from __future__ import annotations

from pathlib import Path
import json
import math
import sys
from typing import Any

import matplotlib.pyplot as plt
import networkx as nx
import osmnx as ox
import yaml


PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

# TODO : aggiungere la possibilita di avere lo zoom 
# TODO : attualmente il codice è stato create per effettuare due click ma questo è possibile solo se la macchina che vogliamo controllare con pddl sia una sola 
# nel caso in cui volessimo avere più macchine controllate da pddl allora dovremmo effettuare più click e associare ad ogni click la macchina a cui è associato, questo potrebbe 
# essere fatto con un ciclo while che continua a prendere click finché l'utente non decide di smettere (ad esempio premendo un tasto specifico o chiudendo la finestra) e ad ogni click chiedere l'associazione con una macchina specifica (ad esempio tramite input da terminale o tramite un menu a tendina nella finestra di matplotlib)



# ============================================================
# Default paths for the current experiment
# ============================================================

PLACE_NAME = "Bologna, Emilia-Romagna, Italy"
PLACE_SLUG = "Bologna_Emilia-Romagna_Italy"
MAP_SCENARIO = "nodes_80"

MAP_DIR = PROJECT_ROOT / "data" / PLACE_SLUG / MAP_SCENARIO

GRAPHML_PATH = MAP_DIR / "road_network.graphml"
MAPPING_PATH = MAP_DIR / "roads_mapping.json"

SCENARIO_NAME = "bologna_car1_custom"
SCENARIO_OUTPUT_PATH = PROJECT_ROOT / "config" / "scenarios" / f"{SCENARIO_NAME}.yaml"

VEHICLE_ID = "car1"


# ============================================================
# Loading utilities
# ============================================================

def load_mapping(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Mapping file not found: {path}")

    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def load_graph(path: Path) -> nx.MultiDiGraph:
    if not path.exists():
        raise FileNotFoundError(f"GraphML file not found: {path}")

    return ox.load_graphml(path)


# ============================================================
# Mapping normalization
# ============================================================

def normalize_osm_node_id(value: Any) -> str:
    """
    GraphML loaded by OSMnx often stores node ids as strings.
    roads_mapping.json may store them as int or string.
    We normalize everything to string for safe comparisons.
    """
    return str(value)


def get_node_osm_id(node: dict[str, Any]) -> str | None:
    """
    Try to recover the original OSM node id from a mapping node.

    Depending on your mapping.py implementation, the key could be:
    - osm_id
    - osm_node_id
    - original_id
    - node_id
    """
    for key in ("osm_id", "osm_node_id", "original_id", "node_id"):
        if key in node:
            return normalize_osm_node_id(node[key])

    return None


def get_node_xy(node: dict[str, Any]) -> tuple[float, float]:
    """
    Mapping nodes are expected to contain projected coordinates x/y.

    These are the same coordinates used by SUMO generation.
    """
    if "x" not in node or "y" not in node:
        raise KeyError(
            "Each mapping node must contain 'x' and 'y'. "
            "Check src/routly/pddl/mapping.py."
        )

    return float(node["x"]), float(node["y"])


def find_nearest_mapping_node(
    click_x: float,
    click_y: float,
    mapping_nodes: list[dict[str, Any]],
) -> tuple[dict[str, Any], float]:
    """
    Find the mapping node nearest to the Matplotlib click.
    Coordinates are projected x/y, so Euclidean distance is fine.
    """
    best_node: dict[str, Any] | None = None
    best_distance = float("inf")

    for node in mapping_nodes:
        node_x, node_y = get_node_xy(node)
        distance = math.hypot(node_x - click_x, node_y - click_y)

        if distance < best_distance:
            best_node = node
            best_distance = distance

    if best_node is None:
        raise RuntimeError("No nodes available in mapping.")

    return best_node, best_distance


def enrich_selected_node(
    mapping_node: dict[str, Any],
    graph: nx.MultiDiGraph,
) -> dict[str, Any]:
    """
    Build the YAML-friendly representation of a selected node.

    We save:
    - PDDL location id
    - OSM node id when available
    - projected x/y
    - geographic lat/lon when available from GraphML
    """
    location_id = mapping_node["id"]
    x, y = get_node_xy(mapping_node)
    osm_node_id = get_node_osm_id(mapping_node)

    result: dict[str, Any] = {
        "type": "location_id",
        "value": location_id,
        "x": round(x, 3),
        "y": round(y, 3),
    }

    if osm_node_id is not None:
        result["osm_node_id"] = osm_node_id

        if osm_node_id in graph.nodes:
            graph_node = graph.nodes[osm_node_id]

            if "y" in graph_node and "x" in graph_node:
                result["lat"] = float(graph_node["y"])
                result["lon"] = float(graph_node["x"])

    return result


# ============================================================
# Plotting
# ============================================================

def plot_mapping_graph(
    mapping: dict[str, Any],
    selected_points: list[tuple[str, dict[str, Any]]] | None = None,
) -> None:
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}
    selected_points = selected_points or []

    fig, ax = plt.subplots(figsize=(12, 10))

    for road in mapping["roads"]:
        geometry = road.get("geometry")

        if geometry:
            xs = [point[0] for point in geometry]
            ys = [point[1] for point in geometry]
            ax.plot(xs, ys, linewidth=0.8)
        else:
            from_node = nodes_by_id.get(road["from"])
            to_node = nodes_by_id.get(road["to"])

            if from_node is None or to_node is None:
                continue

            x1, y1 = get_node_xy(from_node)
            x2, y2 = get_node_xy(to_node)
            ax.plot([x1, x2], [y1, y2], linewidth=0.8)

    node_xs = []
    node_ys = []

    for node in mapping["nodes"]:
        x, y = get_node_xy(node)
        node_xs.append(x)
        node_ys.append(y)

    ax.scatter(node_xs, node_ys, s=12)

    for label, node in selected_points:
        x, y = get_node_xy(node)
        ax.scatter([x], [y], s=120)
        ax.annotate(
            label,
            (x, y),
            textcoords="offset points",
            xytext=(8, 8),
            fontsize=12,
            fontweight="bold",
        )

    ax.set_title(
        "Select scenario points: first click = START, second click = GOAL",
        fontsize=14,
    )
    ax.set_xlabel("Projected X")
    ax.set_ylabel("Projected Y")
    ax.axis("equal")
    ax.grid(True)

    plt.tight_layout()


def select_start_goal_interactively(
    mapping: dict[str, Any],
) -> tuple[dict[str, Any], dict[str, Any]]:
    mapping_nodes = mapping["nodes"]

    plot_mapping_graph(mapping)

    print("\nINTERACTIVE POINT SELECTION")
    print("  1st click: START")
    print("  2nd click: GOAL")
    print("  Close the Matplotlib window only after selecting both points.\n")

    clicks = plt.ginput(2, timeout=0)

    if len(clicks) != 2:
        raise RuntimeError(
            f"Expected exactly 2 clicks, got {len(clicks)}. "
            "Run the script again and select START and GOAL."
        )

    start_click = clicks[0]
    goal_click = clicks[1]

    start_node, start_distance = find_nearest_mapping_node(
        click_x=start_click[0],
        click_y=start_click[1],
        mapping_nodes=mapping_nodes,
    )

    goal_node, goal_distance = find_nearest_mapping_node(
        click_x=goal_click[0],
        click_y=goal_click[1],
        mapping_nodes=mapping_nodes,
    )

    plt.close()

    print("Selected START:")
    print(f"  location_id: {start_node['id']}")
    print(f"  distance from click: {start_distance:.2f} m")

    print("Selected GOAL:")
    print(f"  location_id: {goal_node['id']}")
    print(f"  distance from click: {goal_distance:.2f} m")

    plot_mapping_graph(
        mapping,
        selected_points=[
            ("START", start_node),
            ("GOAL", goal_node),
        ],
    )

    plt.show()

    return start_node, goal_node


# ============================================================
# YAML writing
# ============================================================

def build_scenario_yaml(
    graph: nx.MultiDiGraph,
    start_node: dict[str, Any],
    goal_node: dict[str, Any],
) -> dict[str, Any]:
    start = enrich_selected_node(start_node, graph)
    goal = enrich_selected_node(goal_node, graph)

    return {
        "scenario": {
            "name": SCENARIO_NAME,
        },
        "map": {
            "place_name": PLACE_NAME,
            "place_slug": PLACE_SLUG,
            "map_scenario": MAP_SCENARIO,
            "graphml_path": str(GRAPHML_PATH),
            "mapping_path": str(MAPPING_PATH),
        },
        "vehicles": [
            {
                "id": VEHICLE_ID,
                "start": start,
                "goal": goal,
            }
        ],
    }


def write_scenario_yaml(scenario: dict[str, Any], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open("w", encoding="utf-8") as file:
        yaml.safe_dump(
            scenario,
            file,
            sort_keys=False,
            allow_unicode=True,
        )

    print(f"\nScenario YAML saved:")
    print(f"  {output_path}")


# ============================================================
# Main
# ============================================================

def main() -> None:
    print("Loading map files...")
    print(f"  GraphML: {GRAPHML_PATH}")
    print(f"  Mapping: {MAPPING_PATH}")

    graph = load_graph(GRAPHML_PATH)
    mapping = load_mapping(MAPPING_PATH)

    if "nodes" not in mapping or "roads" not in mapping:
        raise KeyError("roads_mapping.json must contain 'nodes' and 'roads'.")

    print(f"Loaded mapping:")
    print(f"  Nodes: {len(mapping['nodes'])}")
    print(f"  Roads: {len(mapping['roads'])}")

    start_node, goal_node = select_start_goal_interactively(mapping)

    scenario = build_scenario_yaml(
        graph=graph,
        start_node=start_node,
        goal_node=goal_node,
    )

    write_scenario_yaml(scenario, SCENARIO_OUTPUT_PATH)


if __name__ == "__main__":
    main()