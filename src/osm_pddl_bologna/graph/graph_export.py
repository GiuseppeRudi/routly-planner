from pathlib import Path

import osmnx as ox
import networkx as nx


def save_graph(graph: nx.MultiDiGraph, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    ox.save_graphml(graph, output_path)


def load_graph(input_path: Path) -> nx.MultiDiGraph:
    if not input_path.exists():
        raise FileNotFoundError(f"Graph file not found: {input_path}")
    return ox.load_graphml(input_path)
