from __future__ import annotations

from typing import Any

from src.routly.controller.exceptions import ControllerNotImplementedError


def build_weighted_road_graph(mapping: dict[str, Any]) -> Any:
    """Build the shared weighted road graph used by controller policies."""
    raise ControllerNotImplementedError(
        "build_weighted_road_graph() is a controller scaffold stub."
    )


def shortest_path_distance(graph: Any, start_loc: str, goal_loc: str) -> float:
    """Return distance between two locations according to the controller graph."""
    raise ControllerNotImplementedError(
        "shortest_path_distance() is a controller scaffold stub."
    )


def route_distance_from_plan_steps(
    roads_by_id: dict[str, dict[str, Any]],
    road_ids: list[str],
) -> float:
    """Return the travelled distance for a planned sequence of road ids."""
    raise ControllerNotImplementedError(
        "route_distance_from_plan_steps() is a controller scaffold stub."
    )
