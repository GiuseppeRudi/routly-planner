from __future__ import annotations

from dataclasses import dataclass
import heapq
from typing import Any


@dataclass(frozen=True)
class LineGraphBoundaryRoads:
    start_road_id: str
    goal_road_id: str
    path_road_ids: tuple[str, ...]


def select_line_graph_boundary_roads(
    roads: list[dict[str, Any]],
    start_loc: str,
    goal_loc: str,
) -> LineGraphBoundaryRoads:
    """Select deterministic start/goal roads from the shortest node path."""
    if start_loc == goal_loc:
        raise ValueError(
            "Line-graph planning requires different start and goal locations."
        )

    roads_by_from: dict[str, list[dict[str, Any]]] = {}
    for road in roads:
        roads_by_from.setdefault(str(road["from"]), []).append(road)

    frontier: list[tuple[float, int, str, tuple[str, ...]]] = [
        (0.0, 0, start_loc, ())
    ]
    best_distance: dict[str, float] = {start_loc: 0.0}
    counter = 1

    while frontier:
        distance, _, loc, path = heapq.heappop(frontier)
        if loc == goal_loc and path:
            return LineGraphBoundaryRoads(
                start_road_id=path[0],
                goal_road_id=path[-1],
                path_road_ids=path,
            )
        if distance > best_distance.get(loc, float("inf")):
            continue

        for road in sorted(
            roads_by_from.get(loc, []),
            key=lambda item: str(item["id"]),
        ):
            next_loc = str(road["to"])
            next_distance = distance + float(road.get("length", 1.0) or 1.0)
            if next_distance >= best_distance.get(next_loc, float("inf")):
                continue
            best_distance[next_loc] = next_distance
            heapq.heappush(
                frontier,
                (next_distance, counter, next_loc, (*path, str(road["id"]))),
            )
            counter += 1

    raise ValueError(
        "No directed road path found for line-graph planning: "
        f"{start_loc} -> {goal_loc}."
    )
