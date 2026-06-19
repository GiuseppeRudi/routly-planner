from __future__ import annotations

from dataclasses import dataclass
import json
import math
from pathlib import Path
import random
from typing import Any

from src.routly.features import FuelConfig

# Map-driven tunables
# What actually controls difficulty is scale-invariant:
#   full-tank range = _TANK_RANGE_FRACTION * map_diagonal
#   start range = initial_fuel_ratio  * full-tank range
# capacity & consumption are cosmetic litres that grow with the map.
_TANK_RANGE_FRACTION = 0.5 # a full tank covers  about 50% of the map diagonal
_BASE_CONSUMPTION_PER_KM = 7.0  # litres/km at the reference map size
_REFERENCE_SPAN_KM = 5.0 # map diagonal treated as the "1x" size

@dataclass(frozen=True)
class FuelParameters:

    tank_capacity: float
    initial_fuel: float
    consumption_per_meter: float
    stations: list[str]


def map_span_meters(nodes: list[dict[str, Any]]) -> float:
    """Bounding-box diagonal of the node coordinates (projected metres)."""
    xs = [float(n["x"]) for n in nodes if "x" in n and "y" in n]
    ys = [float(n["y"]) for n in nodes if "x" in n and "y" in n]
    if not xs or not ys:
        return 0.0
    return math.hypot(max(xs) - min(xs), max(ys) - min(ys))


def _station_count(num_nodes: int, ratio: float) -> int:
    """Number of stations = percentage of nodes, at least 1."""
    if num_nodes <= 0 or ratio <= 0:
        return 0
    return max(1, min(num_nodes, round(ratio * num_nodes)))

def generate_fuel_stations(
    nodes: list[dict[str, Any]],
    config: FuelConfig,
    seed: int,
) -> list[str]:
    """Pick reproducible station locations as a percentage of all nodes.

    - ``stations_source == "random"`` (default): a seeded ``stations_ratio``
      sample of the nodes.
    - ``stations_source == "osm"``: use the real ``amenity=fuel`` nodes that
      step 01 tagged with ``"fuel_station": True`` (snapped from OSM POIs);
      top up with a seeded random sample if there are fewer than the
      ``stations_ratio`` target, and fall back to pure random if the map has
      no fuel POIs at all.
    """
    source = (config.stations_source or "random").lower()
    location_ids = sorted(n["id"] for n in nodes if n.get("id"))
    target = _station_count(len(location_ids), config.stations_ratio)

    if source == "osm":
        osm_ids = sorted(n["id"] for n in nodes if n.get("fuel_station"))
        if osm_ids:
            chosen = set(osm_ids)
            if len(chosen) < target: # top up to the density target
                rng = random.Random(seed)
                pool = [lid for lid in location_ids if lid not in chosen]
                chosen.update(rng.sample(pool, min(target - len(chosen), len(pool))))
            return sorted(chosen)
        print(
            "WARNING: fuel.stations_source='osm' but no amenity=fuel nodes were "
            "found in this map; falling back to random placement."
        )

    if target == 0:
        return []
    rng = random.Random(seed)
    return sorted(rng.sample(location_ids, target))


def derive_fuel_parameters(
    nodes: list[dict[str, Any]],
    config: FuelConfig,
    seed: int,
) -> FuelParameters:
    """Size tank and consumption from the map extent, and stations from a %.

    - consumption grows with map size (bigger map -> thirstier vehicle),
    - a full tank always covers _TANK_RANGE_FRACTION of the map diagonal,
    - initial fuel is 'initial_fuel_ratio' of that tank,
    - station count is 'stations_ratio' of the nodes.
    """
    span_m = map_span_meters(nodes)
    span_km = span_m / 1000.0

    scale = (span_km / _REFERENCE_SPAN_KM) if span_km > 0 else 1.0
    consumption_per_meter = (_BASE_CONSUMPTION_PER_KM * scale) / 1000.0
    consumption_per_meter = max(consumption_per_meter, 1e-6)  # never zero

    range_full_m = _TANK_RANGE_FRACTION * span_m
    tank_capacity = max(round(consumption_per_meter * range_full_m, 3), 1e-3)
    initial_fuel = round(config.initial_fuel_ratio * tank_capacity, 3)

    stations = generate_fuel_stations(nodes, config, seed)
    return FuelParameters(
        tank_capacity=tank_capacity,
        initial_fuel=initial_fuel,
        consumption_per_meter=consumption_per_meter,
        stations=stations,
    )


def write_fuel_stations(stations: list[str], path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps({"stations": list(stations)}, indent=2), encoding="utf-8")


def load_fuel_stations(path: str | Path) -> list[str]:
    payload = json.loads(Path(path).read_text(encoding="utf-8"))
    return list(payload.get("stations", []))