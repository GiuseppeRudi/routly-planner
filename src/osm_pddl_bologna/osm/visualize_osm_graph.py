from pathlib import Path

import folium
import networkx as nx


def create_folium_map(graph: nx.MultiDiGraph, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)

    nodes = list(graph.nodes(data=True))
    if not nodes:
        raise ValueError("Cannot visualize an empty graph.")

    avg_lat = sum(float(data["y"]) for _, data in nodes) / len(nodes)
    avg_lon = sum(float(data["x"]) for _, data in nodes) / len(nodes)

    fmap = folium.Map(location=[avg_lat, avg_lon], zoom_start=15)

    for u, v, data in graph.edges(data=True):
        u_data = graph.nodes[u]
        v_data = graph.nodes[v]
        points = [
            [float(u_data["y"]), float(u_data["x"])],
            [float(v_data["y"]), float(v_data["x"])],
        ]
        folium.PolyLine(points, weight=2, opacity=0.8).add_to(fmap)

    fmap.save(output_path)
