from __future__ import annotations

import networkx as nx
import osmnx as ox


def choose_start_goal(
    graph: nx.MultiDiGraph,
    place_name: str,
    node_map: dict,
) -> tuple[str, str]:
    """
    Choose start as the city-center node and goal as the furthest reachable node.
    """
    city_center = ox.geocode(place_name)
    center_node = ox.distance.nearest_nodes(graph, X=city_center[1], Y=city_center[0])

    if center_node not in graph.nodes:
        center_node = list(graph.nodes)[0]

    lengths = nx.single_source_dijkstra_path_length(graph, center_node, weight="length")
    reachable = {n: d for n, d in lengths.items() if n != center_node and d > 0}

    if not reachable:
        nodes = list(graph.nodes)
        if len(nodes) < 2:
            raise ValueError("Not enough nodes in the graph.")
        goal_node = nodes[1]
    else:
        goal_node = max(reachable, key=reachable.get)

    start_loc = node_map[center_node]["id"]
    goal_loc = node_map[goal_node]["id"]

    print(f"Problem route: {start_loc} -> {goal_loc}")
    print(f"  Goal distance from center: {reachable.get(goal_node, 0):.0f} m")

    return start_loc, goal_loc


def build_road_network_problem(
    node_map: dict,
    roads: list[dict],
    start_loc: str,
    goal_loc: str,
    vehicle_id: str = "car1",
    problem_name: str = "road-network-problem",
) -> str:
    """Build a PDDL+ problem from locations, roads, and chosen start/goal."""
    location_objs = " ".join(n["id"] for n in node_map.values())
    road_objs = " ".join(r["id"] for r in roads)

    init_lines = [
        f"  (at {vehicle_id} {start_loc})",
        f"  (= (speed {vehicle_id}) 0)",
        f"  (= (total-distance {vehicle_id}) 0)",
        f"  (= (distance-remaining {vehicle_id}) 0)",
    ]

    for road in roads:
        init_lines.extend([
            f"  (connects {road['id']} {road['from']} {road['to']})",
            f"  (road-open {road['id']})",
            f"  (= (road-length {road['id']}) {road['length']})",
            f"  (= (speed-limit {road['id']}) {road['speed']})",
        ])

    return f"""\
;; ============================================================
;;  PROBLEM: {problem_name}
;;  Start:   {start_loc}
;;  Goal:    {goal_loc}
;; ============================================================

(define (problem {problem_name})
  (:domain road-network)

  (:objects
    {vehicle_id} - vehicle

    {location_objs}
    - location

    {road_objs}
    - road
  )

  (:init
{chr(10).join(init_lines)}
  )

  (:goal (at {vehicle_id} {goal_loc}))
  (:metric minimize (total-distance {vehicle_id}))
)
"""
