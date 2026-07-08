from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
import json
import math
from pathlib import Path
import random
from typing import Any

from src.routly.domain.roads import ROAD_CAPACITY_CLASSES, road_capacity_class


BackgroundRoute = tuple[float, list[str]]


@dataclass(frozen=True)
class CongestionWindowFactor:
    start: int
    factor: float


DynamicCongestionProfile = dict[str, list[CongestionWindowFactor]]


@dataclass(frozen=True)
class DynamicRoadSelection:
    dynamic_roads: set[str]
    static_roads: set[str]
    reasons_by_road: dict[str, tuple[str, ...]]


def select_dynamic_roads(
    roads: list[dict[str, Any]],
    nodes_by_id: dict[str, dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    background_routes: list[BackgroundRoute],
    dynamic_profile: DynamicCongestionProfile,
    congestion_type: str,
    hybrid_config: Any,
) -> DynamicRoadSelection:
    """Select which roads keep time-window costs in the optimized model.

    ``dynamic`` marks every road as dynamic. ``hybrid`` keeps only roads that
    matter for traffic, temporal variation, the start-goal corridor, or quick
    candidate paths; all other roads receive one static cost.
    """
    road_ids = {str(road["id"]) for road in roads}
    congestion_type = str(congestion_type).strip().lower()

    if congestion_type == "dynamic":
        return DynamicRoadSelection(
            dynamic_roads=set(road_ids),
            static_roads=set(),
            reasons_by_road={road_id: ("all_roads_dynamic",) for road_id in road_ids},
        )

    if congestion_type != "hybrid":
        return DynamicRoadSelection(
            dynamic_roads=set(),
            static_roads=set(road_ids),
            reasons_by_road={},
        )

    reasons: dict[str, set[str]] = {}

    def mark(road_id: str, reason: str) -> None:
        if road_id in road_ids:
            reasons.setdefault(road_id, set()).add(reason)

    top_k = int(getattr(hybrid_config, "top_k_traffic_roads", 50))
    if top_k > 0:
        for road_id, _ in sorted(
            count_vehicles_per_road(background_routes).items(),
            key=lambda item: (-item[1], item[0]),
        )[:top_k]:
            mark(road_id, "top_traffic")

    min_variation = float(getattr(hybrid_config, "min_temporal_variation", 0.25))
    if min_variation > 0:
        for road_id, changes in dynamic_profile.items():
            values = [change.factor for change in changes]
            if values and (max(values) - min(values)) >= min_variation:
                mark(road_id, "temporal_variation")

    corridor_width = float(getattr(hybrid_config, "corridor_width_meters", 250.0))
    if corridor_width > 0:
        for road_id in _roads_near_start_goal_corridor(
            roads,
            nodes_by_id,
            start_loc,
            goal_loc,
            corridor_width,
        ):
            mark(road_id, "start_goal_corridor")

    candidate_paths = int(getattr(hybrid_config, "candidate_paths", 5))
    if candidate_paths > 0:
        for road_id in _roads_on_candidate_paths(
            roads,
            start_loc,
            goal_loc,
            candidate_paths,
        ):
            mark(road_id, "candidate_path")

    dynamic_roads = set(reasons)
    if not dynamic_roads:
        raise ValueError(
            "Hybrid congestion did not select any dynamic road. "
            "Relax congestion.dynamic.hybrid thresholds or use type: dynamic."
        )

    return DynamicRoadSelection(
        dynamic_roads=dynamic_roads,
        static_roads=road_ids - dynamic_roads,
        reasons_by_road={
            road_id: tuple(sorted(road_reasons))
            for road_id, road_reasons in sorted(reasons.items())
        },
    )


def global_window_starts(
    dynamic_profile: DynamicCongestionProfile,
    dynamic_roads: set[str] | None = None,
) -> list[int]:
    starts = {0}
    selected = dynamic_roads if dynamic_roads is not None else set(dynamic_profile)
    for road_id in selected:
        starts.update(change.start for change in dynamic_profile.get(road_id, []))
    return sorted(starts)


def congestion_factor_at_window(
    dynamic_profile: DynamicCongestionProfile,
    road_id: str,
    window_start: int,
) -> float:
    factor = 1.0
    for change in sorted(dynamic_profile.get(road_id, []), key=lambda item: item.start):
        if change.start > window_start:
            break
        factor = change.factor
    return factor


def generate_background_routes(
    roads: list[dict[str, Any]],
    num_vehicles: int,
    seed: int,
    max_present_time: float | None = None,
) -> list[BackgroundRoute]:
    """Generate deterministic, cycle-free routes shared by PDDL and SUMO."""
    if num_vehicles <= 0 or not roads:
        return []

    rng = random.Random(seed)
    adjacency: dict[str, list[str]] = {}
    road_from: dict[str, str] = {}
    road_to: dict[str, str] = {}
    road_len: dict[str, float] = {}
    road_speed: dict[str, float] = {}

    for road in roads:
        adjacency.setdefault(road["from"], []).append(road["id"])
        road_from[road["id"]] = road["from"]
        road_to[road["id"]] = road["to"]
        road_len[road["id"]] = float(road.get("length", 0.0))
        road_speed[road["id"]] = float(road.get("speed", 0.0) or 0.0)

    # time(road) = length / speed.
    def _route_seconds(route: list[str]) -> float:
        total = 0.0
        for rid in route:
            spd = road_speed.get(rid, 0.0)
            if spd > 0:
                total += road_len.get(rid, 0.0) / spd
        return total

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
            if max_present_time is not None:
                latest_depart = max_present_time - _route_seconds(route)
                if latest_depart < 1.0:
                    continue          # can't finish before T -> discard route
                depart = round(rng.uniform(1.0, latest_depart), 1)
            else:
                depart = round(rng.uniform(1.0, 300.0), 1)   # old behaviour
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
        factors[road_id] = _congestion_factor_for_count(
            vehicle_count,
            threshold,
            max_factor,
        )
    return factors


def compute_dynamic_congestion_profile(
    roads: list[dict[str, Any]],
    background_routes: list[BackgroundRoute],
    max_factor: float,
    vehicles_for_max_congestion_by_road_class: dict[str, int],
    window_seconds: int,
) -> DynamicCongestionProfile:
    """
    Compute congestion-factor changes by road and time window.

    Each background vehicle contributes once to the window in which it enters a
    road. The first value for every road is always the initial factor at t=0;
    later entries are emitted only when the factor changes from the previous
    window.
    """
    if window_seconds <= 0:
        raise ValueError("window_seconds must be greater than zero")
    if max_factor < 1.0:
        raise ValueError("max_factor must be greater than or equal to 1.0")

    thresholds = _validate_congestion_thresholds(
        vehicles_for_max_congestion_by_road_class
    )
    roads_by_id = {road["id"]: road for road in roads}
    counts_by_road_window: dict[str, Counter[int]] = {
        road["id"]: Counter()
        for road in roads
    }
    max_window_start = 0

    for depart, route in background_routes:
        current_time = float(depart)
        for road_id in route:
            road = roads_by_id.get(road_id)
            if road is None:
                continue

            window_start = int(current_time // window_seconds) * window_seconds
            counts_by_road_window[road_id][window_start] += 1
            max_window_start = max(max_window_start, window_start)

            speed = float(road.get("speed", 0))
            if speed <= 0:
                raise ValueError(f"Road {road_id} has non-positive speed")
            current_time += float(road["length"]) / speed

    profile: DynamicCongestionProfile = {}
    window_starts = range(
        0,
        max_window_start + (2 * window_seconds),
        window_seconds,
    )

    for road in roads:
        road_id = road["id"]
        threshold = thresholds[road_capacity_class(road)]
        changes: list[CongestionWindowFactor] = []
        previous_factor: float | None = None

        for window_start in window_starts:
            factor = _congestion_factor_for_count(
                counts_by_road_window[road_id].get(window_start, 0),
                threshold,
                max_factor,
            )
            if previous_factor is None or factor != previous_factor:
                changes.append(
                    CongestionWindowFactor(
                        start=window_start,
                        factor=factor,
                    )
                )
                previous_factor = factor

        profile[road_id] = changes

    return profile


def _roads_near_start_goal_corridor(
    roads: list[dict[str, Any]],
    nodes_by_id: dict[str, dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    corridor_width_meters: float,
) -> set[str]:
    start = _node_point(nodes_by_id.get(start_loc))
    goal = _node_point(nodes_by_id.get(goal_loc))
    if start is None or goal is None:
        return set()

    selected: set[str] = set()
    for road in roads:
        points = _road_points(road, nodes_by_id)
        if any(
            _distance_point_to_segment(point, start, goal) <= corridor_width_meters
            for point in points
        ):
            selected.add(str(road["id"]))
    return selected


def _roads_on_candidate_paths(
    roads: list[dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    candidate_paths: int,
) -> set[str]:
    try:
        import networkx as nx
    except ImportError:
        return set()

    graph = nx.DiGraph()
    for road in roads:
        source = str(road["from"])
        target = str(road["to"])
        road_id = str(road["id"])
        length = max(float(road.get("length", 0.0)), 0.001)
        existing = graph.get_edge_data(source, target)
        if existing is None or length < float(existing.get("weight", math.inf)):
            graph.add_edge(source, target, weight=length, road_id=road_id)

    if start_loc not in graph or goal_loc not in graph:
        return set()

    selected: set[str] = set()
    try:
        paths = nx.shortest_simple_paths(graph, start_loc, goal_loc, weight="weight")
        for _, path in zip(range(candidate_paths), paths):
            for source, target in zip(path, path[1:]):
                edge = graph.get_edge_data(source, target)
                if edge and "road_id" in edge:
                    selected.add(str(edge["road_id"]))
    except (nx.NetworkXNoPath, nx.NodeNotFound):
        return set()
    return selected


def _road_points(
    road: dict[str, Any],
    nodes_by_id: dict[str, dict[str, Any]],
) -> list[tuple[float, float]]:
    points: list[tuple[float, float]] = []
    for point in road.get("geometry") or []:
        try:
            points.append((float(point[0]), float(point[1])))
        except (TypeError, ValueError, IndexError):
            continue
    if points:
        return points

    fallback = [
        _node_point(nodes_by_id.get(str(road.get("from")))),
        _node_point(nodes_by_id.get(str(road.get("to")))),
    ]
    return [point for point in fallback if point is not None]


def _node_point(node: dict[str, Any] | None) -> tuple[float, float] | None:
    if not node:
        return None
    try:
        return float(node["x"]), float(node["y"])
    except (KeyError, TypeError, ValueError):
        return None


def _distance_point_to_segment(
    point: tuple[float, float],
    start: tuple[float, float],
    goal: tuple[float, float],
) -> float:
    px, py = point
    sx, sy = start
    gx, gy = goal
    dx = gx - sx
    dy = gy - sy
    denom = dx * dx + dy * dy
    if denom <= 0:
        return math.hypot(px - sx, py - sy)
    t = max(0.0, min(1.0, ((px - sx) * dx + (py - sy) * dy) / denom))
    closest_x = sx + t * dx
    closest_y = sy + t * dy
    return math.hypot(px - closest_x, py - closest_y)


def _congestion_factor_for_count(
    vehicle_count: int,
    threshold: int,
    max_factor: float,
) -> float:
    factor = min(
        max_factor,
        1.0 + (vehicle_count / threshold) * (max_factor - 1.0),
    )
    return round(factor, 2)


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


def estimate_route_duration_straight_line(
    nodes_by_id: dict[str, dict[str, Any]],
    roads: list[dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    speed: float | None = None,
    congestion: float = 1.0,
    detour_factor: float = 1.3,
    safety_margin: float = 1.0,
) -> float:
    """Approximation of the start->goal duration (seconds).

        distance ~= euclidean(start, goal) * detour_factor
        time     ~= distance * congestion / speed

    speed defaults to the average road speed-limit. `detour_factor` (~1.3)
    compensates for real roads being longer than a straight line.
    Returns 0.0 if a node coordinate is missing.
    """
    s = nodes_by_id.get(start_loc)
    g = nodes_by_id.get(goal_loc)
    if not s or not g:
        return 0.0

    if speed is None:
        speeds = [float(r["speed"]) for r in roads if float(r.get("speed", 0)) > 0]
        speed = sum(speeds) / len(speeds) if speeds else 1.0

    straight = math.hypot(float(g["x"]) - float(s["x"]),
                          float(g["y"]) - float(s["y"]))
    distance = straight * detour_factor
    return round(distance * congestion / speed * safety_margin, 1)

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
