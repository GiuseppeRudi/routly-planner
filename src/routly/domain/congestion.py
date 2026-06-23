from __future__ import annotations

from collections import Counter
import json
from pathlib import Path
import random
from typing import Any

from src.routly.domain.roads import ROAD_CAPACITY_CLASSES, road_capacity_class


BackgroundRoute = tuple[float, list[str]]


def generate_background_routes(
    roads: list[dict[str, Any]],
    num_vehicles: int,
    seed: int,
) -> list[BackgroundRoute]:
    """Generate deterministic, cycle-free routes shared by PDDL and SUMO."""
    if num_vehicles <= 0 or not roads:
        return []

    rng = random.Random(seed)
    adjacency: dict[str, list[str]] = {}
    road_from: dict[str, str] = {}
    road_to: dict[str, str] = {}

    for road in roads:
        adjacency.setdefault(road["from"], []).append(road["id"])
        road_from[road["id"]] = road["from"]
        road_to[road["id"]] = road["to"]

    all_road_ids = [
        road_id
        for road_id in road_to
        if road_from[road_id] != road_to[road_id]
    ]
    if not all_road_ids:
        return []
    routes: list[BackgroundRoute] = []
    attempts = 0

    while len(routes) < num_vehicles and attempts < num_vehicles * 20:
        attempts += 1
        start_road = rng.choice(all_road_ids)
        route = [start_road]
        current_to = road_to[start_road]
        visited_roads = {start_road}
        visited_nodes = {road_from[start_road], current_to}

        for _ in range(rng.randint(3, 12)):
            next_roads = [
                road_id
                for road_id in adjacency.get(current_to, [])
                if road_id not in visited_roads
                and road_to[road_id] not in visited_nodes
            ]
            if not next_roads:
                break

            next_road = rng.choice(next_roads)
            route.append(next_road)
            visited_roads.add(next_road)
            current_to = road_to[next_road]
            visited_nodes.add(current_to)

        if len(route) >= 2:
            depart = round(rng.uniform(1.0, 300.0), 1)
            routes.append((depart, route))

    routes.sort(key=lambda item: item[0])
    validate_background_routes(routes, roads)
    return routes


def validate_background_routes(
    background_routes: list[BackgroundRoute],
    roads: list[dict[str, Any]],
) -> None:
    """Reject disconnected routes, repeated roads, and routes that revisit nodes."""
    road_by_id = {road["id"]: road for road in roads}

    for route_index, (_, route) in enumerate(background_routes):
        if len(route) < 2:
            raise ValueError(
                f"Background route {route_index} must contain at least two roads"
            )

        if len(route) != len(set(route)):
            raise ValueError(
                f"Background route {route_index} repeats one or more roads"
            )

        visited_nodes: set[str] = set()
        previous_to: str | None = None

        for road_id in route:
            if road_id not in road_by_id:
                raise ValueError(
                    f"Background route {route_index} contains unknown road {road_id}"
                )

            road = road_by_id[road_id]
            if previous_to is not None and road["from"] != previous_to:
                raise ValueError(
                    f"Background route {route_index} is disconnected at {road_id}"
                )

            if not visited_nodes:
                visited_nodes.add(road["from"])

            if road["to"] in visited_nodes:
                raise ValueError(
                    f"Background route {route_index} revisits node {road['to']}"
                )

            visited_nodes.add(road["to"])
            previous_to = road["to"]


def count_vehicles_per_road(
    background_routes: list[BackgroundRoute],
) -> dict[str, int]:
    """Count vehicles using each road, counting a vehicle once per road."""
    counts: Counter[str] = Counter()
    for _, route in background_routes:
        counts.update(set(route))
    return dict(counts)


def compute_congestion_factors(
    roads: list[dict[str, Any]],
    background_routes: list[BackgroundRoute],
    max_factor: float,
    vehicles_for_max_congestion_by_road_class: dict[str, int],
) -> dict[str, float]:
    """
    Scale each road from 1.0 to max_factor according to its vehicle load.

    A road reaches max_factor when its vehicle count reaches the threshold
    configured for its capacity class. Higher counts remain capped at max_factor.
    """

    if max_factor < 1.0:
        raise ValueError("max_factor must be greater than or equal to 1.0")

    thresholds = _validate_congestion_thresholds(
        vehicles_for_max_congestion_by_road_class
    )

    counts = count_vehicles_per_road(background_routes)
    
    # print(
    #     f"Vehicle counts for congestion computation: "
    #     f"{ {road_id: count for road_id, count in counts.items() if count > 0} }")
    
    factors: dict[str, float] = {}
    for road in roads:
        road_id = road["id"]
        threshold = thresholds[road_capacity_class(road)]
        vehicle_count = counts.get(road_id, 0)
        factor = min(
            max_factor,
            1.0 + (vehicle_count / threshold) * (max_factor - 1.0),
        )
        factors[road_id] = round(factor, 2)
    return factors


def _validate_congestion_thresholds(
    thresholds: dict[str, int],
) -> dict[str, int]:
    missing = [
        road_class
        for road_class in ROAD_CAPACITY_CLASSES
        if road_class not in thresholds
    ]
    if missing:
        raise ValueError(
            "Missing congestion threshold(s) for road class: "
            + ", ".join(missing)
        )

    validated = {}
    for road_class in ROAD_CAPACITY_CLASSES:
        try:
            threshold = int(thresholds[road_class])
        except (TypeError, ValueError) as exc:
            raise ValueError(
                "Congestion threshold must be an integer for road class "
                f"{road_class}"
            ) from exc
        if threshold <= 0:
            raise ValueError(
                "Congestion threshold must be greater than zero for road class "
                f"{road_class}"
            )
        validated[road_class] = threshold
    return validated


def write_background_routes(
    background_routes: list[BackgroundRoute],
    path: str | Path,
) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = [
        {"depart": depart, "roads": route}
        for depart, route in background_routes
    ]
    path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def load_background_routes(path: str | Path) -> list[BackgroundRoute]:
    payload = json.loads(Path(path).read_text(encoding="utf-8"))
    return [
        (float(item["depart"]), list(item["roads"]))
        for item in payload
    ]
