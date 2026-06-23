from __future__ import annotations

from collections import defaultdict
from dataclasses import asdict, dataclass
from enum import Enum
import json
from pathlib import Path
import random
from typing import Any

from src.routly.domain.roads import road_capacity_class
from src.routly.features import DurationRange, TrafficLightsConfig


class IntersectionComplexity(str, Enum):

    SIMPLE = "simple"
    MEDIUM = "medium"
    COMPLEX = "complex"


# Where each complexity class sits inside a configured [min, max] phase band.
_COMPLEXITY_BANDS: dict["IntersectionComplexity", tuple[float, float]] = {
    IntersectionComplexity.SIMPLE: (0.0, 1.0 / 3.0),
    IntersectionComplexity.MEDIUM: (1.0 / 3.0, 2.0 / 3.0),
    IntersectionComplexity.COMPLEX: (2.0 / 3.0, 1.0),
}


@dataclass(frozen=True)
class TrafficLightTiming:
    green: int
    yellow: int
    red: int
    # Complexity class that produced these durations (kept for inspection,
    # logging and the generated JSON; defaults keep older callers working).
    complexity: str = IntersectionComplexity.SIMPLE.value

    @property
    def average_wait(self) -> float:
        """Expected red-light wait for uniformly distributed arrivals."""
        cycle_duration = self.green + self.yellow + self.red
        return round((self.red * self.red) / (2 * cycle_duration), 2)


# Road-type contribution to the complexity score.
_CLASS_RANK = {"local": 0, "arterial": 1, "major": 2}


def _incident_roads_by_node(
    roads: list[dict[str, Any]],
) -> dict[str, list[dict[str, Any]]]:
    """Group roads by every endpoint ('from' and 'to') they touch."""
    incident: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for road in roads:
        from_id = road.get("from")
        to_id = road.get("to")
        if from_id is not None:
            incident[from_id].append(road)
        if to_id is not None and to_id != from_id:
            incident[to_id].append(road)
    return incident


def _count_approaches(node_id: str, incident_roads: list[dict[str, Any]]) -> int:
    """Number of distinct streets meeting at a node (undirected degree).

    Counting distinct neighbour nodes (rather than directed edges) makes the
    measure robust to one-way vs two-way modelling: a plain through-node has 2
    approaches, a T-junction 3, a crossroads 4+.
    """
    neighbours: set[str] = set()
    for road in incident_roads:
        from_id = road.get("from")
        to_id = road.get("to")
        other = to_id if from_id == node_id else from_id
        if other is not None:
            neighbours.add(other)
    return len(neighbours)


def classify_intersection(
    approaches: int,
    incident_roads: list[dict[str, Any]],
) -> IntersectionComplexity:
    """Classify an intersection from its number of approaches and road type.

    The score combines two signals:
      * how many streets meet at the node (geometric complexity), and
      * the highest-capacity incident road.
    """
    # Geometric complexity from the number of approaching streets.
    if approaches <= 2: degree_level = 0  # through-node / pedestrian crossing
    elif approaches == 3: degree_level = 1  # T-junction
    else: degree_level = 2  # crossroads (4-way) or larger

    # Road-type complexity from the highest-capacity incident road.
    road_level = max(
        (_CLASS_RANK[road_capacity_class(road)] for road in incident_roads),
        default=0,
    )

    score = degree_level + road_level  # 0..4
    if score <= 0: return IntersectionComplexity.SIMPLE
    if score <= 2: return IntersectionComplexity.MEDIUM
    return IntersectionComplexity.COMPLEX


def _duration_for_band(
    rng: random.Random,
    duration_range: DurationRange,
    complexity: IntersectionComplexity,
) -> int:
    """Pick a duration inside the complexity sub-band of 'duration_range'.

    The configured [min, max] interval is split into three sub-bands; the
    complexity class selects the sub-band and a seeded random draw inside it
    adds realistic variation without ever leaving the configured limits.
    """
    low = duration_range.minimum
    high = duration_range.maximum
    span = high - low

    frac_low, frac_high = _COMPLEXITY_BANDS[complexity]
    band_low = round(low + span * frac_low)
    band_high = round(low + span * frac_high)

    band_low = max(low, min(band_low, high))
    band_high = max(low, min(band_high, high))
    if band_high < band_low:
        band_low, band_high = band_high, band_low

    return rng.randint(band_low, band_high)


def generate_traffic_light_timings(
    nodes: list[dict[str, Any]],
    roads: list[dict[str, Any]],
    config: TrafficLightsConfig,
    seed: int,
) -> dict[str, TrafficLightTiming]:
    """Generate reproducible, complexity-aware timings for every TL node.

    Each signalised node is classified by its intersection complexity (number
    of approaching streets plus the highest-capacity incident roads). The
    green/yellow/red phase durations are then drawn from the matching band of
    the configured ranges, so busier/faster junctions get longer phases.
    """
    rng = random.Random(seed)
    timings: dict[str, TrafficLightTiming] = {}

    incident = _incident_roads_by_node(roads)

    traffic_light_ids = sorted(
        node["id"]
        for node in nodes
        if node.get("traffic_light", False)
    )

    for node_id in traffic_light_ids:
        incident_roads = incident.get(node_id, [])
        approaches = _count_approaches(node_id, incident_roads)
        complexity = classify_intersection(approaches, incident_roads)

        timings[node_id] = TrafficLightTiming(
            green=_duration_for_band(rng, config.green_duration, complexity),
            yellow=_duration_for_band(rng, config.yellow_duration, complexity),
            red=_duration_for_band(rng, config.red_duration, complexity),
            complexity=complexity.value,
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
            complexity=values.get(
                "complexity", IntersectionComplexity.SIMPLE.value
            ),
        )
        for node_id, values in payload.items()
    }
