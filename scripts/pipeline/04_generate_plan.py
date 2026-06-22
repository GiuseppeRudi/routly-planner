from __future__ import annotations

from pathlib import Path
import argparse
import sys
import random
import re
import json
import datetime

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.domain.fuel import load_fuel_stations
from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.graph.graph_export import plot_event_map, plot_plan_from_mapping
from src.routly.llm_client import call_llm
from src.routly.llm.prompts import build_random_prompt, build_strategic_prompt
from src.routly.pddl.mapping import (
    load_mapping,
    build_road_adjacency,
    extract_topology_for_llm,
)
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.planning.planner_runner import run_enhsp

# Safety clamp for "slowdown" events: speed is divided by this factor.
SEVERITY_MIN = 1.5
SEVERITY_MAX = 4.0

EVENT_TYPES = {"accident", "roadworks", "robbery", "slowdown"}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run ENHSP and plot the generated plan governed by features config YAML."
    )
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--features-config", required=True)
    parser.add_argument("--problem-override", help="Path to alternative problem file")
    parser.add_argument("--plan-override", help="Path to alternative plan output file")
    parser.add_argument("--plan-image-override", help="Path to alternative plan image output file")
    return parser.parse_args()


def _run_and_plot(config, features: FeatureConfig, problem_path: Path, plan_path: Path, plan_image_path: Path) -> list[str]:

    print(f"\nRunning ENHSP planner on: {problem_path.name}")
    run_enhsp(
        enhsp_jar=config.enhsp_jar,
        domain_path=config.domain_path,
        problem_path=problem_path,
        plan_path=plan_path,
    )

    mapping = load_mapping(config.mapping_path)
    plan_text = plan_path.read_text(encoding="utf-8")
    planned_roads = parse_start_traversal_roads(plan_text)
    print(f"Roads in plan: {len(planned_roads)}")
    fuel_stations = (
        load_fuel_stations(config.fuel_stations_path)
        if features.fuel.enabled and config.fuel_stations_path.exists()
        else []
    )
    plot_plan_from_mapping(mapping=mapping, planned_roads=planned_roads, output_path=plan_image_path, fuel_stations=fuel_stations)
    print("\nOUTPUT FILES:")
    print(f"  Plan:       {plan_path}")
    print(f"  Plan image: {plan_image_path}")
    return planned_roads


def _largest_connected_component(roads: list[str], adjacency: dict[str, set[str]]) -> list[str]:
    """Return the largest subset of `roads` that forms a connected component
    according to `adjacency` (roads sharing an endpoint)."""
    road_set = set(roads)
    visited: set[str] = set()
    best: list[str] = []
    for start in roads:
        if start in visited:
            continue
        component = []
        stack = [start]
        visited.add(start)
        while stack:
            current = stack.pop()
            component.append(current)
            for neighbor in adjacency.get(current, set()):
                if neighbor in road_set and neighbor not in visited:
                    visited.add(neighbor)
                    stack.append(neighbor)
        if len(component) > len(best):
            best = component
    return best


def _validated_events(
    raw_events: list[dict],
    all_roads: list[str],
    adjacency: dict[str, set[str]],
    max_events: int,
    max_roads_per_event: int,
    max_total_closures: int,
    severity_min: float = SEVERITY_MIN,
    severity_max: float = SEVERITY_MAX,
) -> list[dict]:
    events: list[dict] = []
    used_roads: set[str] = set()
    total_closed = 0

    for raw_event in raw_events:
        if len(events) >= max_events:
            break

        event_type = raw_event.get("event_type", "accident")
        if event_type not in EVENT_TYPES:
            event_type = "accident"

        # "slowdown" never closes a road, so it does not count against the
        # closure budget and is not subject to it either.
        is_closure = event_type != "slowdown"
        if is_closure and total_closed >= max_total_closures:
            continue

        description = raw_event.get(
            "event_description",
            raw_event.get(
                "description",
                "Generic incident detected by the urban monitoring system.",
            ),
        )
        roads = [
            road
            for road in raw_event.get("roads", [])
            if road in all_roads and road not in used_roads
        ]
        if not roads:
            continue

        if event_type == "accident":
            roads = roads[:1]
        else:
            roads = roads[:max_roads_per_event]

        roads = _largest_connected_component(roads, adjacency)
        if not roads:
            continue

        if is_closure:
            roads = roads[:max_total_closures - total_closed]
            if not roads:
                continue

        event = {
            "event_type": event_type,
            "roads": roads,
            "description": description,
        }
        if event_type == "slowdown":
            try:
                severity = float(raw_event.get("severity", severity_min))
            except (TypeError, ValueError):
                severity = severity_min
            event["severity"] = max(severity_min, min(severity_max, severity))

        events.append(event)
        used_roads.update(roads)
        if is_closure:
            total_closed += len(roads)

    return events


def _derive_blocked_locations(
    events: list[dict],
    roads_by_id: dict[str, dict],
    protected_locations: set[str],
) -> list[dict]:
    """Close only intersections shared by two or more roads in the same event."""
    blocked_locations: list[dict] = []
    seen: set[str] = set()

    for event in events:
        endpoint_counts: dict[str, int] = {}
        for road_id in event["roads"]:
            road = roads_by_id.get(road_id)
            if road is None:
                continue
            endpoint_counts[road["from"]] = endpoint_counts.get(road["from"], 0) + 1
            endpoint_counts[road["to"]] = endpoint_counts.get(road["to"], 0) + 1

        for location_id, count in sorted(endpoint_counts.items()):
            if count < 2 or location_id in protected_locations or location_id in seen:
                continue

            blocked_locations.append({
                "id": location_id,
                "event_type": event["event_type"],
                "description": event["description"],
                "shared_closed_roads": count,
            })
            seen.add(location_id)

    return blocked_locations


def _build_random_candidates(
    rng: random.Random,
    all_roads: list[str],
    adjacency: dict[str, set[str]],
    sample_size: int = 8,
    neighbors_shown: int = 3,
) -> list[dict]:
    seed_roads = rng.sample(all_roads, min(sample_size, len(all_roads)))
    return [
        {"road": r, "connected_to": sorted(adjacency.get(r, set()))[:neighbors_shown]}
        for r in seed_roads
    ]


def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)
    rng = random.Random(config.seed)

    problem_path = Path(args.problem_override) if args.problem_override else config.problem_path
    plan_path = Path(args.plan_override) if args.plan_override else config.plan_path
    plan_image_path = Path(args.plan_image_override) if args.plan_image_override else config.plan_image_path

    features = FeatureConfig.from_yaml(args.features_config)

    original_roads = _run_and_plot(config, features, problem_path, plan_path, plan_image_path)

    if not features.llm_events.enabled:
        return

    print("\n" + "=" * 70)
    print(f" LLM STATUS : {features.llm_events.enabled}")
    print("=" * 70)

    # --- LLM event injection + dynamic re-plan ---
    dynamic_problem_path = problem_path.parent / "problem_dynamic.pddl"
    dynamic_plan_path = plan_path.parent / "plan_dynamic.sol"
    dynamic_plan_image_path = plan_image_path.parent / "plan_dynamic.png"
    log_path = problem_path.parent / "incidents_log.json"

    print(f"\n📋 Cloning problem structure to handle dynamic event...")
    with open(problem_path, "r", encoding="utf-8") as f:
        content = f.read()

    all_roads = re.findall(r"\(road-open\s+(road_\d+)\)", content)
    if not all_roads:
        print("❌ No open roads found in the base PDDL file! Skipping dynamic event injection.")
        return

    start_match = re.search(r";;\s*Start:\s*(loc_\d+)", content)
    goal_match = re.search(r";;\s*Goal:\s*(loc_\d+)", content)
    start_loc = start_match.group(1) if start_match else None
    goal_loc = goal_match.group(1) if goal_match else None

    mapping = load_mapping(config.mapping_path)
    roads_by_id = {road["id"]: road for road in mapping["roads"]}
    node_count = len(mapping["nodes"])
    road_count = len(all_roads)
    adjacency = build_road_adjacency(mapping, road_ids=set(all_roads))

    max_events = max(1, min(5, node_count // 20))
    max_roads_per_event = max(1, min(4, node_count // 15))
    max_total_closures = road_count // 4

    if features.llm_events.strategic_injection:
        print(f"   Mode: STRATEGIC TOPOLOGY-BASED GENERATION (LLM)")
        if start_loc is None or goal_loc is None:
            print(
                "❌ Could not extract start/goal from the PDDL problem header "
                "(';; Start:' / ';; Goal:' comments missing). Cannot build a "
                "strategic topology prompt. Skipping dynamic event injection."
            )
            return
        topology = extract_topology_for_llm(
            mapping=mapping,
            all_roads=all_roads,
            start_loc=start_loc,
            goal_loc=goal_loc,
        )
        print(
            f"    Topology sent to LLM: {len(topology['edges'])} edges, "
            f"{len(topology['nodes'])} nodes (truncated={topology['truncated']})"
        )
        prompt = build_strategic_prompt(
            topology=topology,
            node_count=node_count,
            road_count=road_count,
            max_events=max_events,
            max_roads_per_event=max_roads_per_event,
            max_total_closures=max_total_closures,
            min_severity=SEVERITY_MIN,
            max_severity=SEVERITY_MAX,
        )
    else:
        print(f"   Mode: AUTOMATED STOCHASTIC GENERATION (LLM)")
        candidates = _build_random_candidates(rng, all_roads, adjacency)
        print(f"    Candidate clusters sent to LLM: {candidates}")
        prompt = build_random_prompt(
            candidates,
            node_count,
            road_count,
            max_events,
            max_roads_per_event,
            max_total_closures,
        )

    try:
        response_text = call_llm(
            prompt,
            backend=features.llm_events.backend,
            seed=config.seed,
        )
        response_text = re.sub(r"```json|```", "", response_text).strip()
        llm_decision = json.loads(response_text)
        raw_events = llm_decision["events"]
        if not raw_events:
            raise ValueError("LLM returned an empty events list")

        events = _validated_events(
            raw_events,
            all_roads,
            adjacency,
            max_events,
            max_roads_per_event,
            max_total_closures,
            severity_min=SEVERITY_MIN,
            severity_max=SEVERITY_MAX,
        )
        if not events:
            raise ValueError("No valid events left after validation")

    except Exception as e:
        print(f"LLM API call or parsing failed ({e}). Applying safe random fallback.")
        fallback_road = rng.choice(all_roads)
        events = [{
            "event_type": "accident",
            "roads": [fallback_road],
            "description": "Generic incident detected by the urban monitoring system.",
        }]

    print(f"\nLLM generated {len(events)} event(s):")
    for i, event in enumerate(events, 1):
        if event["event_type"] == "slowdown":
            print(f"  - Event {i}: type=slowdown, roads_slowed={len(event['roads'])}, severity={event['severity']}")
        else:
            print(f"  - Event {i}: type={event['event_type']}, roads_closed={len(event['roads'])}")

    print(f"\nAUTOMATED EVENTS INJECTED ({len(events)}):")
    for event in events:
        if event["event_type"] == "slowdown":
            print(f"  ➔ [slowdown, severity={event['severity']}] Slowed roads: {event['roads']}")
        else:
            print(f"  ➔ [{event['event_type']}] Blocked roads: {event['roads']}")
        print(f"     Scenario: {event['description']}")
    print()

    modified_content = re.sub(r"\(problem\s+([^\s\)]+)\)", r"(problem \1_dynamic)", content)
    for event in events:
        if event["event_type"] == "slowdown":
            severity = event["severity"]
            for road in event["roads"]:
                pattern = re.compile(
                    rf"\(=\s*\(congestion-factor\s+{re.escape(road)}\)\s*[\d.]+\)"
                )
                replacement = (
                    f"(= (congestion-factor {road}) {severity})  "
                    f";; [DYNAMIC EVENT - slowdown] {event['description']}"
                )
                if pattern.search(modified_content):
                    modified_content = pattern.sub(replacement, modified_content, count=1)
                    print(f"PDDL file updated. Road {road} slowed down (factor={severity}).")
                else:
                    print(
                        f"congestion-factor line for road '{road}' not found in the problem "
                        f"text (was llm_events.enabled set when the problem was generated?)."
                    )
            continue

        for road in event["roads"]:
            line_to_find = f"(road-open {road})"
            blocked_fact = (
                f"{line_to_find}\n"
                f"  ;; [DYNAMIC EVENT - {event['event_type']}] {event['description']}\n"
                f"  (road-blocked {road})"
            )
            if line_to_find in modified_content:
                modified_content = modified_content.replace(line_to_find, blocked_fact)
                print(f"PDDL file updated. Road {road} is now blocked.")
            else:
                print(f"Line '{line_to_find}' not found in the problem text.")

    protected_locations = {loc for loc in (start_loc, goal_loc) if loc is not None}
    closure_events = [event for event in events if event["event_type"] != "slowdown"]
    blocked_locations = _derive_blocked_locations(
        events=closure_events,
        roads_by_id=roads_by_id,
        protected_locations=protected_locations,
    )
    if blocked_locations:
        location_lines = [
            (
                f"  ;; [DYNAMIC EVENT - {location['event_type']}] "
                f"{location['description']}"
            )
            + "\n"
            + f"  (location-blocked {location['id']})"
            for location in blocked_locations
        ]
        init_end_marker = "\n  )\n\n  (:goal"
        modified_content = modified_content.replace(
            init_end_marker,
            "\n" + "\n".join(location_lines) + init_end_marker,
            1,
        )
        print("PDDL file updated. Blocked intersections:")
        for location in blocked_locations:
            print(
                f"  - {location['id']} "
                f"({location['shared_closed_roads']} closed roads meet here)"
            )
    else:
        print("No intersections blocked: no event closes two or more roads at the same node.")

    with open(dynamic_problem_path, "w", encoding="utf-8") as f:
        f.write(modified_content)

    total_roads_closed = sum(len(event["roads"]) for event in closure_events)
    log_payload = {
        "timestamp": datetime.datetime.now().isoformat(),
        "seed": config.seed,
        "total_events": len(events),
        "total_roads_closed": total_roads_closed,
        "blocked_locations": blocked_locations,
        "events": [
            {
                "event_type": event["event_type"],
                "roads": event["roads"],
                "description": event["description"],
                **({"severity": event["severity"]} if event["event_type"] == "slowdown" else {}),
            }
            for event in events
        ],
    }
    with open(log_path, "w", encoding="utf-8") as log_f:
        json.dump(log_payload, log_f, indent=2, ensure_ascii=False)
    print(f"  Incidents log successfully saved to: {log_path.name}")

    recalculated_roads = _run_and_plot(config, features, dynamic_problem_path, dynamic_plan_path, dynamic_plan_image_path)

    blocked_roads = [
        {"id": road, "event_type": event["event_type"], "description": event["description"]}
        for event in closure_events
        for road in event["roads"]
    ]
    slowed_roads = [
        {"id": road, "event_type": event["event_type"], "description": event["description"], "severity": event["severity"]}
        for event in events
        if event["event_type"] == "slowdown"
        for road in event["roads"]
    ]
    event_map_path = problem_path.parent / "event_map.png"
    plot_event_map(
        mapping=mapping,
        original_roads=original_roads,
        recalculated_roads=recalculated_roads,
        blocked_roads=blocked_roads,
        blocked_locations=blocked_locations,
        start_loc=start_loc,
        goal_loc=goal_loc,
        output_path=event_map_path,
        slowed_roads=slowed_roads,
    )
    print(f"   Event map saved: {event_map_path}")
    print("   It will be opened by plan_to_sumo before launching SUMO.")


if __name__ == "__main__":
    main()
