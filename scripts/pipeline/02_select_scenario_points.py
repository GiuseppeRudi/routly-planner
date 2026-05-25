from __future__ import annotations

from pathlib import Path
import argparse
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

from src.routly.config import load_config


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Select start and goal points interactively using Matplotlib."
    )

    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--scenario-output", required=True)

    return parser.parse_args()


def load_mapping(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Mapping file not found: {path}")

    return json.loads(path.read_text(encoding="utf-8"))


def load_graph(path: Path) -> nx.MultiDiGraph:
    if not path.exists():
        raise FileNotFoundError(f"GraphML file not found: {path}")

    return ox.load_graphml(path)


def get_node_xy(node: dict[str, Any]) -> tuple[float, float]:
    if "x" not in node or "y" not in node:
        raise KeyError("Mapping node must contain 'x' and 'y'.")

    return float(node["x"]), float(node["y"])


def get_node_osm_id(node: dict[str, Any]) -> str | None:
    for key in ("osm_id", "osm_node_id", "original_id", "node_id"):
        if key in node:
            return str(node[key])

    return None


def find_nearest_mapping_node(
    click_x: float,
    click_y: float,
    mapping_nodes: list[dict[str, Any]],
) -> tuple[dict[str, Any], float]:
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


def build_directed_graph_from_mapping(mapping: dict[str, Any]) -> dict[str, list[str]]:
    directed_graph: dict[str, list[str]] = {}

    for node in mapping["nodes"]:
        directed_graph[node["id"]] = []

    for road in mapping["roads"]:
        directed_graph.setdefault(road["from"], []).append(road["to"])

    return directed_graph


def find_reachable_locations(
    directed_graph: dict[str, list[str]],
    start_loc: str,
) -> set[str]:
    visited: set[str] = set()
    stack = [start_loc]

    while stack:
        current = stack.pop()

        if current in visited:
            continue

        visited.add(current)

        for neighbor in directed_graph.get(current, []):
            if neighbor not in visited:
                stack.append(neighbor)

    return visited


def validate_selected_pair(
    mapping: dict[str, Any],
    start_node: dict[str, Any],
    goal_node: dict[str, Any],
) -> bool:
    directed_graph = build_directed_graph_from_mapping(mapping)

    start_loc = start_node["id"]
    goal_loc = goal_node["id"]

    outgoing = directed_graph.get(start_loc, [])

    if not outgoing:
        print(f"\nINVALID START: {start_loc} has no outgoing roads.")
        return False

    reachable = find_reachable_locations(directed_graph, start_loc)

    if goal_loc not in reachable:
        print(f"\nINVALID PAIR: {goal_loc} is not reachable from {start_loc}.")
        return False

    print("\nReachability check passed:")
    print(f"  Start: {start_loc}")
    print(f"  Goal:  {goal_loc}")
    print(f"  Reachable locations from start: {len(reachable)}")

    return True


def plot_mapping_graph(
    mapping: dict[str, Any],
    title: str,
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
        ax.annotate(label, (x, y), textcoords="offset points", xytext=(8, 8))

    ax.set_title(title)
    ax.set_xlabel("Projected X")
    ax.set_ylabel("Projected Y")
    ax.axis("equal")
    ax.grid(True)

    plt.tight_layout()


def select_start_goal_interactively(
    mapping: dict[str, Any],
) -> tuple[dict[str, Any], dict[str, Any]]:
    mapping_nodes = mapping["nodes"]

    while True:
        plot_mapping_graph(
            mapping,
            "Select points: first click = START, second click = GOAL",
        )

        print("\nINTERACTIVE POINT SELECTION")
        print("  1st click: START")
        print("  2nd click: GOAL")
        print("  You can use Matplotlib zoom/pan before clicking.\n")

        clicks = plt.ginput(2, timeout=0)

        if len(clicks) != 2:
            plt.close()
            raise RuntimeError(f"Expected exactly 2 clicks, got {len(clicks)}.")

        start_node, start_distance = find_nearest_mapping_node(
            clicks[0][0],
            clicks[0][1],
            mapping_nodes,
        )

        goal_node, goal_distance = find_nearest_mapping_node(
            clicks[1][0],
            clicks[1][1],
            mapping_nodes,
        )

        plt.close()

        print("Selected START:")
        print(f"  location_id: {start_node['id']}")
        print(f"  distance from click: {start_distance:.2f} m")

        print("Selected GOAL:")
        print(f"  location_id: {goal_node['id']}")
        print(f"  distance from click: {goal_distance:.2f} m")

        if validate_selected_pair(mapping, start_node, goal_node):
            break

        print("\nSelect a new valid pair.")

    plot_mapping_graph(
        mapping,
        "Selected valid START and GOAL",
        selected_points=[
            ("START", start_node),
            ("GOAL", goal_node),
        ],
    )

    plt.show()

    return start_node, goal_node


def enrich_selected_node(
    mapping_node: dict[str, Any],
    graph: nx.MultiDiGraph,
) -> dict[str, Any]:
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


def build_scenario_yaml(
    graph: nx.MultiDiGraph,
    config: Any,
    scenario_output_path: Path,
    start_node: dict[str, Any],
    goal_node: dict[str, Any],
) -> dict[str, Any]:
    return {
        "scenario": {
            "name": scenario_output_path.stem,
        },
        "map": {
            "place_name": config.place_name,
            "place_slug": config.place_slug,
            "map_scenario": config.scenario_slug,
            "graphml_path": str(config.raw_graphml_path),
            "mapping_path": str(config.mapping_path),
        },
        "vehicles": [
            {
                "id": "car1",
                "start": enrich_selected_node(start_node, graph),
                "goal": enrich_selected_node(goal_node, graph),
            }
        ],
    }


def write_scenario_yaml(scenario: dict[str, Any], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)

    output_path.write_text(
        yaml.safe_dump(
            scenario,
            sort_keys=False,
            allow_unicode=True,
        ),
        encoding="utf-8",
    )

    print("\nScenario YAML saved:")
    print(f"  {output_path}")


def main() -> None:
    args = parse_args()

    config = load_config(args.map_config, args.project_config)

    scenario_output_path = Path(args.scenario_output)
    if not scenario_output_path.is_absolute():
        scenario_output_path = PROJECT_ROOT / scenario_output_path

    print("Loading map files:")
    print(f"  GraphML: {config.raw_graphml_path}")
    print(f"  Mapping: {config.mapping_path}")
    print(f"  Scenario output: {scenario_output_path}")

    graph = load_graph(config.raw_graphml_path)
    mapping = load_mapping(config.mapping_path)

    if "nodes" not in mapping or "roads" not in mapping:
        raise KeyError("roads_mapping.json must contain 'nodes' and 'roads'.")

    start_node, goal_node = select_start_goal_interactively(mapping)

    scenario = build_scenario_yaml(
        graph=graph,
        config=config,
        scenario_output_path=scenario_output_path,
        start_node=start_node,
        goal_node=goal_node,
    )

    write_scenario_yaml(scenario, scenario_output_path)


if __name__ == "__main__":
    main()