from pathlib import Path
import subprocess


def run_external_planner(command: list[str], output_plan_path: Path | None = None) -> None:
    result = subprocess.run(command, check=True, text=True, capture_output=True)

    if output_plan_path is not None:
        output_plan_path.parent.mkdir(parents=True, exist_ok=True)
        output_plan_path.write_text(result.stdout, encoding="utf-8")
    else:
        print(result.stdout)
