from __future__ import annotations

from pathlib import Path
import argparse
import sys
from typing import Any

import yaml

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.utils import read_yaml
from src.routly.config import load_config
from src.routly.pddl.mapping import load_mapping
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import build_road_network_problem


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build PDDL problem from selected scenario YAML."
    )

    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--scenario-config", required=True)

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

    config = load_config(args.map_config, args.project_config)

    scenario_path = Path(args.scenario_config)
    if not scenario_path.is_absolute():
        scenario_path = PROJECT_ROOT / scenario_path

    scenario = read_yaml(scenario_path)

    mapping_path = Path(
        scenario.get("map", {}).get("mapping_path", config.mapping_path)
    )

    if not mapping_path.is_absolute():
        mapping_path = PROJECT_ROOT / mapping_path

    print("Building PDDL problem from scenario and mapping")
    # print(f"  Scenario: {scenario_path}")
    # print(f"  Mapping:  {mapping_path}")

    mapping = load_mapping(mapping_path)

    vehicle_id, start_loc, goal_loc = extract_vehicle_start_goal(scenario)

    node_map = build_node_map_from_mapping(mapping)
    roads = mapping["roads"]

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
    )

    write_pddl(problem_text, config.problem_path)

    print("\nPDDL PROBLEM CREATED:")
    print(f"  Vehicle: {vehicle_id}")
    print(f"  Start:   {start_loc}")
    print(f"  Goal:    {goal_loc}")
    print(f"  Problem: {config.problem_path}")


if __name__ == "__main__":
    main()