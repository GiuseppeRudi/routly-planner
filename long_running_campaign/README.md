# Long-running campaign runner

This folder is an unattended experiment harness, separate from
`scripts/run_pipeline.py`. It contains no hardcoded RQ1/RQ2 matrix and does not
change the normal pipeline configuration. A campaign YAML supplies every run,
stage, timeout, environment variable, and optional output directory.

## Quick start

Copy `campaign.example.yaml`, edit the run list, and validate it before leaving
the machine unattended:

```powershell
conda run --no-capture-output -n routly python long_running_campaign/run_campaign.py my_campaign.yaml --check-only
conda run --no-capture-output -n routly python long_running_campaign/run_campaign.py my_campaign.yaml
```

Results are written after every run to the configured `output_root`. Each
campaign directory contains the exact campaign YAML, one log per run, and
`campaign_summary.csv` plus `campaign_summary.json`.

## Configuration model

- `campaign.default_timeout_seconds` is the default wall-clock budget for one
  run. `runs[].timeout_seconds` overrides it.
- `stages` is an ordered registry of argv arrays. Commands run without a shell,
  so paths and arguments remain separate and safe.
- `runs[].stages` selects an ordered subset for a run.
- `campaign.environment` applies to every process; `runs[].environment`
  overrides individual variables.
- `runs[].project_config` is exposed as `{project_config}`. Config bundles can
  be stored under `configs/` or anywhere else in the repository.
- `runs[].output_dir` is optional. When supplied, the runner scans that folder
  using `classification.diagnostic_globs` to distinguish OOM from timeout or a
  generic failure.

Available placeholders are `{python}`, `{project_root}`, `{working_directory}`,
`{campaign_id}`, `{campaign_dir}`, `{run_id}`, and `{project_config}`. They may
be used in commands, environment values, and `output_dir`.

## Resume and selection

With `campaign.resume: true`, rerunning the same YAML resumes the newest
incomplete campaign having the same configuration fingerprint and run
selection. Completed run IDs are skipped. A specific directory can be resumed
or a fresh campaign forced:

```powershell
python long_running_campaign/run_campaign.py my_campaign.yaml --resume data/long_running_campaigns/my_campaign_...
python long_running_campaign/run_campaign.py my_campaign.yaml --new
python long_running_campaign/run_campaign.py my_campaign.yaml --only run-01 run-04
```

An OOM or timeout is recorded as an experimental outcome and does not stop the
remaining runs. A launcher/stage failure also allows the next run by default;
set `campaign.continue_on_failure: false` to stop after the first `FAILED`
result. `Ctrl+C` terminates the complete child-process tree and leaves a
resumable summary.

## Reproducible configurations

Keep each long-run input immutable while a campaign is running. A useful
layout is:

```text
long_running_campaign/
  configs/
    campaign_name/
      run-01/project.yaml
      run-01/scenario.yaml
      run-01/pipeline.yaml
      run-02/project.yaml
      ...
  campaign_name.yaml
```

The runner copies its campaign YAML into the result directory. Routly itself
continues to snapshot the project/scenario configuration in each generated
experiment output.
