from __future__ import annotations

from pathlib import Path
import argparse
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.graph.graph_export import plot_plan_from_mapping
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.planning.planner_runner import run_enhsp


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run ENHSP and plot the generated plan."
    )
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    # --- NUOVI ARGOMENTI PER OVERRIDE ---
    parser.add_argument("--problem-override", help="Path to alternative problem file")
    parser.add_argument("--plan-override", help="Path to alternative plan output file")
    parser.add_argument("--plan-image-override", help="Path to alternative plan image output file")
    return parser.parse_args()

def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)

    # Gestione degli override dinamici
    problem_path = Path(args.problem_override) if args.problem_override else config.problem_path
    plan_path = Path(args.plan_override) if args.plan_override else config.plan_path
    plan_image_path = Path(args.plan_image_override) if args.plan_image_override else config.plan_image_path

    run_enhsp(
        enhsp_jar=config.enhsp_jar,
        domain_path=config.domain_path,
        problem_path=problem_path, # Utilizza la variabile locale
        plan_path=plan_path,       # Utilizza la variabile locale
    )

    mapping = load_mapping(config.mapping_path)

    plan_text = plan_path.read_text(encoding="utf-8") # Modificato
    planned_roads = parse_start_traversal_roads(plan_text)

    print(f"Roads in plan: {len(planned_roads)}")

    plot_plan_from_mapping(
        mapping=mapping,
        planned_roads=planned_roads,
        output_path=plan_image_path, # Modificato
    )

    print("\nOUTPUT FILES:")
    print(f"  Plan:       {plan_path}")
    print(f"  Plan image: {plan_image_path}")

if __name__ == "__main__":
    main()