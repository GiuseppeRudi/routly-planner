from __future__ import annotations

from pathlib import Path

import networkx as nx
import numpy as np
import osmnx as ox


def keep_largest_strong_component(graph: nx.MultiDiGraph, is_strongly_connected: bool) -> nx.MultiDiGraph:
    graph = ox.truncate.largest_component(graph, strongly=is_strongly_connected)
    return graph


def crop_around_center(
    graph: nx.MultiDiGraph,
    place_name: str,
    max_nodes: int | None,
) -> nx.MultiDiGraph:
    if not max_nodes or len(graph.nodes) <= max_nodes:
        return graph

    print(f"  Cropping graph around center to max {max_nodes} nodes...")
    center = ox.geocode(place_name)
    center_node = ox.distance.nearest_nodes(graph, X=center[1], Y=center[0])
    bfs_nodes = list(nx.bfs_tree(graph, center_node).nodes)[:max_nodes]
    cropped = graph.subgraph(bfs_nodes).copy()

    return cropped


def add_projected_coordinates(graph: nx.MultiDiGraph) -> tuple[nx.MultiDiGraph, nx.MultiDiGraph]:

    projected = ox.project_graph(graph)

    for node_id in graph.nodes:
        graph.nodes[node_id]["x_proj"] = projected.nodes[node_id]["x"]
        graph.nodes[node_id]["y_proj"] = projected.nodes[node_id]["y"]

    return graph, projected


def save_graphml(graph: nx.MultiDiGraph, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    ox.save_graphml(graph, filepath=path)


def find_osm_fuel_nodes(graph, place_name, distance_meters) -> set:
    """osmids (graph node keys) closest to real amenity=fuel POIs."""
    center = ox.geocode(place_name)
    try:
        pois = ox.features_from_point(
            (center[0], center[1]),
            tags={"amenity": "fuel"},
            dist=distance_meters,
        )
    except Exception as exc:
        print(f"  WARNING: OSM fuel query failed ({exc}); no real stations.")
        return set()
    if pois.empty:
        return set()
    pts = pois.geometry.representative_point()
    nearest = ox.distance.nearest_nodes(
        graph, X=pts.x.tolist(), Y=pts.y.tolist()
    )
    return {int(v) for v in np.atleast_1d(nearest)}

def build_osm_graph(
    place_name: str,
    network_type: str,
    max_nodes: int,
    distance_meters: int,
    keep_largest_component: bool,
    is_strongly_connected: bool
) -> nx.MultiDiGraph:

    graph = download_drive_graph(
        place_name=place_name,
        network_type=network_type,
        distance_meters=distance_meters,
    )

    if keep_largest_component:
        graph = keep_largest_strong_component(graph, is_strongly_connected)

    graph = crop_around_center(
        graph=graph,
        place_name=place_name,
        max_nodes=max_nodes,
    )
    
    print(f"  Final graph: {len(graph.nodes)} nodes, {len(graph.edges)} edges")

    return graph


def download_drive_graph(
    place_name: str,
    network_type: str ,
    distance_meters: int ,
) -> nx.MultiDiGraph:

        
    center = ox.geocode(place_name)
    center_latitude, center_longitude = center[0], center[1]
    graph = ox.graph_from_point(
        center_point=(center_latitude, center_longitude),
        dist=distance_meters,
        network_type=network_type,
    )

    print(f"  Raw graph in a range of {distance_meters} meters: {len(graph.nodes)} nodes, {len(graph.edges)} edges")

    return graph
