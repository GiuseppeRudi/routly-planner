from __future__ import annotations

from dataclasses import dataclass
import re


@dataclass(frozen=True)
class PlanStep:
    timestamp: float
    road_id: str
    from_loc: str
    to_loc: str


START_TRAVERSAL_RE = re.compile(
    r"^\s*([\d.]+)\s*:\s*"
    r"\(start-traversal\s+\S+\s+(\S+)\s+(\S+)\s+(\S+)\)"
)


def parse_start_traversal_steps(plan_text: str) -> list[PlanStep]:
    """Extract timestamped start-traversal actions from an ENHSP plan."""
    steps: list[PlanStep] = []

    for line in plan_text.splitlines():
        match = START_TRAVERSAL_RE.search(line)
        if match:
            steps.append(
                PlanStep(
                    timestamp=float(match.group(1)),
                    road_id=match.group(2),
                    from_loc=match.group(3),
                    to_loc=match.group(4),
                )
            )

    return steps


def parse_start_traversal_roads(plan_text: str) -> list[str]:
    """Extract ordered road IDs from ENHSP plan lines."""
    return [step.road_id for step in parse_start_traversal_steps(plan_text)]


def extract_start_traversal_timestamps(plan_text: str) -> list[float]:
    """Extract timestamps from start-traversal plan actions."""
    return [step.timestamp for step in parse_start_traversal_steps(plan_text)]
