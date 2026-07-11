from __future__ import annotations

from dataclasses import dataclass, replace

from src.routly.controller.exceptions import (
    ControllerConfigurationError,
    ControllerError,
)
from src.routly.controller.models import (
    ControllerResult,
    ControllerRunRequest,
    ControllerSegment,
)
from src.routly.domain.congestion import (
    DynamicCongestionProfile,
    compute_dynamic_congestion_profile,
    congestion_factor_at_window,
    estimate_route_duration_straight_line,
    generate_background_routes,
    load_background_routes,
    validate_background_routes,
    write_background_routes,
)
from src.routly.domain.traffic_lights import (
    generate_traffic_light_timings,
    load_traffic_light_timings,
    write_traffic_light_timings,
)
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import build_road_network_problem
from src.routly.planning.plan_parser import (
    PlanStep,
    extract_plan_metric_time,
    parse_start_traversal_steps,
)
from src.routly.planning.planner_runner import run_enhsp

# Tolerance for float comparisons between an arrival time and a window bound.
_WINDOW_EPSILON = 1e-6


@dataclass(frozen=True)
class CongestionWindowSnapshot:
    """Congestion factors active for one controller replanning window."""

    window_start: float
    window_end: float
    congestion_factors: dict[str, float]


@dataclass(frozen=True)
class ExecutedPlanPrefix:
    """Prefix of a plan considered executed before the next replanning call."""

    steps: list[PlanStep]
    reached_loc: str
    elapsed_seconds: float
    is_final_goal: bool


def compute_congestion_window_snapshot(
    dynamic_profile: DynamicCongestionProfile,
    roads: list[dict],
    window_start: float,
    window_end: float,
) -> CongestionWindowSnapshot:
    """Compute static congestion factors for one dynamic controller window.

    Every open road gets exactly one factor, fixed for the whole window: the
    last profile change at or before `window_start` (1.0 if the road never
    changes). The PDDL problem for this window is built with these factors as
    a plain `congestion_factors_override`, never with time-window objects.
    """
    congestion_factors = {
        road["id"]: congestion_factor_at_window(
            dynamic_profile, road["id"], int(window_start)
        )
        for road in roads
    }
    return CongestionWindowSnapshot(
        window_start=window_start,
        window_end=window_end,
        congestion_factors=congestion_factors,
    )


def select_executed_prefix(
    plan_steps: list[PlanStep],
    plan_text: str,
    window_seconds: float,
    start_loc: str,
) -> ExecutedPlanPrefix:
    """Select the plan prefix to execute before replanning.

    Node-boundary policy: the prefix only ever cuts right after an `arrive`
    event, i.e. once the vehicle is back `at` a location. Leg i's arrival is
    the start timestamp of leg i+1; the last leg's arrival (no further leg
    follows) is the plan's own makespan, taken from ENHSP's trailing
    "Metric"/"Elapsed Time" line via `extract_plan_metric_time`. If no leg
    completes within the nominal window, the window is extended to the first
    arrival instead of inventing a mid-road state.
    """
    if not plan_steps:
        return ExecutedPlanPrefix(
            steps=[],
            reached_loc=start_loc,
            elapsed_seconds=0.0,
            is_final_goal=True,
        )

    step_count = len(plan_steps)
    final_time = extract_plan_metric_time(plan_text)
    if final_time is None:
        final_time = plan_steps[-1].timestamp
    arrival_times = [
        plan_steps[i + 1].timestamp for i in range(step_count - 1)
    ] + [final_time]

    cutoff = -1
    for index, arrival in enumerate(arrival_times):
        if arrival <= window_seconds + _WINDOW_EPSILON:
            cutoff = index
        else:
            break

    if cutoff == -1:
        # No leg completes within the nominal window: extend to the first
        # arrival rather than leaving the vehicle mid-road.
        cutoff = 0

    included = plan_steps[: cutoff + 1]
    return ExecutedPlanPrefix(
        steps=included,
        reached_loc=included[-1].to_loc,
        elapsed_seconds=arrival_times[cutoff],
        is_final_goal=(cutoff == step_count - 1),
    )


def _routing_features(features):
    """Feature snapshot used to plan a single congestion window.

    Congestion becomes static for the window (fixed factors injected via
    `congestion_factors_override`, never time-window objects) and fuel is
    fully disabled, mirroring the fuel controller's `_routing_features`.
    Traffic lights are preserved exactly as configured.
    """
    snapshot_congestion = replace(features.congestion, type="static", replanning=False)
    snapshot_fuel = replace(features.fuel, enabled=False, replanning=False)
    return replace(features, congestion=snapshot_congestion, fuel=snapshot_fuel)


def run_congestion_controller(request: ControllerRunRequest) -> ControllerResult:
    """Run the offline congestion controller and return a concatenated plan.

    Splits the horizon into replanning windows (`controller.replan_window_seconds`).
    Every window solves a static PDDL+ `process` problem from `current_loc` to
    the unchanged final goal, with congestion factors fixed for that window.
    Only the node-boundary prefix of the resulting plan is kept; the rest is
    discarded and replaced by the next window's fresh plan.
    """
    features = request.features
    if not features.controller_for_congestion:
        raise ControllerConfigurationError(
            "run_congestion_controller requires features.congestion enabled "
            "with replanning=True (controller_for_congestion)."
        )

    config = request.project_config
    mapping = request.mapping
    roads = mapping["roads"]
    node_map = {node["id"]: node for node in mapping["nodes"]}

    pddl_dir = config.controller_pddl_dir
    plans_dir = config.controller_plans_dir
    for directory in (pddl_dir, plans_dir):
        directory.mkdir(parents=True, exist_ok=True)

    routing_features = _routing_features(features)

    traffic_light_timings: dict = {}
    if routing_features.traffic_lights:
        if config.traffic_light_timings_path.exists():
            traffic_light_timings = load_traffic_light_timings(
                config.traffic_light_timings_path
            )
        else:
            traffic_light_timings = generate_traffic_light_timings(
                mapping["nodes"],
                mapping["roads"],
                routing_features.traffic_lights_config,
                config.seed,
            )
            write_traffic_light_timings(
                traffic_light_timings, config.traffic_light_timings_path
            )

    background_routes = []
    if routing_features.congestion_enabled:
        if config.background_routes_path.exists():
            background_routes = load_background_routes(config.background_routes_path)
            validate_background_routes(background_routes, roads)
        else:
            route_seconds = estimate_route_duration_straight_line(
                node_map,
                roads,
                request.start_loc,
                request.goal_loc,
                detour_factor=1.3,
                safety_margin=1.15,
            )
            background_routes = generate_background_routes(
                roads,
                features.congestion.num_background_vehicles,
                config.seed,
                max_present_time=route_seconds if route_seconds > 0 else None,
            )
            write_background_routes(background_routes, config.background_routes_path)

    dynamic_profile = compute_dynamic_congestion_profile(
        roads,
        background_routes,
        max_factor=features.congestion.congestion_factor,
        vehicles_for_max_congestion_by_road_class=(
            features.congestion.vehicles_for_max_congestion_by_road_class
        ),
        window_seconds=features.congestion.dynamic.window_seconds,
    )
    print(
        f"Computed dynamic congestion profile for {len(dynamic_profile)} roads "
        f"from {len(background_routes)} background routes "
        "(computed once, reused for every window)."
    )

    domain_text = build_road_network_domain(routing_features)
    domain_path = config.controller_domain_path
    write_pddl(domain_text, domain_path)

    vehicle_id = request.vehicle_id
    goal_loc = request.goal_loc
    current_loc = request.start_loc
    replan_window = features.controller.replan_window_seconds
    max_iterations = features.controller.max_iterations

    segments: list[ControllerSegment] = []
    plan_lines: list[str] = [
        ";; ==========================================================",
        ";;  CONTROLLER CONGESTION PLAN (offline windowed replanning)",
        f";;  vehicle={vehicle_id}  start={current_loc}  goal={goal_loc}",
        f";;  replan_window_seconds={replan_window}  max_iterations={max_iterations}",
        ";; ==========================================================",
    ]
    time_offset = 0.0
    elapsed_seconds = 0.0
    reached_goal = current_loc == goal_loc

    index = 0
    while not reached_goal and index < max_iterations:
        window_start = elapsed_seconds
        window_end = elapsed_seconds + replan_window
        snapshot = compute_congestion_window_snapshot(
            dynamic_profile, roads, window_start, window_end
        )

        problem_text = build_road_network_problem(
            node_map=node_map,
            roads=roads,
            start_loc=current_loc,
            goal_loc=goal_loc,
            vehicle_id=vehicle_id,
            problem_name=f"congestion_window_{index:03d}",
            features=routing_features,
            background_routes=background_routes,
            traffic_light_timings=traffic_light_timings,
            fuel_params=None,
            congestion_factors_override=snapshot.congestion_factors,
            seed=config.seed,
        )
        problem_path = pddl_dir / f"problem_congestion_window_{index:03d}.pddl"
        write_pddl(problem_text, problem_path)

        plan_path = plans_dir / f"plan_congestion_window_{index:03d}.txt"
        run_enhsp(config.enhsp_jar, domain_path, problem_path, plan_path)
        plan_text = plan_path.read_text(encoding="utf-8")
        steps = parse_start_traversal_steps(plan_text)

        if not steps and current_loc != goal_loc:
            raise ControllerError(
                f"Planner returned no plan for window {index} "
                f"({current_loc} -> {goal_loc})."
            )

        prefix = select_executed_prefix(steps, plan_text, replan_window, current_loc)

        for step in prefix.steps:
            plan_lines.append(
                f"{time_offset + step.timestamp:.3f}: "
                f"(start-traversal {vehicle_id} {step.road_id} "
                f"{step.from_loc} {step.to_loc})"
            )
        if prefix.steps:
            time_offset += prefix.elapsed_seconds

        segments.append(
            ControllerSegment(
                index=index,
                mode="congestion",
                start_loc=current_loc,
                target_loc=goal_loc,
                reached_loc=prefix.reached_loc,
                window_start=window_start,
                window_end=window_start + prefix.elapsed_seconds,
                plan_path=plan_path,
                problem_path=problem_path,
                notes=(
                    f"steps={len(prefix.steps)}; "
                    f"factors={len(snapshot.congestion_factors)} roads"
                ),
            )
        )

        # Reject non-progressing windows before they can form a controller loop.
        if prefix.reached_loc == current_loc and not prefix.is_final_goal:
            raise ControllerError(
                f"Congestion controller made no progress at {current_loc} "
                f"(window {index}); aborting to avoid an infinite loop."
            )

        current_loc = prefix.reached_loc
        elapsed_seconds += prefix.elapsed_seconds
        reached_goal = prefix.is_final_goal or current_loc == goal_loc
        index += 1

    if not reached_goal:
        raise ControllerError(
            f"Congestion controller exceeded max_iterations={max_iterations} "
            f"without reaching {goal_loc} (stopped at {current_loc})."
        )

    plan_output = "\n".join(plan_lines) + "\n"
    return ControllerResult(
        mode="congestion",
        status="success",
        plan_text=plan_output,
        segments=segments,
        message=(
            f"Reached {goal_loc} in {len(segments)} window(s); "
            f"elapsed {elapsed_seconds:.0f} s."
        ),
    )
