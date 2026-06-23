from __future__ import annotations

from typing import Any


ROAD_CAPACITY_CLASSES = ("local", "arterial", "major")

_CLASS_RANK = {"local": 0, "arterial": 1, "major": 2}

_MAJOR_HIGHWAYS = {
    "motorway",
    "trunk",
    "primary",
    "motorway_link",
    "trunk_link",
    "primary_link",
}

_ARTERIAL_HIGHWAYS = {
    "secondary",
    "tertiary",
    "secondary_link",
    "tertiary_link",
}


def road_capacity_class(road: dict[str, Any]) -> str:
    """Classify a road for capacity-sensitive features.

    Missing, empty, or unknown OSM highway tags are treated as local roads.
    When OSM gives multiple highway tags, the highest-capacity class wins.
    """
    road_class = "local"
    for tag in _highway_tags(road.get("highway")):
        candidate = _capacity_class_for_highway(tag)
        if _CLASS_RANK[candidate] > _CLASS_RANK[road_class]:
            road_class = candidate
    return road_class


def _capacity_class_for_highway(highway: str) -> str:
    if highway in _MAJOR_HIGHWAYS:
        return "major"
    if highway in _ARTERIAL_HIGHWAYS:
        return "arterial"
    return "local"


def _highway_tags(raw_highway: Any) -> list[str]:
    if raw_highway is None:
        return []

    if isinstance(raw_highway, str):
        tag = raw_highway.strip()
        return [tag] if tag else []

    if isinstance(raw_highway, (list, tuple, set)):
        tags = []
        for item in raw_highway:
            if isinstance(item, str) and item.strip():
                tags.append(item.strip())
        return tags

    return []
