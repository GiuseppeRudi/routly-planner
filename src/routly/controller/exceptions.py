class ControllerError(RuntimeError):
    """Base error for offline controller failures."""


class ControllerConfigurationError(ValueError):
    """Raised when controller-related feature configuration is inconsistent."""


class ControllerNotImplementedError(NotImplementedError):
    """Raised by controller stubs that intentionally expose future work."""
