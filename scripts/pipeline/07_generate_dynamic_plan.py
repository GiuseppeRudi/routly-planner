from __future__ import annotations
from pathlib import Path
import argparse
import subprocess
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.config import load_config

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate plan for the dynamic PDDL problem.")
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    return parser.parse_args()

def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)

    dynamic_problem = config.problem_path.parent / "problem_dynamic.pddl"
    dynamic_plan = config.plan_path.parent / "plan_dynamic.sol"
    dynamic_plan_image = config.plan_image_path.parent / "plan_dynamic.png"

    cmd = [
        sys.executable, "scripts/pipeline/04_generate_plan.py",
        "--map-config", args.map_config,
        "--project-config", args.project_config,
        "--problem-override", str(dynamic_problem),
        "--plan-override", str(dynamic_plan),
        "--plan-image-override", str(dynamic_plan_image)
    ]

    subprocess.run(cmd, cwd=PROJECT_ROOT, check=True)

if __name__ == "__main__":
    main()