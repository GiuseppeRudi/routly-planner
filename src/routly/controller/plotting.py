from __future__ import annotations

from pathlib import Path

from src.routly.graph.graph_export import (
    plot_controller_legs_from_mapping,
    plot_plan_from_mapping,
)
from src.routly.planning.plan_parser import (
    parse_start_traversal_roads,
    parse_start_traversal_steps,
)
from src.routly.sumo.sumo_writer import parse_refuel_stops

# Tolerance for float comparisons between a step's absolute timestamp and a
# segment's window bound.
_WINDOW_EPSILON = 1e-6


def _segment_label(seg) -> str:
    """Mode-aware label: fuel legs show start-to-target, congestion windows
    show the replanning time window (target_loc is always the fixed goal for
    congestion, so start-to-target would be uninformative/repetitive)."""
    if seg.mode == "congestion":
        if seg.window_start is not None and seg.window_end is not None:
            return f"Window {seg.index}: t={seg.window_start:.0f}s -> t={seg.window_end:.0f}s"
        return f"Window {seg.index}"
    return f"Leg {seg.index}: {seg.start_loc} -> {seg.target_loc}"


def plot_controller_result(
    mapping: dict,
    planned_roads: list[str],
    segments: list,
    plan_text: str,
    plan_image_path: Path,
    start_loc: str,
    goal_loc: str,
    fuel_stations: list | None = None,
    title: str = "Controller: start -> goal",
) -> Path | None:
    """Draw the overall controller-plan image, then (if any segment produced
    a non-empty sub-route) a second image breaking the route down leg-by-leg
    (fuel) or window-by-window (congestion).

    Callers are responsible for validating planned_roads is non-empty before
    calling this. Returns the legs/windows image path, or None if no segment
    produced a plottable sub-route.
    """
    fuel_stations = fuel_stations or []
    plot_plan_from_mapping(
        mapping=mapping,
        planned_roads=planned_roads,
        output_path=plan_image_path,
        fuel_stations=fuel_stations,
    )

    # Congestion windows are solved all the way to the fixed goal, so a raw
    # `seg.plan_path` holds a full tentative route, not just the piece that
    # was actually kept before the next replan (see `select_executed_prefix`
    # in congestion_controller.py). Slicing the final, already-concatenated
    # `plan_text` by each segment's [window_start, window_end) reproduces
    # exactly the executed piece instead. Fuel legs don't need this: each
    # `seg.plan_path` already holds only the steps for that leg (see
    # fuel_controller.py), identical to what ends up in `plan_text`.
    full_steps = (
        parse_start_traversal_steps(plan_text)
        if any(seg.mode == "congestion" for seg in segments)
        else []
    )

    legs: list[list[str]] = []
    labels: list[str] = []
    for seg in segments:
        leg_roads: list[str] = []
        if seg.mode == "congestion":
            if seg.window_start is not None and seg.window_end is not None:
                leg_roads = [
                    step.road_id
                    for step in full_steps
                    if seg.window_start - _WINDOW_EPSILON
                    <= step.timestamp
                    < seg.window_end - _WINDOW_EPSILON
                ]
        elif seg.plan_path and Path(seg.plan_path).exists():
            leg_roads = parse_start_traversal_roads(
                Path(seg.plan_path).read_text(encoding="utf-8")
            )
        if not leg_roads:
            continue
        legs.append(leg_roads)
        labels.append(_segment_label(seg))

    if not legs:
        return None

    legs_image_path = plan_image_path.with_name(
        plan_image_path.stem + "_legs" + plan_image_path.suffix
    )
    plot_controller_legs_from_mapping(
        mapping=mapping,
        legs=legs,
        output_path=legs_image_path,
        fuel_stations=fuel_stations,
        chosen_ids=parse_refuel_stops(plan_text) if fuel_stations else [],
        start_loc=start_loc,
        goal_loc=goal_loc,
        leg_labels=labels,
        title=title,
    )
    return legs_image_path
