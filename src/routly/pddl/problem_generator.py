from __future__ import annotations

from typing import Any

from routly.domain.congestion import BackgroundRoute, compute_congestion_factors
from src.routly.features import FeatureConfig
from routly.domain.traffic_lights import (
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
) -> str:
    if features is None:
        features = FeatureConfig.base()

    congestion_factors: dict[str, float] = {}
    if features.traffic_lights and traffic_light_timings is None:
        traffic_light_timings = generate_traffic_light_timings(
            list(node_map.values()),
            features.traffic_lights_config,
        )

    if features.congestion_in_pddl:
        congestion_factors = compute_congestion_factors(
            roads,
            background_routes or [],
            max_factor=features.congestion.congestion_factor,
            vehicles_for_max_congestion=(
                features.congestion.vehicles_for_max_congestion
            ),
        )

        # print("Congestion factors:")
        # for road_id, factor in congestion_factors.items():
        #     print(f"  {road_id}: {factor:.2f}")

        print(
            f"Computed congestion factors for "
            f"{len(congestion_factors)} roads "
            f"from {len(background_routes or [])} generated background routes."
        )

    objects_block  = _build_objects(node_map, roads, vehicle_id)
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congestion_factors,
                                 traffic_light_timings or {})
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

        # LLM events: all roads start unblocked; LLM will add (road-blocked ...) facts
        # No init facts needed here — absence of (road-blocked) means passable.

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

    return "\n".join(lines)


# ── METRIC ────────────────────────────────────────────────────────────────────

def _build_metric(vehicle_id: str, features: FeatureConfig) -> str:
    # Use travel-time when traffic lights are active (it includes signal delays).
    # Fall back to total-distance for pure routing.
    if features.traffic_lights:
        return f"  (:metric minimize (travel-time {vehicle_id}))"
    return f"  (:metric minimize (total-distance {vehicle_id}))"
