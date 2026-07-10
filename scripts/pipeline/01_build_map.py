from __future__ import annotations

from pathlib import Path
import argparse
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.graph.mapping_plot import plot_mapping_graph

from src.routly.osm.graph_builder import (
    add_projected_coordinates,
    build_osm_graph,
    find_osm_fuel_nodes,
    save_graphml,
)

from src.routly.pddl.mapping import graph_to_mapping, write_mapping


def remove_legacy_graph_image(config) -> None:
    if config.legacy_graph_image_path.exists():
        config.legacy_graph_image_path.unlink()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build Routly map artifacts from OSMnx."
    )

    parser.add_argument(
        "--project-config",
        required=True,
        help="Path to the project YAML config, e.g. config/project.yaml",
    )

    return parser.parse_args()


def main() -> None:
    args = parse_args()

    config = load_config(args.project_config)

    config.output_dir.mkdir(parents=True, exist_ok=True)

    graph = build_osm_graph(
        place_name=config.place_name,
        network_type=config.network_type,
        max_nodes=config.max_nodes,
        keep_largest_component=config.keep_largest_component,
        is_strongly_connected=config.remove_isolated_nodes,
        distance_meters=config.distance_meters,
    )

    graph, projected_graph = add_projected_coordinates(graph)
    save_graphml(graph, config.raw_graphml_path)

    fuel_osmids = find_osm_fuel_nodes(
        graph, config.place_name, config.distance_meters
    )
    print(f"Identified {len(fuel_osmids)} fuel stations in OSM data.")
    mapping = graph_to_mapping(graph, projected_graph, fuel_osmids)
    write_mapping(mapping, config.mapping_path)
    remove_legacy_graph_image(config)
    plot_mapping_graph(
        mapping,
        config.graph_base_image_path,
        title=f"{config.place_name} Road Network (base)",
    )

    print("\nOUTPUT FILES:")
    print(f"  Base graph image:  {config.graph_base_image_path}")
    print(f"  GraphML:      {config.raw_graphml_path}")
    print(f"  Mapping:      {config.mapping_path}")
    print("\nNEXT STEP:")
    print("  python scripts/pipeline/02_select_scenario_points.py --project-config config/project.yaml")


if __name__ == "__main__":
    main()
