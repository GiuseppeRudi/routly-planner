from __future__ import annotations

from dataclasses import asdict, dataclass
import json
from pathlib import Path
import random
from typing import Any

from src.routly.features import TrafficLightsConfig


@dataclass(frozen=True)
class TrafficLightTiming:
    green: int
    yellow: int
    red: int

    @property
    def average_wait(self) -> float:
        """
        Expected red-light wait for uniformly distributed arrivals.

        Only arrivals during red wait; their average remaining red time is
        red / 2.
        """
        cycle_duration = self.green + self.yellow + self.red
        return round((self.red * self.red) / (2 * cycle_duration), 2)


def generate_traffic_light_timings(
    nodes: list[dict[str, Any]],
    config: TrafficLightsConfig,
) -> dict[str, TrafficLightTiming]:
    """Generate reproducible timings for every traffic-light node."""
    rng = random.Random(config.seed)
    timings: dict[str, TrafficLightTiming] = {}

    traffic_light_ids = sorted(
        node["id"]
        for node in nodes
        if node.get("traffic_light", False)
    )

    for node_id in traffic_light_ids:
        timings[node_id] = TrafficLightTiming(
            green=rng.randint(
                config.green_duration.minimum,
                config.green_duration.maximum,
            ),
            yellow=rng.randint(
                config.yellow_duration.minimum,
                config.yellow_duration.maximum,
            ),
            red=rng.randint(
                config.red_duration.minimum,
                config.red_duration.maximum,
            ),
        )

    return timings


def write_traffic_light_timings(
    timings: dict[str, TrafficLightTiming],
    path: str | Path,
) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = {}
    for node_id, timing in timings.items():
        payload[node_id] = {
            **asdict(timing),
            "average_wait": timing.average_wait,
        }
    path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def load_traffic_light_timings(
    path: str | Path,
) -> dict[str, TrafficLightTiming]:
    payload = json.loads(Path(path).read_text(encoding="utf-8"))
    return {
        node_id: TrafficLightTiming(
            green=values["green"],
            yellow=values["yellow"],
            red=values["red"],
        )
        for node_id, values in payload.items()
    }
