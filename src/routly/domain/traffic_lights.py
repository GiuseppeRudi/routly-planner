from __future__ import annotations

from collections import defaultdict
from dataclasses import asdict, dataclass
from enum import Enum
import json
from pathlib import Path
import random
from typing import Any

from src.routly.features import DurationRange, TrafficLightsConfig


class IntersectionComplexity(str, Enum):

    SIMPLE = "simple"
    MEDIUM = "medium"
    COMPLEX = "complex"


# ---------------------------------------------------------------------------
# Road-type proxy.
#
# The mapping does not store the OSM 'highway' class, but it does store the
# per-road speed limit (m/s), which is a good proxy for the *type* of road
# feeding the intersection:
#   <= ~9 m/s   (~32 km/h)  -> residential / local street
#   <= ~14 m/s  (~50 km/h)  -> urban arterial
#    > ~14 m/s               -> major / fast road
# ---------------------------------------------------------------------------
_LOCAL_ROAD_SPEED_MS = 9.0
_URBAN_ROAD_SPEED_MS = 14.0

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


def _road_speed_ms(road: dict[str, Any]) -> float:
    """Return a road's speed in m/s, tolerating both mapping keys.
    JSON mapping roads use 'speed' while PDDL road dicts use 'speed_ms'."""
    speed = road.get("speed", road.get("speed_ms"))
    try:
        return float(speed)
    except (TypeError, ValueError):
        return 0.0


# NOTE: ideally this lives in a shared module (e.g. src/routly/domain/roads.py)
# so the congestion feature and this one use the SAME definition of
# road type. Kept here for now; move it and import it from both once the OSM
# highway tag is added to the mapping.
def road_class(road: dict[str, Any]) -> str:
    """Normalize a road to a tier: "major" | "arterial" | "local".

    Prefers the OSM highway tag; falls back to the speed proxy when the tag
    is missing, so this works both before and after adding highway.
    """
    highway = road.get("highway")
    if isinstance(highway, list):
        highway = highway[0] if highway else None
    if highway:
        if highway in {
            "motorway", "trunk", "primary",
            "motorway_link", "trunk_link", "primary_link",
        }:
            return "major"
        if highway in {
            "secondary", "tertiary",
            "secondary_link", "tertiary_link",
        }:
            return "arterial"
        return "local"  # residential, unclassified, living_street, service…

    speed_ms = _road_speed_ms(road)
    if speed_ms > _URBAN_ROAD_SPEED_MS:
        return "major"
    if speed_ms > _LOCAL_ROAD_SPEED_MS:
        return "arterial"
    return "local"


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
      * the biggest/fastest incident road (road-type tier via 'road_class').
    """
    # Geometric complexity from the number of approaching streets.
    if approaches <= 2: degree_level = 0  # through-node / pedestrian crossing
    elif approaches == 3: degree_level = 1  # T-junction
    else: degree_level = 2  # crossroads (4-way) or larger

    # Road-type complexity from the biggest incident road. Uses the shared
    # road_class() helper, which prefers the OSM highway tag and falls back
    # to the speed proxy when the tag is not present yet.
    road_level = max(
        (_CLASS_RANK[road_class(road)] for road in incident_roads),
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
    of approaching streets plus the type/speed of the incident roads). The
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