from __future__ import annotations

from pathlib import Path

import networkx as nx
import osmnx as ox


def download_drive_graph(place_name: str, network_type: str = "drive") -> nx.MultiDiGraph:
    """Download a road graph from OpenStreetMap using OSMnx."""
    print(f"Downloading {place_name} {network_type} network from OSM...")
    graph = ox.graph_from_place(place_name, network_type=network_type)
    print(f"  Raw graph: {len(graph.nodes)} nodes, {len(graph.edges)} edges")
    return graph


def keep_largest_strong_component(graph: nx.MultiDiGraph) -> nx.MultiDiGraph:
    """Keep the largest strongly connected component."""
    graph = ox.truncate.largest_component(graph, strongly=True)
    print(f"  Largest component: {len(graph.nodes)} nodes, {len(graph.edges)} edges")
    return graph


def compute_auto_max_nodes(graph: nx.MultiDiGraph, c_target: int = 50_000_000) -> int:
    """
    Heuristic used in the original script:
    MAX_NODES ≈ cubic root of c_target / graph density.
    """
    density = len(graph.edges) / max(1, len(graph.nodes))
    max_nodes = int(round((c_target / density) ** (1 / 3)))
    max_nodes = max(50, min(max_nodes, len(graph.nodes)))
    print(f"  Auto MAX_NODES: {max_nodes}")
    return max_nodes


def crop_around_city_center(
    graph: nx.MultiDiGraph,
    place_name: str,
    max_nodes: int | None,
) -> nx.MultiDiGraph:
    """Crop the graph with a BFS from the geocoded city center."""
    if not max_nodes or len(graph.nodes) <= max_nodes:
        return graph

    city_center = ox.geocode(place_name)
    center_node = ox.distance.nearest_nodes(graph, X=city_center[1], Y=city_center[0])
    bfs_nodes = list(nx.bfs_tree(graph, center_node).nodes)[:max_nodes]
    cropped = graph.subgraph(bfs_nodes).copy()

    print(f"  City center: lat={city_center[0]:.4f}, lon={city_center[1]:.4f}")
    print(f"  Cropped graph: {len(cropped.nodes)} nodes, {len(cropped.edges)} edges")
    return cropped


def add_projected_coordinates(graph: nx.MultiDiGraph) -> tuple[nx.MultiDiGraph, nx.MultiDiGraph]:
    """
    Project the graph to metric coordinates and copy projected coordinates
    into the original graph as x_proj/y_proj.
    """
    print("Projecting graph to metric coordinates...")
    projected = ox.project_graph(graph)

    for node_id in graph.nodes:
        graph.nodes[node_id]["x_proj"] = projected.nodes[node_id]["x"]
        graph.nodes[node_id]["y_proj"] = projected.nodes[node_id]["y"]

    return graph, projected


def save_graphml(graph: nx.MultiDiGraph, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    ox.save_graphml(graph, filepath=path)
    print(f"  Saved GraphML: {path}")


def build_osm_graph(
    place_name: str,
    network_type: str = "drive",
    c_target: int = 50_000_000,
    max_nodes: int | None = None,
) -> nx.MultiDiGraph:
    """Complete OSM graph creation step."""
    graph = download_drive_graph(place_name, network_type)
    graph = keep_largest_strong_component(graph)

    if max_nodes is None:
        max_nodes = compute_auto_max_nodes(graph, c_target)

    graph = crop_around_city_center(graph, place_name, max_nodes)
    print(f"  Final graph: {len(graph.nodes)} nodes, {len(graph.edges)} edges")
    return graph
