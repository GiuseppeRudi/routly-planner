from __future__ import annotations

from pathlib import Path
import argparse
import json
import math
import sys
from typing import Any

import matplotlib
import matplotlib.pyplot as plt
from matplotlib.backend_bases import MouseButton
from matplotlib.widgets import Button
import networkx as nx
import osmnx as ox
import yaml


PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.config import load_config
from src.routly.features import FeatureConfig
from src.routly.domain.fuel import compute_fuel_reachability, derive_fuel_parameters
from src.routly.controller.graph_utils import (
    build_weighted_road_graph,
    single_source_distances,
)
from src.routly.graph.graph_export import draw_fuel_stations


# CLI

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Select start and goal points interactively using Matplotlib."
    )
    parser.add_argument("--project-config",  required=True)
    return parser.parse_args()


# Loading utilities

def load_mapping(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Mapping file not found: {path}")
    return json.loads(path.read_text(encoding="utf-8"))


def load_graph(path: Path) -> nx.MultiDiGraph:
    if not path.exists():
        raise FileNotFoundError(f"GraphML file not found: {path}")
    return ox.load_graphml(path)


# Mapping utilities

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


# Reachability validation

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
    fuel_params=None,
    graph=None,
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

    base_msg = (
        f"Valid pair. START={start_loc}, GOAL={goal_loc}, "
        f"reachable locations={len(reachable)}."
    )

    # Validate fuel reachability after topological reachability succeeds.
    if fuel_params is not None:
        if graph is None:
            graph = build_weighted_road_graph(mapping)
        fuel_check = compute_fuel_reachability(
            start_loc,
            goal_loc,
            fuel_params,
            distances_from=lambda loc: single_source_distances(graph, loc),
        )
        if not fuel_check.reachable:
            return False, f"Fuel check failed: {fuel_check.message}"
        suffix = (
            " Refuelling required (a fuel station is on the way)."
            if fuel_check.needs_refuel
            else " Enough fuel to reach the goal without refuelling."
        )
        return True, base_msg + suffix

    return True, base_msg


# Window constants and centering

WIN_W, WIN_H = 1400, 760
DPI          = 100


def center_window(fig: plt.Figure, width: int, height: int) -> None:
    """Move the window to screen center. Does NOT resize."""
    manager = plt.get_current_fig_manager()
    try:
        window = manager.window

        # Center TkAgg windows with screen dimensions.
        if hasattr(window, "winfo_screenwidth"):
            window.update_idletasks()
            sw = window.winfo_screenwidth()
            sh = window.winfo_screenheight()
            x  = (sw - width)  // 2
            y  = (sh - height) // 2
            window.geometry(f"{width}x{height}+{x}+{y}")
            return

        # Center QtAgg windows with the available screen geometry.
        if hasattr(window, "screen") and hasattr(window, "move"):
            geo = window.screen().availableGeometry()
            x = geo.x() + (geo.width()  - width)  // 2
            y = geo.y() + (geo.height() - height) // 2
            window.resize(width, height)
            window.move(x, y)
            return

    except Exception:
        pass


def schedule_initial_draw(fig: plt.Figure) -> None:
    """
    Schedule a redraw after the GUI event loop starts.

    TkAgg may hand control to the Tk event loop before the canvas is fully
    painted, which can hide controls until the first resize.
    """
    manager = plt.get_current_fig_manager()
    try:
        # Schedule the redraw through TkAgg's event loop.
        manager.window.after(80, lambda: (
            fig.canvas.draw(),
            fig.canvas.flush_events(),
        ))
        return
    except AttributeError:
        pass

    try:
        # Schedule the redraw through a single-shot QtAgg timer.
        from PyQt5.QtCore import QTimer
        QTimer.singleShot(80, lambda: (
            fig.canvas.draw(),
            fig.canvas.flush_events(),
        ))
    except Exception:
        pass


# Drawing helpers

def draw_base_graph(ax: plt.Axes, mapping: dict[str, Any]) -> None:
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}

    for road in mapping["roads"]:
        geometry = road.get("geometry")
        if geometry:
            xs = [p[0] for p in geometry]
            ys = [p[1] for p in geometry]
        else:
            fn = nodes_by_id.get(road["from"])
            tn = nodes_by_id.get(road["to"])
            if fn is None or tn is None:
                continue
            x1, y1 = get_node_xy(fn)
            x2, y2 = get_node_xy(tn)
            xs, ys = [x1, x2], [y1, y2]
        ax.plot(xs, ys, color="#6f6f6f", linewidth=0.55, alpha=0.55, zorder=1)

    node_xs = [get_node_xy(n)[0] for n in mapping["nodes"]]
    node_ys = [get_node_xy(n)[1] for n in mapping["nodes"]]
    ax.scatter(
        node_xs, node_ys,
        s=20, color="#2f80ed",
        edgecolors="white", linewidths=0.45,
        alpha=0.95, zorder=2,
    )


def draw_selected_point(
    ax: plt.Axes,
    node: dict[str, Any],
    label: str,
    color: str,
) -> list[Any]:
    x, y = get_node_xy(node)
    artists: list[Any] = []
    artists.append(ax.scatter(
        [x], [y], s=170, color=color,
        edgecolors="black", linewidths=1.15, zorder=6,
    ))
    artists.append(ax.annotate(
        f"{label}\n{node['id']}",
        (x, y),
        textcoords="offset points", xytext=(10, 10),
        fontsize=8.5, fontweight="bold",
        bbox={"boxstyle": "round,pad=0.35", "facecolor": "white",
              "edgecolor": color, "alpha": 0.96},
        zorder=7,
    ))
    return artists


# Selector class

class ScenarioPointSelector:

    def __init__(
        self,
        mapping: dict[str, Any],
        place_name: str = "",
        fuel_params=None,
        fuel_graph=None,
    ) -> None:
        self.mapping = mapping
        self.mapping_nodes = mapping["nodes"]
        self.place_name = place_name
        self.fuel_params = fuel_params
        self.fuel_graph = fuel_graph

        self.start_node: dict[str, Any] | None = None
        self.goal_node:  dict[str, Any] | None = None
        self.confirmed = False
        self.selected_artists: list[Any] = []

        # Disable the default toolbar so custom zoom and pan handlers take over.
        matplotlib.rcParams["toolbar"] = "None"

        self.fig, self.ax = plt.subplots(
            figsize=(WIN_W / DPI, WIN_H / DPI),
            dpi=DPI,
        )
        self.fig.canvas.manager.set_window_title("Routly - Scenario point selector")

        # Reserve vertical space for controls, status, title, and place name.
        self.fig.subplots_adjust(left=0.04, right=0.98, top=0.88, bottom=0.14)

        draw_base_graph(self.ax, self.mapping)

        # Use the generated station set because random stations are not node flags.
        if self.fuel_params is not None and getattr(self.fuel_params, "stations", None):
            draw_fuel_stations(
                self.ax, self.mapping,
                station_ids=self.fuel_params.stations,
                zorder=5,
            )

        # Equal aspect so the map is never stretched regardless of window shape.
        # 'datalim' adjusts the visible data range rather than the axes box,
        # which avoids white space and visual bugs on resize.
        self.ax.set_aspect("equal", adjustable="datalim")
        self.ax.set_axis_off()

        self.fig.text(
            0.5, 0.935,
            "Double-click START, then double-click GOAL  |  "
            "Scroll to zoom  |  Drag to pan  |  Right-click to remove",
            ha="center", va="top",
            fontsize=10, fontweight="bold",
        )

        if place_name:
            self.fig.text(
                0.5, 0.908,
                place_name,
                ha="center", va="top",
                fontsize=9, style="italic", color="#555555",
            )

        self.status_text = self.fig.text(
            0.04, 0.09,
            "Double-click a node to select START, then GOAL.",
            fontsize=8.5, ha="left", va="center", color="#333333",
        )

        confirm_ax = self.fig.add_axes([0.60, 0.025, 0.11, 0.050])
        reset_ax   = self.fig.add_axes([0.73, 0.025, 0.11, 0.050])
        exit_ax    = self.fig.add_axes([0.86, 0.025, 0.10, 0.050])

        self.confirm_button = Button(confirm_ax, "Confirm", color="#d4edda", hovercolor="#a8d5b5")
        self.reset_button   = Button(reset_ax,   "Reset",   color="#fff3cd", hovercolor="#ffe08a")
        self.exit_button    = Button(exit_ax,    "Exit",    color="#f8d7da", hovercolor="#f5a5ab")

        self.confirm_button.on_clicked(self.on_confirm_clicked)
        self.reset_button.on_clicked(self.on_reset_clicked)
        self.exit_button.on_clicked(self.on_exit_clicked)

        self._pan_active:     bool                    = False
        self._pan_start_data: tuple[float, float] | None = None
        self._pan_xlim:       tuple[float, float] | None = None
        self._pan_ylim:       tuple[float, float] | None = None
        # Track movement so drag releases are not treated as selections.
        self._pan_did_move:   bool = False

        canvas = self.fig.canvas
        canvas.mpl_connect("button_press_event",   self.on_mouse_press)
        canvas.mpl_connect("motion_notify_event",  self.on_mouse_motion)
        canvas.mpl_connect("button_release_event", self.on_mouse_release)
        canvas.mpl_connect("scroll_event",         self.on_scroll)
        # Equal aspect preserves map proportions without a resize handler.

        self.fig.canvas.draw()
        center_window(self.fig, WIN_W, WIN_H)

    # Helpers

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
                draw_selected_point(self.ax, self.start_node, "START", "#2ca02c")
            )

        if self.goal_node is not None:
            self.selected_artists.extend(
                draw_selected_point(self.ax, self.goal_node, "GOAL", "#d62728")
            )

        # Show straight-line distance once both endpoints are available.
        if self.start_node is not None and self.goal_node is not None:
            x1, y1 = get_node_xy(self.start_node)
            x2, y2 = get_node_xy(self.goal_node)
            dist_m = math.hypot(x2 - x1, y2 - y1)

            self.selected_artists.append(
                self.ax.plot(
                    [x1, x2], [y1, y2],
                    color="#999999", linewidth=1.0,
                    linestyle="--", zorder=3,
                )[0]
            )

            mid_x, mid_y = (x1 + x2) / 2, (y1 + y2) / 2
            self.selected_artists.append(
                self.ax.annotate(
                    f"~{dist_m / 1000:.2f} km (straight-line distance)",
                    (mid_x, mid_y),
                    textcoords="offset points", xytext=(6, 6),
                    fontsize=8, color="#555555",
                    bbox={"boxstyle": "round,pad=0.25", "facecolor": "white",
                          "edgecolor": "#cccccc", "alpha": 0.85},
                    zorder=8,
                )
            )

            self.set_status(
                f"START={self.start_node['id']}   GOAL={self.goal_node['id']}   "
                f"Straight-line distance: {dist_m:.0f} m ({dist_m / 1000:.2f} km).   "
                f"Press Confirm or Reset."
            )

        self.fig.canvas.draw_idle()

    # Cursor-centered zoom

    def on_scroll(self, event: Any) -> None:
        if event.inaxes != self.ax:
            return
        if event.xdata is None or event.ydata is None:
            return

        # Shrink limits when scrolling up and expand them when scrolling down.
        factor = 0.85 if event.step > 0 else 1.0 / 0.85

        cx, cy   = event.xdata, event.ydata
        xl, xr   = self.ax.get_xlim()
        yb, yt   = self.ax.get_ylim()

        self.ax.set_xlim(cx + (xl - cx) * factor, cx + (xr - cx) * factor)
        self.ax.set_ylim(cy + (yb - cy) * factor, cy + (yt - cy) * factor)
        self.fig.canvas.draw_idle()

    # Drag pan

    def on_mouse_motion(self, event: Any) -> None:
        if not self._pan_active:
            return
        if event.inaxes != self.ax:
            return
        if event.xdata is None or event.ydata is None:
            return

        self._pan_did_move = True

        dx = self._pan_start_data[0] - event.xdata
        dy = self._pan_start_data[1] - event.ydata

        self.ax.set_xlim(self._pan_xlim[0] + dx, self._pan_xlim[1] + dx)
        self.ax.set_ylim(self._pan_ylim[0] + dy, self._pan_ylim[1] + dy)
        self.fig.canvas.draw_idle()

    def on_mouse_release(self, event: Any) -> None:
        self._pan_active = False

    # Mouse input dispatch

    def on_mouse_press(self, event: Any) -> None:
        if event.inaxes != self.ax:
            return
        if event.xdata is None or event.ydata is None:
            return

        # Right-click removes the nearest selected endpoint.
        if event.button == MouseButton.RIGHT:
            self._handle_right_click(event.xdata, event.ydata)
            return

        if event.button != MouseButton.LEFT:
            return

        is_double = getattr(event, "dblclick", False)

        if is_double:
            # Double-click selects the nearest node and cancels any pending pan.
            self._pan_active  = False
            self._pan_did_move = False
            self._do_select(event.xdata, event.ydata)

        else:
            # Single-click starts a pan operation.
            self._pan_active      = True
            self._pan_did_move    = False
            self._pan_start_data  = (event.xdata, event.ydata)
            self._pan_xlim        = self.ax.get_xlim()
            self._pan_ylim        = self.ax.get_ylim()

    def _do_select(self, x: float, y: float) -> None:
        node, distance = find_nearest_mapping_node(x, y, self.mapping_nodes)

        if self.start_node is None:
            self.start_node = node
            self.set_status(
                f"START selected: {node['id']}  "
                f"(nearest node {distance:.0f} m from click).  "
                f"Now double-click GOAL."
            )
            self.redraw_selected_points()

        elif self.goal_node is None:
            self.goal_node = node
            self.redraw_selected_points()

        else:
            self.set_status(
                "Both START and GOAL already selected. Press Confirm or Reset."
            )

    def _handle_right_click(self, click_x: float, click_y: float) -> None:
        has_start = self.start_node is not None
        has_goal  = self.goal_node  is not None

        if not has_start and not has_goal:
            self.set_status("No node to remove.")
            return

        if has_start and not has_goal:
            self.start_node = None
            self.set_status("START removed. Double-click to select a new START.")
            self.redraw_selected_points()
            return

        if has_goal and not has_start:
            self.goal_node = None
            self.set_status("GOAL removed. Double-click to select a new GOAL.")
            self.redraw_selected_points()
            return

        # Remove whichever endpoint is closest to the click.
        sx, sy = get_node_xy(self.start_node)
        gx, gy = get_node_xy(self.goal_node)

        if math.hypot(sx - click_x, sy - click_y) <= math.hypot(gx - click_x, gy - click_y):
            self.start_node = None
            self.set_status("START removed. Double-click to select a new START.")
        else:
            self.goal_node = None
            self.set_status("GOAL removed. Double-click to select a new GOAL.")

        self.redraw_selected_points()

    # Button handlers

    def on_reset_clicked(self, event: Any) -> None:
        self.start_node = None
        self.goal_node  = None
        self.confirmed  = False
        self.clear_selected_artists()
        self.set_status("Selection reset. Double-click START, then double-click GOAL.")

    def on_confirm_clicked(self, event: Any) -> None:
        if self.start_node is None or self.goal_node is None:
            self.set_status("Cannot confirm: select both START and GOAL first.")
            return

        is_valid, message = validate_selected_pair(
            self.mapping,
            self.start_node,
            self.goal_node,
            fuel_params=self.fuel_params,
            graph=self.fuel_graph,
        )

        if not is_valid:
            self.set_status(f"{message}  Press Reset and choose again.")
            return

        self.confirmed = True
        self.set_status(f"Confirmed! {message} Closing...")
        self.fig.canvas.draw_idle()
        plt.pause(0.35)
        plt.close(self.fig)

    def on_exit_clicked(self, event: Any) -> None:
        self.confirmed = False
        plt.close(self.fig)

    # Run

    def run(self) -> tuple[dict[str, Any], dict[str, Any]]:
        # Delay the first redraw until the GUI backend has painted the canvas.
        schedule_initial_draw(self.fig)

        plt.show()

        if not self.confirmed or self.start_node is None or self.goal_node is None:
            raise RuntimeError("Point selection was cancelled or not confirmed.")

        return self.start_node, self.goal_node


def select_start_goal_interactively(
    mapping: dict[str, Any],
    place_name: str = "",
    fuel_params=None,
    fuel_graph=None,
) -> tuple[dict[str, Any], dict[str, Any]]:
    selector = ScenarioPointSelector(
        mapping,
        place_name=place_name,
        fuel_params=fuel_params,
        fuel_graph=fuel_graph,
    )
    return selector.run()


# Scenario YAML writing

def enrich_selected_node(
    mapping_node: dict[str, Any],
    graph: nx.MultiDiGraph,
) -> dict[str, Any]:
    location_id = mapping_node["id"]
    x, y = get_node_xy(mapping_node)
    osm_node_id = get_node_osm_id(mapping_node)

    result: dict[str, Any] = {
        "type":  "location_id",
        "value": location_id,
        "x":     round(x, 3),
        "y":     round(y, 3),
    }

    if osm_node_id is not None:
        result["osm_node_id"] = osm_node_id
        if osm_node_id in graph.nodes:
            gn = graph.nodes[osm_node_id]
            if "y" in gn and "x" in gn:
                result["lat"] = float(gn["y"])
                result["lon"] = float(gn["x"])

    return result


def build_scenario_yaml(
    graph: nx.MultiDiGraph,
    config: Any,
    scenario_output_path: Path,
    start_node: dict[str, Any],
    goal_node: dict[str, Any],
) -> dict[str, Any]:
    return {
        "scenario": {"name": scenario_output_path.stem},
        "map": {
            "place_name":   config.place_name,
            "place_slug":   config.place_slug,
            "map_scenario": config.scenario_slug,
            "graphml_path": str(config.raw_graphml_path),
            "mapping_path": str(config.mapping_path),
        },
        "vehicles": [
            {
                "id":    "car1",
                "start": enrich_selected_node(start_node, graph),
                "goal":  enrich_selected_node(goal_node, graph),
            }
        ],
    }


def write_scenario_yaml(scenario: dict[str, Any], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(
        yaml.safe_dump(scenario, sort_keys=False, allow_unicode=True),
        encoding="utf-8",
    )
    print("\nScenario YAML saved:")
    print(f"  {output_path}")


# Main

def main() -> None:
    args = parse_args()
    config = load_config(args.project_config)
    scenario_output_path = config.scenario_path

    print("Loading map files:")
    print(f"  GraphML: {config.raw_graphml_path}")
    print(f"  Mapping: {config.mapping_path}")

    graph = load_graph(config.raw_graphml_path)
    mapping = load_mapping(config.mapping_path)

    if "nodes" not in mapping or "roads" not in mapping:
        raise KeyError("roads_mapping.json must contain 'nodes' and 'roads'.")

    # Derive fuel constraints before validating selectable endpoints.
    fuel_params = None
    fuel_graph = None
    features = FeatureConfig.from_yaml(args.project_config)
    if features.fuel.enabled:
        fuel_params = derive_fuel_parameters(
            nodes=mapping["nodes"],
            config=features.fuel,
            seed=config.seed,
        )
        fuel_graph = build_weighted_road_graph(mapping)
        print(
            f"  Fuel-aware selection: tank={fuel_params.tank_capacity:.1f} L, "
            f"initial={fuel_params.initial_fuel:.1f} L, "
            f"{len(fuel_params.stations)} station(s)."
        )

    start_node, goal_node = select_start_goal_interactively(
        mapping,
        place_name=config.place_name,
        fuel_params=fuel_params,
        fuel_graph=fuel_graph,
    )

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
