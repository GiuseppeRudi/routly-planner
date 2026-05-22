from __future__ import annotations

from pathlib import Path

import networkx as nx
import osmnx as ox


def keep_largest_strong_component(graph: nx.MultiDiGraph, is_strongly_connected: bool) -> nx.MultiDiGraph:
    graph = ox.truncate.largest_component(graph, strongly=is_strongly_connected)
    print(f"  Largest component: {len(graph.nodes)} nodes, {len(graph.edges)} edges")
    return graph


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
    network_type: str,
    max_nodes: int,
    distance_meters: int,
    keep_largest_component: bool,
    is_strongly_connected: bool
) -> nx.MultiDiGraph:
    """Complete OSM graph creation step."""

    graph = download_drive_graph(
        place_name=place_name,
        network_type=network_type,
        distance_meters=distance_meters,
    )

    if keep_largest_component:
        graph = keep_largest_strong_component(graph, is_strongly_connected)

    # graph = crop_around_city_center(
    #     graph=graph,
    #     place_name=place_name,
    #     max_nodes=max_nodes,
    # )
    
    print(f"  Final graph: {len(graph.nodes)} nodes, {len(graph.edges)} edges")

    return graph


def download_drive_graph(
    place_name: str,
    network_type: str ,
    distance_meters: int ,
) -> nx.MultiDiGraph:
    """
    Download a road graph from OpenStreetMap using OSMnx.
    """
        
    center = ox.geocode(place_name)
    center_latitude, center_longitude = center[0], center[1]
    graph = ox.graph_from_point(
        center_point=(center_latitude, center_longitude),
        dist=distance_meters,
        network_type=network_type,
    )

    print(f"  Raw graph: {len(graph.nodes)} nodes, {len(graph.edges)} edges")

    return graph