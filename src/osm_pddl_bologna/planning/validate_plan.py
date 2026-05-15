from pathlib import Path
import subprocess


def validate_with_val(validate_exe: Path, domain: Path, problem: Path, plan: Path) -> None:
    command = [str(validate_exe), str(domain), str(problem), str(plan)]
    subprocess.run(command, check=True)
