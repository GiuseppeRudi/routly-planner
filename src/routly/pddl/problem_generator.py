from __future__ import annotations

from typing import Any

import networkx as nx

from src.routly.features import FeatureConfig


AVERAGE_LIGHT_WAIT_S = 30.0   # seconds — typical urban signal half-cycle


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
    congested_road_ids: set[str] = set()
    if features.congestion_in_pddl:
        congested_road_ids = _compute_congested_roads(
            roads,
            fraction=features.congestion.congested_fraction,
        )
        print(f"  Congested roads (top {features.congestion.congested_fraction*100:.0f}% centrality): "
              f"{len(congested_road_ids)} / {len(roads)}")

    objects_block  = _build_objects(node_map, roads, vehicle_id)
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congested_road_ids)
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
    congested_road_ids: set[str],
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
            factor = features.congestion.congestion_factor if road_id in congested_road_ids else 1.0
            lines.append(f"  (= (congestion-factor {road_id}) {factor})")

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

def _compute_congested_roads(
    roads: list[dict[str, Any]],
    fraction: float = 0.2,
) -> set[str]:
    """
    Mark the top `fraction` of roads as congested using edge betweenness
    centrality — roads that lie on many shortest paths are the busiest arteries.
    """
    # Build a lightweight DiGraph just for centrality computation
    G = nx.DiGraph()
    road_by_edge: dict[tuple[str, str], str] = {}

    for r in roads:
        G.add_edge(r["from"], r["to"], weight=r["length"])
        road_by_edge[(r["from"], r["to"])] = r["id"]

    centrality = nx.edge_betweenness_centrality(G, weight="weight", normalized=True)

    # Sort edges by centrality descending, take top fraction
    sorted_edges = sorted(centrality.items(), key=lambda x: x[1], reverse=True)
    n_congested = max(1, int(len(sorted_edges) * fraction))
    congested_edges = {edge for edge, _ in sorted_edges[:n_congested]}

    return {
        road_by_edge[edge]
        for edge in congested_edges
        if edge in road_by_edge
    }
