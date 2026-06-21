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
        "args": ["map_config", "project_config", "features_config"],  # ➔ Added features_config
    },
    "plan_to_sumo": {
        "script": "scripts/pipeline/05_plan_to_sumo.py",
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
# SOLVED 3. Più auto per simulare congestione:
# SOLVED **Semplice**: Il planner non considera la congestione del traffico ma viene simulata solo da sumo,
# SOLVED Il planner genera il piano senza considerare la congestione, poi inserisci 200 macchine ad esempio e simuli su sumo
# SOLVED **Completa**: Integrare la congestione nel planner, ad esempio con un costo dinamico che aumenta per le strade più trafficate.
# SOLVED In questo modo il planner cercherà di evitare le strade congestionate già durante la generazione del piano.
# SOLVED Inoltre vogliamo creare diversi domain e problem file (con semafori, senza semafori, senza congestione,
# SOLVED congestione in PDDL, congestione non in PDDL, con llm, senza llm (per la generazione di eventi casuali es. incidenti, lavori in corso))
# SOLVED e vedere come cambia il piano a seconda delle features considerate. Quindi tramite uno yaml configuriamo quali features vogliamo attivare per la generazione del piano.
# SOLVED 4. allora i semafori sono fissi a 30 s di durata => questo però viene scelto da noi 
# SOLVED potremmo verificare se queste informazioni possano essere prelevati per ogni specifico semafori quindi ognuno con durata diversa prelevata  dalla realtà o un valore random
# SOLVED 5. Eventi casuali (incidenti, lavori in corso) con LLM
# SOLVED Fare diverse simulazioni e partire dallo stesso scenario. La prima simulazione parte senza eventi generati dall'LLM
# SOLVED Successivamente effettuare diverse altre simulazioni a partire dallo stesso scenario in cui l'LLM genera degli eventi casuali
# SOLVED e vedere come è cambiato il planner e il piano a seconda degli eventi generati effettuando una comparazione (SOTA)
# SOLVED - BISOGNA INTEGRARE GLI SCRIPT 6 E 7 TRA IL BUILD DOMAIN AND PROBLEM E IL GENERATE PLAN (TRA 4 E 5) , QUINDI LO SCRIPT 8 SI ELIMINA PERCHE GIA IL PLAN TO SUMO (5)
# SOLVED - DALLA RUN PIPELINE YAML DARE LA POSSIBILITA ALLUTENTE DI ATTIVARE O DISATTIVARE LINTEGRAZIONE DEGLI LLM feature_config.yaml ce un flag va controllato 
# SOLVED modificare il comportamento del python che invece di commentare deve sostituire il predicato road open in road blocked cosi da essere coerente con il file domain generator che implementa iniziezione del road blocked all'interno del domain file pddl 
# SOLVED - LLM RESTITUISCE ANCHE UN FILE .LOG CHE PER OGNI EVENTO GENERATO DA LA MOTIVAZIONE REALISTICA DEL PERCHE è STATA CHIUSA 
# SOLVED - DARE LA POSSIBILITA AD UN UNICA ESECUZIONE DEL LLM DI GENERARE PIU EVENTI, E OGNI EVENTO PUO AVERE UNA DIMENSIONE DIVERSA (INTESA COME NUMERO DI STRADE CHIUSE DOVE ESISTE UNA CONNESSIONE TRA PIU STRADE DELLO STESSO EVENTO) .
# SOLVED 7. la congestione attualmente viene generata da sumo indicando il numero di macchine con un timestep di generazione random , nodo di partenza e di arrivo random 
# SOLVED per integrare la congestione nel planner potremmo creare un costo dinamico che aumenta per le strade più trafficate, 
# SOLVED ad esempio potremmo avere un costo base per ogni strada e poi aggiungere un costo aggiuntivo che dipende dal numero di macchine che stanno utilizzando quella strada 
# SOLVED in quel momento. In questo modo il planner cercherà di evitare le strade congestionate già durante la generazione del piano.



# TODO - EVENTI COME INCIDENTI STRADALI HANNO UNA DIMENSIONE FISSA PARI A 1 , EVENTI COME LAVORI IN CORSO, RAPINE POSSONO PORTARE ALLA CHIUSURE DI PIU STRADE LA CUI DIMENSIONE CIOE IL NUMERO DI STRADE DA CHIUDERE VIENE LASCIATA AL RAGIONAMENTO DEL LLM ( AD EUGENIO FA PAURA) .
# TODO - IL RAGIONAMENTO DELLA DIMENSIONE DEVE ESSERE FATTO A SECONDA DELLA DIMENSIONE DELLA MAPPA ( NUMERO DI NODI ), AL NUMERO DI EVENTI GIA CREATI , ALLA DIMENSIONE DEGLI EVENTI GIA CREATI . 
# TODO - INOLTRE IL NUMERO DI EVENTI DA CREARE CHE POSSONO UNO O PIU VIENE LASCIATO DECIDERE ALL LLM IN BASE ANCHE IN QUESTO ALLA DIMENSIONE DELLA MAPPA 
# TODO - iniettare questo con flag true o false da yaml (MAGARI SI POTREBBE DIRE AL LLM DI CERCARE DI CHIUDERE DEI PUNTI STRASTEGICI SENZA CONOSCERE IL PIANO MA SOLO CON IL PROBLEM FILE IN CUI PASSERREBBE LA MACCHINA NELLA SUA ROTTA => QUESTO PER EVITARE DI CREARE EVENTI IN UNA GRANDE MAPPA SENZA CHE INFLUISCANO SUL PIANO)


# TODO - LLM DEVE CREARE NON SOLO CHIUSURA DI STRADA MA ANCHE DIMINUIZIONE DELLA VELCOITA IN SPECIFICO TRATTO DI STRADA

# TODO CONGESTIONE TRAFFICO 
# TODO  -  ROSSO = STRADA CHIUSA , GIALLO = RALLENTAMENTO CON ABBASSAMENTO LIMITE DI VELOCITA

# ^---^  SIMONE 

# TODO SISTEMARE IL MECCANISMO PER LA RILEVAZIONE DEGLI INCROCI CHIUSI POSSIBILE SOLO SE DUE O PIU STRADE CHIUDE SI INCONTRANO IN UN NODO CHIUSO
# TODO I NODI ESTERNI AL BLOCCO DI STRADE CHIUSE (EVENTO) NON DEVONO ESSERE CHIUSE

# TODO SISTEMARE IL PROBLEMA DERIVATO DALLA FATTO CHE ALCUNE MACCHINE APPARTENENTI AL TRAFFICO NON PASSINO DA STRADE E NODI CHIUSI DALL LLM 

# TODO - quando vengono bloccate le strade a causa degli eventi generati dagli llm bisogna ricreare anche le route dei veicoli background e
# TODO   quindi ricalcolare anche il fattore di congestione per ogni strada con le nuove route aggiornate e poi darle al planner

# ^---^ IELPA



# SOLVED 8. Classificare ogni semaforo per complessità dell’incrocio, cioe dare delle durata diverse delle fasi
# SOLVED di verde, rosso e giallo a seconda della complessita dellincrocio o del tipo di strada 

# TODO 9. Controllo benzina con flag da yaml per attivare o disattivare la feature, se attivo il planner deve considerare il livello di benzina e quindi generare un piano che preveda anche il rifornimento di benzina in base al livello di benzina iniziale e alla distanza da percorrere.
# TODO Questo o inserendo a meno delle stazioni di rifornimento casualmente in una delle strade o prendendole dalla realtà (se possibile)

# ^---^ CRISTIANO

 
# TODO 6. ATTUALMENTE UTILIZZIAMO UNA FORMULA PER IL CALCOLO DELLA CONGESTIONE CHE TIENE CONTO DI UN NUMERO MASSIMO DI VEICOLO
# TODO PER OGNI STRADA SENZA PERO DIFFERENZIARE I TIPI DI STRADA : AD ESEMPIO UNA STRADA PROVINCIALE PIU AVERE UN NUMERO DI MACCHINE
# TODO PER POTER ESSERE CONGESTIONATA PARI A 20 MENTRE UNA SUPERSTRADA POTREBEB AVERE UN NUMERO DI MACCHINA PER POTER ESSERE CLASSIFICATA CONGESTIONATA SUPERIORE AD ESEMPIO 50 

# TODO 7. PER OGNI STRADA DOBBIMO CONTROLLARE QUANTE MACCHINE PASSANO DA LI => CONTARE IL NUMERO DI MACCHINE CHE PASSANO DA UNA STRADA 
# TODO QUESTO PERO NON è SUFFICIENTE POICHE NON BASTA AVERE IL NUMERO TOTALE DI MACCHINA CHE PASSANO PER QUELLA STRADA MA ANCHE SAPERE IN LINEA TEMPORALE COME SI DISTRIBUSICONO QUESTE MACCHINE LUNGO IL TEMP O
# TODO PER AVERE UNA CONGESTIONE DINAMICA DELLE STRADE 


# ^---^ RUDI



# OPEN QUESTIONS 


# TODO PENDING - RISOLVERE E GESTIRE ERRORE DERIVATO DAL FATTO CHE IL PLANNER POTREBBE NON RISOLVERE UN PERCORSO SE LLM CHIUDE LE STRADE O LUNICA STADA CHE COLLEGA LO START E IL GOAL
# TODO PENDING - AVVISARE LUTENTE CHE DURANTE UN PIANO UNSOLVABLE POICHE LLM HA CHIUSO UN UNICA STRADA, IL PLANNER NON RIESCE A TROVARE UNA SOLUZIONE 
# TODO PENDING - OPPURE
# TODO PENDING - quando viene bloccata una strada che rende impossibile la route da punto A a punto B, effettuare una diminuzione di velocità invece di bloccarla