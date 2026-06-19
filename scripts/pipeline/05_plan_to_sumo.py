from __future__ import annotations

from pathlib import Path
import argparse
import sys
import webbrowser
from typing import Any
import yaml

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.domain.congestion import (
    load_background_routes,
    validate_background_routes,
)
from src.routly.features import FeatureConfig
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.sumo.sumo_runner import launch_sumo_gui
from src.routly.sumo.sumo_writer import (
    apply_traffic_light_timings,
    build_net,
    compute_simulation_end_time,
    write_edg_xml,
    write_nod_xml,
    write_rou_xml,
    write_sumocfg,
    write_view_settings,
)
from src.routly.domain.traffic_lights import (
    generate_traffic_light_timings,
    load_traffic_light_timings,
    write_traffic_light_timings,
)


PLAN_FILE_BY_KIND = {
    "base": "plan.txt",
    "dynamic": "plan_dynamic.sol",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert ENHSP plan to SUMO files and launch SUMO-GUI."
    )
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--scenario-config", required=True)
    parser.add_argument("--features-config", required=True)
    parser.add_argument("--plan-override", help="Path to alternative plan file")
    return parser.parse_args()


def read_yaml(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Scenario YAML not found: {path}")
    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def get_vehicle_id_from_scenario(scenario: dict[str, Any]) -> str:
    vehicles = scenario.get("vehicles", [])
    if not vehicles:
        return "car1"
    return vehicles[0].get("id", "car1")


def resolve_plan_runs(
    config,
    features: FeatureConfig,
    plan_override: str | None,
) -> list[tuple[str, Path]]:
    if plan_override:
        return [("override", Path(plan_override))]

    runs: list[tuple[str, Path]] = []
    for plan_kind in features.sumo.plans:
        if plan_kind == "dynamic" and not features.llm_events.enabled:
            print(
                "WARNING: skipping SUMO plan 'dynamic' because "
                "features.llm_events.enabled=false."
            )
            continue

        plan_path = config.plan_path.parent / PLAN_FILE_BY_KIND[plan_kind]
        if not plan_path.exists():
            raise FileNotFoundError(
                f"Plan '{plan_kind}' not found at {plan_path}. "
                "Run step 4 first to generate the requested plan."
            )
        runs.append((plan_kind, plan_path))

    if not runs:
        plan_path = config.plan_path.parent / PLAN_FILE_BY_KIND["base"]
        if not plan_path.exists():
            raise FileNotFoundError(
                f"Base plan not found at {plan_path}. Run step 4 first."
            )
        runs.append(("base", plan_path))

    return runs


def sumo_route_path_for_plan(config, plan_kind: str) -> Path:
    if plan_kind == "base":
        return config.sumo_rou_path
    return config.sumo_rou_path.with_name(f"road_network_{plan_kind}.rou.xml")


def sumo_cfg_path_for_plan(config, plan_kind: str) -> Path:
    if plan_kind == "base":
        return config.sumo_cfg_path
    return config.sumo_cfg_path.with_name(f"road_network_{plan_kind}.sumocfg")


def open_event_map_before_sumo(config, features: FeatureConfig, plan_kinds: list[str]) -> None:
    if not features.sumo.open_event_map:
        return
    if "dynamic" not in plan_kinds:
        return

    event_map_path = config.problem_path.parent / "event_map.png"
    if not event_map_path.exists():
        print(f"WARNING: event map not found before SUMO launch: {event_map_path}")
        return

    print(f"\nOpening event comparison map before SUMO: {event_map_path}")
    webbrowser.open(event_map_path.resolve().as_uri())


def write_and_launch_sumo_for_plan(
    plan_kind: str,
    plan_path: Path,
    config,
    mapping: dict[str, Any],
    features: FeatureConfig,
    vehicle_id: str,
    background_routes,
) -> None:
    print("\n" + "=" * 70)
    print(f"SUMO PLAN: {plan_kind}")
    print("=" * 70)
    print(f"Reading plan file: {plan_path}")

    plan_text = plan_path.read_text(encoding="utf-8")
    road_sequence = parse_start_traversal_roads(plan_text)

    if not road_sequence:
        print("WARNING: no road sequence found in plan. Check ENHSP output format.")

    print(f"Found route with {len(road_sequence)} roads.")

    route_path = sumo_route_path_for_plan(config, plan_kind)
    cfg_path = sumo_cfg_path_for_plan(config, plan_kind)

    write_rou_xml(
        road_sequence,
        out_path=route_path,
        vehicle_id=vehicle_id,
        background_vehicles=(
            features.congestion.num_background_vehicles
            if features.congestion_in_sumo
            else 0
        ),
        all_roads=mapping["roads"],
        background_routes=background_routes,
        seed=config.seed,
    )

    end_time = compute_simulation_end_time(plan_text, road_sequence, mapping)
    write_sumocfg(
        config.sumo_net_path,
        route_path,
        cfg_path,
        view_file=config.sumo_viewsettings_path,
        end=end_time,
        seed=config.seed,
    )

    print("\nSUMO FILES CREATED:")
    print(f"  Route: {route_path}")
    print(f"  Config: {cfg_path}")

    launch_sumo_gui(
        cfg_path,
        sumo_gui=config.sumo_gui,
        vehicle_id=vehicle_id,
    )


def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)

    scenario_path = Path(args.scenario_config)
    if not scenario_path.is_absolute():
        scenario_path = PROJECT_ROOT / scenario_path

    scenario = read_yaml(scenario_path)
    vehicle_id = get_vehicle_id_from_scenario(scenario)
    features = FeatureConfig.from_yaml(args.features_config)

    mapping_path = Path(
        scenario.get("map", {}).get("mapping_path", config.mapping_path)
    )
    if not mapping_path.is_absolute():
        mapping_path = PROJECT_ROOT / mapping_path

    mapping = load_mapping(mapping_path)
    traffic_light_timings = {}
    if features.traffic_lights:
        if config.traffic_light_timings_path.exists():
            traffic_light_timings = load_traffic_light_timings(
                config.traffic_light_timings_path
            )
        else:
            traffic_light_timings = generate_traffic_light_timings(
                mapping["nodes"],
                mapping["roads"],
                features.traffic_lights_config,
                config.seed,
            )
            write_traffic_light_timings(
                traffic_light_timings,
                config.traffic_light_timings_path,
            )

    background_routes = None
    if features.congestion_in_sumo and config.background_routes_path.exists():
        background_routes = load_background_routes(config.background_routes_path)
        validate_background_routes(background_routes, mapping["roads"])
        print(
            f"Loaded {len(background_routes)} shared background routes from "
            f"{config.background_routes_path}"
        )
    elif features.congestion_in_pddl:
        raise FileNotFoundError(
            "Shared background routes are required in PDDL congestion mode. "
            f"Run step 3 first to create: {config.background_routes_path}"
        )

    plan_runs = resolve_plan_runs(config, features, args.plan_override)

    write_nod_xml(mapping["nodes"], config.sumo_nod_path, with_traffic_lights=features.traffic_lights)
    write_edg_xml(mapping["roads"], config.sumo_edg_path)
    build_net(config.sumo_edg_path, config.sumo_nod_path, config.sumo_net_path)
    if features.traffic_lights:
        apply_traffic_light_timings(
            config.sumo_net_path,
            traffic_light_timings,
        )

    write_view_settings(config.sumo_viewsettings_path)

    open_event_map_before_sumo(
        config,
        features,
        [plan_kind for plan_kind, _ in plan_runs],
    )

    print("\nSUMO NETWORK FILES CREATED:")
    print(f"  {config.sumo_nod_path}")
    print(f"  {config.sumo_edg_path}")
    print(f"  {config.sumo_net_path}")
    print(f"  {config.sumo_viewsettings_path}")

    for plan_kind, plan_path in plan_runs:
        write_and_launch_sumo_for_plan(
            plan_kind=plan_kind,
            plan_path=plan_path,
            config=config,
            mapping=mapping,
            features=features,
            vehicle_id=vehicle_id,
            background_routes=background_routes,
        )


if __name__ == "__main__":
    main()
