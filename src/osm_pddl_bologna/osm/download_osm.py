from pathlib import Path

import osmnx as ox
import networkx as nx


def download_graph_from_point(
    latitude: float,
    longitude: float,
    distance_meters: int,
    network_type: str = "drive",
) -> nx.MultiDiGraph:
    graph = ox.graph_from_point(
        center_point=(latitude, longitude),
        dist=distance_meters,
        network_type=network_type,
        simplify=True,
    )
    return graph


def save_graphml(graph: nx.MultiDiGraph, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    ox.save_graphml(graph, output_path)


def load_graphml(input_path: Path) -> nx.MultiDiGraph:
    if not input_path.exists():
        raise FileNotFoundError(f"Graph file not found: {input_path}")
    return ox.load_graphml(input_path)
