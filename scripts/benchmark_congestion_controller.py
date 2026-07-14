"""Benchmark: windowed congestion-controller replanning vs a single full-horizon solve.

Both modes go through the exact same code path (`run_congestion_controller`), so the
only variable being measured is the replanning window size:
  - "controller": the project's configured `replan_window_seconds` (small windows,
    adaptive replanning).
  - "plain": a single window spanning the whole horizon (`replan_window_seconds`
    forced very large), which is functionally equivalent to one non-adaptive
    full-horizon ENHSP solve -- the same PDDL+ problem construction and domain,
    just without windowing.

Requires a local ENHSP jar and an already-built `roads_mapping.json` for the target
experiment (i.e. pipeline steps 1-3 already ran). Not runnable in a plain dev sandbox.

Usage:
    python scripts/benchmark_congestion_controller.py --project-config config/project.yaml
"""

from __future__ import annotations

from dataclasses import replace
from pathlib import Path
import argparse
import csv
import sys
import time

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.controller import ControllerRunRequest
from src.routly.controller.congestion_controller import run_congestion_controller
from src.routly.domain.macro_roads import require_macro_artifacts
from src.routly.features import FeatureConfig
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import (
    extract_grounded_sizes,
    extract_grounding_time_ms,
    extract_plan_metric_time,
    parse_start_traversal_roads,
)
from src.routly.utils import read_yaml

# Effectively "one window covering the whole horizon" -- see module docstring.
PLAIN_WINDOW_SECONDS = 10**9


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Compare windowed congestion-controller replanning against "
        "an equivalent single full-horizon solve."
    )
    parser.add_argument("--project-config", required=True)
    return parser.parse_args()


def _extract_vehicle_start_goal(scenario: dict) -> tuple[str, str, str]:
    vehicles = scenario.get("vehicles", [])
    if not vehicles:
        raise ValueError("Scenario YAML does not contain any vehicle.")
    vehicle = vehicles[0]
    return (
        vehicle.get("id", "car1"),
        vehicle["start"]["value"],
        vehicle["goal"]["value"],
    )


def _run_mode(
    label: str,
    request: ControllerRunRequest,
    benchmark_root: Path,
) -> dict:
    pddl_dir = benchmark_root / label / "pddl"
    plans_dir = benchmark_root / label / "plans"
    domain_path = pddl_dir / "domain.pddl"

    print(f"\n{'=' * 70}\n RUNNING MODE: {label}\n{'=' * 70}")
    start = time.perf_counter()
    result = run_congestion_controller(
        request,
        run_label=label,
        pddl_dir=pddl_dir,
        plans_dir=plans_dir,
        domain_path=domain_path,
    )
    wall_seconds = time.perf_counter() - start

    real_invocations = [
        seg for seg in result.segments if "reused_from_solve=True" not in seg.notes
    ]
    reused_count = len(result.segments) - len(real_invocations)

    grounding_ms_total = 0.0
    search_seconds_total = 0.0
    seen_plan_paths: set[Path] = set()
    for seg in real_invocations:
        if seg.plan_path is None or seg.plan_path in seen_plan_paths:
            continue
        seen_plan_paths.add(seg.plan_path)
        plan_text = seg.plan_path.read_text(encoding="utf-8")
        grounding_ms_total += extract_grounding_time_ms(plan_text) or 0.0
        search_seconds_total += extract_plan_metric_time(plan_text) or 0.0

    planned_roads = parse_start_traversal_roads(result.plan_text)
    final_makespan = max((seg.window_end or 0.0) for seg in result.segments)

    return {
        "mode": label,
        "windows_total": len(result.segments),
        "enhsp_invocations": len(seen_plan_paths),
        "windows_reused_from_cache": reused_count,
        "wall_clock_seconds": round(wall_seconds, 3),
        "grounding_time_ms_total": round(grounding_ms_total, 1),
        "search_time_seconds_total": round(search_seconds_total, 3),
        "final_makespan_seconds": round(final_makespan, 1),
        "plan_roads_count": len(planned_roads),
    }


def main() -> None:
    args = parse_args()
    config = load_config(args.project_config)
    features = FeatureConfig.from_yaml(args.project_config)

    if not features.congestion.enabled:
        raise SystemExit(
            "features.congestion.enabled must be true in the project config "
            "to run this benchmark."
        )

    scenario = read_yaml(config.scenario_path)
    mapping_path, _ = require_macro_artifacts(
        scenario, config, enabled=features.road_abstraction.enabled
    )
    mapping = load_mapping(mapping_path)
    vehicle_id, start_loc, goal_loc = _extract_vehicle_start_goal(scenario)

    # Force controller-mode routing regardless of how the project config has
    # congestion.replanning set, so both benchmark runs use the same code path.
    controller_features = replace(
        features, congestion=replace(features.congestion, replanning=True)
    )
    plain_features = replace(
        controller_features,
        controller=replace(controller_features.controller, replan_window_seconds=PLAIN_WINDOW_SECONDS, max_iterations=1),
    )

    base_request = ControllerRunRequest(
        project_config=config,
        features=controller_features,
        scenario=scenario,
        mapping=mapping,
        vehicle_id=vehicle_id,
        start_loc=start_loc,
        goal_loc=goal_loc,
    )
    plain_request = replace(base_request, features=plain_features)

    benchmark_root = config.experiment_dir / "benchmark"
    rows = [
        _run_mode("plain", plain_request, benchmark_root),
        _run_mode("controller", base_request, benchmark_root),
    ]

    csv_path = benchmark_root / "benchmark_results.csv"
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    print(f"\n{'=' * 70}\n RESULTS\n{'=' * 70}")
    header = list(rows[0].keys())
    print(" | ".join(header))
    for row in rows:
        print(" | ".join(str(row[key]) for key in header))
    print(f"\nSaved: {csv_path}")


if __name__ == "__main__":
    main()
