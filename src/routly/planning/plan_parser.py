from __future__ import annotations

from dataclasses import dataclass
import re


@dataclass(frozen=True)
class PlanStep:
    timestamp: float
    road_id: str
    from_loc: str
    to_loc: str


TRAVERSAL_ACTION_RE = re.compile(
    r"^\s*([\d.]+)\s*:\s*"
    r"\((?:start-traversal|traverse-road)(?:-[^\s\)]*)?"
    r"\s+\S+\s+(\S+)\s+(\S+)\s+(\S+)(?:\s+\S+)?\)"
)

ROAD_SPECIFIC_TRAVERSAL_ACTION_RE = re.compile(
    r"^\s*([\d.]+)\s*:\s*"
    r"\((?:start-traversal|traverse-road)-(?:static|dynamic)-"
    r"([^\s\)]+?)(?:-tw_\d+)?\s+\S+\)"
)

LINE_GRAPH_TRAVERSAL_ACTION_RE = re.compile(
    r"^\s*([\d.]+)\s*:\s*"
    r"\((?:traverse-road|finish-road)(?:-[^\s\)]*)?"
    r"\s+\S+\s+(\S+)(?:\s+\S+)?\)"
)


def parse_start_traversal_steps(plan_text: str) -> list[PlanStep]:
    """Extract timestamped traversal actions from an ENHSP plan."""
    steps: list[PlanStep] = []

    for line in plan_text.splitlines():
        match = TRAVERSAL_ACTION_RE.search(line)
        if match:
            steps.append(
                PlanStep(
                    timestamp=float(match.group(1)),
                    road_id=match.group(2),
                    from_loc=match.group(3),
                    to_loc=match.group(4),
                )
            )
            continue

        match = LINE_GRAPH_TRAVERSAL_ACTION_RE.search(line)
        if match:
            steps.append(
                PlanStep(
                    timestamp=float(match.group(1)),
                    road_id=match.group(2),
                    from_loc="",
                    to_loc="",
                )
            )
            continue

        match = ROAD_SPECIFIC_TRAVERSAL_ACTION_RE.search(line)
        if match:
            steps.append(
                PlanStep(
                    timestamp=float(match.group(1)),
                    road_id=match.group(2),
                    from_loc="",
                    to_loc="",
                )
            )

    return steps


def parse_start_traversal_roads(plan_text: str) -> list[str]:
    """Extract ordered road IDs from ENHSP traversal plan lines."""
    return [step.road_id for step in parse_start_traversal_steps(plan_text)]


def extract_start_traversal_timestamps(plan_text: str) -> list[float]:
    """Extract timestamps from traversal plan actions."""
    return [step.timestamp for step in parse_start_traversal_steps(plan_text)]


def extract_plan_metric_time(plan_text: str) -> float | None:
    """Extract the final plan makespan from ENHSP's trailing metric/elapsed line."""
    match = re.search(r"Metric\s*(?:\(Search\))?\s*:\s*([\d.]+)", plan_text)
    if not match:
        match = re.search(r"Elapsed Time\s*:\s*([\d.]+)", plan_text)
    if not match:
        return None
    return float(match.group(1))


def extract_grounding_time_ms(plan_text: str) -> float | None:
    """Extract ENHSP's grounding time (milliseconds) from its stdout preamble."""
    match = re.search(r"Grounding Time:\s*(\d+)", plan_text)
    if not match:
        return None
    return float(match.group(1))


def extract_grounded_sizes(plan_text: str) -> dict[str, int]:
    """Extract grounded problem sizes (|F|, |A|, |P|, |E|) from ENHSP's stdout preamble."""
    sizes: dict[str, int] = {}
    for key in ("F", "X", "A", "P", "E"):
        match = re.search(rf"\|{key}\|:\s*(\d+)", plan_text)
        if match:
            sizes[key] = int(match.group(1))
    return sizes
