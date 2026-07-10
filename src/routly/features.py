from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS = {
    "local": 20,
    "arterial": 35,
    "major": 50,
}


def _read_yaml(path: Path) -> dict[str, Any]:
    import yaml
    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


@dataclass(frozen=True)
class DurationRange:
    minimum: int
    maximum: int

    def __post_init__(self) -> None:
        if self.minimum <= 0:
            raise ValueError("Traffic-light durations must be greater than zero")
        if self.maximum < self.minimum:
            raise ValueError(
                "Traffic-light duration maximum must be greater than or equal to minimum"
            )


@dataclass(frozen=True)
class TrafficLightsConfig:
    green_duration: DurationRange = field(
        default_factory=lambda: DurationRange(20, 60)
    )
    yellow_duration: DurationRange = field(
        default_factory=lambda: DurationRange(3, 6)
    )
    red_duration: DurationRange = field(
        default_factory=lambda: DurationRange(20, 60)
    )


@dataclass
class HybridCongestionConfig:
    min_temporal_variation: float = 0.25

    def __post_init__(self) -> None:
        if self.min_temporal_variation < 0:
            raise ValueError(
                "congestion.dynamic.hybrid.min_temporal_variation must be greater than or equal to zero"
            )


@dataclass
class DynamicCongestionConfig:
    window_seconds: int = 30
    hybrid: HybridCongestionConfig = field(default_factory=HybridCongestionConfig)

    def __post_init__(self) -> None:
        if self.window_seconds <= 0:
            raise ValueError("congestion.dynamic.window_seconds must be greater than zero")


@dataclass
class CongestionConfig:
    enabled: bool = False
    mode: str = "pddl"
    type: str = "static"
    replanning: bool = False
    num_background_vehicles: int = 200
    congestion_factor: float = 2.0
    dynamic: DynamicCongestionConfig = field(default_factory=DynamicCongestionConfig)
    vehicles_for_max_congestion_by_road_class: dict[str, int] = field(
        default_factory=lambda: dict(DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS)
    )


@dataclass
class LLMEventsConfig:
    enabled: bool = False
    # Prefer topology near start, goal, and high-degree nodes.
    strategic_injection: bool = False
    prevent_unsolvable_blocks: bool = False
    unsolvable_fallback: str = "slowdown"
    unsolvable_fallback_severity: float = 5.0


@dataclass
class SumoRunConfig:
    plans: list[str] = field(default_factory=lambda: ["base"])
    open_event_map: bool = True
    open_congestion_map: bool = False


@dataclass(frozen=True)
class ControllerConfig:
    replan_window_seconds: int = 30
    max_iterations: int = 50

    def __post_init__(self) -> None:
        if self.replan_window_seconds <= 0:
            raise ValueError("controller.replan_window_seconds must be greater than zero")
        if self.max_iterations <= 0:
            raise ValueError("controller.max_iterations must be greater than zero")


@dataclass(frozen=True)
class FuelConfig:
    """Fuel feature configuration with map-derived litre values."""

    enabled: bool = False
    replanning: bool = False
    stations_ratio: float = 0.35
    initial_fuel_ratio: float = 0.15
    stations_source: str = "random"
    consumption_mode: str = "discrete"
    refuel_stop_seconds: int = 30

    def __post_init__(self) -> None:
        if self.replanning and not self.enabled:
            raise ValueError("fuel.replanning=true requires fuel.enabled=true")
        if not 0.0 < self.stations_ratio <= 1.0:
            raise ValueError("fuel.stations_ratio must be in (0, 1]")
        if not 0.0 < self.initial_fuel_ratio <= 1.0:
            raise ValueError("fuel.initial_fuel_ratio must be in (0, 1]")
        if self.consumption_mode not in ("discrete", "continuous"):
            raise ValueError("fuel.consumption_mode must be 'discrete' or 'continuous'")
        if self.refuel_stop_seconds < 0:
            raise ValueError("fuel.refuel_stop_seconds must be >= 0")


@dataclass(frozen=True)
class RoadAbstractionConfig:
    enabled: bool = False
    max_segments_per_macro: int = 8
    max_length_meters: float = 1500.0
    speed_tolerance_ratio: float = 0.15
    require_same_capacity_class: bool = True

    def __post_init__(self) -> None:
        if self.max_segments_per_macro <= 1:
            raise ValueError(
                "road_abstraction.max_segments_per_macro must be greater than 1"
            )
        if self.max_length_meters <= 0:
            raise ValueError("road_abstraction.max_length_meters must be positive")
        if self.speed_tolerance_ratio < 0:
            raise ValueError(
                "road_abstraction.speed_tolerance_ratio must be greater than or equal to 0"
            )

@dataclass
class FeatureConfig:
    traffic_lights: bool = False
    traffic_lights_config: TrafficLightsConfig = field(
        default_factory=TrafficLightsConfig
    )
    congestion: CongestionConfig = field(default_factory=CongestionConfig)
    llm_events: LLMEventsConfig = field(default_factory=LLMEventsConfig)
    sumo: SumoRunConfig = field(default_factory=SumoRunConfig)
    controller: ControllerConfig = field(default_factory=ControllerConfig)
    fuel: FuelConfig = field(default_factory=FuelConfig)
    road_abstraction: RoadAbstractionConfig = field(
        default_factory=RoadAbstractionConfig
    )

    @property
    def congestion_enabled(self) -> bool:
        return self.congestion.enabled

    @property
    def congestion_in_pddl(self) -> bool:
        return self.congestion_enabled and self.congestion.mode == "pddl"

    @property
    def congestion_in_sumo(self) -> bool:
        return self.congestion_enabled and self.congestion.mode == "sumo"

    @property
    def static_congestion_in_pddl(self) -> bool:
        return (
            self.congestion_in_pddl
            and self.congestion.type == "static"
            and not self.congestion.replanning
        )

    @property
    def dynamic_congestion_in_pddl(self) -> bool:
        return (
            self.congestion_in_pddl
            and self.congestion.type in {"dynamic", "hybrid"}
            and not self.congestion.replanning
        )

    @property
    def hybrid_congestion_in_pddl(self) -> bool:
        return (
            self.congestion_in_pddl
            and self.congestion.type == "hybrid"
            and not self.congestion.replanning
        )

    @property
    def snapshot_congestion_in_pddl(self) -> bool:
        return self.static_congestion_in_pddl or self.controller_for_congestion

    @property
    def controller_enabled(self) -> bool:
        return self.controller_for_fuel or self.controller_for_congestion

    @property
    def controller_for_fuel(self) -> bool:
        return self.fuel.enabled and self.fuel.replanning

    @property
    def controller_for_congestion(self) -> bool:
        return self.congestion.enabled and self.congestion.replanning

    @property
    def fuel_in_pddl(self) -> bool:
        return self.fuel.enabled and not self.fuel.replanning

    @property
    def fuel_in_controller(self) -> bool:
        return self.fuel.enabled and self.fuel.replanning

    @property
    def label(self) -> str:
        """label for logging and file naming."""
        parts = []
        if self.traffic_lights:
            parts.append("tl")
        if self.congestion_in_pddl:
            if self.controller_for_congestion:
                parts.append("cong-controller")
            else:
                parts.append(f"cong-pddl-{self.congestion.type}")
        elif self.congestion_in_sumo:
            parts.append("cong-sumo")
        if self.llm_events.enabled:
            parts.append("llm")
        if self.fuel.enabled:
            parts.append("fuel-controller" if self.fuel_in_controller else "fuel")
        if self.road_abstraction.enabled:
            parts.append("macro")
        return "_".join(parts) if parts else "base"

    @classmethod
    def from_yaml(cls, path: str | Path) -> FeatureConfig:
        raw = _read_yaml(Path(path))
        f = raw.get("features", {})

        traffic_lights_raw = f.get("traffic_lights", False)
        if isinstance(traffic_lights_raw, dict):
            traffic_lights_enabled = traffic_lights_raw.get("enabled", True)
            traffic_lights_config = TrafficLightsConfig(
                green_duration=_duration_range(
                    traffic_lights_raw.get("green_duration"),
                    default_minimum=20,
                    default_maximum=60,
                ),
                yellow_duration=_duration_range(
                    traffic_lights_raw.get("yellow_duration"),
                    default_minimum=3,
                    default_maximum=6,
                ),
                red_duration=_duration_range(
                    traffic_lights_raw.get("red_duration"),
                    default_minimum=20,
                    default_maximum=60,
                ),
            )
        else:
            traffic_lights_enabled = bool(traffic_lights_raw)
            traffic_lights_config = TrafficLightsConfig()

        cong = _congestion_config(f.get("congestion", {}))
        controller = _controller_config(f.get("controller", {}))
        road_abstraction = _road_abstraction_config(f.get("road_abstraction", {}))

        llm_raw = f.get("llm_events", {})
        llm = LLMEventsConfig(
            enabled=llm_raw.get("enabled", False),
            strategic_injection=llm_raw.get("strategic_injection", False),
            prevent_unsolvable_blocks=llm_raw.get("prevent_unsolvable_blocks", False),
            unsolvable_fallback=llm_raw.get("unsolvable_fallback", "slowdown"),
            unsolvable_fallback_severity=llm_raw.get("unsolvable_fallback_severity", 5.0),
        )

        sumo_raw = f.get("sumo", {})
        sumo = SumoRunConfig(
            plans=_sumo_plans(
                sumo_raw.get(
                    "plans",
                    ["base", "dynamic"] if llm.enabled else ["base"],
                )
            ),
            open_event_map=sumo_raw.get("open_event_map", True),
            open_congestion_map=sumo_raw.get("open_congestion_map", False),
        )

        fuel_raw = f.get("fuel", False)
        if isinstance(fuel_raw, dict):
            if "mode" in fuel_raw:
                raise ValueError(
                    "features.fuel.mode was removed; use "
                    "features.fuel.replanning: true for the fuel controller "
                    "or replanning: false for PDDL fuel."
                )
            fuel = FuelConfig(
                enabled=fuel_raw.get("enabled", True),
                replanning=bool(fuel_raw.get("replanning", False)),
                stations_ratio=float(fuel_raw.get("stations_ratio", 0.35)),
                initial_fuel_ratio=float(fuel_raw.get("initial_fuel_ratio", 0.15)),
                stations_source=fuel_raw.get("stations_source", "random"),
                consumption_mode=fuel_raw.get("consumption_mode", "discrete"),
            )
        else:
            fuel = FuelConfig(enabled=bool(fuel_raw))

        traversal_model = str(
            raw.get("planner", {}).get("traversal_model", "process")
        ).strip().lower()
        _validate_controller_combination(
            controller,
            fuel,
            cong,
            traversal_model=traversal_model,
        )

        return cls(
            traffic_lights=traffic_lights_enabled,
            traffic_lights_config=traffic_lights_config,
            congestion=cong,
            llm_events=llm,
            sumo=sumo,
            controller=controller,
            fuel=fuel,
            road_abstraction=road_abstraction,
        )

    @classmethod
    def base(cls) -> FeatureConfig:
        """Minimal feature set - plain routing, no extras."""
        return cls()


def _duration_range(
    raw: dict[str, Any] | None,
    default_minimum: int,
    default_maximum: int,
) -> DurationRange:
    raw = raw or {}
    return DurationRange(
        minimum=int(raw.get("min", default_minimum)),
        maximum=int(raw.get("max", default_maximum)),
    )


def _congestion_config(raw: dict[str, Any] | bool | None) -> CongestionConfig:
    if raw is None:
        raw = {}

    if isinstance(raw, bool):
        return CongestionConfig(enabled=raw)

    if not isinstance(raw, dict):
        raise ValueError("features.congestion must be a mapping or a boolean")

    mode_raw = raw.get("mode", "pddl")
    legacy_mode = str(mode_raw).strip().lower()
    if legacy_mode == "sumo_only":
        raise ValueError(
            "features.congestion.mode='sumo_only' is no longer supported; "
            "use mode: 'sumo'."
        )
    if legacy_mode == "windows":
        raise ValueError(
            "features.congestion.mode='windows' is not supported; use "
            "mode: 'pddl', type: 'dynamic', and replanning: true for the "
            "controller-based dynamic congestion flow."
        )

    enabled = bool(raw.get("enabled", bool(raw) and legacy_mode != "none"))
    if not enabled:
        if bool(raw.get("replanning", False)):
            raise ValueError(
                "features.congestion.replanning=true requires "
                "features.congestion.enabled=true."
            )
        return CongestionConfig(
            enabled=False,
            mode="pddl" if legacy_mode == "none" else legacy_mode,
            type=str(raw.get("type", "static")).strip().lower(),
            replanning=False,
            num_background_vehicles=int(raw.get("num_background_vehicles", 200)),
            congestion_factor=float(raw.get("congestion_factor", 2.0)),
            dynamic=_dynamic_congestion_config(raw.get("dynamic")),
            vehicles_for_max_congestion_by_road_class=_congestion_thresholds(
                raw.get("vehicles_for_max_congestion_by_road_class"),
                required=False,
            ),
        )

    mode = legacy_mode
    if mode == "none":
        raise ValueError(
            "features.congestion.mode='none' is no longer supported; "
            "use congestion.enabled: false."
        )
    if mode not in {"sumo", "pddl"}:
        raise ValueError("features.congestion.mode must be 'sumo' or 'pddl'")

    congestion_type = str(raw.get("type", "static")).strip().lower()
    if congestion_type not in {"static", "dynamic", "hybrid"}:
        raise ValueError(
            "features.congestion.type must be 'static', 'dynamic', or 'hybrid'"
        )
    if mode == "sumo" and congestion_type in {"dynamic", "hybrid"}:
        raise ValueError(
            "features.congestion.type='dynamic' and type='hybrid' are supported "
            "only with mode: 'pddl'."
        )

    replanning = bool(raw.get("replanning", False))
    if replanning and (mode != "pddl" or congestion_type != "dynamic"):
        raise ValueError(
            "features.congestion.replanning=true requires mode: 'pddl' "
            "and type: 'dynamic'."
        )

    return CongestionConfig(
        enabled=True,
        mode=mode,
        type=congestion_type,
        replanning=replanning,
        num_background_vehicles=int(raw.get("num_background_vehicles", 200)),
        congestion_factor=float(raw.get("congestion_factor", 2.0)),
        dynamic=_dynamic_congestion_config(raw.get("dynamic")),
        vehicles_for_max_congestion_by_road_class=_congestion_thresholds(
            raw.get("vehicles_for_max_congestion_by_road_class"),
            required=True,
        ),
    )


def _controller_config(raw: dict[str, Any] | bool | None) -> ControllerConfig:
    if raw is None:
        raw = {}

    if isinstance(raw, bool):
        raise ValueError(
            "features.controller.enabled was removed; use fuel.replanning "
            "or congestion.replanning to activate a controller."
        )

    if not isinstance(raw, dict):
        raise ValueError("features.controller must be a mapping")

    forbidden = sorted(set(raw) & {"enabled", "mode"})
    if forbidden:
        fields = ", ".join(f"features.controller.{field}" for field in forbidden)
        raise ValueError(
            f"{fields} were removed; use fuel.replanning or "
            "congestion.replanning to activate the appropriate controller."
        )

    return ControllerConfig(
        replan_window_seconds=int(raw.get("replan_window_seconds", 30)),
        max_iterations=int(raw.get("max_iterations", 50)),
    )


def _validate_controller_combination(
    controller: ControllerConfig,
    fuel: FuelConfig,
    congestion: CongestionConfig,
    traversal_model: str,
) -> None:
    _ = controller
    if fuel.enabled and fuel.replanning and congestion.enabled and congestion.replanning:
        raise ValueError(
            "Fuel controller and congestion controller cannot be enabled "
            "together: set exactly one of features.fuel.replanning and "
            "features.congestion.replanning to true."
        )

    controller_enabled = (
        (fuel.enabled and fuel.replanning)
        or (congestion.enabled and congestion.replanning)
    )
    if controller_enabled and traversal_model != "process":
        raise ValueError(
            "Controller replanning requires planner.traversal_model='process'. "
            "Both the fuel controller and the congestion controller are "
            "incompatible with traversal_model='compiled_duration'."
        )


def _road_abstraction_config(
    raw: dict[str, Any] | bool | None,
) -> RoadAbstractionConfig:
    if raw is None:
        raw = {}

    if isinstance(raw, bool):
        return RoadAbstractionConfig(enabled=raw)

    if not isinstance(raw, dict):
        raise ValueError("features.road_abstraction must be a mapping or a boolean")

    return RoadAbstractionConfig(
        enabled=bool(raw.get("enabled", False)),
        max_segments_per_macro=int(raw.get("max_segments_per_macro", 8)),
        max_length_meters=float(raw.get("max_length_meters", 1500.0)),
        speed_tolerance_ratio=float(raw.get("speed_tolerance_ratio", 0.15)),
        require_same_capacity_class=bool(
            raw.get("require_same_capacity_class", True)
        ),
    )


def _dynamic_congestion_config(raw: dict[str, Any] | None) -> DynamicCongestionConfig:
    raw = raw or {}
    return DynamicCongestionConfig(
        window_seconds=int(raw.get("window_seconds", 30)),
        hybrid=_hybrid_congestion_config(raw.get("hybrid")),
    )


def _hybrid_congestion_config(
    raw: dict[str, Any] | None,
) -> HybridCongestionConfig:
    raw = raw or {}
    return HybridCongestionConfig(
        min_temporal_variation=float(raw.get("min_temporal_variation", 0.25)),
    )


def _congestion_thresholds(
    raw: dict[str, Any] | None,
    required: bool,
) -> dict[str, int]:
    if raw is None:
        if required:
            raise ValueError(
                "Missing required features.congestion."
                "vehicles_for_max_congestion_by_road_class"
            )
        return dict(DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS)

    missing = [
        road_class
        for road_class in DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS
        if road_class not in raw
    ]
    if missing:
        raise ValueError(
            "Missing congestion threshold(s) for road class: "
            + ", ".join(missing)
        )

    thresholds = {}
    for road_class in DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS:
        try:
            threshold = int(raw[road_class])
        except (TypeError, ValueError) as exc:
            raise ValueError(
                "Congestion threshold must be an integer for road class "
                f"{road_class}"
            ) from exc
        if threshold <= 0:
            raise ValueError(
                "Congestion threshold must be greater than zero for road class "
                f"{road_class}"
            )
        thresholds[road_class] = threshold
    return thresholds


def _sumo_plans(raw: str | list[str]) -> list[str]:
    plans = [raw] if isinstance(raw, str) else list(raw)
    valid = {"base", "dynamic", "controller"}
    invalid = [plan for plan in plans if plan not in valid]
    if invalid:
        raise ValueError(
            f"Unsupported SUMO plan(s): {invalid}. Valid values are: {sorted(valid)}"
        )
    if not plans:
        raise ValueError("At least one SUMO plan must be configured")
    return plans
