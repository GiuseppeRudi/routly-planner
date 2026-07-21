from __future__ import annotations

import importlib.util
import os
from pathlib import Path
import sys
import tempfile
import unittest

import yaml

SCRIPT_PATH = Path(__file__).with_name("run_campaign.py")
SPEC = importlib.util.spec_from_file_location("long_campaign_runner", SCRIPT_PATH)
assert SPEC is not None and SPEC.loader is not None
runner = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = runner
SPEC.loader.exec_module(runner)


def write_config(root: Path, run_ids: tuple[str, ...] = ("run-1", "run-2")) -> Path:
    (root / "project.yaml").write_text("experiment: {}\n", encoding="utf-8")
    payload = {
        "version": 1,
        "campaign": {
            "name": "test-campaign",
            "working_directory": str(root),
            "output_root": "campaigns",
            "default_timeout_seconds": 2,
            "resume": True,
            "continue_on_failure": True,
            "environment": {"TEST_RUN_ID": "{run_id}"},
        },
        "classification": {
            "oom_markers": ["outofmemoryerror", "java heap space"],
            "diagnostic_globs": ["**/*.txt"],
        },
        "stages": [
            {
                "name": "noop",
                "command": ["{python}", "-c", "print('ok')"],
            }
        ],
        "runs": [
            {
                "id": run_id,
                "project_config": "project.yaml",
                "metadata": {"sequence": index},
            }
            for index, run_id in enumerate(run_ids, start=1)
        ],
    }
    path = root / "campaign.yaml"
    path.write_text(yaml.safe_dump(payload, sort_keys=False), encoding="utf-8")
    return path


class CampaignRunnerTests(unittest.TestCase):
    def test_load_validate_and_render_placeholders(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            config = runner.load_campaign_config(write_config(root))
            runner.validate_campaign(config, config.runs)
            command = runner.rendered_command(
                config,
                config.runs[0],
                config.stages["noop"],
                "campaign-123",
                root / "campaigns/campaign-123",
            )
            environment = runner.rendered_environment(
                config,
                config.runs[0],
                "campaign-123",
                root / "campaigns/campaign-123",
            )
            self.assertEqual(command[0], sys.executable)
            self.assertEqual(environment["TEST_RUN_ID"], "run-1")

    def test_duplicate_run_ids_are_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            path = write_config(Path(temp_dir), ("same", "same"))
            with self.assertRaisesRegex(runner.ConfigError, "duplicate run id"):
                runner.load_campaign_config(path)

    def test_timeout_is_distinct_from_oom_and_oom_wins(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            log_path = root / "run.log"
            log_path.write_text("TIMEOUT: limit reached", encoding="utf-8")
            self.assertEqual(
                runner.classify_status(
                    log_path, None, ["outofmemoryerror"], [], 124, True
                ),
                "TIMEOUT",
            )
            log_path.write_text(
                "TIMEOUT then java.lang.OutOfMemoryError", encoding="utf-8"
            )
            self.assertEqual(
                runner.classify_status(
                    log_path, None, ["outofmemoryerror"], [], 124, True
                ),
                "OOM",
            )

    def test_real_timeout_terminates_process(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            log_path = root / "timeout.log"
            outcome = runner.execute_command(
                [sys.executable, "-c", "import time; time.sleep(60)"],
                log_path,
                root,
                os.environ,
                0.2,
            )
            self.assertTrue(outcome.timed_out)
            self.assertNotEqual(outcome.return_code, 0)
            self.assertIn("TIMEOUT", log_path.read_text(encoding="utf-8"))

    def test_failure_does_not_block_next_run_and_outputs_are_incremental(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            config = runner.load_campaign_config(write_config(root))
            campaign_dir = config.output_root / "test-run"
            campaign_dir.mkdir(parents=True)
            called: list[str] = []

            def fake_execute(spec):
                called.append(spec.run_id)
                return runner.RunResult(
                    run_id=spec.run_id,
                    status="FAILED" if spec.run_id == "run-1" else "SOLVED",
                    elapsed_seconds=1.0,
                    timeout_seconds=spec.timeout_seconds,
                )

            results = runner.execute_campaign(
                config,
                list(config.runs),
                "test-run",
                campaign_dir,
                execute=fake_execute,
            )
            self.assertEqual(called, ["run-1", "run-2"])
            self.assertEqual([item.status for item in results], ["FAILED", "SOLVED"])
            self.assertTrue((campaign_dir / "campaign_summary.csv").is_file())
            self.assertTrue((campaign_dir / "campaign_summary.json").is_file())

    def test_resume_skips_recorded_run(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            config = runner.load_campaign_config(write_config(root))
            campaign_dir = config.output_root / "test-campaign_previous"
            campaign_dir.mkdir(parents=True)
            first = runner.RunResult(
                run_id="run-1",
                status="SOLVED",
                elapsed_seconds=1.0,
                timeout_seconds=2.0,
            )
            runner.write_results(
                config, campaign_dir.name, campaign_dir, list(config.runs), [first]
            )
            campaign_id, loaded_dir, previous, mode = runner.initialise_campaign(
                config, list(config.runs), "auto", False
            )
            self.assertEqual(
                (campaign_id, loaded_dir, mode),
                (
                    campaign_dir.name,
                    campaign_dir,
                    "resume",
                ),
            )
            called: list[str] = []

            def fake_execute(spec):
                called.append(spec.run_id)
                return runner.RunResult(
                    run_id=spec.run_id,
                    status="SOLVED",
                    elapsed_seconds=1.0,
                    timeout_seconds=spec.timeout_seconds,
                )

            results = runner.execute_campaign(
                config,
                list(config.runs),
                campaign_id,
                campaign_dir,
                initial_results=previous,
                execute=fake_execute,
            )
            self.assertEqual(called, ["run-2"])
            self.assertEqual([item.status for item in results], ["SOLVED", "SOLVED"])


if __name__ == "__main__":
    unittest.main()
