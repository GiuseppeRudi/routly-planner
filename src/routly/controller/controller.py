from __future__ import annotations

from src.routly.controller.congestion_controller import run_congestion_controller
from src.routly.controller.exceptions import ControllerConfigurationError
from src.routly.controller.fuel_controller import run_fuel_controller
from src.routly.controller.models import ControllerResult, ControllerRunRequest


def run_controller(request: ControllerRunRequest) -> ControllerResult:
    """Dispatch the offline controller based on validated feature config."""
    features = request.features

    if not features.controller_enabled:
        return ControllerResult(
            mode=None,
            status="skipped",
            message="No replanning controller is active.",
        )

    if features.controller_for_fuel:
        return run_fuel_controller(request)

    if features.controller_for_congestion:
        return run_congestion_controller(request)

    raise ControllerConfigurationError(
        "Controller configuration is inconsistent: no executable "
        "controller was selected."
    )
