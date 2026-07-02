from __future__ import annotations

from pathlib import Path
import argparse
import sys
from typing import Any

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.domain.fuel import derive_fuel_parameters, write_fuel_stations
from src.routly.utils import read_yaml
from src.routly.domain.congestion import estimate_route_duration_straight_line, generate_background_routes, write_background_routes
from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.pddl.mapping import load_mapping
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import build_road_network_problem
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.domain.traffic_lights import (
    generate_traffic_light_timings,
    write_traffic_light_timings,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build PDDL domain and problem from selected scenario YAML."
    )

    parser.add_argument("--project-config", required=True)

    return parser.parse_args()


def build_node_map_from_mapping(mapping: dict[str, Any]) -> dict[str, dict[str, Any]]:
    node_map: dict[str, dict[str, Any]] = {}

    for node in mapping["nodes"]:
        node_map[node["id"]] = node

    return node_map

def extract_vehicle_start_goal(scenario: dict[str, Any]) -> tuple[str, str, str]:
    vehicles = scenario.get("vehicles", [])

    if not vehicles:
        raise ValueError("Scenario YAML does not contain any vehicle.")

    if len(vehicles) > 1:
        raise NotImplementedError(
            "This script currently supports one PDDL-controlled vehicle."
        )

    vehicle = vehicles[0]

    return (
        vehicle["id"],
        vehicle["start"]["value"],
        vehicle["goal"]["value"],
    )


def main() -> None:
    args = parse_args()

    config = load_config(args.project_config)
    scenario_path = config.scenario_path

    scenario = read_yaml(scenario_path)

    features = FeatureConfig.from_yaml(args.project_config)

    mapping_path = Path(
        scenario.get("map", {}).get("mapping_path", config.mapping_path)
    )

    if not mapping_path.is_absolute():
        mapping_path = PROJECT_ROOT / mapping_path

    print("Building PDDL domain and problem from scenario and mapping")
    # print(f"  Scenario: {scenario_path}")
    # print(f"  Mapping:  {mapping_path}")

    mapping = load_mapping(mapping_path)

    vehicle_id, start_loc, goal_loc = extract_vehicle_start_goal(scenario)

    node_map = build_node_map_from_mapping(mapping)
    roads = mapping["roads"]
    background_routes = []
    traffic_light_timings = {}

    if features.congestion_enabled:
        route_seconds = estimate_route_duration_straight_line(
            node_map, # nodes_by_id
            roads,
            start_loc,
            goal_loc,
            detour_factor=1.3, # roads aren't straight lines
            safety_margin=1.15, # small cushion
        )

        background_routes = generate_background_routes(
            roads,
            features.congestion.num_background_vehicles,
            config.seed,
            max_present_time=route_seconds if route_seconds > 0 else None,
        )
        write_background_routes(background_routes, config.background_routes_path)
        print(
            f"Generated {len(background_routes)} shared background routes: "
            f"{config.background_routes_path}"
        )

    if features.traffic_lights:
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
        print(
            f"Generated {len(traffic_light_timings)} traffic-light programs: "
            f"{config.traffic_light_timings_path}"
        )
    
    fuel_params = None
    if features.fuel.enabled:
        fuel_params = derive_fuel_parameters(
            nodes=mapping["nodes"],
            config=features.fuel,
            seed=config.seed,
        )
        write_fuel_stations(fuel_params.stations, config.fuel_stations_path)
        print(
            f"Fuel: {len(fuel_params.stations)} stations, "
            f"tank={fuel_params.tank_capacity} L, start={fuel_params.initial_fuel} L, "
            f"rate={fuel_params.consumption_per_meter} L/m"
        )

    # Generate domain
    domain_text = build_road_network_domain(features)
    write_pddl(domain_text, config.domain_path)
    print(f"\nPDDL DOMAIN CREATED (with features: {features.label})")

    # Generate problem
    problem_name = scenario.get("scenario", {}).get(
        "name",
        f"{config.place_slug}_problem",
    )

    problem_text = build_road_network_problem(
        node_map=node_map,
        roads=roads,
        start_loc=start_loc,
        goal_loc=goal_loc,
        vehicle_id=vehicle_id,
        problem_name=problem_name,
        features=features,
        background_routes=background_routes,
        traffic_light_timings=traffic_light_timings,
        fuel_params=fuel_params,
        seed=config.seed,
    )

    write_pddl(problem_text, config.problem_path)

    print("\nPDDL PROBLEM CREATED:")
    print(f"  Vehicle: {vehicle_id}")
    print(f"  Start:   {start_loc}")
    print(f"  Goal:    {goal_loc}")
    print(f"  Problem: {config.problem_path}")


if __name__ == "__main__":
    main()
