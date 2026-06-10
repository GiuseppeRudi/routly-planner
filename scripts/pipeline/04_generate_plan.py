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
from src.routly.pddl.mapping import load_mapping
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
    sample_roads = random.sample(all_roads, min(5, len(all_roads)))
    print(f"  ↳ Sample sent to LLM for decision: {sample_roads}")

    prompt = (
        f"You are a traffic incident generator for the city of Bologna.\n"
        f"Choose exactly ONE road from this list to simulate an accident or roadwork: {sample_roads}.\n"
        f"You must respond strictly in this JSON format, with no other text before or after:\n"
        f"{{\n"
        f"  \"selected_road\": \"road_XXXX\",\n"
        f"  \"event_description\": \"Short description of what happened in English\"\n"
        f"}}"
    )
    try:
        response_text = call_llm(prompt, backend=features.llm_events.backend)
        response_text = re.sub(r"```json|```", "", response_text).strip()
        llm_decision = json.loads(response_text)
        selected_road = llm_decision["selected_road"]
        description = llm_decision["event_description"]
    except Exception as e:
        print(f"⚠️ LLM API call or parsing failed ({e}). Applying safe random fallback.")
        selected_road = random.choice(sample_roads)
        description = "Generic incident detected by the urban monitoring system."

    print(f"\n🚨 AUTOMATED EVENT INJECTED:")
    print(f"  ➔ Blocked Road: {selected_road}")
    print(f"  ➔ Scenario:     {description}\n")

    modified_content = re.sub(r"\(problem\s+([^\s\)]+)\)", r"(problem \1_dynamic)", content)
    line_to_comment = f"(road-open {selected_road})"
    commented_line = f";; [DYNAMIC EVENT] {description}\n  ;; {line_to_comment}"
    if line_to_comment in modified_content:
        modified_content = modified_content.replace(line_to_comment, commented_line)
        print(f"🔒 PDDL file updated. Road {selected_road} is now closed.")
    else:
        print(f"⚠️ Line '{line_to_comment}' not found in the problem text.")

    with open(dynamic_problem_path, "w", encoding="utf-8") as f:
        f.write(modified_content)

    log_payload = {
        "timestamp": datetime.datetime.now().isoformat(),
        "total_events": 1,
        "events": [{"road_id": selected_road, "description": description}]
    }
    with open(log_path, "w", encoding="utf-8") as log_f:
        json.dump(log_payload, log_f, indent=2, ensure_ascii=False)
    print(f"📝 Incidents log successfully saved to: {log_path.name}")

    _run_and_plot(config, dynamic_problem_path, dynamic_plan_path, dynamic_plan_image_path)


if __name__ == "__main__":
    main()