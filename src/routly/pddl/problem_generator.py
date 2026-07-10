from __future__ import annotations

from typing import Any

from src.routly.config import (
    COMPILED_DURATION_MODE_GENERIC,
    COMPILED_DURATION_MODE_LINE_GRAPH,
    COMPILED_DURATION_MODE_ROAD_SPECIFIC,
    VALID_COMPILED_DURATION_MODES,
)
from src.routly.domain.fuel import FuelParameters
from src.routly.domain.congestion import (
    BackgroundRoute,
    DynamicCongestionProfile,
    DynamicRoadSelection,
    compute_congestion_factors,
    compute_dynamic_congestion_profile,
    congestion_factor_at_window,
    generate_background_routes,
    global_window_starts,
    select_dynamic_roads,
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
TRAVERSAL_PROCESS = "process"
TRAVERSAL_COMPILED_DURATION = "compiled_duration"
VALID_TRAVERSAL_MODELS = {TRAVERSAL_PROCESS, TRAVERSAL_COMPILED_DURATION}


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
    congestion_factors_override: dict[str, float] | None = None,
    seed: int | None = None,
    traversal_model: str = TRAVERSAL_PROCESS,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
    objects_declared_in_domain: bool = False,
) -> str:
    if features is None:
        features = FeatureConfig.base()
    traversal_model = _validate_traversal_model(features, traversal_model)
    compiled_duration_mode = _validate_compiled_duration_mode(
        traversal_model,
        compiled_duration_mode,
    )
    if _uses_road_specific_compiled_actions(traversal_model, compiled_duration_mode):
        objects_declared_in_domain = False

    congestion_factors: dict[str, float] = {}
    dynamic_congestion_profile: DynamicCongestionProfile = {}
    dynamic_road_selection = DynamicRoadSelection(
        dynamic_roads=set(),
        static_roads={str(road["id"]) for road in roads},
        reasons_by_road={},
    )
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

    if congestion_factors_override is not None and features.congestion_in_pddl:
        congestion_factors = dict(congestion_factors_override)
        print(
            f"Using overridden congestion factors for "
            f"{len(congestion_factors)} roads."
        )

    elif features.snapshot_congestion_in_pddl or features.dynamic_congestion_in_pddl:
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
        dynamic_road_selection = select_dynamic_roads(
            roads=roads,
            nodes_by_id=node_map,
            start_loc=start_loc,
            goal_loc=goal_loc,
            background_routes=background_routes or [],
            dynamic_profile=dynamic_congestion_profile,
            congestion_type=features.congestion.type,
            hybrid_config=features.congestion.dynamic.hybrid,
        )
        for line in dynamic_congestion_diagnostic_lines(
            dynamic_congestion_profile,
            dynamic_road_selection.dynamic_roads,
        ):
            print(line)

    objects_block  = _build_objects(
        node_map,
        roads,
        vehicle_id,
        features,
        dynamic_congestion_profile,
        dynamic_road_selection,
        objects_declared_in_domain,
        traversal_model,
        compiled_duration_mode,
    )
    init_block     = _build_init(node_map, roads, start_loc, vehicle_id,
                                 features, congestion_factors,
                                 traffic_light_timings or {}, fuel_params,
                                 dynamic_congestion_profile,
                                 dynamic_road_selection,
                                 goal_loc,
                                 traversal_model,
                                 compiled_duration_mode)
    metric_line    = _build_metric(vehicle_id, features, traversal_model)
    goal_line      = _build_goal(
        vehicle_id,
        goal_loc,
        features,
        traversal_model,
        compiled_duration_mode,
    )

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

{goal_line}

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
    roads: list[dict[str, Any]] | None = None,
    features: FeatureConfig | None = None,
    traversal_model: str = TRAVERSAL_PROCESS,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
    dynamic_road_selection: DynamicRoadSelection | None = None,
    congestion_factors: dict[str, float] | None = None,
    traffic_light_timings: dict[str, TrafficLightTiming] | None = None,
    excluded_roads: set[str] | None = None,
) -> tuple[str, str]:
    excluded_roads = excluded_roads or set()
    if dynamic_road_selection is None:
        dynamic_roads = {
            road_id
            for road_id in dynamic_congestion_profile
            if road_id not in excluded_roads
        }
        dynamic_road_selection = DynamicRoadSelection(
            dynamic_roads=dynamic_roads,
            static_roads=set(),
            reasons_by_road={},
        )
    else:
        dynamic_road_selection = DynamicRoadSelection(
            dynamic_roads=dynamic_road_selection.dynamic_roads - excluded_roads,
            static_roads=dynamic_road_selection.static_roads - excluded_roads,
            reasons_by_road=dynamic_road_selection.reasons_by_road,
        )

    window_starts = global_window_starts(
        dynamic_congestion_profile,
        dynamic_road_selection.dynamic_roads,
    )
    windows_block = _build_dynamic_congestion_windows_block(
        window_starts,
        traversal_model,
        compiled_duration_mode,
    )
    profile_block = _build_dynamic_congestion_profile_block(
        dynamic_congestion_profile,
        window_starts,
        roads or [],
        features,
        traversal_model,
        dynamic_road_selection,
        congestion_factors or {},
        traffic_light_timings or {},
    )
    return windows_block, profile_block


def dynamic_congestion_pddl_stats(
    dynamic_congestion_profile: DynamicCongestionProfile,
    dynamic_roads: set[str] | None = None,
) -> dict[str, int]:
    included_roads = dynamic_roads or set(dynamic_congestion_profile)
    window_starts = global_window_starts(
        dynamic_congestion_profile,
        included_roads,
    )
    roads_with_updates = sum(
        1
        for road_id in included_roads
        if len({change.factor for change in dynamic_congestion_profile.get(road_id, [])}) > 1
    )
    future_windows = [start for start in window_starts if start > 0]
    return {
        "roads": len(included_roads),
        "roads_with_updates": roads_with_updates,
        "windows": len(window_starts),
        "future_windows": len(future_windows),
        "window_values": len(included_roads) * len(window_starts),
        "grounded_update_events": len(future_windows),
    }


def dynamic_congestion_diagnostic_lines(
    dynamic_congestion_profile: DynamicCongestionProfile,
    dynamic_roads: set[str] | None = None,
) -> list[str]:
    stats = dynamic_congestion_pddl_stats(
        dynamic_congestion_profile,
        dynamic_roads,
    )
    lines = [
        (
            "Dynamic PDDL congestion profile (global-window model): "
            f"{stats['roads']} road(s), "
            f"{stats['windows']} global window(s), "
            f"{stats['window_values']} precomputed road/window value(s)."
        ),
        (
            "Estimated additional grounded temporal events: "
            f"{stats['grounded_update_events']} "
            "(one advance-window transition per future global window)."
        ),
    ]
    if stats["window_values"] >= DYNAMIC_CONGESTION_SEARCH_WARNING_UPDATES:
        lines.append(
            "WARNING: dynamic PDDL congestion still increases the numeric model. "
            "The global-window formulation removes road/window update events, "
            "but each dynamic road still receives one precomputed value per "
            "global window."
        )
    return lines


# ── OBJECTS ───────────────────────────────────────────────────────────────────

def _build_objects(
    node_map: dict[str, Any],
    roads: list[dict[str, Any]],
    vehicle_id: str,
    features: FeatureConfig,
    dynamic_congestion_profile: DynamicCongestionProfile,
    dynamic_road_selection: DynamicRoadSelection,
    objects_declared_in_domain: bool,
    traversal_model: str,
    compiled_duration_mode: str,
) -> str:
    loc_ids  = " ".join(info["id"] for info in node_map.values())
    road_ids = " ".join(r["id"] for r in roads)
    window_starts: list[int] = []
    dynamic_windows_block = ""
    if features.dynamic_congestion_in_pddl:
        window_starts = global_window_starts(
            dynamic_congestion_profile,
            dynamic_road_selection.dynamic_roads,
        )
        dynamic_windows_block = _build_dynamic_congestion_windows_block(
            window_starts,
            traversal_model,
            compiled_duration_mode,
        )

    if _uses_road_specific_compiled_actions(traversal_model, compiled_duration_mode):
        lines = [
            "  (:objects",
            f"    {vehicle_id} - vehicle",
        ]
        for info in sorted(node_map.values(), key=lambda node: str(node["id"])):
            loc_id = str(info["id"])
            lines.append(f"    {loc_id} - {_location_type(loc_id)}")
        for road in sorted(roads, key=lambda item: str(item["id"])):
            road_id = str(road["id"])
            lines.append(f"    {road_id} - {_road_type(road_id)}")
        if dynamic_windows_block:
            lines.append(dynamic_windows_block)
        lines.append("  )")
        return "\n".join(lines)

    if objects_declared_in_domain:
        return f"""\
  (:objects
    {vehicle_id} - vehicle
  )"""

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
    dynamic_road_selection: DynamicRoadSelection | None = None,
    goal_loc: str = "",
    traversal_model: str = TRAVERSAL_PROCESS,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
) -> str:
    lines: list[str] = []
    dynamic_congestion_profile = dynamic_congestion_profile or {}
    dynamic_road_selection = dynamic_road_selection or DynamicRoadSelection(
        dynamic_roads=set(),
        static_roads={str(road["id"]) for road in roads},
        reasons_by_road={},
    )

    # ── vehicle ───────────────────────────────────────────────────────────────
    line_graph = _uses_line_graph_traversal(
        features,
        traversal_model,
        compiled_duration_mode,
    )
    if line_graph:
        start_roads = [road for road in roads if road["from"] == start_loc]
        if not start_roads:
            raise ValueError(f"No outgoing road from start location {start_loc}")
        for road in start_roads:
            lines.append(f"  (ready-road {vehicle_id} {road['id']})")
    else:
        lines.append(f"  (at {vehicle_id} {start_loc})")
    if traversal_model == TRAVERSAL_PROCESS:
        lines += [
            f"  (= (speed {vehicle_id}) 0)",
            f"  (= (total-distance {vehicle_id}) 0)",
            f"  (= (distance-remaining {vehicle_id}) 0)",
        ]
    if features.traffic_lights or traversal_model == TRAVERSAL_COMPILED_DURATION:
        lines.append(f"  (= (travel-time {vehicle_id}) 0)")

    # ── roads ─────────────────────────────────────────────────────────────────
    roads_by_from: dict[str, list[dict[str, Any]]] = {}
    for road in roads:
        roads_by_from.setdefault(str(road["from"]), []).append(road)

    for r in roads:
        road_id = r["id"]
        lines += [
            f"  (connects {road_id} {r['from']} {r['to']})",
            f"  (road-open {road_id})",
        ]
        if traversal_model == TRAVERSAL_PROCESS:
            lines += [
                f"  (= (road-length {road_id}) {r['length']})",
                f"  (= (speed-limit {road_id}) {r['speed']})",
            ]

        congestion_factor = 1.0
        if features.snapshot_congestion_in_pddl:
            congestion_factor = congestion_factors.get(road_id, 1.0)
            lines.append(
                f"  (= (congestion-factor {road_id}) {congestion_factor})"
            )
        elif features.dynamic_congestion_in_pddl:
            if road_id in dynamic_road_selection.static_roads:
                congestion_factor = congestion_factors.get(road_id, 1.0)
            else:
                congestion_factor = _initial_dynamic_congestion_factor(
                    dynamic_congestion_profile,
                    road_id,
                )
            lines.append(
                f"  (= (congestion-factor {road_id}) {congestion_factor})"
            )
        elif features.llm_events.enabled:
            lines.append(f"  (= (congestion-factor {road_id}) 1.0)")

        if traversal_model == TRAVERSAL_COMPILED_DURATION:
            if not features.dynamic_congestion_in_pddl:
                duration = compute_compiled_travel_duration(
                    road=r,
                    features=features,
                    congestion_factor=congestion_factor,
                    traffic_light_timings=traffic_light_timings,
                )
                lines.append(f"  (= (travel-duration {road_id}) {duration})")
            if features.fuel_in_pddl and fuel_params is not None:
                fuel_cost = round(
                    float(r["length"]) * fuel_params.consumption_per_meter,
                    6,
                )
                lines.append(f"  (= (fuel-cost {road_id}) {fuel_cost})")

        if line_graph:
            for next_road in roads_by_from.get(str(r["to"]), []):
                lines.append(f"  (road-next {road_id} {next_road['id']})")
            if r["to"] == goal_loc:
                lines.append(f"  (goal-road {road_id})")

    if features.dynamic_congestion_in_pddl:
        _, dynamic_profile_block = build_dynamic_congestion_pddl_sections(
            dynamic_congestion_profile,
            roads=roads,
            features=features,
            traversal_model=traversal_model,
            compiled_duration_mode=compiled_duration_mode,
            dynamic_road_selection=dynamic_road_selection,
            congestion_factors=congestion_factors,
            traffic_light_timings=traffic_light_timings,
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

    if features.fuel_in_pddl and fuel_params is not None:
        station_set = set(fuel_params.stations)
        lines += [
            f"  (= (fuel-level {vehicle_id}) {fuel_params.initial_fuel})",
            f"  (= (fuel-capacity {vehicle_id}) {fuel_params.tank_capacity})",
        ]
        if traversal_model == TRAVERSAL_PROCESS:
            lines.append(
                f"  (= (fuel-consumption-rate {vehicle_id}) {fuel_params.consumption_per_meter})"
            )
        for node in node_map.values():
            if node["id"] in station_set:
                lines.append(f"  (has-fuel-station {node['id']})")

    return "\n".join(lines)


# ── METRIC ────────────────────────────────────────────────────────────────────

def _build_metric(
    vehicle_id: str,
    features: FeatureConfig,
    traversal_model: str,
) -> str:
    if traversal_model == TRAVERSAL_COMPILED_DURATION:
        return f"  (:metric minimize (travel-time {vehicle_id}))"
    if features.dynamic_congestion_in_pddl:
        return "  (:metric minimize (sim-time))"
    if features.traffic_lights:
        return f"  (:metric minimize (travel-time {vehicle_id}))"
    return f"  (:metric minimize (total-distance {vehicle_id}))"


def _build_goal(
    vehicle_id: str,
    goal_loc: str,
    features: FeatureConfig,
    traversal_model: str,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
) -> str:
    if _uses_line_graph_traversal(
        features,
        traversal_model,
        compiled_duration_mode,
    ):
        return f"  (:goal (reached-goal {vehicle_id}))"
    return f"  (:goal (at {vehicle_id} {goal_loc}))"


def compute_compiled_travel_duration(
    road: dict[str, Any],
    features: FeatureConfig,
    congestion_factor: float = 1.0,
    traffic_light_timings: dict[str, TrafficLightTiming] | None = None,
) -> float:
    speed = float(road.get("speed", 0) or 0)
    if speed <= 0:
        return 999999.0

    duration = float(road["length"]) * float(congestion_factor) / speed
    if features.traffic_lights:
        timing = (traffic_light_timings or {}).get(road.get("to"))
        if timing is not None:
            duration += timing.average_wait
    return round(duration, 4)


def _validate_traversal_model(
    features: FeatureConfig,
    traversal_model: str,
) -> str:
    traversal_model = str(traversal_model).strip().lower()
    if traversal_model not in VALID_TRAVERSAL_MODELS:
        raise ValueError(
            "traversal_model must be 'process' or 'compiled_duration'"
        )
    if traversal_model != TRAVERSAL_COMPILED_DURATION:
        return traversal_model
    if features.fuel_in_pddl and features.fuel.consumption_mode == "continuous":
        raise ValueError(
            "planner.traversal_model='compiled_duration' requires "
            "fuel.consumption_mode='discrete'. Continuous fuel consumption "
            "is only supported by traversal_model='process'."
        )
    return traversal_model


def _validate_compiled_duration_mode(
    traversal_model: str,
    compiled_duration_mode: str,
) -> str:
    compiled_duration_mode = str(compiled_duration_mode).strip().lower()
    if compiled_duration_mode not in VALID_COMPILED_DURATION_MODES:
        raise ValueError(
            "compiled_duration_mode must be 'generic', 'road_specific', "
            "or 'line_graph'"
        )
    if compiled_duration_mode == COMPILED_DURATION_MODE_LINE_GRAPH:
        raise ValueError(
            "compiled_duration_mode='line_graph' is recognized but not "
            "implemented yet."
        )
    if (
        traversal_model != TRAVERSAL_COMPILED_DURATION
        and compiled_duration_mode != COMPILED_DURATION_MODE_GENERIC
    ):
        raise ValueError(
            "compiled_duration_mode can be non-generic only with "
            "traversal_model='compiled_duration'."
        )
    return compiled_duration_mode


def _uses_road_specific_compiled_actions(
    traversal_model: str,
    compiled_duration_mode: str,
) -> bool:
    return (
        traversal_model == TRAVERSAL_COMPILED_DURATION
        and compiled_duration_mode == COMPILED_DURATION_MODE_ROAD_SPECIFIC
    )


def _initial_dynamic_congestion_factor(
    profile: DynamicCongestionProfile,
    road_id: str,
) -> float:
    changes = profile.get(road_id, [])
    if changes and changes[0].start == 0:
        return changes[0].factor
    return 1.0


def _build_dynamic_congestion_windows_block(
    window_starts: list[int],
    traversal_model: str = TRAVERSAL_PROCESS,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
) -> str:
    lines = ["", "", DYNAMIC_WINDOWS_BEGIN]
    if window_starts:
        if _uses_road_specific_compiled_actions(
            traversal_model,
            compiled_duration_mode,
        ):
            lines += [
                f"    {_window_id(start)} - {_window_type(_window_id(start))}"
                for start in window_starts
            ]
        else:
            lines += [
                "    " + " ".join(_window_id(start) for start in window_starts),
                "    - time-window",
            ]
    lines.append(DYNAMIC_WINDOWS_END)
    return "\n".join(lines)


def _build_dynamic_congestion_profile_block(
    profile: DynamicCongestionProfile,
    window_starts: list[int],
    roads: list[dict[str, Any]],
    features: FeatureConfig | None,
    traversal_model: str,
    dynamic_road_selection: DynamicRoadSelection,
    congestion_factors: dict[str, float],
    traffic_light_timings: dict[str, TrafficLightTiming],
) -> str:
    lines = [
        DYNAMIC_PROFILE_BEGIN,
        "  (= (sim-time) 0)",
    ]

    if window_starts:
        lines.append(f"  (current-window {_window_id(window_starts[0])})")
        for start in window_starts:
            lines.append(f"  (= (window-start {_window_id(start)}) {start})")
        for current_start, next_start in zip(window_starts, window_starts[1:]):
            lines.append(
                f"  (next-window {_window_id(current_start)} {_window_id(next_start)})"
            )

    road_by_id = {str(road["id"]): road for road in roads}

    for road_id in sorted(dynamic_road_selection.static_roads):
        if road_id not in road_by_id:
            continue
        lines.append(f"  (static-road {road_id})")
        if features and traversal_model == TRAVERSAL_PROCESS:
            effective_speed = _effective_speed(
                road_by_id[road_id],
                congestion_factors.get(road_id, 1.0),
            )
            lines.append(f"  (= (effective-speed {road_id}) {effective_speed})")
        elif features and traversal_model == TRAVERSAL_COMPILED_DURATION:
            duration = compute_compiled_travel_duration(
                road=road_by_id[road_id],
                features=features,
                congestion_factor=congestion_factors.get(road_id, 1.0),
                traffic_light_timings=traffic_light_timings,
            )
            lines.append(f"  (= (travel-duration {road_id}) {duration})")

    for road_id in sorted(dynamic_road_selection.dynamic_roads):
        road = road_by_id.get(road_id)
        if road is None:
            continue
        lines.append(f"  (dynamic-road {road_id})")
        for start in window_starts:
            factor = congestion_factor_at_window(profile, road_id, start)
            window_id = _window_id(start)
            if traversal_model == TRAVERSAL_PROCESS:
                effective_speed = _effective_speed(road, factor)
                lines.append(
                    f"  (= (effective-speed-window {road_id} {window_id}) {effective_speed})"
                )
            elif features is not None:
                duration = compute_compiled_travel_duration(
                    road=road,
                    features=features,
                    congestion_factor=factor,
                    traffic_light_timings=traffic_light_timings,
                )
                lines.append(
                    f"  (= (travel-duration-window {road_id} {window_id}) {duration})"
                )

    lines.append(DYNAMIC_PROFILE_END)
    return "\n".join(lines)


def _effective_speed(road: dict[str, Any], congestion_factor: float) -> float:
    speed = float(road.get("speed", 0) or 0)
    if speed <= 0:
        return 0.0001
    factor = max(float(congestion_factor), 0.0001)
    return round(speed / factor, 6)


def _window_id(window_start: int) -> str:
    return f"tw_{window_start:05d}"


def _location_type(location_id: str) -> str:
    return f"loc_type_{location_id}"


def _road_type(road_id: str) -> str:
    return f"road_type_{road_id}"


def _window_type(window_id: str) -> str:
    return f"window_type_{window_id}"


def _uses_line_graph_traversal(
    features: FeatureConfig,
    traversal_model: str,
    compiled_duration_mode: str = COMPILED_DURATION_MODE_GENERIC,
) -> bool:
    _ = features
    return (
        traversal_model == TRAVERSAL_COMPILED_DURATION
        and compiled_duration_mode == COMPILED_DURATION_MODE_LINE_GRAPH
    )
