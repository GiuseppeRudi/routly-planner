from __future__ import annotations

from pathlib import Path
from typing import Any

import yaml


def read_yaml(path: str | Path) -> dict[str, Any]:
    path = Path(path)

    if not path.exists():
        raise FileNotFoundError(f"YAML file not found: {path}")

    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def resolve_path(path_value: str | Path, project_root: str | Path = ".") -> Path:
    path = Path(path_value)

    if path.is_absolute():
        return path

    return Path(project_root) / path