from __future__ import annotations

import argparse
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
    "build_domain_and_problem": {
        "script": "scripts/pipeline/03_build_domain_and_problem.py",
        "args": ["map_config", "project_config", "scenario_config", "features_config"],
    },
    "generate_plan": {
        "script": "scripts/pipeline/04_generate_plan.py",
        "args": ["map_config", "project_config"],
    },
    "plan_to_sumo": {
        "script": "scripts/pipeline/05_plan_to_sumo.py",
        "args": ["map_config", "project_config", "scenario_config", "features_config"],
    },
    # --- NUOVI STEP DINAMICI CON LLM ---
    "inject_llm_events": {
        "script": "scripts/pipeline/06_inject_llm_events.py",
        "args": ["map_config", "project_config"],
    },
    "generate_dynamic_plan": {
        "script": "scripts/pipeline/07_generate_dynamic_plan.py",
        "args": ["map_config", "project_config"],
    },
    "plan_dynamic_to_sumo": {
        "script": "scripts/pipeline/08_plan_dynamic_to_sumo.py",
        "args": ["map_config", "project_config", "scenario_config", "features_config"],
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

    if key == "features_config":
        return configs["features_config"]

    raise KeyError(f"Unsupported pipeline argument key: {key}")


def cli_flag_for_key(key: str) -> str:
    flags = {
        "map_config": "--map-config",
        "project_config": "--project-config",
        "scenario_output": "--scenario-output",
        "scenario_config": "--scenario-config",
        "features_config": "--features-config",
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
    # print("Command:")
    # print("  " + " ".join(cmd))

    result = subprocess.run(
        cmd,
        cwd=PROJECT_ROOT,
        text=True,
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"Pipeline stopped: step '{step_name}' failed with exit code {result.returncode}."
        )

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Routly pipeline runner.",
        formatter_class=argparse.RawTextHelpFormatter,
    )
    parser.add_argument(
        "steps",
        nargs="*",
        type=int,
        metavar="STEP",
        help=(
            "Step numbers to run (1-based). Run all if omitted.\n"
            "  1 = build_map\n"
            "  2 = select_scenario_points\n"
            "  3 = build_domain_and_problem\n"
            "  4 = generate_plan\n"
            "  5 = plan_to_sumo\n"
            "Example: python run_pipeline.py 1 3 5"
        ),
    )
    return parser.parse_args()

def main() -> None:
    args = parse_args()

    pipeline_config = read_yaml(PIPELINE_CONFIG_PATH)
    validate_pipeline_config(pipeline_config)
    validate_existing_input_configs(pipeline_config)

    all_steps = pipeline_config["run"]

    # Filter steps if numbers were provided on the CLI
    if args.steps:
        invalid = [n for n in args.steps if n < 1 or n > len(all_steps)]
        if invalid:
            raise ValueError(
                f"Invalid step number(s): {invalid}. "
                f"Valid range: 1-{len(all_steps)}."
            )
        run_steps = [all_steps[n - 1] for n in args.steps]
    else:
        run_steps = all_steps

    print("Routly pipeline")
    print("Steps to run:")
    for step_name in run_steps:
        idx = all_steps.index(step_name) + 1
        print(f"  {idx}. {step_name}")

    for step_name in run_steps:
        run_step(step_name, pipeline_config)

    print("\nPipeline completed successfully.")


if __name__ == "__main__":
    main()


# SOLVED 1. Semafori
# SOLVED 2. Sensi di Marcia
# TODO 3. Più auto per simulare congestione:
# SOLVED **Semplice**: Il planner non considera la congestione del traffico ma viene simulata solo da sumo,
# SOLVED Il planner genera il piano senza considerare la congestione, poi inserisci 200 macchine ad esempio e simuli su sumo
# TODO **Completa**: Integrare la congestione nel planner, ad esempio con un costo dinamico che aumenta per le strade più trafficate.
# TODO In questo modo il planner cercherà di evitare le strade congestionate già durante la generazione del piano.
# SOLVED Inoltre vogliamo creare diversi domain e problem file (con semafori, senza semafori, senza congestione,
# SOLVED congestione in PDDL, congestione non in PDDL, con llm, senza llm (per la generazione di eventi casuali es. incidenti, lavori in corso))
# SOLVED e vedere come cambia il piano a seconda delle features considerate. Quindi tramite uno yaml configuriamo quali features vogliamo attivare per la generazione del piano.
# TODO 4. allora i semafori sono fissi a 30 s di durata => questo però viene scelto da noi 
# TODO potremmo verificare se queste informazioni possano essere prelevati per ogni specifico semafori quindi ognuno con durata diversa prelevata  dalla realtà 
# TODO 5. Eventi casuali (incidenti, lavori in corso) con LLM
# TODO Fare diverse simulazioni e partire dallo stesso scenario. La prima simulazione parte senza eventi generati dall'LLM
# TODO Successivamente effettuare diverse altre simulazioni a partire dallo stesso scenario in cui l'LLM genera degli eventi casuali
# TODO e vedere come è cambiato il planner e il piano a seconda degli eventi generati effettuando una comparazione (SOTA)
# TODO 6. Controllo benzina
# TODO 7. la congestione attualmente viene generata da sumo indicando il numero di macchine con un timestep di generazione random , nodo di partenza e di arrivo random 
# TODO per integrare la congestione nel planner potremmo creare un costo dinamico che aumenta per le strade più trafficate, 
# TODO ad esempio potremmo avere un costo base per ogni strada e poi aggiungere un costo aggiuntivo che dipende dal numero di macchine che stanno utilizzando quella strada 
# TODO in quel momento. In questo modo il planner cercherà di evitare le strade congestionate già durante la generazione del piano.
# TODO PER OGNI STRADA DOBBIMO CONTROLLARE QUANTE MACCHINE PASSANO DA LI => CONTARE IL NUMERO DI MACCHINE CHE PASSANO DA UNA STRADA 
# TODO QUESTO PERO NON è SUFFICIENTE POICHE NON BASTA AVERE IL NUMERO TOTALE DI MACCHINA CHE PASSANO PER QUELLA STRADA MA ANCHE SAPERE IN LINEA TEMPORALE COME SI DISTRIBUSICONO QUESTE MACCHINE LUNGO IL TEMP O
# TODO PER AVERE UNA CONGESTIONE DINAMICA DELLE STRADE 

