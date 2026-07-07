from __future__ import annotations

from dataclasses import dataclass

from src.routly.controller.exceptions import ControllerNotImplementedError
from src.routly.controller.models import ControllerResult, ControllerRunRequest


@dataclass(frozen=True)
class FuelTargetDecision:
    """Decision produced by the fuel target-selection policy."""

    target_loc: str
    reason: str
    estimated_distance_to_target: float | None = None
    estimated_distance_target_to_goal: float | None = None


def select_fuel_target(request: ControllerRunRequest) -> FuelTargetDecision:
    """Choose goal or best reachable fuel station for the next planning leg."""
    raise ControllerNotImplementedError(
        "select_fuel_target() is a controller scaffold stub."
    )


def run_fuel_controller(request: ControllerRunRequest) -> ControllerResult:
    """Run the offline fuel controller and return a concatenated plan result."""
    raise ControllerNotImplementedError(
        "run_fuel_controller() is a controller scaffold stub."
    )
