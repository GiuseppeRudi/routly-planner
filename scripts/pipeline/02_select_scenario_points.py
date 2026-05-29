from __future__ import annotations

from pathlib import Path
import argparse
import json
import math
import sys
from typing import Any

import matplotlib.pyplot as plt
from matplotlib.backend_bases import MouseButton
from matplotlib.widgets import Button
import networkx as nx
import osmnx as ox
import yaml


PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config


# ============================================================
# CLI
# ============================================================

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Select start and goal points interactively using Matplotlib."
    )

    parser.add_argument("--map-config", required=True)
    parser.add_argument("--project-config", required=True)
    parser.add_argument("--scenario-output", required=True)

    return parser.parse_args()


# ============================================================
# Loading utilities
# ============================================================

def load_mapping(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Mapping file not found: {path}")

    return json.loads(path.read_text(encoding="utf-8"))


def load_graph(path: Path) -> nx.MultiDiGraph:
    if not path.exists():
        raise FileNotFoundError(f"GraphML file not found: {path}")

    return ox.load_graphml(path)


# ============================================================
# Mapping utilities
# ============================================================

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


# ============================================================
# Reachability validation
# ============================================================

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
) -> tuple[bool, str]:
    directed_graph = build_directed_graph_from_mapping(mapping)

    start_loc = start_node["id"]
    goal_loc = goal_node["id"]

    outgoing = directed_graph.get(start_loc, [])

    if not outgoing:
        return False, f"Invalid START: {start_loc} has no outgoing roads."

    reachable = find_reachable_locations(directed_graph, start_loc)

    if goal_loc not in reachable:
        return False, f"Invalid pair: {goal_loc} is not reachable from {start_loc}."

    return True, (
        f"Valid pair selected. START={start_loc}, GOAL={goal_loc}, "
        f"reachable locations={len(reachable)}."
    )


# ============================================================
# Matplotlib window helpers
# ============================================================

def center_window(fig: plt.Figure, width: int = 920, height: int = 680) -> None:
    """
    Try to open the Matplotlib window smaller and centered.
    Works on common Tk/Qt backends. Unsupported backends are ignored safely.
    """
    manager = plt.get_current_fig_manager()

    try:
        manager.resize(width, height)
    except Exception:
        pass

    try:
        window = manager.window

        # TkAgg
        if hasattr(window, "winfo_screenwidth"):
            screen_width = window.winfo_screenwidth()
            screen_height = window.winfo_screenheight()
            x = int((screen_width - width) / 2)
            y = int((screen_height - height) / 2)
            window.geometry(f"{width}x{height}+{x}+{y}")
            return

        # QtAgg
        if hasattr(window, "screen") and hasattr(window, "move"):
            screen_geometry = window.screen().availableGeometry()
            x = int(screen_geometry.x() + (screen_geometry.width() - width) / 2)
            y = int(screen_geometry.y() + (screen_geometry.height() - height) / 2)
            window.resize(width, height)
            window.move(x, y)
            return

    except Exception:
        pass

    fig.set_size_inches(width / 100, height / 100)


def setup_axes(ax: plt.Axes, title: str) -> None:
    ax.set_title(title, fontsize=12, fontweight="bold", pad=10)
    ax.set_xlabel("Projected X", fontsize=9)
    ax.set_ylabel("Projected Y", fontsize=9)
    ax.axis("equal")
    ax.grid(True, linewidth=0.35, alpha=0.22)

    ax.tick_params(axis="both", labelsize=8)

    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)


def draw_base_graph(ax: plt.Axes, mapping: dict[str, Any]) -> None:
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}

    for road in mapping["roads"]:
        geometry = road.get("geometry")

        if geometry:
            xs = [point[0] for point in geometry]
            ys = [point[1] for point in geometry]
        else:
            from_node = nodes_by_id.get(road["from"])
            to_node = nodes_by_id.get(road["to"])

            if from_node is None or to_node is None:
                continue

            x1, y1 = get_node_xy(from_node)
            x2, y2 = get_node_xy(to_node)
            xs = [x1, x2]
            ys = [y1, y2]

        ax.plot(
            xs,
            ys,
            color="#6f6f6f",
            linewidth=0.55,
            alpha=0.55,
            zorder=1,
        )

    node_xs: list[float] = []
    node_ys: list[float] = []

    for node in mapping["nodes"]:
        x, y = get_node_xy(node)
        node_xs.append(x)
        node_ys.append(y)

    ax.scatter(
        node_xs,
        node_ys,
        s=20,
        color="#2f80ed",
        edgecolors="white",
        linewidths=0.45,
        alpha=0.95,
        zorder=2,
    )


def draw_selected_point(
    ax: plt.Axes,
    node: dict[str, Any],
    label: str,
    color: str,
) -> list[Any]:
    x, y = get_node_xy(node)

    artists: list[Any] = []

    point = ax.scatter(
        [x],
        [y],
        s=170,
        color=color,
        edgecolors="black",
        linewidths=1.15,
        zorder=6,
    )
    artists.append(point)

    annotation = ax.annotate(
        f"{label}\n{node['id']}",
        (x, y),
        textcoords="offset points",
        xytext=(10, 10),
        fontsize=8.5,
        fontweight="bold",
        bbox={
            "boxstyle": "round,pad=0.35",
            "facecolor": "white",
            "edgecolor": color,
            "alpha": 0.96,
        },
        zorder=7,
    )
    artists.append(annotation)

    return artists


# ============================================================
# Selector class
# ============================================================

class ScenarioPointSelector:
    def __init__(self, mapping: dict[str, Any]) -> None:
        self.mapping = mapping
        self.mapping_nodes = mapping["nodes"]

        self.start_node: dict[str, Any] | None = None
        self.goal_node: dict[str, Any] | None = None
        self.confirmed = False

        self.selected_artists: list[Any] = []

        self.fig, self.ax = plt.subplots(figsize=(9.2, 6.8))
        self.fig.canvas.manager.set_window_title("Routly — Scenario point selector")

        center_window(self.fig, width=920, height=680)

        # Leave space below for buttons.
        self.fig.subplots_adjust(left=0.07, right=0.98, top=0.90, bottom=0.16)

        draw_base_graph(self.ax, self.mapping)
        setup_axes(
            self.ax,
            "Double-click START, then double-click GOAL",
        )

        self.status_text = self.fig.text(
            0.07,
            0.08,
            "Use toolbar zoom/pan. Double-click on a node area to select START, then GOAL.",
            fontsize=9,
            ha="left",
            va="center",
        )

        confirm_ax = self.fig.add_axes([0.70, 0.035, 0.12, 0.045])
        reset_ax = self.fig.add_axes([0.84, 0.035, 0.10, 0.045])

        self.confirm_button = Button(confirm_ax, "Confirm")
        self.reset_button = Button(reset_ax, "Reset")

        self.confirm_button.on_clicked(self.on_confirm_clicked)
        self.reset_button.on_clicked(self.on_reset_clicked)

        self.click_connection_id = self.fig.canvas.mpl_connect(
            "button_press_event",
            self.on_mouse_press,
        )

    def set_status(self, message: str) -> None:
        self.status_text.set_text(message)
        self.fig.canvas.draw_idle()

    def clear_selected_artists(self) -> None:
        for artist in self.selected_artists:
            try:
                artist.remove()
            except Exception:
                pass

        self.selected_artists.clear()
        self.fig.canvas.draw_idle()

    def redraw_selected_points(self) -> None:
        self.clear_selected_artists()

        if self.start_node is not None:
            self.selected_artists.extend(
                draw_selected_point(
                    self.ax,
                    self.start_node,
                    "START",
                    "#2ca02c",
                )
            )

        if self.goal_node is not None:
            self.selected_artists.extend(
                draw_selected_point(
                    self.ax,
                    self.goal_node,
                    "GOAL",
                    "#d62728",
                )
            )

        self.fig.canvas.draw_idle()

    def on_mouse_press(self, event: Any) -> None:
        if event.inaxes != self.ax:
            return

        if event.button != MouseButton.LEFT:
            return

        # Require double click to avoid accidental selection while zooming/panning.
        if not getattr(event, "dblclick", False):
            self.set_status("Single click ignored. Use double-click to select a node.")
            return

        if event.xdata is None or event.ydata is None:
            return

        node, distance = find_nearest_mapping_node(
            click_x=event.xdata,
            click_y=event.ydata,
            mapping_nodes=self.mapping_nodes,
        )

        if self.start_node is None:
            self.start_node = node
            self.set_status(
                f"START selected: {node['id']} "
                f"(click distance {distance:.2f} m). Now double-click GOAL."
            )

        elif self.goal_node is None:
            self.goal_node = node
            self.set_status(
                f"GOAL selected: {node['id']} "
                f"(click distance {distance:.2f} m). Press Confirm or Reset."
            )

        else:
            self.set_status(
                "Both START and GOAL are already selected. Press Confirm or Reset."
            )
            return

        self.redraw_selected_points()

    def on_reset_clicked(self, event: Any) -> None:
        self.start_node = None
        self.goal_node = None
        self.confirmed = False
        self.clear_selected_artists()
        self.ax.set_title(
            "Double-click START, then double-click GOAL",
            fontsize=12,
            fontweight="bold",
            pad=10,
        )
        self.set_status(
            "Selection reset. Double-click START, then double-click GOAL."
        )

    def on_confirm_clicked(self, event: Any) -> None:
        if self.start_node is None or self.goal_node is None:
            self.set_status("Cannot confirm: select both START and GOAL first.")
            return

        is_valid, message = validate_selected_pair(
            mapping=self.mapping,
            start_node=self.start_node,
            goal_node=self.goal_node,
        )

        if not is_valid:
            self.ax.set_title(
                "Invalid selection — press Reset and choose again",
                fontsize=12,
                fontweight="bold",
                pad=10,
            )
            self.set_status(message)
            return

        self.confirmed = True
        self.ax.set_title(
            "Valid selection confirmed — closing window",
            fontsize=12,
            fontweight="bold",
            pad=10,
        )
        self.set_status(message)

        self.fig.canvas.draw_idle()
        plt.pause(0.35)
        plt.close(self.fig)

    def run(self) -> tuple[dict[str, Any], dict[str, Any]]:
        plt.show()

        if not self.confirmed or self.start_node is None or self.goal_node is None:
            raise RuntimeError("Point selection was cancelled or not confirmed.")

        return self.start_node, self.goal_node


def select_start_goal_interactively(
    mapping: dict[str, Any],
) -> tuple[dict[str, Any], dict[str, Any]]:
    selector = ScenarioPointSelector(mapping)
    return selector.run()


# ============================================================
# Scenario YAML writing
# ============================================================

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

    print("\nScenario YAML saved on config/scenarios folder")
    print(f"  {output_path}")


# ============================================================
# Main
# ============================================================

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