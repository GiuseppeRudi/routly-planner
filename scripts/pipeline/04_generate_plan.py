from __future__ import annotations

from pathlib import Path
import argparse
import sys
import random
import re
import json
import datetime  # ➔ Added for timestamp logging
import yaml

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.graph.graph_export import plot_plan_from_mapping
from src.routly.llm_client import call_llm
from src.routly.pddl.mapping import load_mapping, build_road_adjacency
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.planning.planner_runner import run_enhsp


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


def _run_and_plot(config, problem_path: Path, plan_path: Path, plan_image_path: Path) -> None:
    print(f"\n🚀 Running ENHSP planner on: {problem_path.name}")
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
    plot_plan_from_mapping(mapping=mapping, planned_roads=planned_roads, output_path=plan_image_path)
    print("\nOUTPUT FILES:")
    print(f"  Plan:       {plan_path}")
    print(f"  Plan image: {plan_image_path}")


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


def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)

    problem_path = Path(args.problem_override) if args.problem_override else config.problem_path
    plan_path = Path(args.plan_override) if args.plan_override else config.plan_path
    plan_image_path = Path(args.plan_image_override) if args.plan_image_override else config.plan_image_path

    features = FeatureConfig.from_yaml(args.features_config)

    print("\n" + "=" * 70)
    print(f"📊 CONFIG CHECK: features.llm_events.enabled = {features.llm_events.enabled}")
    print("=" * 70)

    # Always plan on the static problem first → guarantees plan.txt always exists
    _run_and_plot(config, problem_path, plan_path, plan_image_path)

    if not features.llm_events.enabled:
        return

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

    print(f"🔮 Mode: AUTOMATED STOCHASTIC GENERATION (LLM)")

    mapping = load_mapping(config.mapping_path)
    node_count = len(mapping["nodes"])
    road_count = len(all_roads)
    adjacency = build_road_adjacency(mapping, road_ids=set(all_roads))

    max_events = max(1, min(5, node_count // 20))
    max_roads_per_event = max(1, min(4, node_count // 15))
    max_total_closures = max(1, road_count // 4)

    seed_roads = random.sample(all_roads, min(8, len(all_roads)))
    candidates = [
        {"road": r, "connected_to": sorted(adjacency.get(r, set()))[:3]}
        for r in seed_roads
    ]
    print(f"  ↳ Candidate clusters sent to LLM: {candidates}")

    prompt = (
        f"You are a traffic incident generator for the city of Bologna.\n"
        f"The road network has {node_count} intersections and {road_count} roads.\n"
        f"Generate between 1 and {max_events} traffic events using only the roads from the "
        f"candidate clusters below. Each cluster lists a road and the roads directly connected "
        f"to it (sharing an intersection).\n"
        f"Candidates: {json.dumps(candidates)}\n\n"
        f"Each event must have an \"event_type\":\n"
        f"  - \"accident\": blocks exactly ONE road.\n"
        f"  - \"roadworks\" or \"robbery\": blocks between 1 and {max_roads_per_event} roads, "
        f"which MUST be connected to each other (pick them from the same cluster, i.e. a road "
        f"plus one or more of its connected_to roads).\n"
        f"Do not reuse the same road in more than one event. The total number of closed roads "
        f"across all events must not exceed {max_total_closures}.\n"
        f"You must respond strictly in this JSON format, with no other text before or after:\n"
        f"{{\n"
        f"  \"events\": [\n"
        f"    {{\"event_type\": \"accident\", \"roads\": [\"road_XXXX\"], \"event_description\": \"Short description in English\"}}\n"
        f"  ]\n"
        f"}}"
    )

    try:
        response_text = call_llm(prompt, backend=features.llm_events.backend)
        response_text = re.sub(r"```json|```", "", response_text).strip()
        llm_decision = json.loads(response_text)
        raw_events = llm_decision["events"]
        if not raw_events:
            raise ValueError("LLM returned an empty events list")

        events: list[dict] = []
        used_roads: set[str] = set()
        total_closed = 0

        for raw_event in raw_events:
            if len(events) >= max_events or total_closed >= max_total_closures:
                break

            event_type = raw_event.get("event_type", "accident")
            description = raw_event.get(
                "event_description", "Generic incident detected by the urban monitoring system."
            )
            roads = [
                r for r in raw_event.get("roads", [])
                if r in all_roads and r not in used_roads
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

            roads = roads[:max_total_closures - total_closed]
            if not roads:
                continue

            events.append({"event_type": event_type, "roads": roads, "description": description})
            used_roads.update(roads)
            total_closed += len(roads)

        if not events:
            raise ValueError("No valid events left after validation")

    except Exception as e:
        print(f"⚠️ LLM API call or parsing failed ({e}). Applying safe random fallback.")
        fallback_road = random.choice(all_roads)
        events = [{
            "event_type": "accident",
            "roads": [fallback_road],
            "description": "Generic incident detected by the urban monitoring system.",
        }]

    print(f"\n🚨 AUTOMATED EVENTS INJECTED ({len(events)}):")
    for event in events:
        print(f"  ➔ [{event['event_type']}] Blocked roads: {event['roads']}")
        print(f"     Scenario: {event['description']}")
    print()

    modified_content = re.sub(r"\(problem\s+([^\s\)]+)\)", r"(problem \1_dynamic)", content)
    for event in events:
        for road in event["roads"]:
            line_to_comment = f"(road-open {road})"
            commented_line = f";; [DYNAMIC EVENT - {event['event_type']}] {event['description']}\n  ;; {line_to_comment}"
            if line_to_comment in modified_content:
                modified_content = modified_content.replace(line_to_comment, commented_line)
                print(f"🔒 PDDL file updated. Road {road} is now closed.")
            else:
                print(f"⚠️ Line '{line_to_comment}' not found in the problem text.")

    with open(dynamic_problem_path, "w", encoding="utf-8") as f:
        f.write(modified_content)

    total_roads_closed = sum(len(event["roads"]) for event in events)
    log_payload = {
        "timestamp": datetime.datetime.now().isoformat(),
        "total_events": len(events),
        "total_roads_closed": total_roads_closed,
        "events": [
            {"event_type": event["event_type"], "roads": event["roads"], "description": event["description"]}
            for event in events
        ],
    }
    with open(log_path, "w", encoding="utf-8") as log_f:
        json.dump(log_payload, log_f, indent=2, ensure_ascii=False)
    print(f"📝 Incidents log successfully saved to: {log_path.name}")

    _run_and_plot(config, dynamic_problem_path, dynamic_plan_path, dynamic_plan_image_path)


if __name__ == "__main__":
    main()