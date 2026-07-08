from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import xml.etree.ElementTree as ET

from src.routly.domain.congestion import BackgroundRoute


@dataclass(frozen=True)
class InvalidSumoConnection:
    route_id: str
    from_edge: str
    to_edge: str
    pair_index: int


def load_sumo_connections(net_path: str | Path) -> set[tuple[str, str]]:
    """Read edge-to-edge connections from a generated SUMO .net.xml file."""
    root = ET.parse(Path(net_path)).getroot()
    connections: set[tuple[str, str]] = set()
    for connection in root.findall("connection"):
        from_edge = connection.get("from")
        to_edge = connection.get("to")
        if not from_edge or not to_edge:
            continue
        if from_edge.startswith(":") or to_edge.startswith(":"):
            continue
        connections.add((from_edge, to_edge))
    return connections


def first_invalid_sumo_connection(
    edge_sequence: list[str],
    allowed_pairs: set[tuple[str, str]],
) -> tuple[str, str, int] | None:
    for index, (from_edge, to_edge) in enumerate(
        zip(edge_sequence, edge_sequence[1:])
    ):
        if (from_edge, to_edge) not in allowed_pairs:
            return from_edge, to_edge, index
    return None


def validate_sumo_route(
    edge_sequence: list[str],
    net_path: str | Path,
    route_id: str,
) -> None:
    if not edge_sequence:
        raise ValueError(f"SUMO route {route_id} is empty")

    allowed_pairs = load_sumo_connections(net_path)
    invalid = first_invalid_sumo_connection(edge_sequence, allowed_pairs)
    if invalid is None:
        return

    from_edge, to_edge, pair_index = invalid
    raise ValueError(
        f"SUMO route {route_id} is not connected in {Path(net_path).name}: "
        f"{from_edge} -> {to_edge} at segment {pair_index}. "
        "The PDDL route expands to edges that netconvert does not connect."
    )


def filter_background_routes_by_sumo_connections(
    background_routes: list[BackgroundRoute] | None,
    net_path: str | Path,
) -> tuple[list[BackgroundRoute] | None, list[InvalidSumoConnection]]:
    if background_routes is None:
        return None, []

    allowed_pairs = load_sumo_connections(net_path)
    kept: list[BackgroundRoute] = []
    dropped: list[InvalidSumoConnection] = []
    for index, (depart, route) in enumerate(background_routes):
        invalid = first_invalid_sumo_connection(list(route), allowed_pairs)
        if invalid is None:
            kept.append((depart, route))
            continue

        from_edge, to_edge, pair_index = invalid
        dropped.append(
            InvalidSumoConnection(
                route_id=f"bg_{index:04d}",
                from_edge=from_edge,
                to_edge=to_edge,
                pair_index=pair_index,
            )
        )

    return kept, dropped
