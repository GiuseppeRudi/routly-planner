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
class CongestionConfig:
    mode: str = "none" # "none" | "sumo_only" | "pddl"
    num_background_vehicles: int = 200  # used in sumo_only and pddl modes
    congestion_factor: float = 2.0 # speed divisor for congested roads in pddl mode
    vehicles_for_max_congestion_by_road_class: dict[str, int] = field(
        default_factory=lambda: dict(DEFAULT_CONGESTION_THRESHOLDS_BY_ROAD_CLASS)
    )


@dataclass
class LLMEventsConfig:
    enabled: bool = False
    backend: str = "ollama"  # "ollama" | "lmstudio" - which local LLM server to call
    strategic_injection: bool = False  # if True, LLM uses compact problem topology
    # (start, goal, node degree) instead of a random road sample to pick targets
    prevent_unsolvable_blocks: bool = False
    unsolvable_fallback: str = "slowdown" # "slowdown" | "skip"
    unsolvable_fallback_severity: float = 5.0


@dataclass
class SumoRunConfig:
    plans: list[str] = field(default_factory=lambda: ["base"])
    open_event_map: bool = True
    open_congestion_map: bool = False

@dataclass
@dataclass(frozen=True)
class FuelConfig:
    """Fuel feature configuration — only flags and ratios; the litres are
    derived from the map at build time."""

    enabled: bool
    stations_ratio: float # fraction of nodes that get a station
    initial_fuel_ratio: float # fraction of full tank at the start
    stations_source: str # "random" | "osm"
    consumption_mode: str # "discrete" (burn at road entry) | "continuous" (burn in process)

    def __post_init__(self) -> None:
        if not 0.0 < self.stations_ratio <= 1.0:
            raise ValueError("fuel.stations_ratio must be in (0, 1]")
        if not 0.0 < self.initial_fuel_ratio <= 1.0:
            raise ValueError("fuel.initial_fuel_ratio must be in (0, 1]")
        if self.consumption_mode not in ("discrete", "continuous"):
            raise ValueError("fuel.consumption_mode must be 'discrete' or 'continuous'")

@dataclass
class FeatureConfig:
    traffic_lights: bool = False
    traffic_lights_config: TrafficLightsConfig = field(
        default_factory=TrafficLightsConfig
    )
    congestion: CongestionConfig = field(default_factory=CongestionConfig)
    llm_events: LLMEventsConfig = field(default_factory=LLMEventsConfig)
    sumo: SumoRunConfig = field(default_factory=SumoRunConfig)
    fuel: FuelConfig = field(default_factory=FuelConfig)

    @property
    def congestion_in_pddl(self) -> bool:
        return self.congestion.mode == "pddl"

    @property
    def congestion_in_sumo(self) -> bool:
        return self.congestion.mode in ("sumo_only", "pddl")

    @property
    def label(self) -> str:
        """label for logging and file naming."""
        parts = []
        if self.traffic_lights:
            parts.append("tl")
        if self.congestion_in_pddl:
            parts.append("cong-pddl")
        elif self.congestion_in_sumo:
            parts.append("cong-sumo")
        if self.llm_events.enabled:
            parts.append("llm")
        if self.fuel.enabled:
            parts.append("fuel")
        return "_".join(parts) if parts else "base"

    # ── constructor ───────────────────────────────────────────────────────────

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

        cong_raw = f.get("congestion", {})
        cong_mode = cong_raw.get("mode", "none")
        cong = CongestionConfig(
            mode=cong_mode,
            num_background_vehicles=cong_raw.get("num_background_vehicles", 200),
            congestion_factor=cong_raw.get("congestion_factor", 2.0),
            vehicles_for_max_congestion_by_road_class=_congestion_thresholds(
                cong_raw.get("vehicles_for_max_congestion_by_road_class"),
                required=cong_mode != "none",
            ),
        )

        llm_raw = f.get("llm_events", {})
        llm = LLMEventsConfig(
            enabled=llm_raw.get("enabled", False),
            backend=llm_raw.get("backend", "ollama"),
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
            fuel = FuelConfig(
                enabled=fuel_raw.get("enabled", True),
                stations_ratio=float(fuel_raw.get("stations_ratio", 0.35)),
                initial_fuel_ratio=float(fuel_raw.get("initial_fuel_ratio", 0.15)),
                stations_source=fuel_raw.get("stations_source", "random"),
                consumption_mode=fuel_raw.get("consumption_mode", "discrete"),
            )
        else:
            fuel = FuelConfig(enabled=bool(fuel_raw))

        return cls(
            traffic_lights=traffic_lights_enabled,
            traffic_lights_config=traffic_lights_config,
            congestion=cong,
            llm_events=llm,
            sumo=sumo,
            fuel=fuel,
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
    valid = {"base", "dynamic"}
    invalid = [plan for plan in plans if plan not in valid]
    if invalid:
        raise ValueError(
            f"Unsupported SUMO plan(s): {invalid}. Valid values are: {sorted(valid)}"
        )
    if not plans:
        raise ValueError("At least one SUMO plan must be configured")
    return plans
