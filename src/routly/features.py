from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


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
    vehicles_for_max_congestion: int = 20 # vehicle count at which congestion_factor is fully applied


@dataclass
class LLMEventsConfig:
    """
    Placeholder for LLM-generated random events (accidents, roadworks).
    When enabled, the domain gains a (road-blocked ?r) predicate and
    road-open preconditions already prevent traversal of blocked roads.
    The LLM is responsible for populating which roads are blocked in the
    problem file at runtime (not implemented yet).
    """
    enabled: bool = False
    backend: str = "ollama"  # "ollama" | "lmstudio" - which local LLM server to call


@dataclass
class FeatureConfig:
    traffic_lights: bool = False
    traffic_lights_config: TrafficLightsConfig = field(
        default_factory=TrafficLightsConfig
    )
    congestion: CongestionConfig = field(default_factory=CongestionConfig)
    llm_events: LLMEventsConfig = field(default_factory=LLMEventsConfig)

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
        cong = CongestionConfig(
            mode=cong_raw.get("mode", "none"),
            num_background_vehicles=cong_raw.get("num_background_vehicles", 200),
            congestion_factor=cong_raw.get("congestion_factor", 2.0),
            vehicles_for_max_congestion=cong_raw.get(
                "vehicles_for_max_congestion",
                20,
            ),
        )

        llm_raw = f.get("llm_events", {})
        llm = LLMEventsConfig(
            enabled=llm_raw.get("enabled", False),
            backend=llm_raw.get("backend", "ollama"),
        )

        return cls(
            traffic_lights=traffic_lights_enabled,
            traffic_lights_config=traffic_lights_config,
            congestion=cong,
            llm_events=llm,
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
