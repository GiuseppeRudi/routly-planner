from __future__ import annotations

from pathlib import Path
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.graph.graph_export import plot_graph

from src.routly.osm.graph_builder import (
    add_projected_coordinates,
    build_osm_graph,
    save_graphml,
)

from src.routly.pddl.mapping import graph_to_mapping, write_mapping
from src.routly.pddl.pddl_writer import write_pddl


def main() -> None:
    config = load_config(
        "config/maps/bologna_area.yaml",
        "config/project_settings.yaml",
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
        config.output_dir / "road_network_graph.png",
        title=f"{config.place_name} Road Network — Routly",
    )

    graph, projected_graph = add_projected_coordinates(graph)
    save_graphml(graph, config.raw_graphml_path)

    mapping, node_map, roads = graph_to_mapping(graph, projected_graph)
    write_mapping(mapping, config.mapping_path)


    print("\nOUTPUT FILES:")
    print(f"  Graph image:  {config.output_dir / 'road_network_graph.png'}")
    print(f"  GraphML:      {config.raw_graphml_path}")
    print(f"  Mapping:      {config.mapping_path}")
    print("\nNEXT STEP:")
    print("  python scripts/02_select_scenario_points.py")


if __name__ == "__main__":
    main()