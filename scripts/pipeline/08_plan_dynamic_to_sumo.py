from __future__ import annotations
from pathlib import Path
import argparse
import subprocess
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.config import load_config

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Convert dynamic plan to SUMO and launch GUI.")
    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--scenario-config", required=True)
    parser.add_argument("--features-config", required=True)
    return parser.parse_args()

def main() -> None:
    args = parse_args()
    config = load_config(args.map_config, args.project_config)
    dynamic_plan = config.plan_path.parent / "plan_dynamic.sol"

    cmd = [
        sys.executable, "scripts/pipeline/05_plan_to_sumo.py",
        "--map-config", args.map_config,
        "--project-config", args.project_config,
        "--scenario-config", args.scenario_config,
        "--features-config", args.features_config,
        "--plan-override", str(dynamic_plan)
    ]

    subprocess.run(cmd, cwd=PROJECT_ROOT, check=True)

if __name__ == "__main__":
    main()