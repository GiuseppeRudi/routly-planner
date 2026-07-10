from __future__ import annotations

import argparse
from pathlib import Path
import sys
from typing import Any

import yaml


SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.domain.fuel import derive_fuel_parameters, write_fuel_stations
from src.routly.domain.macro_roads import (
    build_macro_road_mapping,
    plot_macro_roads_comparison,
    write_macro_artifacts,
)
from src.routly.features import FeatureConfig
from src.routly.graph.mapping_plot import plot_mapping_graph
from src.routly.pddl.mapping import load_mapping
from src.routly.utils import read_yaml


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build optional macro-road abstraction artifacts."
    )
    parser.add_argument("--project-config", required=True)
    return parser.parse_args()


def extract_start_goal(scenario: dict[str, Any]) -> tuple[str, str]:
    vehicles = scenario.get("vehicles", [])
    if not vehicles:
        raise ValueError("Scenario YAML does not contain any vehicle.")
    vehicle = vehicles[0]
    return vehicle["start"]["value"], vehicle["goal"]["value"]


def resolve_path(raw_path: str | Path) -> Path:
    path = Path(raw_path)
    if path.is_absolute():
        return path
    return PROJECT_ROOT / path


def project_relative(path: Path) -> str:
    try:
        return path.resolve().relative_to(PROJECT_ROOT.resolve()).as_posix()
    except ValueError:
        return str(path)


def mark_fuel_station_nodes(
    mapping: dict[str, Any],
    station_ids: list[str],
) -> dict[str, Any]:
    station_set = set(station_ids)
    nodes = []
    for node in mapping.get("nodes", []):
        current = dict(node)
        if current.get("id") in station_set:
            current["fuel_station"] = True
        nodes.append(current)
    marked = dict(mapping)
    marked["nodes"] = nodes
    marked["roads"] = [dict(road) for road in mapping.get("roads", [])]
    return marked


def update_scenario_macro_paths(config, scenario: dict[str, Any]) -> None:
    scenario.setdefault("map", {})
    scenario["map"]["planning_mapping_path"] = project_relative(config.macro_mapping_path)
    scenario["map"].pop("macro_expansion_path", None)
    config.scenario_path.write_text(
        yaml.safe_dump(scenario, sort_keys=False),
        encoding="utf-8",
    )


def remove_legacy_macro_artifacts(config) -> None:
    for filename in ("macro_roads_expansion.json", "macro_roads_report.txt"):
        path = config.map_dir / filename
        if path.exists():
            path.unlink()


def remove_legacy_graph_artifacts(config) -> None:
    if config.legacy_graph_image_path.exists():
        config.legacy_graph_image_path.unlink()


def main() -> None:
    args = parse_args()
    config = load_config(args.project_config)
    features = FeatureConfig.from_yaml(args.project_config)

    if not features.road_abstraction.enabled:
        print("Road abstraction disabled: skipping build_macro_roads.")
        return

    scenario = read_yaml(config.scenario_path)
    map_section = scenario.get("map", {})
    original_mapping_path = resolve_path(map_section.get("mapping_path", config.mapping_path))
    if not original_mapping_path.exists():
        raise FileNotFoundError(f"Original mapping not found: {original_mapping_path}")

    original_mapping = load_mapping(original_mapping_path)
    start_loc, goal_loc = extract_start_goal(scenario)

    mapping_for_abstraction = original_mapping
    if features.fuel.enabled:
        fuel_params = derive_fuel_parameters(
            nodes=original_mapping["nodes"],
            config=features.fuel,
            seed=config.seed,
        )
        write_fuel_stations(fuel_params.stations, config.fuel_stations_path)
        mapping_for_abstraction = mark_fuel_station_nodes(
            original_mapping,
            fuel_params.stations,
        )
        print(
            f"Fuel stations fixed before macro-road abstraction: "
            f"{len(fuel_params.stations)} -> {config.fuel_stations_path}"
        )

    result = build_macro_road_mapping(
        mapping=mapping_for_abstraction,
        start_loc=start_loc,
        goal_loc=goal_loc,
        config=features.road_abstraction,
        original_mapping_path=project_relative(original_mapping_path),
        macro_mapping_path=project_relative(config.macro_mapping_path),
    )

    write_macro_artifacts(
        result=result,
        mapping_path=config.macro_mapping_path,
        report_json_path=config.macro_report_json_path,
    )
    remove_legacy_graph_artifacts(config)
    plot_mapping_graph(
        original_mapping,
        config.graph_base_image_path,
        title=f"{config.place_name} Road Network (base)",
        start_loc=start_loc,
        goal_loc=goal_loc,
    )
    plot_mapping_graph(
        result.mapping,
        config.graph_macro_image_path,
        title=f"{config.place_name} Road Network (macro)",
        start_loc=start_loc,
        goal_loc=goal_loc,
    )
    remove_legacy_macro_artifacts(config)
    plot_macro_roads_comparison(
        original_mapping=original_mapping,
        macro_mapping=result.mapping,
        expansion=result.expansion,
        output_path=config.macro_comparison_image_path,
        start_loc=start_loc,
        goal_loc=goal_loc,
    )
    update_scenario_macro_paths(config, scenario)

    stats = result.report["stats"]
    print("Macro-road abstraction completed.")
    print(
        f"  Roads: {stats['original_roads']} -> {stats['planning_roads']} "
        f"(ratio={stats['road_compression_ratio']})"
    )
    print(
        f"  Nodes: {stats['original_nodes']} -> {stats['planning_nodes']} "
        f"(ratio={stats['node_compression_ratio']})"
    )
    print(f"  Mapping:   {config.macro_mapping_path}")
    print(f"  Report:    {config.macro_report_json_path}")
    print(f"  Base graph:  {config.graph_base_image_path}")
    print(f"  Macro graph: {config.graph_macro_image_path}")
    print(f"  Image:     {config.macro_comparison_image_path}")


if __name__ == "__main__":
    main()
