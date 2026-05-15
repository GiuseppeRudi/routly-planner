from dataclasses import dataclass


@dataclass(frozen=True)
class RoadNode:
    id: str
    original_osm_id: str
    latitude: float
    longitude: float


@dataclass(frozen=True)
class RoadEdge:
    source: str
    target: str
    length: float
    name: str | None = None
    one_way: bool = True
