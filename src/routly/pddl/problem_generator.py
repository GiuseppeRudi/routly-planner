from __future__ import annotations

from typing import Any

import networkx as nx

from src.routly.features import FeatureConfig


AVERAGE_LIGHT_WAIT_S = 30.0   # seconds


# ── PUBLIC API ────────────────────────────────────────────────────────────────

def build_road_network_problem(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    start_loc: str,
    goal_loc: str,
    vehicle_id: str = "car1",
    problem_name: str = "road_network_problem",
    features: FeatureConfig | None = None,
) -> str:
    if features is None:
        features = FeatureConfig.base()

    # Compute congested roads if needed (betweenness centrality on road graph)
    congestion_factors: dict[str, float] = {}

    if features.congestion_in_pddl:
        congestion_factors = _compute_congestion_factors(
            roads,
            background_vehicles=features.congestion.num_background_vehicles,
            base_factor=features.congestion.congestion_factor,
        )

        print(f"{congestion_factors}")

        print(
            f"Computed congestion factors for "
            f"{len(congestion_factors)} roads "
            f"using {features.congestion.num_background_vehicles} background vehicles."
        )

    objects_block  = _build_objects(node_map, roads, vehicle_id)
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congestion_factors)
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
                lines.append(f"  (has-traffic-light {loc_id})")
                lines.append(f"  (= (light-wait {loc_id}) {AVERAGE_LIGHT_WAIT_S})")
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


# ── CONGESTION COMPUTATION ────────────────────────────────────────────────────

def _compute_congestion_factors(
    roads: list[dict[str, Any]],
    background_vehicles: int,
    base_factor: float,
) -> dict[str, float]:
    """
    Compute dynamic congestion factors using:
    - edge betweenness centrality
    - number of background vehicles

    More vehicles => higher congestion impact.
    """

    G = nx.DiGraph()
    road_by_edge: dict[tuple[str, str], str] = {}

    for r in roads:
        edge = (r["from"], r["to"])

        G.add_edge(
            r["from"],
            r["to"],
            weight=r["length"],
        )

        road_by_edge[edge] = r["id"]

    centrality = nx.edge_betweenness_centrality(
        G,
        weight="weight",
        normalized=True,
    )

    if not centrality:
        return {}

    max_centrality = max(centrality.values())

    # Prevent division by zero
    if max_centrality == 0:
        max_centrality = 1.0

    # Example:
    # 20 vehicles  -> 0.2
    # 100 vehicles -> 1.0
    # 200 vehicles -> 2.0
    traffic_multiplier = background_vehicles / 100.0

    congestion_factors: dict[str, float] = {}

    for edge, score in centrality.items():
        normalized_score = score / max_centrality

        factor = (
            1.0
            + normalized_score
            * traffic_multiplier
            * (base_factor - 1.0)
        )

        road_id = road_by_edge[edge]
        congestion_factors[road_id] = round(factor, 2)

    return congestion_factors