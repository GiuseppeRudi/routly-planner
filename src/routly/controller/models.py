from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Literal

from src.routly.config import ProjectConfig
from src.routly.features import FeatureConfig


ControllerMode = Literal["fuel", "congestion"]


@dataclass(frozen=True)
class ControllerRunRequest:
    """Shared input passed to either controller implementation."""

    project_config: ProjectConfig
    features: FeatureConfig
    scenario: dict[str, Any]
    mapping: dict[str, Any]
    vehicle_id: str
    start_loc: str
    goal_loc: str


@dataclass(frozen=True)
class ControllerSegment:
    """One planned/executed controller segment."""

    index: int
    mode: ControllerMode
    start_loc: str
    target_loc: str
    reached_loc: str | None = None
    window_start: float | None = None
    window_end: float | None = None
    plan_path: Path | None = None
    problem_path: Path | None = None
    notes: str = ""


@dataclass(frozen=True)
class ControllerResult:
    """High-level result written by a controller run."""

    mode: ControllerMode | None
    status: str
    plan_text: str = ""
    segments: list[ControllerSegment] = field(default_factory=list)
    message: str = ""
