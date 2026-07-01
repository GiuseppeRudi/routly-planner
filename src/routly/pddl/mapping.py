from __future__ import annotations

import json
import random
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


def _normalize_highway(raw_highway: object) -> str | list[str] | None:
    if raw_highway is None:
        return None

    if isinstance(raw_highway, str):
        highway = raw_highway.strip()
        return highway if highway else None

    if isinstance(raw_highway, (list, tuple, set)):
        tags = [
            item.strip()
            for item in raw_highway
            if isinstance(item, str) and item.strip()
        ]
        if not tags:
            return None
        return tags[0] if len(tags) == 1 else tags

    return str(raw_highway)


def graph_to_mapping(
    graph: nx.MultiDiGraph,
    projected_graph: nx.MultiDiGraph,
    fuel_osmids: set | None = None,
) -> tuple[dict]:
    """
    Convert an OSMnx graph to:
      - SUMO/PDDL node mapping
      - PDDL road objects
      - full JSON mapping with geometries
    """
    node_map: dict[int, dict] = {}
    nodes_for_json: list[dict] = []
    fuel_osmids = fuel_osmids or set()

    for i, node in enumerate(graph.nodes):
        data = graph.nodes[node]
        loc_id = f"loc_{i:04d}"

        is_tl = data.get("highway") == "traffic_signals"
        is_fuel = node in fuel_osmids

        entry = {
            "id": loc_id, "x": data["x_proj"], "y": data["y_proj"],
            "traffic_light": is_tl, "fuel_station": is_fuel,  # NEW key
        }
        node_map[node] = entry
        nodes_for_json.append(dict(entry))

    pddl_roads: list[dict] = []
    roads_for_json: list[dict] = []

    for i, (u, v, k, data) in enumerate(graph.edges(keys=True, data=True)):
        road_id = f"road_{i:04d}"
        length = round(float(data.get("length", 100.0)), 2)
        speed_ms = _parse_speed_ms(data.get("maxspeed", "50"))
        highway = _normalize_highway(data.get("highway"))

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
            "highway": highway,
        })

        roads_for_json.append({
            "id": road_id,
            "from": node_map[u]["id"],
            "to": node_map[v]["id"],
            "length": length,
            "speed": speed_ms,
            "highway": highway,
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


def extract_topology_for_llm(
    mapping: dict,
    all_roads: list[str],
    start_loc: str,
    goal_loc: str,
    max_edges: int = 120,
    strategic: bool = True,
    seed: int = 42,
) -> dict:
    """Compact, route-agnostic graph view for the LLM prompt.

    Contains only topology (which roads connect which intersections), each
    touched intersection's degree (how many roads meet there), and a node ->
    incident-roads lookup (`node_roads`). When `strategic=True`, each edge also
    carries `distance_to_axis` (perpendicular distance of the road's midpoint
    from the straight start-goal segment) to guide strategic road selection.
    When `strategic=False`, that field is omitted so the LLM has no geometric
    bias. On large maps the edge set is truncated to a corridor buffer around
    the start-goal segment (geometric filter, not solver output).
    """
    roads_by_id = {r["id"]: r for r in mapping["roads"] if r["id"] in set(all_roads)}
    nodes_by_id = {n["id"]: n for n in mapping["nodes"]}

    degree: dict[str, int] = {}
    for road in roads_by_id.values():
        degree[road["from"]] = degree.get(road["from"], 0) + 1
        degree[road["to"]] = degree.get(road["to"], 0) + 1

    if len(roads_by_id) <= max_edges:
        selected_ids = list(roads_by_id.keys())
        truncated = False
    else:
        if strategic:
            selected_ids = _roads_in_corridor(
                roads_by_id, nodes_by_id, start_loc, goal_loc, max_edges
            )
        else:
            selected_ids = random.Random(seed).sample(list(roads_by_id.keys()), max_edges)
        truncated = True

    edges = []
    node_roads: dict[str, list[str]] = {}
    for rid in selected_ids:
        road = roads_by_id[rid]
        edge: dict = {
            "id": rid,
            "from": road["from"],
            "to": road["to"],
            "length": road["length"],
        }
        if strategic:
            edge["distance_to_axis"] = _road_distance_to_axis(road, nodes_by_id, start_loc, goal_loc)
        edges.append(edge)
        node_roads.setdefault(road["from"], []).append(rid)
        node_roads.setdefault(road["to"], []).append(rid)

    touched_nodes = sorted(node_roads.keys())

    return {
        "start": start_loc,
        "goal": goal_loc,
        "nodes": [{"id": n} for n in touched_nodes],
        "edges": edges,
        "node_roads": node_roads,
        "truncated": truncated,
    }


def _point_segment_distance(
    px: float, py: float, ax: float, ay: float, bx: float, by: float
) -> float:
    """Perpendicular distance from point (px, py) to segment a-b."""
    dx, dy = bx - ax, by - ay
    seg_len_sq = dx * dx + dy * dy
    if seg_len_sq == 0:
        return ((px - ax) ** 2 + (py - ay) ** 2) ** 0.5
    t = max(0.0, min(1.0, ((px - ax) * dx + (py - ay) * dy) / seg_len_sq))
    proj_x, proj_y = ax + t * dx, ay + t * dy
    return ((px - proj_x) ** 2 + (py - proj_y) ** 2) ** 0.5


def _road_distance_to_axis(
    road: dict, nodes_by_id: dict[str, dict], start_loc: str, goal_loc: str
) -> float | None:
    start_node = nodes_by_id.get(start_loc)
    goal_node = nodes_by_id.get(goal_loc)
    from_node = nodes_by_id.get(road["from"])
    to_node = nodes_by_id.get(road["to"])
    if None in (start_node, goal_node, from_node, to_node):
        return None
    mid_x = (from_node["x"] + to_node["x"]) / 2
    mid_y = (from_node["y"] + to_node["y"]) / 2
    return round(
        _point_segment_distance(
            mid_x, mid_y,
            start_node["x"], start_node["y"],
            goal_node["x"], goal_node["y"],
        ),
        1,
    )


def _roads_in_corridor(
    roads_by_id: dict[str, dict],
    nodes_by_id: dict[str, dict],
    start_loc: str,
    goal_loc: str,
    max_edges: int,
    width_ratio: float = 0.12,
    min_width: float = 80.0,
) -> list[str]:
    """Geometric filter: keep only roads whose endpoints both lie within a
    buffer of the straight start-goal segment. Narrower than a bounding box,
    so it concentrates candidates closer to a plausible direct path without
    ever reading the solver's actual plan."""
    start_node = nodes_by_id.get(start_loc)
    goal_node = nodes_by_id.get(goal_loc)
    if start_node is None or goal_node is None:
        return list(roads_by_id.keys())[:max_edges]

    segment_length = (
        (goal_node["x"] - start_node["x"]) ** 2
        + (goal_node["y"] - start_node["y"]) ** 2
    ) ** 0.5
    corridor_width = max(segment_length * width_ratio, min_width)

    def _near_axis(loc_id: str) -> bool:
        node = nodes_by_id.get(loc_id)
        if node is None:
            return False
        return _point_segment_distance(
            node["x"], node["y"],
            start_node["x"], start_node["y"],
            goal_node["x"], goal_node["y"],
        ) <= corridor_width

    selected = [
        rid
        for rid, road in roads_by_id.items()
        if _near_axis(road["from"]) and _near_axis(road["to"])
    ]

    if not selected:
        # Degenerate corridor (e.g. start/goal coincide) - fall back to the
        # closest roads by axis distance instead of returning nothing.
        ranked = sorted(
            roads_by_id.items(),
            key=lambda item: _road_distance_to_axis(
                item[1], nodes_by_id, start_loc, goal_loc
            ) or float("inf"),
        )
        selected = [rid for rid, _ in ranked]

    return selected[:max_edges]


def build_road_adjacency(mapping: dict, road_ids: set[str] | None = None) -> dict[str, set[str]]:
    """Map each road id to the set of road ids sharing an endpoint (from/to) with it.

    If `road_ids` is given, only those roads are considered (both as keys and as
    possible neighbors) - useful to restrict adjacency to currently open roads.
    """
    by_location: dict[str, set[str]] = {}
    for road in mapping["roads"]:
        rid = road["id"]
        if road_ids is not None and rid not in road_ids:
            continue
        by_location.setdefault(road["from"], set()).add(rid)
        by_location.setdefault(road["to"], set()).add(rid)

    adjacency: dict[str, set[str]] = {}
    for road in mapping["roads"]:
        rid = road["id"]
        if road_ids is not None and rid not in road_ids:
            continue
        neighbors = by_location.get(road["from"], set()) | by_location.get(road["to"], set())
        neighbors.discard(rid)
        adjacency[rid] = neighbors

    return adjacency
