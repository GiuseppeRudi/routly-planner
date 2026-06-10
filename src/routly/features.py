from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


def _read_yaml(path: Path) -> dict[str, Any]:
    import yaml
    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


@dataclass
class CongestionConfig:
    mode: str = "none" # "none" | "sumo_only" | "pddl"
    num_background_vehicles: int = 200  # used in sumo_only and pddl modes
    congestion_factor: float = 2.0 # speed divisor for congested roads in pddl mode
    congested_fraction: float = 0.2 # top X% most central roads marked as congested


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
    one_way: bool = True          # structural — always enforced via directed graph
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

        cong_raw = f.get("congestion", {})
        cong = CongestionConfig(
            mode=cong_raw.get("mode", "none"),
            num_background_vehicles=cong_raw.get("num_background_vehicles", 200),
            congestion_factor=cong_raw.get("congestion_factor", 2.0),
            congested_fraction=cong_raw.get("congested_fraction", 0.2),
        )

        llm_raw = f.get("llm_events", {})
        llm = LLMEventsConfig(
            enabled=llm_raw.get("enabled", False),
            backend=llm_raw.get("backend", "ollama"),
        )

        return cls(
            traffic_lights=f.get("traffic_lights", False),
            one_way=f.get("one_way", True),
            congestion=cong,
            llm_events=llm,
        )

    @classmethod
    def base(cls) -> FeatureConfig:
        """Minimal feature set - plain routing, no extras."""
        return cls()
