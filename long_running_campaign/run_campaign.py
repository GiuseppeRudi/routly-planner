from __future__ import annotations

import argparse
import csv
import datetime as dt
from dataclasses import asdict, dataclass, field
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import time
from typing import Any, Callable, Iterable, Mapping, Sequence

import yaml

TOOL_ROOT = Path(__file__).resolve().parent
PROJECT_ROOT = TOOL_ROOT.parent
DEFAULT_OOM_MARKERS = (
    "outofmemoryerror",
    "java heap space",
    "gc overhead limit exceeded",
    "insufficient memory for the java runtime environment",
    "native memory allocation",
    "cannot allocate memory",
    "ran out of memory",
)
DEFAULT_DIAGNOSTIC_GLOBS = ("**/*.txt", "**/*.sol", "**/hs_err_pid*.log")
MAX_DIAGNOSTIC_FILE_BYTES = 2_000_000


class ConfigError(ValueError):
    """Raised when the campaign YAML is invalid."""


@dataclass(frozen=True)
class StageSpec:
    name: str
    command: tuple[str, ...]


@dataclass(frozen=True)
class RunSpec:
    run_id: str
    project_config: Path
    project_config_arg: str
    timeout_seconds: float
    stage_names: tuple[str, ...]
    environment: dict[str, str] = field(default_factory=dict)
    output_dir_template: str = ""
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass(frozen=True)
class CampaignConfig:
    source_path: Path
    fingerprint: str
    name: str
    working_directory: Path
    output_root: Path
    default_timeout_seconds: float
    resume: bool
    continue_on_failure: bool
    environment: dict[str, str]
    oom_markers: tuple[str, ...]
    diagnostic_globs: tuple[str, ...]
    stages: dict[str, StageSpec]
    runs: tuple[RunSpec, ...]


@dataclass
class RunResult:
    run_id: str
    status: str
    elapsed_seconds: float
    timeout_seconds: float
    failure_stage: str = ""
    failure_reason: str = ""
    return_code: int | None = None
    log_path: str = ""
    output_dir: str = ""
    started_at: str = ""
    finished_at: str = ""
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass(frozen=True)
class ProcessOutcome:
    return_code: int
    timed_out: bool = False


CommandExecutor = Callable[
    [Sequence[str], Path, Path, Mapping[str, str], float], ProcessOutcome
]


def _mapping(value: object, label: str) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise ConfigError(f"{label} must be a YAML mapping")
    return value


def _string_map(value: object, label: str) -> dict[str, str]:
    if value is None:
        return {}
    raw = _mapping(value, label)
    return {str(key): str(item) for key, item in raw.items()}


def _positive_number(value: object, label: str) -> float:
    try:
        number = float(value)
    except (TypeError, ValueError) as exc:
        raise ConfigError(f"{label} must be a positive number") from exc
    if number <= 0:
        raise ConfigError(f"{label} must be greater than zero")
    return number


def _resolve_path(base: Path, value: object, label: str) -> Path:
    if not isinstance(value, str) or not value.strip():
        raise ConfigError(f"{label} must be a non-empty path")
    path = Path(value)
    return (base / path).resolve() if not path.is_absolute() else path.resolve()


def _project_argument(path: Path, working_directory: Path) -> str:
    try:
        return str(path.relative_to(working_directory))
    except ValueError:
        return str(path)


def _fingerprint(payload: object) -> str:
    encoded = json.dumps(payload, sort_keys=True, ensure_ascii=False).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()[:16]


def load_campaign_config(path: Path) -> CampaignConfig:
    source_path = path.resolve()
    if not source_path.is_file():
        raise FileNotFoundError(f"Campaign YAML not found: {source_path}")
    payload = yaml.safe_load(source_path.read_text(encoding="utf-8"))
    root = _mapping(payload, "campaign file")
    if root.get("version") != 1:
        raise ConfigError("version must be 1")

    campaign = _mapping(root.get("campaign"), "campaign")
    name = str(campaign.get("name", "")).strip()
    if not name or not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]*", name):
        raise ConfigError(
            "campaign.name must contain only letters, numbers, dot, underscore, or dash"
        )
    working_directory = _resolve_path(
        PROJECT_ROOT,
        campaign.get("working_directory", "."),
        "campaign.working_directory",
    )
    output_root = _resolve_path(
        working_directory,
        campaign.get("output_root", "data/long_running_campaigns"),
        "campaign.output_root",
    )
    default_timeout = _positive_number(
        campaign.get("default_timeout_seconds", 14_400),
        "campaign.default_timeout_seconds",
    )
    environment = _string_map(campaign.get("environment"), "campaign.environment")
    resume = bool(campaign.get("resume", True))
    continue_on_failure = bool(campaign.get("continue_on_failure", True))

    classification = _mapping(root.get("classification", {}), "classification")
    oom_values = classification.get("oom_markers", list(DEFAULT_OOM_MARKERS))
    if not isinstance(oom_values, list) or not all(
        isinstance(item, str) and item.strip() for item in oom_values
    ):
        raise ConfigError("classification.oom_markers must be a list of strings")
    diagnostic_values = classification.get(
        "diagnostic_globs", list(DEFAULT_DIAGNOSTIC_GLOBS)
    )
    if not isinstance(diagnostic_values, list) or not all(
        isinstance(item, str) and item.strip() for item in diagnostic_values
    ):
        raise ConfigError("classification.diagnostic_globs must be a list of strings")

    stage_rows = root.get("stages")
    if not isinstance(stage_rows, list) or not stage_rows:
        raise ConfigError("stages must be a non-empty list")
    stages: dict[str, StageSpec] = {}
    for index, value in enumerate(stage_rows):
        row = _mapping(value, f"stages[{index}]")
        stage_name = str(row.get("name", "")).strip()
        command = row.get("command")
        if not stage_name:
            raise ConfigError(f"stages[{index}].name is required")
        if stage_name in stages:
            raise ConfigError(f"duplicate stage name: {stage_name}")
        if (
            not isinstance(command, list)
            or not command
            or not all(isinstance(token, (str, int, float)) for token in command)
        ):
            raise ConfigError(f"stages[{index}].command must be a non-empty argv list")
        stages[stage_name] = StageSpec(
            stage_name, tuple(str(token) for token in command)
        )

    run_rows = root.get("runs")
    if not isinstance(run_rows, list) or not run_rows:
        raise ConfigError("runs must be a non-empty list")
    runs: list[RunSpec] = []
    seen_ids: set[str] = set()
    for index, value in enumerate(run_rows):
        row = _mapping(value, f"runs[{index}]")
        if row.get("enabled", True) is False:
            continue
        run_id = str(row.get("id", "")).strip()
        if not run_id or not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]*", run_id):
            raise ConfigError(f"runs[{index}].id is invalid")
        if run_id in seen_ids:
            raise ConfigError(f"duplicate run id: {run_id}")
        seen_ids.add(run_id)
        project_config = _resolve_path(
            working_directory,
            row.get("project_config"),
            f"runs[{index}].project_config",
        )
        timeout = _positive_number(
            row.get("timeout_seconds", default_timeout),
            f"runs[{index}].timeout_seconds",
        )
        selected_stages = row.get("stages", list(stages))
        if not isinstance(selected_stages, list) or not selected_stages:
            raise ConfigError(f"runs[{index}].stages must be a non-empty list")
        stage_names = tuple(str(item) for item in selected_stages)
        unknown = [item for item in stage_names if item not in stages]
        if unknown:
            raise ConfigError(f"{run_id} references unknown stages: {unknown}")
        metadata = _mapping(row.get("metadata", {}), f"runs[{index}].metadata")
        runs.append(
            RunSpec(
                run_id=run_id,
                project_config=project_config,
                project_config_arg=_project_argument(project_config, working_directory),
                timeout_seconds=timeout,
                stage_names=stage_names,
                environment=_string_map(
                    row.get("environment"), f"runs[{index}].environment"
                ),
                output_dir_template=str(row.get("output_dir", "")),
                metadata=metadata,
            )
        )
    if not runs:
        raise ConfigError("no enabled runs were found")

    return CampaignConfig(
        source_path=source_path,
        fingerprint=_fingerprint(root),
        name=name,
        working_directory=working_directory,
        output_root=output_root,
        default_timeout_seconds=default_timeout,
        resume=resume,
        continue_on_failure=continue_on_failure,
        environment=environment,
        oom_markers=tuple(item.lower() for item in oom_values),
        diagnostic_globs=tuple(diagnostic_values),
        stages=stages,
        runs=tuple(runs),
    )


def _render_context(
    config: CampaignConfig, spec: RunSpec, campaign_id: str, campaign_dir: Path
) -> dict[str, str]:
    return {
        "python": sys.executable,
        "project_root": str(PROJECT_ROOT),
        "working_directory": str(config.working_directory),
        "campaign_id": campaign_id,
        "campaign_dir": str(campaign_dir),
        "run_id": spec.run_id,
        "project_config": spec.project_config_arg,
    }


def _render(value: str, context: Mapping[str, str], label: str) -> str:
    try:
        return value.format_map(context)
    except KeyError as exc:
        raise ConfigError(f"unknown placeholder {exc.args[0]!r} in {label}") from exc


def rendered_command(
    config: CampaignConfig,
    spec: RunSpec,
    stage: StageSpec,
    campaign_id: str,
    campaign_dir: Path,
) -> list[str]:
    context = _render_context(config, spec, campaign_id, campaign_dir)
    return [
        _render(token, context, f"stage {stage.name} command")
        for token in stage.command
    ]


def rendered_environment(
    config: CampaignConfig, spec: RunSpec, campaign_id: str, campaign_dir: Path
) -> dict[str, str]:
    context = _render_context(config, spec, campaign_id, campaign_dir)
    environment = os.environ.copy()
    for source in (config.environment, spec.environment):
        for key, value in source.items():
            environment[key] = _render(value, context, f"environment variable {key}")
    return environment


def rendered_output_dir(
    config: CampaignConfig, spec: RunSpec, campaign_id: str, campaign_dir: Path
) -> Path | None:
    if not spec.output_dir_template:
        return None
    context = _render_context(config, spec, campaign_id, campaign_dir)
    value = _render(spec.output_dir_template, context, f"{spec.run_id}.output_dir")
    path = Path(value)
    return (
        (config.working_directory / path).resolve()
        if not path.is_absolute()
        else path.resolve()
    )


def validate_campaign(config: CampaignConfig, specs: Iterable[RunSpec]) -> None:
    if not config.working_directory.is_dir():
        raise FileNotFoundError(
            f"Working directory not found: {config.working_directory}"
        )
    selected = list(specs)
    if not selected:
        raise ConfigError("no runs selected")
    fake_dir = config.output_root / "validation"
    for spec in selected:
        if not spec.project_config.is_file():
            raise FileNotFoundError(
                f"Project config for {spec.run_id} not found: {spec.project_config}"
            )
        for stage_name in spec.stage_names:
            stage = config.stages[stage_name]
            command = rendered_command(
                config, spec, stage, config.name + "_validation", fake_dir
            )
            if not command or not command[0]:
                raise ConfigError(f"empty command for {spec.run_id}/{stage_name}")
            for token in command[1:]:
                candidate = Path(token)
                if candidate.suffix.lower() not in {".py", ".ps1", ".sh"}:
                    continue
                script_path = (
                    (config.working_directory / candidate).resolve()
                    if not candidate.is_absolute()
                    else candidate.resolve()
                )
                if not script_path.is_file():
                    raise FileNotFoundError(
                        f"Script for {spec.run_id}/{stage_name} not found: {script_path}"
                    )
        rendered_environment(config, spec, config.name + "_validation", fake_dir)
        rendered_output_dir(config, spec, config.name + "_validation", fake_dir)


def _terminate_process_tree(process: subprocess.Popen[Any]) -> None:
    if process.poll() is not None:
        return
    if os.name == "nt":
        subprocess.run(
            ["taskkill", "/PID", str(process.pid), "/T", "/F"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
        )
    else:
        try:
            os.killpg(process.pid, signal.SIGTERM)
            time.sleep(0.5)
            if process.poll() is None:
                os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    if process.poll() is None:
        process.kill()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait(timeout=5)


def execute_command(
    command: Sequence[str],
    log_path: Path,
    working_directory: Path,
    environment: Mapping[str, str],
    timeout_seconds: float,
) -> ProcessOutcome:
    creationflags = subprocess.CREATE_NEW_PROCESS_GROUP if os.name == "nt" else 0
    with log_path.open("a", encoding="utf-8") as log_file:
        process = subprocess.Popen(
            list(command),
            cwd=working_directory,
            env=dict(environment),
            stdout=log_file,
            stderr=subprocess.STDOUT,
            text=True,
            creationflags=creationflags,
            start_new_session=(os.name != "nt"),
        )
        try:
            return ProcessOutcome(process.wait(timeout=max(timeout_seconds, 0.01)))
        except subprocess.TimeoutExpired:
            log_file.write("\nTIMEOUT: run exceeded its wall-clock budget.\n")
            log_file.flush()
            _terminate_process_tree(process)
            return ProcessOutcome(process.returncode or 124, timed_out=True)
        except KeyboardInterrupt:
            log_file.write("\nINTERRUPTED: campaign stopped by the user.\n")
            log_file.flush()
            _terminate_process_tree(process)
            raise


def _read_diagnostic_file(path: Path) -> str:
    try:
        with path.open("rb") as handle:
            data = handle.read(MAX_DIAGNOSTIC_FILE_BYTES)
        return data.decode("utf-8", errors="replace").lower()
    except OSError:
        return ""


def diagnostic_text(
    log_path: Path, output_dir: Path | None, globs: Iterable[str]
) -> str:
    text = _read_diagnostic_file(log_path)
    if output_dir and output_dir.is_dir():
        seen: set[Path] = set()
        for pattern in globs:
            for path in output_dir.glob(pattern):
                if path.is_file() and path not in seen:
                    seen.add(path)
                    text += "\n" + _read_diagnostic_file(path)
    return text


def classify_status(
    log_path: Path,
    output_dir: Path | None,
    oom_markers: Iterable[str],
    diagnostic_globs: Iterable[str],
    return_code: int,
    timed_out: bool,
) -> str:
    diagnostic = diagnostic_text(log_path, output_dir, diagnostic_globs)
    if any(marker.lower() in diagnostic for marker in oom_markers):
        return "OOM"
    if timed_out:
        return "TIMEOUT"
    return "SOLVED" if return_code == 0 else "FAILED"


def execute_run(
    config: CampaignConfig,
    spec: RunSpec,
    campaign_id: str,
    campaign_dir: Path,
    executor: CommandExecutor = execute_command,
) -> RunResult:
    started_at = dt.datetime.now().astimezone()
    started = time.perf_counter()
    logs_dir = campaign_dir / "logs"
    logs_dir.mkdir(parents=True, exist_ok=True)
    log_path = logs_dir / f"{spec.run_id}.log"
    output_dir = rendered_output_dir(config, spec, campaign_id, campaign_dir)
    environment = rendered_environment(config, spec, campaign_id, campaign_dir)
    failure_stage = ""
    reason = ""
    return_code = 0
    timed_out = False

    with log_path.open("a", encoding="utf-8") as log_file:
        log_file.write(
            f"\n{'#' * 72}\nRUN: {spec.run_id}\nSTARTED: {started_at.isoformat()}\n"
            f"TIMEOUT_SECONDS: {spec.timeout_seconds:g}\n{'#' * 72}\n"
        )

    for stage_name in spec.stage_names:
        elapsed = time.perf_counter() - started
        remaining = spec.timeout_seconds - elapsed
        if remaining <= 0:
            timed_out = True
            return_code = 124
            failure_stage = stage_name
            reason = f"Exceeded the {spec.timeout_seconds:g}-second wall-clock limit"
            with log_path.open("a", encoding="utf-8") as log_file:
                log_file.write(f"\nTIMEOUT before stage {stage_name}.\n")
            break
        stage = config.stages[stage_name]
        command = rendered_command(config, spec, stage, campaign_id, campaign_dir)
        with log_path.open("a", encoding="utf-8") as log_file:
            log_file.write(
                f"\n{'=' * 72}\nSTAGE: {stage_name}\n"
                f"COMMAND_ARGV: {json.dumps(command, ensure_ascii=False)}\n"
                f"REMAINING_SECONDS: {remaining:.3f}\n{'=' * 72}\n"
            )
        outcome = executor(
            command,
            log_path,
            config.working_directory,
            environment,
            remaining,
        )
        return_code = outcome.return_code
        timed_out = outcome.timed_out
        if return_code != 0 or timed_out:
            failure_stage = stage_name
            reason = (
                f"Exceeded the {spec.timeout_seconds:g}-second wall-clock limit"
                if timed_out
                else f"Stage {stage_name} exited with code {return_code}"
            )
            break

    status = classify_status(
        log_path,
        output_dir,
        config.oom_markers,
        config.diagnostic_globs,
        return_code,
        timed_out,
    )
    if status == "OOM":
        reason = "Out-of-memory evidence found in the run log or configured output"
    finished_at = dt.datetime.now().astimezone()
    return RunResult(
        run_id=spec.run_id,
        status=status,
        elapsed_seconds=round(time.perf_counter() - started, 3),
        timeout_seconds=spec.timeout_seconds,
        failure_stage=failure_stage,
        failure_reason=reason,
        return_code=return_code,
        log_path=str(log_path),
        output_dir=str(output_dir or ""),
        started_at=started_at.isoformat(),
        finished_at=finished_at.isoformat(),
        metadata=spec.metadata,
    )


def _state_payload(
    config: CampaignConfig,
    campaign_id: str,
    specs: Sequence[RunSpec],
    results: Sequence[RunResult],
) -> dict[str, Any]:
    expected = [spec.run_id for spec in specs]
    completed = {result.run_id for result in results}
    return {
        "version": 1,
        "campaign_id": campaign_id,
        "campaign_name": config.name,
        "config_path": str(config.source_path),
        "config_fingerprint": config.fingerprint,
        "updated_at": dt.datetime.now().astimezone().isoformat(),
        "working_directory": str(config.working_directory),
        "expected_run_ids": expected,
        "complete": completed == set(expected),
        "runs": [asdict(result) for result in results],
    }


def write_results(
    config: CampaignConfig,
    campaign_id: str,
    campaign_dir: Path,
    specs: Sequence[RunSpec],
    results: Sequence[RunResult],
) -> None:
    payload = _state_payload(config, campaign_id, specs, results)
    state_path = campaign_dir / "campaign_summary.json"
    temp_path = campaign_dir / ".campaign_summary.json.tmp"
    temp_path.write_text(
        json.dumps(payload, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    temp_path.replace(state_path)

    fields = list(RunResult.__dataclass_fields__)
    with (campaign_dir / "campaign_summary.csv").open(
        "w", encoding="utf-8", newline=""
    ) as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fields)
        writer.writeheader()
        for result in results:
            row = asdict(result)
            row["metadata"] = json.dumps(result.metadata, sort_keys=True)
            writer.writerow(row)


def _load_results(path: Path) -> tuple[dict[str, Any], list[RunResult]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    valid = set(RunResult.__dataclass_fields__)
    results = [
        RunResult(**{key: value for key, value in row.items() if key in valid})
        for row in payload.get("runs", [])
    ]
    return payload, results


def _latest_resumable(
    config: CampaignConfig, expected_run_ids: list[str]
) -> tuple[Path, list[RunResult]] | None:
    if not config.output_root.is_dir():
        return None
    candidates = sorted(
        (path for path in config.output_root.iterdir() if path.is_dir()),
        key=lambda path: path.stat().st_mtime,
        reverse=True,
    )
    for directory in candidates:
        state_path = directory / "campaign_summary.json"
        if not state_path.is_file():
            continue
        try:
            payload, results = _load_results(state_path)
        except (OSError, ValueError, TypeError, json.JSONDecodeError):
            continue
        if (
            payload.get("campaign_name") == config.name
            and payload.get("config_fingerprint") == config.fingerprint
            and payload.get("expected_run_ids") == expected_run_ids
            and not payload.get("complete", False)
        ):
            return directory, results
    return None


def initialise_campaign(
    config: CampaignConfig,
    specs: Sequence[RunSpec],
    resume_request: str | None,
    force_new: bool,
) -> tuple[str, Path, list[RunResult], str]:
    expected = [spec.run_id for spec in specs]
    previous: tuple[Path, list[RunResult]] | None = None
    if not force_new and resume_request:
        if resume_request == "auto":
            previous = _latest_resumable(config, expected)
        else:
            directory = Path(resume_request).resolve()
            state_path = directory / "campaign_summary.json"
            if not state_path.is_file():
                raise FileNotFoundError(f"Resume state not found: {state_path}")
            payload, results = _load_results(state_path)
            if payload.get("config_fingerprint") != config.fingerprint:
                raise ConfigError(
                    "resume state was created from a different YAML config"
                )
            if payload.get("expected_run_ids") != expected:
                raise ConfigError("resume state has a different run selection")
            if payload.get("complete"):
                raise ConfigError("the requested campaign is already complete")
            previous = (directory, results)
    if previous:
        directory, results = previous
        return directory.name, directory, results, "resume"

    timestamp = dt.datetime.now().strftime("%Y%m%d_%H%M%S_%f")
    campaign_id = f"{config.name}_{timestamp}"
    directory = config.output_root / campaign_id
    directory.mkdir(parents=True, exist_ok=False)
    shutil.copy2(config.source_path, directory / "campaign.yaml")
    return campaign_id, directory, [], "new"


def execute_campaign(
    config: CampaignConfig,
    specs: Sequence[RunSpec],
    campaign_id: str,
    campaign_dir: Path,
    initial_results: Iterable[RunResult] = (),
    execute: Callable[[RunSpec], RunResult] | None = None,
) -> list[RunResult]:
    existing = {result.run_id: result for result in initial_results}
    results: list[RunResult] = []
    for spec in specs:
        if spec.run_id in existing:
            result = existing[spec.run_id]
            print(f"{spec.run_id}: already recorded as {result.status}; skipping")
        else:
            try:
                result = (
                    execute(spec)
                    if execute
                    else execute_run(config, spec, campaign_id, campaign_dir)
                )
            except KeyboardInterrupt:
                write_results(config, campaign_id, campaign_dir, specs, results)
                raise
            except Exception as exc:
                now = dt.datetime.now().astimezone().isoformat()
                result = RunResult(
                    run_id=spec.run_id,
                    status="FAILED",
                    elapsed_seconds=0.0,
                    timeout_seconds=spec.timeout_seconds,
                    failure_stage="launcher",
                    failure_reason=f"{type(exc).__name__}: {exc}",
                    log_path=str(campaign_dir / "logs" / f"{spec.run_id}.log"),
                    started_at=now,
                    finished_at=now,
                    metadata=spec.metadata,
                )
            print(
                f"{spec.run_id}: {result.status} " f"({result.elapsed_seconds:.3f} s)",
                flush=True,
            )
        results.append(result)
        write_results(config, campaign_id, campaign_dir, specs, results)
        if result.status == "FAILED" and not config.continue_on_failure:
            print("Stopping because campaign.continue_on_failure is false.")
            break
    return results


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Run long, unattended experiment campaigns from YAML."
    )
    parser.add_argument("config", type=Path, help="Campaign YAML file")
    parser.add_argument(
        "--check-only", action="store_true", help="Validate without running commands"
    )
    parser.add_argument(
        "--only", nargs="+", metavar="RUN_ID", help="Run only the selected IDs"
    )
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument(
        "--resume",
        nargs="?",
        const="auto",
        metavar="CAMPAIGN_DIR",
        help="Resume an interrupted campaign; without a path, use the latest match",
    )
    mode.add_argument("--new", action="store_true", help="Always create a new campaign")
    return parser.parse_args(argv)


def selected_runs(config: CampaignConfig, only: Sequence[str] | None) -> list[RunSpec]:
    if not only:
        return list(config.runs)
    requested = list(dict.fromkeys(only))
    by_id = {spec.run_id: spec for spec in config.runs}
    missing = [run_id for run_id in requested if run_id not in by_id]
    if missing:
        raise ConfigError(f"unknown or disabled run IDs: {missing}")
    return [by_id[run_id] for run_id in requested]


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)
    config = load_campaign_config(args.config)
    specs = selected_runs(config, args.only)
    validate_campaign(config, specs)
    print(
        f"Validated campaign {config.name!r}: {len(specs)} run(s), "
        f"working directory {config.working_directory}"
    )
    if args.check_only:
        print("Check-only completed; no command was started.")
        return 0

    resume_request = args.resume
    if resume_request is None and config.resume and not args.new:
        resume_request = "auto"
    campaign_id, campaign_dir, previous, mode = initialise_campaign(
        config, specs, resume_request, args.new
    )
    print(f"Campaign: {campaign_id} ({mode})")
    print(f"Results: {campaign_dir}")
    write_results(config, campaign_id, campaign_dir, specs, previous)
    try:
        results = execute_campaign(
            config, specs, campaign_id, campaign_dir, initial_results=previous
        )
    except KeyboardInterrupt:
        print(f"Campaign interrupted. Resume with --resume {campaign_dir}")
        return 130
    counts = {
        status: sum(result.status == status for result in results)
        for status in ("SOLVED", "OOM", "TIMEOUT", "FAILED")
    }
    print("Completed: " + ", ".join(f"{key}={value}" for key, value in counts.items()))
    return 1 if counts["FAILED"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
