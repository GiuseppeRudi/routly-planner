from __future__ import annotations

from pathlib import Path
import argparse
import sys
from typing import Any
import yaml

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.sumo.sumo_runner import launch_sumo_gui
from src.routly.sumo.sumo_writer import (
    build_net,
    compute_simulation_end_time,
    write_edg_xml,
    write_nod_xml,
    write_rou_xml,
    write_sumocfg,
    write_view_settings,
)


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


def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)

    scenario_path = Path(args.scenario_config)
    if not scenario_path.is_absolute():
        scenario_path = PROJECT_ROOT / scenario_path

    scenario = read_yaml(scenario_path)
    vehicle_id = get_vehicle_id_from_scenario(scenario)
    features = FeatureConfig.from_yaml(args.features_config)
    mapping = load_mapping(config.mapping_path)

    # Resolve the default plan path from config
    plan_path = Path(args.plan_override) if args.plan_override else config.plan_path

    # When LLM events are enabled, step 4 produces plan_dynamic.sol instead of plan.txt
    if not args.plan_override and features.llm_events.enabled:
        plan_path = plan_path.parent / "plan_dynamic.sol"
        if not plan_path.exists():
            raise FileNotFoundError(
                f"plan_dynamic.sol not found at {plan_path}. "
                "Run step 4 with llm_events.enabled=true to generate it first."
            )

    print(f"\n📖 Reading plan file: {plan_path.name}")
    plan_text = plan_path.read_text(encoding="utf-8")
    road_sequence = parse_start_traversal_roads(plan_text)

    if not road_sequence:
        print("WARNING: no road sequence found in plan. Check ENHSP output format.")

    print(f"Found route with {len(road_sequence)} roads.")

    write_nod_xml(mapping["nodes"], config.sumo_nod_path, with_traffic_lights=features.traffic_lights)
    write_edg_xml(mapping["roads"], config.sumo_edg_path)
    build_net(config.sumo_edg_path, config.sumo_nod_path, config.sumo_net_path)

    write_rou_xml(
        road_sequence,
        out_path=config.sumo_rou_path,
        vehicle_id=vehicle_id,
        background_vehicles=features.congestion.num_background_vehicles if features.congestion_in_sumo else 0,
        all_roads=mapping["roads"],
    )

    end_time = compute_simulation_end_time(plan_text, road_sequence, mapping)
    write_view_settings(config.sumo_viewsettings_path)

    write_sumocfg(
        config.sumo_net_path,
        config.sumo_rou_path,
        config.sumo_cfg_path,
        view_file=config.sumo_viewsettings_path,
        end=end_time,
    )

    print("\nSUMO FILES CREATED:")
    print(f"  {config.sumo_nod_path}")
    print(f"  {config.sumo_edg_path}")
    print(f"  {config.sumo_net_path}")
    print(f"  {config.sumo_rou_path}")
    print(f"  {config.sumo_cfg_path}")

    launch_sumo_gui(
        config.sumo_cfg_path,
        sumo_gui=config.sumo_gui,
        vehicle_id=vehicle_id,
    )


if __name__ == "__main__":
    main()