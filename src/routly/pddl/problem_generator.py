from __future__ import annotations

from typing import Any

from src.routly.domain.fuel import FuelParameters
from src.routly.domain.congestion import (
    BackgroundRoute,
    DynamicCongestionProfile,
    compute_congestion_factors,
    compute_dynamic_congestion_profile,
    generate_background_routes,
)
from src.routly.features import FeatureConfig
from src.routly.domain.traffic_lights import (
    TrafficLightTiming,
    generate_traffic_light_timings,
)

DYNAMIC_WINDOWS_BEGIN = "    ;; BEGIN DYNAMIC CONGESTION WINDOWS"
DYNAMIC_WINDOWS_END = "    ;; END DYNAMIC CONGESTION WINDOWS"
DYNAMIC_PROFILE_BEGIN = "  ;; BEGIN DYNAMIC CONGESTION PROFILE"
DYNAMIC_PROFILE_END = "  ;; END DYNAMIC CONGESTION PROFILE"
DYNAMIC_CONGESTION_SEARCH_WARNING_UPDATES = 100


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
    dynamic_congestion_profile: DynamicCongestionProfile = {}
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

    if features.static_congestion_in_pddl:
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

    if features.dynamic_congestion_in_pddl:
        dynamic_congestion_profile = compute_dynamic_congestion_profile(
            roads,
            background_routes or [],
            max_factor=features.congestion.congestion_factor,
            vehicles_for_max_congestion_by_road_class=(
                features.congestion.vehicles_for_max_congestion_by_road_class
            ),
            window_seconds=features.congestion.dynamic.window_seconds,
        )
        for line in dynamic_congestion_diagnostic_lines(dynamic_congestion_profile):
            print(line)

    objects_block  = _build_objects(
        node_map,
        roads,
        vehicle_id,
        features,
        dynamic_congestion_profile,
    )
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congestion_factors,
                                 traffic_light_timings or {}, fuel_params,
                                 dynamic_congestion_profile)
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


def recleanse_and_compute_dynamic_congestion_profile(
    roads: list[dict[str, Any]],
    blocked_roads: list[str],
    blocked_locations: list[str],
    features: FeatureConfig,
    seed: int,
) -> tuple[DynamicCongestionProfile, list[Any]]:
    """
    Re-generate background traffic routes on the remaining open topology and
    re-compute a time-windowed congestion profile for dynamic PDDL congestion.
    """
    if not features.dynamic_congestion_in_pddl:
        return {}, []

    closed_edges = set(blocked_roads)
    closed_nodes = set(blocked_locations)

    filtered_roads = [
        r for r in roads
        if r["id"] not in closed_edges
        and r["from"] not in closed_nodes
        and r["to"] not in closed_nodes
    ]

    new_bg_routes = generate_background_routes(
        filtered_roads,
        features.congestion.num_background_vehicles,
        seed,
    )

    new_profile = compute_dynamic_congestion_profile(
        roads,
        new_bg_routes,
        max_factor=features.congestion.congestion_factor,
        vehicles_for_max_congestion_by_road_class=(
            features.congestion.vehicles_for_max_congestion_by_road_class
        ),
        window_seconds=features.congestion.dynamic.window_seconds,
    )

    return new_profile, new_bg_routes


def build_dynamic_congestion_pddl_sections(
    dynamic_congestion_profile: DynamicCongestionProfile,
    excluded_roads: set[str] | None = None,
) -> tuple[str, str]:
    excluded_roads = excluded_roads or set()
    window_starts = _dynamic_profile_future_window_starts(
        dynamic_congestion_profile,
        excluded_roads,
    )
    windows_block = _build_dynamic_congestion_windows_block(window_starts)
    profile_block = _build_dynamic_congestion_profile_block(
        dynamic_congestion_profile,
        window_starts,
        excluded_roads,
    )
    return windows_block, profile_block


def dynamic_congestion_pddl_stats(
    dynamic_congestion_profile: DynamicCongestionProfile,
    excluded_roads: set[str] | None = None,
) -> dict[str, int]:
    excluded_roads = excluded_roads or set()
    included_roads = [
        road_id
        for road_id in dynamic_congestion_profile
        if road_id not in excluded_roads
    ]
    window_starts = _dynamic_profile_future_window_starts(
        dynamic_congestion_profile,
        excluded_roads,
    )
    future_updates = sum(
        1
        for road_id, changes in dynamic_congestion_profile.items()
        if road_id not in excluded_roads
        for change in changes
        if change.start > 0
    )
    roads_with_updates = sum(
        1
        for road_id in included_roads
        if any(change.start > 0 for change in dynamic_congestion_profile[road_id])
    )
    return {
        "roads": len(included_roads),
        "roads_with_updates": roads_with_updates,
        "future_windows": len(window_starts),
        "future_updates": future_updates,
        "grounded_update_events": future_updates,
    }


def dynamic_congestion_diagnostic_lines(
    dynamic_congestion_profile: DynamicCongestionProfile,
    excluded_roads: set[str] | None = None,
) -> list[str]:
    stats = dynamic_congestion_pddl_stats(
        dynamic_congestion_profile,
        excluded_roads,
    )
    lines = [
        (
            "Dynamic PDDL congestion profile: "
            f"{stats['roads']} road(s), "
            f"{stats['future_windows']} future window(s), "
            f"{stats['future_updates']} future update(s)."
        ),
        (
            "Estimated additional grounded update events: "
            f"{stats['grounded_update_events']} "
            "(one activate-congestion-window event per road/window update)."
        ),
    ]
    if stats["future_updates"] >= DYNAMIC_CONGESTION_SEARCH_WARNING_UPDATES:
        lines.append(
            "WARNING: dynamic PDDL congestion may cause search explosion. "
            "These global temporal updates are unrelated to the selected route, "
            "so ENHSP must reason about many extra event orderings; on larger "
            "maps this can lead to millions of expanded states or Java heap OOM."
        )
    return lines


# ── OBJECTS ───────────────────────────────────────────────────────────────────

def _build_objects(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    vehicle_id: str,
    features: FeatureConfig,
    dynamic_congestion_profile: DynamicCongestionProfile,
) -> str:
    loc_ids  = " ".join(info["id"] for info in node_map.values())
    road_ids = " ".join(r["id"] for r in roads)
    dynamic_windows_block = ""
    if features.dynamic_congestion_in_pddl:
        dynamic_windows_block, _ = build_dynamic_congestion_pddl_sections(
            dynamic_congestion_profile,
        )

    return f"""\
  (:objects
    {vehicle_id} - vehicle

    {loc_ids}
    - location

    {road_ids}
    - road
{dynamic_windows_block}
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
    dynamic_congestion_profile: DynamicCongestionProfile | None = None,
) -> str:
    lines: list[str] = []
    dynamic_congestion_profile = dynamic_congestion_profile or {}

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

        if features.static_congestion_in_pddl:
            factor = congestion_factors.get(road_id, 1.0)
            lines.append(
                f"  (= (congestion-factor {road_id}) {factor})"
            )
        elif features.dynamic_congestion_in_pddl:
            factor = _initial_dynamic_congestion_factor(
                dynamic_congestion_profile,
                road_id,
            )
            lines.append(
                f"  (= (congestion-factor {road_id}) {factor})"
            )
        elif features.llm_events.enabled:
            lines.append(f"  (= (congestion-factor {road_id}) 1.0)")

    if features.dynamic_congestion_in_pddl:
        _, dynamic_profile_block = build_dynamic_congestion_pddl_sections(
            dynamic_congestion_profile,
        )
        if dynamic_profile_block:
            lines.append(dynamic_profile_block)

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


def _initial_dynamic_congestion_factor(
    profile: DynamicCongestionProfile,
    road_id: str,
) -> float:
    changes = profile.get(road_id, [])
    if changes and changes[0].start == 0:
        return changes[0].factor
    return 1.0


def _dynamic_profile_future_window_starts(
    profile: DynamicCongestionProfile,
    excluded_roads: set[str],
) -> list[int]:
    starts = {
        change.start
        for road_id, changes in profile.items()
        if road_id not in excluded_roads
        for change in changes
        if change.start > 0
    }
    return sorted(starts)


def _build_dynamic_congestion_windows_block(window_starts: list[int]) -> str:
    lines = ["", "", DYNAMIC_WINDOWS_BEGIN]
    if window_starts:
        lines.append("    " + " ".join(_window_id(start) for start in window_starts))
        lines.append("    - time-window")
    lines.append(DYNAMIC_WINDOWS_END)
    return "\n".join(lines)


def _build_dynamic_congestion_profile_block(
    profile: DynamicCongestionProfile,
    window_starts: list[int],
    excluded_roads: set[str],
) -> str:
    window_start_set = set(window_starts)
    lines = [
        DYNAMIC_PROFILE_BEGIN,
        "  (= (sim-time) 0)",
    ]

    for start in window_starts:
        lines.append(f"  (= (window-start {_window_id(start)}) {start})")

    for road_id in sorted(profile):
        if road_id in excluded_roads:
            continue
        for change in profile[road_id]:
            if change.start not in window_start_set:
                continue
            window_id = _window_id(change.start)
            lines.append(f"  (congestion-update-pending {road_id} {window_id})")
            lines.append(
                f"  (= (congestion-value {road_id} {window_id}) {change.factor})"
            )

    lines.append(DYNAMIC_PROFILE_END)
    return "\n".join(lines)


def _window_id(window_start: int) -> str:
    return f"tw_{window_start:05d}"
