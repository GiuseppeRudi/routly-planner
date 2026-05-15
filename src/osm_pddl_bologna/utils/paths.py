from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[3]

DATA_DIR = PROJECT_ROOT / "data"
RAW_DATA_DIR = DATA_DIR / "raw"
PROCESSED_DATA_DIR = DATA_DIR / "processed"

CONFIG_DIR = PROJECT_ROOT / "config"

PDDL_DIR = PROJECT_ROOT / "pddl"
PDDL_DOMAIN_DIR = PDDL_DIR / "domains"
PDDL_PROBLEM_DIR = PDDL_DIR / "problems"
PDDL_PLAN_DIR = PDDL_DIR / "plans"


def ensure_project_directories() -> None:
    directories = [
        RAW_DATA_DIR,
        RAW_DATA_DIR / "osm",
        RAW_DATA_DIR / "sumo",
        PROCESSED_DATA_DIR,
        PROCESSED_DATA_DIR / "graphs",
        PROCESSED_DATA_DIR / "pddl",
        PROCESSED_DATA_DIR / "maps",
        PDDL_DOMAIN_DIR,
        PDDL_PROBLEM_DIR,
        PDDL_PLAN_DIR,
    ]

    for directory in directories:
        directory.mkdir(parents=True, exist_ok=True)
