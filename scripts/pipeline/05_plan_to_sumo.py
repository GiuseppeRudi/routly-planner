from __future__ import annotations

from pathlib import Path
import argparse
import sys
import webbrowser
from typing import Any
import json
import yaml
import copy
import xml.etree.ElementTree as ET


# Bulletproof root path resolution independent of terminal prompt location
SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.domain.fuel import load_fuel_stations
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
    write_fuel_pois,
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

from src.routly.graph.graph_export import EventMapViewer


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert ENHSP plan to SUMO files and launch SUMO-GUI."
    )
    parser.add_argument("--project-config", required=True)
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

        plan_path = config.dynamic_plan_path if plan_kind == "dynamic" else config.plan_path
        if not plan_path.exists():
            print(f"WARNING: Plan '{plan_kind}' not found at {plan_path}. Skipping run.")
            continue
        runs.append((plan_kind, plan_path))

    if not runs:
        plan_path = config.plan_path
        if not plan_path.exists():
            raise FileNotFoundError(
                f"Base plan not found at {plan_path}. Run step 4 first."
            )
        runs.append(("base", plan_path))

    return runs


def sumo_route_path_for_plan(config, plan_kind: str) -> Path:
    if plan_kind == "dynamic":
        return config.dynamic_sumo_rou_path
    return config.sumo_rou_path


def sumo_cfg_path_for_plan(config, plan_kind: str) -> Path:
    if plan_kind == "dynamic":
        return config.dynamic_sumo_cfg_path
    return config.sumo_cfg_path


def open_event_map_before_sumo(config, features: FeatureConfig, plan_kinds: list[str], mapping: dict[str, Any]) -> None:
    if not features.sumo.open_event_map:
        return
    if "dynamic" not in plan_kinds:
        return

    print(f"\nOpening INTERACTIVE Event Comparison Map before SUMO launch...")

    # Legge i percorsi di base e dinamici generati nello Step 4
    orig_roads = parse_start_traversal_roads(config.plan_path.read_text(encoding="utf-8")) if config.plan_path.exists() else []
    repl_roads = parse_start_traversal_roads(config.dynamic_plan_path.read_text(encoding="utf-8")) if config.dynamic_plan_path.exists() else []

    # Carica gli eventi LLM dal file log
    blocked_roads, slowed_roads, blocked_locs = [], [], []
    if config.incidents_log_path.exists():
        try:
            with open(config.incidents_log_path, "r", encoding="utf-8") as f:
                log_data = json.load(f)
                for ev in log_data.get("events", []):
                    if ev.get("event_type") == "slowdown":
                        slowed_roads.extend([{"id": r} for r in ev.get("roads", [])])
                    else:
                        blocked_roads.extend([{"id": r} for r in ev.get("roads", [])])
                blocked_locs = log_data.get("blocked_locations", [])
        except Exception:
            pass

    # Carica start e goal dal mapping/scenario
    scenario_data = read_yaml(config.scenario_path) if config.scenario_path.exists() else {}
    vehicles = scenario_data.get("vehicles", [])
    start_loc = vehicles[0]["start"]["value"] if vehicles else None
    goal_loc = vehicles[0]["goal"]["value"] if vehicles else None

    # Avvia la finestra interattiva Matplotlib
    viewer = EventMapViewer(
        mapping=mapping,
        original_roads=orig_roads,
        recalculated_roads=repl_roads,
        blocked_roads=blocked_roads,
        blocked_locations=blocked_locs,
        start_loc=start_loc,
        goal_loc=goal_loc,
        slowed_roads=slowed_roads
    )
    viewer.show()

def write_and_launch_sumo_for_plan(
    plan_kind: str,
    plan_path: Path,
    config,
    mapping: dict[str, Any],
    features: FeatureConfig,
    vehicle_id: str,
    background_routes,
    net_path: Path,
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

    blocked_roads = []
    blocked_locations = []

    if plan_kind == "dynamic" and features.llm_events.enabled:
        log_path = config.incidents_log_path
        if log_path.exists():
            try:
                with open(log_path, "r", encoding="utf-8") as log_f:
                    log_data = json.load(log_f)
                
                for event in log_data.get("events", []):
                    if event.get("event_type") != "slowdown":
                        blocked_roads.extend(event.get("roads", []))
                
                for loc in log_data.get("blocked_locations", []):
                    if isinstance(loc, dict) and "id" in loc:
                        blocked_locations.append(loc["id"])
                    elif isinstance(loc, str):
                        blocked_locations.append(loc)
                
                print(f"ℹ️ Loaded incident data for background filtering. Blocked infrastructure:")
                print(f"   Roads: {blocked_roads}")
                print(f"   Junctions: {blocked_locations}")
            except Exception as e:
                print(f"WARNING: Failed to parse incidents log file ({e}). Routing fallback active.")

    write_rou_xml(
        road_sequence,
        out_path=route_path,
        vehicle_id=vehicle_id,
        background_vehicles=(
            features.congestion.num_background_vehicles
            if features.congestion_enabled
            else 0
        ),
        all_roads=mapping["roads"],
        background_routes=background_routes,
        seed=config.seed,
        blocked_roads=blocked_roads,
        blocked_locations=blocked_locations,
    )

    end_time = compute_simulation_end_time(plan_text, road_sequence, mapping)
    additional = []
    if features.fuel.enabled and config.fuel_stations_path.exists():
        stations = load_fuel_stations(config.fuel_stations_path)
        write_fuel_pois(stations, mapping["nodes"], config.fuel_poi_path, net_path, "images/gas_station.png")
        additional.append(config.fuel_poi_path)

    write_sumocfg(
        net_file=net_path,
        route_file=route_path,
        cfg_file=cfg_path,
        view_file=config.sumo_viewsettings_path,
        begin=0, end=end_time, seed=config.seed,
        additional_files=additional,
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
    config = load_config(args.project_config)
    scenario_path = config.scenario_path

    scenario = read_yaml(scenario_path)
    vehicle_id = get_vehicle_id_from_scenario(scenario)
    features = FeatureConfig.from_yaml(args.project_config)

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
    if features.congestion_enabled and config.background_routes_path.exists():
        background_routes = load_background_routes(config.background_routes_path)
        validate_background_routes(background_routes, mapping["roads"])
        print(
            f"Loaded {len(background_routes)} shared background routes from "
            f"{config.background_routes_path}"
        )
    elif features.congestion_enabled:
        raise FileNotFoundError(
            "Shared background routes are required when congestion.enabled=true. "
            f"Run step 3 first to create: {config.background_routes_path}"
        )

    plan_runs = resolve_plan_runs(config, features, args.plan_override)

    # Assicurati che esista la cartella di output
    config.sumo_viewsettings_path.parent.mkdir(parents=True, exist_ok=True)

    sumo_template_view = PROJECT_ROOT / "config" / "sumo_view.xml"
    if sumo_template_view.exists():
        view_content = sumo_template_view.read_text(encoding="utf-8")
        config.sumo_viewsettings_path.write_text(view_content, encoding="utf-8")
        print(f"🎨 Applicato tema grafico personalizzato da {sumo_template_view.name}")
    else:
        print(f"WARNING: File {sumo_template_view} non trovato. Caricamento view settings di fallback.")
        write_view_settings(config.sumo_viewsettings_path)

    open_event_map_before_sumo(
        config,
        features,
        [plan_kind for plan_kind, _ in plan_runs],
        mapping=mapping,
    )

    for plan_kind, plan_path in plan_runs:
        if plan_kind == "dynamic":
            nod_path = config.sumo_nod_path.parent / f"{config.sumo_nod_path.dash_stem if hasattr(config.sumo_nod_path, 'dash_stem') else config.sumo_nod_path.stem}_dynamic.nod.xml"
            edg_path = config.sumo_edg_path.parent / f"{config.sumo_edg_path.dash_stem if hasattr(config.sumo_edg_path, 'dash_stem') else config.sumo_edg_path.stem}_dynamic.edg.xml"
            net_path = config.sumo_net_path.parent / f"{config.sumo_net_path.dash_stem if hasattr(config.sumo_net_path, 'dash_stem') else config.sumo_net_path.stem}_dynamic.net.xml"
        else:
            nod_path = config.sumo_nod_path
            edg_path = config.sumo_edg_path
            net_path = config.sumo_net_path

        local_roads = copy.deepcopy(mapping["roads"])
        local_nodes = copy.deepcopy(mapping["nodes"])

        blocked_roads_set = set()
        slowed_roads_map = {}

        if plan_kind == "dynamic" and features.llm_events.enabled:
            log_path = config.incidents_log_path
            if log_path.exists():
                try:
                    with open(log_path, "r", encoding="utf-8") as log_f:
                        log_data = json.load(log_f)

                    for event in log_data.get("events", []):
                        if event.get("event_type") == "slowdown":
                            severity = float(event.get("severity", 2.0))
                            for r in event.get("roads", []):
                                slowed_roads_map[r] = severity
                        else:
                            for r in event.get("roads", []):
                                blocked_roads_set.add(r)

                    for road in local_roads:
                        r_id = road.get("id")
                        if r_id in blocked_roads_set:
                            road["speed"] = 0.01
                            road["disallowed"] = "passenger"
                        elif r_id in slowed_roads_map:
                            if "speed" in road:
                                road["speed"] = round(float(road["speed"]) / slowed_roads_map[r_id], 2)

                    print(f"⚡ Rete DINAMICA: Applicati {len(blocked_roads_set)} blocchi fisici e {len(slowed_roads_map)} rallentamenti di velocità.")
                except Exception as e:
                    print(f"WARNING: Errore nell'applicazione delle modifiche stradali LLM ({e})")

        # Scrittura dei file XML base per SUMO
        write_nod_xml(local_nodes, nod_path, with_traffic_lights=features.traffic_lights)
        write_edg_xml(local_roads, edg_path)

        # ── INIEZIONE CHIRURGICA DEI COLORI DIRETTAMENTE DENTRO .EDG.XML (TASK 10 - APPROCCIO GIVEN) ──
        if edg_path.exists():
            try:
                tree = ET.parse(edg_path)
                root = tree.getroot()
                for edge in root.findall("edge"):
                    r_id = edge.get("id")
                    if r_id in blocked_roads_set:
                        edge.set("color", "230,76,60")    # Rosso acceso per interruzioni
                    elif r_id in slowed_roads_map:
                        edge.set("color", "241,196,15")   # Giallo per rallentamenti
                    else:
                        edge.set("color", "52,152,219")    # Blu per strade libere standard
                tree.write(edg_path, encoding="utf-8", xml_declaration=True)
                print(f"🎨 Colori nativi hardcodati con successo in {edg_path.name}.")
            except Exception as e:
                print(f"WARNING: Errore durante l'iniezione XML dei colori nativi ({e})")
        # ─────────────────────────────────────────────────────────────────────────────────────────────

        # Compilazione nativa del network con i colori incorporati
        build_net(edg_path, nod_path, net_path)
        
        if features.traffic_lights:
            apply_traffic_light_timings(net_path, traffic_light_timings)

        print(f"\nSUMO NETWORK CREATED FOR {plan_kind.upper()}:")
        print(f"  {nod_path}")
        print(f"  {edg_path}")
        print(f"  {net_path}")

        write_and_launch_sumo_for_plan(
            plan_kind=plan_kind,
            plan_path=plan_path,
            config=config,
            mapping=mapping,
            features=features,
            vehicle_id=vehicle_id,
            background_routes=background_routes,
            net_path=net_path,
        )


if __name__ == "__main__":
    main()