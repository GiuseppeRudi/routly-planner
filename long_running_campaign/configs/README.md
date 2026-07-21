# Campaign configuration bundles

Place frozen project/scenario/pipeline YAML bundles for future long-running
campaigns here when keeping them beside the runner is convenient. The runner
does not require this exact layout: every `runs[].project_config` may point to
any file, relative to `campaign.working_directory` or by absolute path.

Do not edit a bundle while its campaign is running. Create a new directory for
the next campaign so its inputs and results remain reproducible.
