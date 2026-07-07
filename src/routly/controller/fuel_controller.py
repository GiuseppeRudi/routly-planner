from __future__ import annotations

from dataclasses import dataclass, replace

from src.routly.controller.exceptions import (
    ControllerConfigurationError,
    ControllerError,
)
from src.routly.domain.congestion import (
    compute_congestion_factors,        # <-- NEW
    estimate_route_duration_straight_line,
    generate_background_routes,
    load_background_routes,
    validate_background_routes,
    write_background_routes,
)
from src.routly.controller.graph_utils import (
    build_weighted_road_graph,
    route_distance_from_plan_steps,
    shortest_path_distance,
    single_source_distances,
)
from src.routly.controller.models import (
    ControllerResult,
    ControllerRunRequest,
    ControllerSegment,
)
from src.routly.domain.traffic_lights import (
    generate_traffic_light_timings,
    load_traffic_light_timings,
    write_traffic_light_timings,
)
from src.routly.domain.fuel import FuelParameters, derive_fuel_parameters
from src.routly.features import FeatureConfig
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.pddl_writer import write_pddl
from src.routly.pddl.problem_generator import build_road_network_problem
from src.routly.planning.plan_parser import parse_start_traversal_steps
from src.routly.planning.planner_runner import run_enhsp

_FUEL_EPSILON = 1e-6  # liters tolerance for float comparisons

# Fraction of the real autonomy we allow the target selection to plan for. The
# margin absorbs the gap between the optimal shortest-path estimate and the
# (possibly longer) satisficing plan returned by ENHSP. 1.0 = no margin.
ROUTING_SAFETY_FACTOR = 0.9


@dataclass(frozen=True)
class FuelTargetDecision:
    """Where the controller decides to head for the next leg."""

    target_loc: str
    reason: str  # "goal-reachable" | "station-to-goal" | "station-progress"
    is_station: bool
    estimated_distance_to_target: float | None = None
    estimated_distance_target_to_goal: float | None = None


def _routing_features(features: FeatureConfig) -> FeatureConfig:
    """Feature set used to plan a single leg.

    Fuel accounting is done by the controller itself, so `fuel` is disabled in
    the per-leg PDDL (otherwise the planner would double-count it). Traffic
    lights and congestion are PRESERVED exactly as configured in project.yaml
    so that each leg is routed the way the vehicle will actually be simulated:
      * traffic_lights on  -> metric becomes travel-time (signal delays matter);
      * congestion  on     -> congested roads get higher cost and are avoided.
    Everything else is preserved.
    """
    routing_fuel = replace(features.fuel, enabled=False, replanning=False)
    return replace(features, fuel=routing_fuel)


def select_fuel_target(
    graph,
    current_loc: str,
    goal_loc: str,
    fuel_current: float,
    fuel_params: FuelParameters,
    safety_factor: float = 1.0,
    excluded: frozenset[str] = frozenset(),
) -> FuelTargetDecision:
    """Pick the next target: the goal if it is within the (margin-adjusted)
    autonomy, otherwise the best reachable fuel station.

    Args:
        safety_factor: fraction of the real autonomy usable for planning
            (see ROUTING_SAFETY_FACTOR).
        excluded: targets to skip (e.g. ones whose real plan already proved
            unaffordable this leg).

    Station policy (deterministic):
      1. prefer stations from which the goal is reachable on a full tank;
      2. among those, minimise the total detour d(cur->s) + d(s->goal);
      3. otherwise fall back to stations that at least reduce the remaining
         distance to the goal (multi-hop refuelling);
      4. ties are broken by station id for reproducibility.
    Raises ControllerError when no admissible target remains.
    """
    inf = float("inf")
    rate = fuel_params.consumption_per_meter
    usable_fuel = fuel_current * safety_factor
    autonomy = usable_fuel / rate if rate > 0 else inf
    full_range = (fuel_params.tank_capacity * safety_factor) / rate if rate > 0 else inf

    dist_cur = single_source_distances(graph, current_loc)
    dist_to_goal = dist_cur.get(goal_loc, inf)

    # 1. Goal reachable right now (within margin) and not blacklisted.
    if goal_loc not in excluded and dist_to_goal <= autonomy:
        return FuelTargetDecision(
            target_loc=goal_loc,
            reason="goal-reachable",
            is_station=False,
            estimated_distance_to_target=dist_to_goal,
            estimated_distance_target_to_goal=0.0,
        )

    # 2. Otherwise consider reachable stations (excluding blacklisted ones).
    reachable_stations = [
        s
        for s in fuel_params.stations
        if s != current_loc
        and s not in excluded
        and dist_cur.get(s, inf) <= autonomy
    ]
    if not reachable_stations:
        raise ControllerError(
            f"Fuel controller stuck at {current_loc}: goal {goal_loc} is "
            f"{dist_to_goal:.0f} m away but the usable autonomy is only "
            f"{autonomy:.0f} m and no (further) fuel station is reachable."
        )

    candidates = []
    for station in reachable_stations:
        d_to_station = dist_cur[station]
        d_station_to_goal = shortest_path_distance(graph, station, goal_loc)
        reaches_goal = d_station_to_goal <= full_range
        makes_progress = d_station_to_goal < dist_to_goal
        candidates.append(
            (station, d_to_station, d_station_to_goal, reaches_goal, makes_progress)
        )

    usable = [c for c in candidates if c[3] or c[4]]
    if not usable:
        raise ControllerError(
            f"Fuel controller stuck at {current_loc}: the reachable stations do "
            f"not reduce the distance to {goal_loc}; refuelling there would loop "
            f"without progress."
        )

    usable.sort(key=lambda c: (0 if c[3] else 1, round(c[1] + c[2], 3), c[0]))
    station, d_to_station, d_station_to_goal, reaches_goal, _ = usable[0]
    return FuelTargetDecision(
        target_loc=station,
        reason="station-to-goal" if reaches_goal else "station-progress",
        is_station=True,
        estimated_distance_to_target=d_to_station,
        estimated_distance_target_to_goal=d_station_to_goal,
    )


def run_fuel_controller(
    request: ControllerRunRequest,
    blocked_road_ids: set[str] | None = None,
    run_label: str = "",
    pddl_dir: "Path | None" = None,
    plans_dir: "Path | None" = None,
) -> ControllerResult:
    """Run the offline fuel controller for a single vehicle.

    Args:
        request: shared controller request (config, features, mapping, start/goal).
        blocked_road_ids: roads to treat as closed (removed from the graph and
            from every per-leg PDDL problem) so the controller replans around
            them. Use this to feed LLM-generated closures into the controller.
        run_label: optional prefix for the artifact filenames (e.g. "base" or
            "events") so multiple runs in the same experiment do not overwrite
            each other.
    """
    features = request.features
    if not features.fuel_in_controller:
        raise ControllerConfigurationError(
            "run_fuel_controller requires features.fuel enabled with "
            "replanning=True (fuel_in_controller)."
        )

    config = request.project_config
    mapping = request.mapping

    # Where to write the controller's intermediate PDDL/plan artifacts. Callers
    # (e.g. step 04) route these into the EXISTING run folders -- basic for the
    # base plan, llm for the events plan -- so no separate 'controller' folder
    # is created. When not provided, fall back to the controller dirs.
    pddl_dir = pddl_dir if pddl_dir is not None else config.controller_pddl_dir
    plans_dir = plans_dir if plans_dir is not None else config.controller_plans_dir
    for _directory in (pddl_dir, plans_dir):
        _directory.mkdir(parents=True, exist_ok=True)

    # Optionally close roads (e.g. LLM-generated closures). Removing a road from
    # the road list is equivalent to closing it for both routing and PDDL.
    blocked = set(blocked_road_ids or ())
    roads = [road for road in mapping["roads"] if road["id"] not in blocked]
    roads_by_id = {road["id"]: road for road in roads}
    node_map = {node["id"]: node for node in mapping["nodes"]}
    graph = build_weighted_road_graph({"nodes": mapping["nodes"], "roads": roads})

    fuel_params = derive_fuel_parameters(
        nodes=mapping["nodes"],
        config=features.fuel,
        seed=config.seed,
    )
    rate = fuel_params.consumption_per_meter
    full_range = fuel_params.tank_capacity / rate if rate > 0 else float("inf")

    # Plan every leg as a pure routing problem (fuel is handled here).
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

    background_routes = None
    if routing_features.congestion_enabled:
        if config.background_routes_path.exists():
            background_routes = load_background_routes(config.background_routes_path)
            validate_background_routes(background_routes, mapping["roads"])
        else:
            route_seconds = estimate_route_duration_straight_line(
                node_map,
                mapping["roads"],
                request.start_loc,
                request.goal_loc,
                detour_factor=1.3,
                safety_margin=1.15,
            )
            background_routes = generate_background_routes(
                mapping["roads"],
                routing_features.congestion.num_background_vehicles,
                config.seed,
                max_present_time=route_seconds if route_seconds > 0 else None,
            )
            write_background_routes(
                background_routes, config.background_routes_path
            )
    
    congestion_factors = None
    if routing_features.congestion_in_pddl:
        congestion_factors = compute_congestion_factors(
            roads,
            background_routes or [],
            max_factor=routing_features.congestion.congestion_factor,
            vehicles_for_max_congestion_by_road_class=(
                routing_features.congestion.vehicles_for_max_congestion_by_road_class
            ),
        )
        print(
            f"Cached congestion factors for {len(congestion_factors)} roads "
            f"from {len(background_routes or [])} background routes "
            "(computed once, reused for all legs)."
        )
    
    prefix = f"{run_label}_" if run_label else ""
    domain_text = build_road_network_domain(routing_features)
    domain_path = pddl_dir / f"{prefix}domain_controller.pddl"
    write_pddl(domain_text, domain_path)

    vehicle_id = request.vehicle_id
    goal_loc = request.goal_loc
    current_loc = request.start_loc
    fuel_current = fuel_params.initial_fuel

    segments: list[ControllerSegment] = []
    plan_lines: list[str] = [
        ";; ==========================================================",
        ";;  CONTROLLER FUEL PLAN (offline replanning)"
        + (f"  [{run_label}]" if run_label else ""),
        f";;  vehicle={vehicle_id}  start={current_loc}  goal={goal_loc}",
        f";;  tank={fuel_params.tank_capacity:.3f} L  "
        f"initial={fuel_params.initial_fuel:.3f} L  "
        f"rate={rate:.6f} L/m  full_range={full_range:.0f} m",
        f";;  blocked_roads={len(blocked)}  safety_factor={ROUTING_SAFETY_FACTOR}",
        ";; ==========================================================",
    ]
    time_offset = 0.0
    max_iterations = features.controller.max_iterations

    reached_goal = False
    for index in range(max_iterations):
        if current_loc == goal_loc:
            reached_goal = True
            break

        # Inner retry: the ENHSP plan may be longer than the optimal estimate.
        # If a leg proves unaffordable, blacklist that target and pick a closer
        # one; select_fuel_target raises only when nothing admissible is left.
        excluded: set[str] = set()
        while True:
            decision = select_fuel_target(
                graph,
                current_loc,
                goal_loc,
                fuel_current,
                fuel_params,
                safety_factor=ROUTING_SAFETY_FACTOR,
                excluded=frozenset(excluded),
            )
            target = decision.target_loc

            problem_text = build_road_network_problem(
                node_map=node_map,
                roads=roads,
                start_loc=current_loc,
                goal_loc=target,
                vehicle_id=vehicle_id,
                problem_name=f"fuel_{prefix}leg_{index:02d}",
                features=routing_features,
                background_routes=background_routes,
                traffic_light_timings=traffic_light_timings,
                fuel_params=None,
                congestion_factors_override=congestion_factors,
                seed=config.seed,
            )
            problem_path = (
                pddl_dir
                / f"problem_fuel_{prefix}leg_{index:02d}.pddl"
            )
            write_pddl(problem_text, problem_path)

            plan_path = (
                plans_dir
                / f"plan_fuel_{prefix}leg_{index:02d}.txt"
            )
            run_enhsp(config.enhsp_jar, domain_path, problem_path, plan_path)
            plan_text = plan_path.read_text(encoding="utf-8")
            steps = parse_start_traversal_steps(plan_text)

            if not steps:
                if current_loc == target:
                    reached = current_loc
                else:
                    raise ControllerError(
                        f"Planner returned no plan for leg {index} "
                        f"({current_loc} -> {target})."
                    )
            else:
                reached = steps[-1].to_loc

            road_ids = [step.road_id for step in steps]
            leg_distance = route_distance_from_plan_steps(roads_by_id, road_ids)
            leg_fuel = leg_distance * rate

            if leg_fuel > fuel_current + _FUEL_EPSILON:
                # Real plan longer than the optimal estimate: this target is too
                # far to reach safely. Blacklist it and try a closer one.
                print(
                    f"   Controller: leg {index} to {target} needs "
                    f"{leg_fuel:.3f} L over {leg_distance:.0f} m but only "
                    f"{fuel_current:.3f} L available; picking a closer target."
                )
                excluded.add(target)
                continue

            break  # affordable leg found

        fuel_current -= leg_fuel

        plan_lines.append(
            f";; --- leg {index}: {current_loc} -> {target} "
            f"({'station' if decision.is_station else 'goal'}), "
            f"{leg_distance:.0f} m, {leg_fuel:.3f} L consumed, "
            f"fuel left {fuel_current:.3f} L"
        )
        for step in steps:
            plan_lines.append(
                f"{time_offset + step.timestamp:.3f}: "
                f"(start-traversal {vehicle_id} {step.road_id} "
                f"{step.from_loc} {step.to_loc})"
            )
        if steps:
            time_offset += steps[-1].timestamp + 1.0

        refuelled = False
        if decision.is_station and reached == target:
            fuel_current = fuel_params.tank_capacity
            refuelled = True
            plan_lines.append(
                f";; refuel at {target} -> tank full ({fuel_current:.3f} L)"
            )

        segments.append(
            ControllerSegment(
                index=index,
                mode="fuel",
                start_loc=current_loc,
                target_loc=target,
                reached_loc=reached,
                plan_path=plan_path,
                problem_path=problem_path,
                notes=(
                    f"{decision.reason}; dist={leg_distance:.0f} m; "
                    f"fuel_left={fuel_current:.3f} L"
                    + ("; refuelled" if refuelled else "")
                ),
            )
        )

        # Guard against non-progress loops.
        if reached == current_loc:
            raise ControllerError(
                f"Fuel controller made no progress at {current_loc} "
                f"(leg {index}); aborting to avoid an infinite loop."
            )
        current_loc = reached
    else:
        raise ControllerError(
            f"Fuel controller exceeded max_iterations={max_iterations} "
            f"without reaching {goal_loc} (stopped at {current_loc})."
        )

    plan_output = "\n".join(plan_lines) + "\n"
    status = "success" if reached_goal else "failed"
    message = (
        f"Reached {goal_loc} in {len(segments)} leg(s); "
        f"final fuel {fuel_current:.3f} L."
        if reached_goal
        else f"Stopped at {current_loc} before reaching {goal_loc}."
    )
    return ControllerResult(
        mode="fuel",
        status=status,
        plan_text=plan_output,
        segments=segments,
        message=message,
    )
