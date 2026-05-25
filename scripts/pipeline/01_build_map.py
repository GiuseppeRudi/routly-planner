from __future__ import annotations

from pathlib import Path
import argparse
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.utils import read_yaml

from src.routly.config import load_config
from src.routly.graph.graph_export import plot_graph

from src.routly.osm.graph_builder import (
    add_projected_coordinates,
    build_osm_graph,
    save_graphml,
)

from src.routly.pddl.mapping import graph_to_mapping, write_mapping


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build Routly map artifacts from OSMnx."
    )

    parser.add_argument(
        "--map-config",
        required=True,
        help="Path to the map YAML config, e.g. config/maps/bologna_area.yaml",
    )

    parser.add_argument(
        "--project-config",
        required=True,
        help="Path to the project YAML config, e.g. config/project_settings.yaml",
    )

    return parser.parse_args()


def main() -> None:
    args = parse_args()

    config = load_config(
        args.map_config,
        args.project_config,
    )

    config.output_dir.mkdir(parents=True, exist_ok=True)

    graph = build_osm_graph(
        place_name=config.place_name,
        network_type=config.network_type,
        max_nodes=config.max_nodes,
        keep_largest_component=config.keep_largest_component,
        is_strongly_connected=config.remove_isolated_nodes,
        distance_meters=config.distance_meters,
    )

    plot_graph(
        graph,
        config.graph_image_path,
        title=f"{config.place_name} Road Network — Routly",
    )

    graph, projected_graph = add_projected_coordinates(graph)
    save_graphml(graph, config.raw_graphml_path)

    mapping, node_map, roads = graph_to_mapping(graph, projected_graph)
    write_mapping(mapping, config.mapping_path)

    print("\nOUTPUT FILES:")
    print(f"  Graph image:  {config.graph_image_path}")
    print(f"  GraphML:      {config.raw_graphml_path}")
    print(f"  Mapping:      {config.mapping_path}")
    print("\nNEXT STEP:")
    print("  python scripts/02_select_scenario_points.py --map-config ... --project-config ... --scenario-config ...")


if __name__ == "__main__":
    main()