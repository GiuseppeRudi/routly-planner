from pathlib import Path

import networkx as nx


def _pddl_node_name(index: int) -> str:
    return f"loc_{index}"


def generate_problem_from_graph(
    graph: nx.MultiDiGraph,
    problem_name: str = "bologna-center-navigation",
    domain_name: str = "urban-navigation",
    vehicle_name: str = "vehicle_1",
) -> str:
    if graph.number_of_nodes() < 2:
        raise ValueError("The graph must contain at least two nodes.")

    osm_nodes = list(graph.nodes())
    node_mapping = {osm_id: _pddl_node_name(i) for i, osm_id in enumerate(osm_nodes, start=1)}

    start_node = node_mapping[osm_nodes[0]]
    goal_node = node_mapping[osm_nodes[-1]]

    objects = [f"    {vehicle_name} - vehicle"]
    objects.append("    " + " ".join(node_mapping.values()) + " - location")

    init_lines = [f"    (at {vehicle_name} {start_node})", "    (= (total-cost) 0)"]

    seen_edges: set[tuple[str, str]] = set()

    for u, v, data in graph.edges(data=True):
        source = node_mapping[u]
        target = node_mapping[v]
        if (source, target) in seen_edges:
            continue
        seen_edges.add((source, target))

        length = data.get("length", 1.0)
        try:
            length_value = max(1, round(float(length)))
        except (TypeError, ValueError):
            length_value = 1

        init_lines.append(f"    (connected {source} {target})")
        init_lines.append(f"    (= (distance {source} {target}) {length_value})")

    problem = f"""(define (problem {problem_name})
  (:domain {domain_name})

  (:objects
{chr(10).join(objects)}
  )

  (:init
{chr(10).join(init_lines)}
  )

  (:goal
    (at {vehicle_name} {goal_node})
  )

  (:metric minimize (total-cost))
)
"""
    return problem


def write_problem(problem_text: str, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(problem_text, encoding="utf-8")
