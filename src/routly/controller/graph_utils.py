"""Shared, dependency-light graph helpers for the offline controllers.

These utilities are intentionally decoupled from the domain and PDDL layers so
that both the fuel controller and the (separately owned) congestion controller
can reuse them. Distances are computed on the *road length* weights, i.e. the
same quantity fuel consumption is proportional to.
"""
from __future__ import annotations

import heapq
from typing import Any

# A weighted directed graph is a plain adjacency dict:
#   { from_loc: [ (to_loc, length_meters), ... ], ... }
WeightedGraph = dict[str, list[tuple[str, float]]]


def build_weighted_road_graph(mapping: dict[str, Any]) -> WeightedGraph:
    """Build a directed adjacency graph weighted by road length (meters).

    Every node id is present as a key (even with no outgoing roads) so that
    lookups never raise. Parallel roads are all kept; the shortest-path
    routines naturally pick the shortest one.
    """
    adjacency: WeightedGraph = {}
    for node in mapping.get("nodes", []):
        adjacency.setdefault(node["id"], [])
    for road in mapping.get("roads", []):
        adjacency.setdefault(road["from"], []).append(
            (road["to"], float(road["length"]))
        )
    return adjacency


def single_source_distances(graph: WeightedGraph, source: str) -> dict[str, float]:
    """Dijkstra shortest-path distances (meters) from 'source' to every node.

    Unreachable nodes are simply absent from the returned dict.
    """
    dist: dict[str, float] = {source: 0.0}
    pq: list[tuple[float, str]] = [(0.0, source)]
    while pq:
        d, u = heapq.heappop(pq)
        if d > dist.get(u, float("inf")):
            continue
        for v, w in graph.get(u, []):
            nd = d + w
            if nd < dist.get(v, float("inf")):
                dist[v] = nd
                heapq.heappush(pq, (nd, v))
    return dist


def shortest_path_distance(graph: WeightedGraph, start_loc: str, goal_loc: str) -> float:
    """Shortest driving distance in meters, or math.inf if unreachable."""
    if start_loc == goal_loc:
        return 0.0
    return single_source_distances(graph, start_loc).get(goal_loc, float("inf"))


def route_distance_from_plan_steps(
    roads_by_id: dict[str, dict[str, Any]],
    road_ids: list[str],
) -> float:
    """Total length (meters) of the roads actually traversed by a plan.

    'road_ids' is the ordered list of road ids extracted from the plan
    (e.g. via 'plan_parser.parse_start_traversal_steps').
    """
    total = 0.0
    for rid in road_ids:
        road = roads_by_id.get(rid)
        if road is None:
            raise KeyError(f"Unknown road id in plan: {rid!r}")
        total += float(road["length"])
    return total
