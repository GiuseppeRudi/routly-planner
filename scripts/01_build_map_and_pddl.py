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

from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.mapping import graph_to_mapping, write_mapping
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import (
    build_road_network_problem,
    choose_start_goal,
)


def main() -> None:
    config = load_config("config/maps/bologna_area.yaml", "config/project_settings.yaml")

    config.output_dir.mkdir(parents=True, exist_ok=True)

    graph = build_osm_graph(
        place_name=config.place_name,
        network_type=config.network_type,
        max_nodes=config.max_nodes,
        keep_largest_component=config.keep_largest_component,
        is_strongly_connected=config.remove_isolated_nodes,
        distance_meters=config.distance_meters
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

    domain_text = build_road_network_domain()
    write_pddl(domain_text, config.domain_path)

    start_loc, goal_loc = choose_start_goal(graph, config.place_name, node_map)
    problem_text = build_road_network_problem(
        node_map=node_map,
        roads=roads,
        start_loc=start_loc,
        goal_loc=goal_loc,
        vehicle_id=config.vehicle_id,
        problem_name=f"{config.place_slug}_problem",
    )
    write_pddl(problem_text, config.problem_path)

    print("\nOUTPUT FILES:")
    print(f"  Graph image:  {config.output_dir / 'road_network_graph.png'}")
    print(f"  Mapping:      {config.mapping_path}")
    print(f"  Domain:       {config.domain_path}")
    print(f"  Problem:      {config.problem_path}")


if __name__ == "__main__":
    main()

# TODO Il panner non considera la congestione del traffico simulata da sumo,
# TODO successivamente troviamo il modo di integrarlo nella rappresentazione dello stato all'interno del problema
# TODO 1. Semafori
# TODO 2. Sensi di Marcia
# TODO 3. Più auto nel problema PDDL per simulare congestione
# TODO 4. Eventi casuali (incidenti, lavori in corso) con LLM
# TODO Fare diverse simulazioni e partire dallo stesso scenario. La prima simulazione parte senza eventi generati dall'LLM
# TODO Successivamente effettuare diverse altre simulazioni a partire dallo stesso scenario in cui l'LLM genere degli eventi casuali
# TODO e vedere come è cambiato il planner e il piano a seconda degli eventi generati effettuando una comparazione (SOTA)
# TODO 5. Controllo benzina
# TODO 6. (Opzionale) Distinzione tra mappa piccola, media e grande