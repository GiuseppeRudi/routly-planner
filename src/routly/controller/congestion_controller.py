from __future__ import annotations

from dataclasses import dataclass

from src.routly.controller.exceptions import ControllerNotImplementedError
from src.routly.controller.models import ControllerResult, ControllerRunRequest
from src.routly.planning.plan_parser import PlanStep


@dataclass(frozen=True)
class CongestionWindowSnapshot:
    """Congestion factors active for one controller replanning window."""

    window_start: float
    window_end: float
    congestion_factors: dict[str, float]


@dataclass(frozen=True)
class ExecutedPlanPrefix:
    """Prefix of a plan considered executed before the next replanning call."""

    steps: list[PlanStep]
    reached_loc: str
    elapsed_seconds: float


def compute_congestion_window_snapshot(
    request: ControllerRunRequest,
    window_start: float,
    window_end: float,
) -> CongestionWindowSnapshot:
    """Compute static congestion factors for one dynamic controller window."""
    raise ControllerNotImplementedError(
        "compute_congestion_window_snapshot() is a controller scaffold stub."
    )


def select_executed_prefix(
    plan_steps: list[PlanStep],
    window_seconds: int,
) -> ExecutedPlanPrefix:
    """Select the plan prefix to execute before replanning."""
    raise ControllerNotImplementedError(
        "select_executed_prefix() is a controller scaffold stub."
    )


def run_congestion_controller(request: ControllerRunRequest) -> ControllerResult:
    """Run the offline congestion controller and return a concatenated plan."""
    raise ControllerNotImplementedError(
        "run_congestion_controller() is a controller scaffold stub."
    )
