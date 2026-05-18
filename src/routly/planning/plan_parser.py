from __future__ import annotations

import re


def parse_start_traversal_roads(plan_text: str) -> list[str]:
    """Extract ordered road IDs from ENHSP plan lines."""
    roads: list[str] = []

    for line in plan_text.splitlines():
        match = re.search(r"\(start-traversal\s+\S+\s+(road_\d+)", line)
        if match:
            roads.append(match.group(1))

    return roads


def extract_start_traversal_timestamps(plan_text: str) -> list[float]:
    """Extract timestamps from start-traversal plan actions."""
    timestamps: list[float] = []

    for line in plan_text.splitlines():
        match = re.match(r"^\s*([\d.]+)\s*:", line)
        if match and "start-traversal" in line:
            timestamps.append(float(match.group(1)))

    return timestamps
