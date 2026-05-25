from __future__ import annotations

from pathlib import Path
import json
import sys
from typing import Any

import yaml

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.pddl.mapping import load_mapping
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import build_road_network_problem


SCENARIO_PATH = PROJECT_ROOT / "config" / "scenarios" / "bologna_car1_custom.yaml"


def read_yaml(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Scenario file not found: {path}")

    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def build_node_map_from_mapping(mapping: dict[str, Any]) -> dict[str, dict[str, Any]]:
    """
    Rebuild a node_map-like structure from roads_mapping.json.

    In the original 01 script, node_map was produced by graph_to_mapping().
    Here we are in a later script, so we reconstruct what we need from mapping["nodes"].
    """
    node_map: dict[str, dict[str, Any]] = {}

    for node in mapping["nodes"]:
        location_id = node["id"]
        node_map[location_id] = node

    return node_map


def extract_vehicle_start_goal(scenario: dict[str, Any]) -> tuple[str, str, str]:
    vehicles = scenario.get("vehicles", [])

    if not vehicles:
        raise ValueError("Scenario YAML does not contain any vehicle.")

    if len(vehicles) > 1:
        raise NotImplementedError(
            "This build_problem script currently supports one PDDL-controlled vehicle. "
            "Multi-vehicle problem generation will be added later."
        )

    vehicle = vehicles[0]

    vehicle_id = vehicle["id"]
    start_loc = vehicle["start"]["value"]
    goal_loc = vehicle["goal"]["value"]

    return vehicle_id, start_loc, goal_loc


def main() -> None:
    config = load_config(
        "config/maps/bologna_area.yaml",
        "config/project_settings.yaml",
    )

    scenario = read_yaml(SCENARIO_PATH)

    mapping_path = Path(
        scenario.get("map", {}).get("mapping_path", config.mapping_path)
    )

    print("Building PDDL problem from scenario:")
    print(f"  Scenario: {SCENARIO_PATH}")
    print(f"  Mapping:  {mapping_path}")

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

    print("\nNEXT STEP:")
    print("  python scripts/04_generate_plan.py")


if __name__ == "__main__":
    main()