from __future__ import annotations

import json
from pathlib import Path

import networkx as nx


def _parse_speed_ms(raw_speed: object, default_kmh: float = 50.0) -> float:
    if isinstance(raw_speed, list):
        raw_speed = raw_speed[0]

    try:
        speed_kmh = float(str(raw_speed).split()[0])
    except (ValueError, AttributeError, TypeError):
        speed_kmh = default_kmh

    return round(speed_kmh / 3.6, 3)


def graph_to_mapping(
    graph: nx.MultiDiGraph,
    projected_graph: nx.MultiDiGraph,
) -> tuple[dict]:
    """
    Convert an OSMnx graph to:
      - SUMO/PDDL node mapping
      - PDDL road objects
      - full JSON mapping with geometries
    """
    node_map: dict[int, dict] = {}
    nodes_for_json: list[dict] = []

    for i, node in enumerate(graph.nodes):
        data = graph.nodes[node]
        loc_id = f"loc_{i:04d}"

        is_tl = data.get("highway") == "traffic_signals"

        node_map[node] = {
            "id": loc_id,
            "x": data["x_proj"],
            "y": data["y_proj"],
            "traffic_light": is_tl,
        }
        nodes_for_json.append({
            "id": loc_id,
            "x": data["x_proj"],
            "y": data["y_proj"],
            "traffic_light": is_tl,
        })

    pddl_roads: list[dict] = []
    roads_for_json: list[dict] = []

    for i, (u, v, k, data) in enumerate(graph.edges(keys=True, data=True)):
        road_id = f"road_{i:04d}"
        length = round(float(data.get("length", 100.0)), 2)
        speed_ms = _parse_speed_ms(data.get("maxspeed", "50"))

        edge_data_projected = projected_graph.get_edge_data(u, v, k)
        if edge_data_projected and "geometry" in edge_data_projected:
            geometry = [[pt[0], pt[1]] for pt in edge_data_projected["geometry"].coords]
        else:
            geometry = [
                [node_map[u]["x"], node_map[u]["y"]],
                [node_map[v]["x"], node_map[v]["y"]],
            ]

        pddl_roads.append({
            "id": road_id,
            "from": node_map[u]["id"],
            "to": node_map[v]["id"],
            "length": length,
            "speed_ms": speed_ms,
        })

        roads_for_json.append({
            "id": road_id,
            "from": node_map[u]["id"],
            "to": node_map[v]["id"],
            "length": length,
            "speed": speed_ms,
            "geometry": geometry,
        })

    mapping = {
        "nodes": nodes_for_json,
        "roads": roads_for_json,
    }

    #print(f"  Locations: {len(nodes_for_json)}")
    #print(f"  Roads:     {len(roads_for_json)}")
    tl_count = sum(1 for n in nodes_for_json if n.get("traffic_light"))
    print(f"  Traffic lights: {tl_count} / {len(nodes_for_json)} nodes")

    return mapping


def write_mapping(mapping: dict, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(mapping, indent=2), encoding="utf-8")
    #print(f"Mapping written: {path}")


def load_mapping(path: str | Path) -> dict:
    return json.loads(Path(path).read_text(encoding="utf-8"))
