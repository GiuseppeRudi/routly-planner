from __future__ import annotations

import argparse
from dataclasses import asdict
import json
from pathlib import Path
import sys
from typing import Any

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.controller import ControllerRunRequest, run_controller
from src.routly.domain.macro_roads import require_macro_artifacts
from src.routly.features import FeatureConfig
from src.routly.pddl.mapping import load_mapping
from src.routly.utils import read_yaml


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run the optional offline controller scaffold."
    )
    parser.add_argument("--project-config", required=True)
    return parser.parse_args()


def extract_vehicle_start_goal(scenario: dict[str, Any]) -> tuple[str, str, str]:
    vehicles = scenario.get("vehicles", [])
    if not vehicles:
        raise ValueError("Scenario YAML does not contain any vehicle.")
    if len(vehicles) > 1:
        raise NotImplementedError(
            "The controller scaffold currently supports one PDDL-controlled vehicle."
        )

    vehicle = vehicles[0]
    return (
        vehicle.get("id", "car1"),
        vehicle["start"]["value"],
        vehicle["goal"]["value"],
    )


def main() -> None:
    args = parse_args()

    config = load_config(args.project_config)
    features = FeatureConfig.from_yaml(args.project_config)

    if not features.controller_enabled:
        print("No replanning controller active: skipping controller_run step.")
        return

    scenario = read_yaml(config.scenario_path)
    vehicle_id, start_loc, goal_loc = extract_vehicle_start_goal(scenario)

    mapping_path, _ = require_macro_artifacts(
        scenario,
        config,
        enabled=features.road_abstraction.enabled,
    )
    mapping = load_mapping(mapping_path)

    for directory in [
        config.controller_pddl_dir,
        config.controller_plans_dir,
        config.controller_images_dir,
        config.controller_logs_dir,
        config.controller_artifacts_dir,
        config.controller_sumo_dir,
    ]:
        directory.mkdir(parents=True, exist_ok=True)

    result = run_controller(
        ControllerRunRequest(
            project_config=config,
            features=features,
            scenario=scenario,
            mapping=mapping,
            vehicle_id=vehicle_id,
            start_loc=start_loc,
            goal_loc=goal_loc,
        )
    )

    if result.plan_text:
        config.controller_plan_path.write_text(result.plan_text, encoding="utf-8")
        print(f"Controller plan written to: {config.controller_plan_path}")

    config.controller_summary_path.write_text(
        json.dumps(asdict(result), indent=2, default=str),
        encoding="utf-8",
    )
    print(f"Controller summary written to: {config.controller_summary_path}")


if __name__ == "__main__":
    main()
