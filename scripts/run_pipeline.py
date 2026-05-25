from __future__ import annotations

from pathlib import Path
import subprocess
import sys
from typing import Any

import yaml

PROJECT_ROOT = Path.cwd()
PIPELINE_CONFIG_PATH = PROJECT_ROOT / "config" / "pipeline.yaml"

sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.utils import read_yaml

SCRIPT_REGISTRY = {
    "build_map": {
        "script": "scripts/pipeline/01_build_map.py",
        "args": ["map_config", "project_config"],
    },
    "select_scenario_points": {
        "script": "scripts/pipeline/02_select_scenario_points.py",
        "args": ["map_config", "project_config", "scenario_output"],
    },
    "build_problem": {
        "script": "scripts/pipeline/03_build_problem.py",
        "args": ["map_config", "project_config", "scenario_config"],
    },
    "generate_plan": {
        "script": "scripts/pipeline/04_generate_plan.py",
        "args": ["map_config", "project_config"],
    },
    "plan_to_sumo": {
        "script": "scripts/pipeline/05_plan_to_sumo.py",
        "args": ["map_config", "project_config", "scenario_config"],
    },
}



def get_pipeline_value(config: dict[str, Any], key: str) -> str:
    configs = config.get("configs", {})
    outputs = config.get("outputs", {})

    if key == "map_config":
        return configs["map_config"]

    if key == "project_config":
        return configs["project_config"]

    if key == "scenario_output":
        return outputs["scenario_config"]

    if key == "scenario_config":
        return outputs["scenario_config"]

    raise KeyError(f"Unsupported pipeline argument key: {key}")


def cli_flag_for_key(key: str) -> str:
    flags = {
        "map_config": "--map-config",
        "project_config": "--project-config",
        "scenario_output": "--scenario-output",
        "scenario_config": "--scenario-config",
    }

    return flags[key]


def validate_pipeline_config(config: dict[str, Any]) -> None:
    configs = config.get("configs", {})
    outputs = config.get("outputs", {})
    run_steps = config.get("run", [])

    if not configs.get("map_config"):
        raise ValueError("Missing configs.map_config in config/pipeline.yaml")

    if not configs.get("project_config"):
        raise ValueError("Missing configs.project_config in config/pipeline.yaml")

    if not outputs.get("scenario_config"):
        raise ValueError("Missing outputs.scenario_config in config/pipeline.yaml")

    if not isinstance(run_steps, list) or not run_steps:
        raise ValueError("Missing or empty run list in config/pipeline.yaml")

    for step_name in run_steps:
        if step_name not in SCRIPT_REGISTRY:
            valid = ", ".join(SCRIPT_REGISTRY.keys())
            raise ValueError(
                f"Unknown pipeline step '{step_name}'. Valid steps are: {valid}"
            )


def validate_existing_input_configs(config: dict[str, Any]) -> None:
    map_config = PROJECT_ROOT / config["configs"]["map_config"]
    project_config = PROJECT_ROOT / config["configs"]["project_config"]

    if not map_config.exists():
        raise FileNotFoundError(f"Map config not found: {map_config}")

    if not project_config.exists():
        raise FileNotFoundError(f"Project config not found: {project_config}")


def build_script_command(step_name: str, config: dict[str, Any]) -> list[str]:
    step_info = SCRIPT_REGISTRY[step_name]
    script_path = PROJECT_ROOT / step_info["script"]

    if not script_path.exists():
        raise FileNotFoundError(f"Script not found for step '{step_name}': {script_path}")

    cmd = [sys.executable, str(script_path)]

    for arg_key in step_info["args"]:
        cmd.append(cli_flag_for_key(arg_key))
        cmd.append(get_pipeline_value(config, arg_key))

    return cmd


def run_step(step_name: str, config: dict[str, Any]) -> None:
    cmd = build_script_command(step_name, config)

    print("\n" + "=" * 70)
    print(f"RUNNING STEP: {step_name}")
    print("=" * 70)
    print("Command:")
    print("  " + " ".join(cmd))

    result = subprocess.run(
        cmd,
        cwd=PROJECT_ROOT,
        text=True,
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"Pipeline stopped: step '{step_name}' failed with exit code {result.returncode}."
        )


def main() -> None:
    pipeline_config = read_yaml(PIPELINE_CONFIG_PATH)

    validate_pipeline_config(pipeline_config)
    validate_existing_input_configs(pipeline_config)

    run_steps = pipeline_config["run"]

    print("Routly pipeline")
    print(f"Pipeline config: {PIPELINE_CONFIG_PATH}")
    print("Steps:")
    for step_name in run_steps:
        print(f"  - {step_name}")

    for step_name in run_steps:
        run_step(step_name, pipeline_config)

    print("\nPipeline completed successfully.")


if __name__ == "__main__":
    main()