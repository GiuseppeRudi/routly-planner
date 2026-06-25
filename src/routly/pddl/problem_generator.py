from __future__ import annotations

from typing import Any

from src.routly.domain.fuel import FuelParameters
# ➔ Task 3: Added generate_background_routes import
from src.routly.domain.congestion import BackgroundRoute, compute_congestion_factors, generate_background_routes
from src.routly.features import FeatureConfig
from src.routly.domain.traffic_lights import (
    TrafficLightTiming,
    generate_traffic_light_timings,
)


# ── PUBLIC API ────────────────────────────────────────────────────────────────

def build_road_network_problem(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    vehicle_id: str = "car1",
    problem_name: str = "road_network_problem",
    features: FeatureConfig | None = None,
    background_routes: list[BackgroundRoute] | None = None,
    traffic_light_timings: dict[str, TrafficLightTiming] | None = None,
    fuel_params: FuelParameters | None = None,
    seed: int | None = None,
) -> str:
    if features is None:
        features = FeatureConfig.base()

    congestion_factors: dict[str, float] = {}
    if features.traffic_lights and traffic_light_timings is None:
        if seed is None:
            raise ValueError(
                "A global seed is required when generating traffic-light timings"
            )
        traffic_light_timings = generate_traffic_light_timings(
            list(node_map.values()),
            roads,
            features.traffic_lights_config,
            seed,
        )

    if features.congestion_in_pddl:
        congestion_factors = compute_congestion_factors(
            roads,
            background_routes or [],
            max_factor=features.congestion.congestion_factor,
            vehicles_for_max_congestion_by_road_class=(
                features.congestion.vehicles_for_max_congestion_by_road_class
            ),
        )

        print(
            f"Computed congestion factors for "
            f"{len(congestion_factors)} roads "
            f"from {len(background_routes or [])} generated background routes."
        )

    objects_block  = _build_objects(node_map, roads, vehicle_id)
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congestion_factors,
                                 traffic_light_timings or {}, fuel_params,)
    metric_line    = _build_metric(vehicle_id, features)

    return f"""\
;; ============================================================
;;  PROBLEM: {problem_name}
;;  Features: {features.label}
;;  Start: {start_loc}
;;  Goal:  {goal_loc}
;; ============================================================

(define (problem {problem_name})
  (:domain road-network)

{objects_block}

  (:init
{init_block}
  )

  (:goal (at {vehicle_id} {goal_loc}))

{metric_line}
)
"""


def recleanse_and_compute_dynamic_congestion(
    roads: list[dict[str, Any]],
    blocked_roads: list[str],
    blocked_locations: list[str],
    features: FeatureConfig,
    seed: int,
) -> tuple[dict[str, float], list[Any]]:
    """
    TASK 3: Re-generate background traffic routes on the remaining open network topology
    and re-compute fresh static congestion factors for the PDDL planner input.
    """
    if not features.congestion_in_pddl:
        return {}, []

    closed_edges = set(blocked_roads)
    closed_nodes = set(blocked_locations)

    # Filter out blocked components from the routing pool for background vehicles
    filtered_roads = [
        r for r in roads
        if r["id"] not in closed_edges
        and r["from"] not in closed_nodes
        and r["to"] not in closed_nodes
    ]

    # Re-generate background traffic routes exclusively using the safe open network paths
    new_bg_routes = generate_background_routes(
        filtered_roads,
        features.congestion.num_background_vehicles,
        seed
    )

    # Re-compute static congestion factors for all network edges based on the new traffic distribution.
    new_factors = compute_congestion_factors(
        roads,
        new_bg_routes,
        max_factor=features.congestion.congestion_factor,
        vehicles_for_max_congestion_by_road_class=(
            features.congestion.vehicles_for_max_congestion_by_road_class
        ),
    )

    return new_factors, new_bg_routes


# ── OBJECTS ───────────────────────────────────────────────────────────────────

def _build_objects(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    vehicle_id: str,
) -> str:
    loc_ids  = " ".join(info["id"] for info in node_map.values())
    road_ids = " ".join(r["id"] for r in roads)

    return f"""\
  (:objects
    {vehicle_id} - vehicle

    {loc_ids}
    - location

    {road_ids}
    - road
  )"""


# ── INIT ──────────────────────────────────────────────────────────────────────

def _build_init(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    start_loc: str,
    vehicle_id: str,
    features: FeatureConfig,
    congestion_factors: dict[str, float],
    traffic_light_timings: dict[str, TrafficLightTiming],
    fuel_params: FuelParameters | None = None,
) -> str:
    lines: list[str] = []

    # ── vehicle ───────────────────────────────────────────────────────────────
    lines += [
        f"  (at {vehicle_id} {start_loc})",
        f"  (= (speed {vehicle_id}) 0)",
        f"  (= (total-distance {vehicle_id}) 0)",
        f"  (= (distance-remaining {vehicle_id}) 0)",
    ]
    if features.traffic_lights:
        lines.append(f"  (= (travel-time {vehicle_id}) 0)")

    # ── roads ─────────────────────────────────────────────────────────────────
    for r in roads:
        road_id = r["id"]
        lines += [
            f"  (connects {road_id} {r['from']} {r['to']})",
            f"  (road-open {road_id})",
            f"  (= (road-length {road_id}) {r['length']})",
            f"  (= (speed-limit {road_id}) {r['speed']})",
        ]

        if features.congestion_in_pddl:
            factor = congestion_factors.get(road_id, 1.0)
            lines.append(
                f"  (= (congestion-factor {road_id}) {factor})"
            )
        elif features.llm_events.enabled:
            lines.append(f"  (= (congestion-factor {road_id}) 1.0)")

    # ── nodes: traffic lights ─────────────────────────────────────────────────
    if features.traffic_lights:
        for node_info in node_map.values():
            loc_id = node_info["id"]
            if node_info.get("traffic_light"):
                timing = traffic_light_timings[loc_id]
                lines.append(f"  (has-traffic-light {loc_id})")
                lines.append(
                    f"  (= (light-wait {loc_id}) {timing.average_wait})"
                )
            else:
                lines.append(f"  (= (light-wait {loc_id}) 0)")

    if features.fuel.enabled and fuel_params is not None:
        station_set = set(fuel_params.stations)
        lines += [
            f"  (= (fuel-level {vehicle_id}) {fuel_params.initial_fuel})",
            f"  (= (fuel-capacity {vehicle_id}) {fuel_params.tank_capacity})",
            f"  (= (fuel-consumption-rate {vehicle_id}) {fuel_params.consumption_per_meter})",
        ]
        for node in node_map.values():
            if node["id"] in station_set:
                lines.append(f"  (has-fuel-station {node['id']})")

    return "\n".join(lines)


# ── METRIC ────────────────────────────────────────────────────────────────────

def _build_metric(vehicle_id: str, features: FeatureConfig) -> str:
    if features.traffic_lights:
        return f"  (:metric minimize (travel-time {vehicle_id}))"
    return f"  (:metric minimize (total-distance {vehicle_id}))"
