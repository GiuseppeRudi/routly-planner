from __future__ import annotations

from pathlib import Path
import subprocess
import time


def run_enhsp(
    enhsp_jar: str | Path,
    domain_path: str | Path,
    problem_path: str | Path,
    plan_path: str | Path,
    java_heap_mb: int = 4096,
) -> None:
    """Run ENHSP and write planner stdout to a plan file."""
    enhsp_jar = Path(enhsp_jar)
    domain_path = Path(domain_path)
    problem_path = Path(problem_path)
    plan_path = Path(plan_path)

    plan_path.parent.mkdir(parents=True, exist_ok=True)

    cmd = [
        "java",
        f"-Xmx{java_heap_mb}m",
        f"-Xms{java_heap_mb // 4}m",
        "-jar",
        str(enhsp_jar),
        "-o", str(domain_path),
        "-f", str(problem_path)]

    print("Running ENHSP")
    try:
        start = time.time()
        with plan_path.open("w", encoding="utf-8") as outfile:
            subprocess.run(cmd, stdout=outfile, stderr=subprocess.PIPE, text=True, check=True)
        print(f"Plan saved: {plan_path}")
        print(f"Elapsed time: {time.time() - start:.3f}s")

    except FileNotFoundError as exc:
        raise RuntimeError(
            "Java or ENHSP was not found. Check Java installation and enhsp_jar path."
        ) from exc

    except subprocess.CalledProcessError as exc:
        raise RuntimeError(f"ENHSP failed with exit code {exc.returncode}:\n{exc.stderr}") from exc
