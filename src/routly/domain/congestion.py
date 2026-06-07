from __future__ import annotations

from collections import Counter
import json
from pathlib import Path
import random
from typing import Any


BackgroundRoute = tuple[float, list[str]]


def generate_background_routes(
    roads: list[dict[str, Any]],
    num_vehicles: int,
    seed: int = 42,
) -> list[BackgroundRoute]:
    """Generate deterministic background routes that can be shared by PDDL and SUMO."""
    if num_vehicles <= 0 or not roads:
        return []

    rng = random.Random(seed)
    adjacency: dict[str, list[str]] = {}
    road_to: dict[str, str] = {}

    for road in roads:
        adjacency.setdefault(road["from"], []).append(road["id"])
        road_to[road["id"]] = road["to"]

    all_road_ids = list(road_to)
    routes: list[BackgroundRoute] = []
    attempts = 0

    while len(routes) < num_vehicles and attempts < num_vehicles * 20:
        attempts += 1
        start_road = rng.choice(all_road_ids)
        route = [start_road]
        current_to = road_to[start_road]

        for _ in range(rng.randint(3, 12)):
            next_roads = adjacency.get(current_to, [])
            if not next_roads:
                break
            next_road = rng.choice(next_roads)
            route.append(next_road)
            current_to = road_to[next_road]

        if len(route) >= 2:
            depart = round(rng.uniform(1.0, 300.0), 1)
            routes.append((depart, route))

    routes.sort(key=lambda item: item[0])
    return routes


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
    vehicles_for_max_congestion: int,
) -> dict[str, float]:
    """
    Scale each road from 1.0 to max_factor according to its absolute vehicle load.

    A road reaches max_factor when its vehicle count reaches the configured
    threshold. Higher counts remain capped at max_factor.
    """

    if max_factor < 1.0:
        raise ValueError("max_factor must be greater than or equal to 1.0")
    if vehicles_for_max_congestion <= 0:
        raise ValueError("vehicles_for_max_congestion must be greater than zero")

    counts = count_vehicles_per_road(background_routes)
    
    # print(
    #     f"Vehicle counts for congestion computation: "
    #     f"{ {road_id: count for road_id, count in counts.items() if count > 0} }")
    
    return {
        road["id"]: round(
            min(max_factor, 1.0 + (counts.get(road["id"], 0) / vehicles_for_max_congestion) * (max_factor - 1.0))
            , 2
        )
        for road in roads
    }


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
