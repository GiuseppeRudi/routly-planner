from __future__ import annotations

from pathlib import Path
import re
from typing import Any
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.widgets import Button, RadioButtons
from matplotlib.cm import ScalarMappable
from matplotlib.colors import Normalize
import osmnx as ox


def plot_graph(graph, output_path: str | Path, title: str = "Road Network") -> None:
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    _, ax = ox.plot_graph(
        graph,
        figsize=(12, 12),
        node_size=30,
        node_color="#e74c3c",
        edge_color="#2c3e50",
        edge_linewidth=1,
        bgcolor="#f8f9fa",
        show=False,
        close=False,
    )
    ax.set_title(title, fontsize=14)
    plt.savefig(output_path, dpi=150, bbox_inches="tight")
    plt.close()
    # print(f"Graph image saved: {output_path}")



def plot_plan_from_mapping(
    mapping: dict,
    planned_roads: list[str],
    output_path: str | Path,
    fuel_stations: list[str] | None = None
) -> None:


    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    fig, ax = plt.subplots(figsize=(12, 12))

    # Draw full road network
    for road in mapping["roads"]:
        geometry = road.get("geometry", [])

        if len(geometry) < 2:
            continue

        xs = [p[0] for p in geometry]
        ys = [p[1] for p in geometry]

        ax.plot(
            xs,
            ys,
            linewidth=0.6,
            color="black",
            alpha=0.5,
            zorder=1,
        )

    # Draw planned route
    for road_id in planned_roads:
        road = next(
            (r for r in mapping["roads"] if r["id"] == road_id),
            None,
        )

        if road is None:
            print(f"WARNING: planned road not found in mapping: {road_id}")
            continue

        geometry = road.get("geometry", [])

        if len(geometry) < 2:
            continue

        xs = [p[0] for p in geometry]
        ys = [p[1] for p in geometry]

        ax.plot(
            xs,
            ys,
            linewidth=2.5,
            color="red",
            zorder=2,
        )

    draw_fuel_stations(ax, mapping, fuel_stations or [])

    # START and GOAL labels
    if planned_roads:
        first_road = next(
            (r for r in mapping["roads"] if r["id"] == planned_roads[0]),
            None,
        )
        last_road = next(
            (r for r in mapping["roads"] if r["id"] == planned_roads[-1]),
            None,
        )

        if first_road and first_road.get("geometry"):
            x_start, y_start = first_road["geometry"][0]
            ax.scatter(x_start, y_start, s=30, color="green", zorder=3)
            ax.text(
                x_start,
                y_start,
                "START",
                fontsize=10,
                color="green",
                ha="center",
                va="bottom",
                zorder=4,
            )

        if last_road and last_road.get("geometry"):
            x_goal, y_goal = last_road["geometry"][-1]
            ax.scatter(x_goal, y_goal, s=30, color="darkred", zorder=3)
            ax.text(
                x_goal,
                y_goal,
                "GOAL",
                fontsize=10,
                color="darkred",
                ha="center",
                va="bottom",
                zorder=4,
            )

    ax.set_aspect("equal", adjustable="box")
    ax.axis("off")

    plt.savefig(output_path, dpi=150, bbox_inches="tight")
    plt.close(fig)

    # print(f"Plan image saved: {output_path}")


def _plot_roads(
    ax,
    roads_by_id: dict[str, dict],
    road_ids: list[str],
    color: str,
    linewidth: float,
    alpha: float,
    zorder: int,
    linestyle: str = "-",
) -> None:
    for road_id in road_ids:
        road = roads_by_id.get(road_id)
        if road is None:
            continue

        geometry = road.get("geometry", [])
        if len(geometry) < 2:
            continue

        xs = [point[0] for point in geometry]
        ys = [point[1] for point in geometry]
        ax.plot(
            xs,
            ys,
            color=color,
            linewidth=linewidth,
            alpha=alpha,
            zorder=zorder,
            linestyle=linestyle,
            solid_capstyle="round",
        )


def plot_event_map(
    mapping: dict,
    original_roads: list[str],
    recalculated_roads: list[str],
    blocked_roads: list[dict],
    blocked_locations: list[dict] | None,
    start_loc: str | None,
    goal_loc: str | None,
    output_path: str | Path,
    slowed_roads: list[dict] | None = None,
) -> None:
    """Write a PNG map comparing original and re-planned routes."""
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    roads_by_id = {road["id"]: road for road in mapping["roads"]}
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}
    blocked_ids = [entry["id"] for entry in blocked_roads]
    slowed_ids = [entry["id"] for entry in (slowed_roads or [])]
    blocked_location_ids = [
        entry["id"] for entry in (blocked_locations or [])
    ]

    fig, ax = plt.subplots(figsize=(14, 14))

    _plot_roads(
        ax,
        roads_by_id,
        [road["id"] for road in mapping["roads"]],
        color="#a8a8a8",
        linewidth=0.75,
        alpha=0.72,
        zorder=1,
    )

    # Same geometry, different widths: overlapping categories remain visible
    # without shifting roads away from their real position.
    _plot_roads(
        ax,
        roads_by_id,
        original_roads,
        color="#e64b35",
        linewidth=8.0,
        alpha=0.58,
        zorder=3,
    )

    _plot_roads(
        ax,
        roads_by_id,
        recalculated_roads,
        color="#00a75a",
        linewidth=5.0,
        alpha=0.82,
        zorder=4,
    )

    _plot_roads(
        ax,
        roads_by_id,
        blocked_ids,
        color="#1f5fd1",
        linewidth=11.0,
        alpha=0.28,
        zorder=6,
    )
    _plot_roads(
        ax,
        roads_by_id,
        blocked_ids,
        color="#0057ff",
        linewidth=3.6,
        alpha=0.96,
        zorder=8,
    )

    _plot_roads(
        ax,
        roads_by_id,
        slowed_ids,
        color="#FFD700",
        linewidth=4.2,
        alpha=0.96,
        zorder=7,
        linestyle="--",
    )

    for location_id in blocked_location_ids:
        node = nodes_by_id.get(location_id)
        if node is None:
            continue
        ax.scatter(
            node["x"],
            node["y"],
            marker="X",
            s=170,
            color="#0057ff",
            edgecolors="white",
            linewidths=1.6,
            zorder=11,
        )

    if start_loc and start_loc in nodes_by_id:
        node = nodes_by_id[start_loc]
        ax.scatter(node["x"], node["y"], s=120, color="purple", zorder=12)
        ax.text(
            node["x"],
            node["y"],
            "START",
            fontsize=11,
            color="purple",
            ha="center",
            va="bottom",
            zorder=13,
        )

    if goal_loc and goal_loc in nodes_by_id:
        node = nodes_by_id[goal_loc]
        ax.scatter(node["x"], node["y"], s=120, color="darkred", zorder=12)
        ax.text(
            node["x"],
            node["y"],
            "GOAL",
            fontsize=11,
            color="darkred",
            ha="center",
            va="bottom",
            zorder=13,
        )

    legend_handles = [
        Line2D([0], [0], color="#e64b35", linewidth=6, alpha=0.75, label="Original route"),
        Line2D([0], [0], color="#00a75a", linewidth=5, label="Replanned route"),
        Line2D([0], [0], color="#0057ff", linewidth=4, label="Blocked roads"),
        Line2D([0], [0], color="#FFD700", linewidth=4, linestyle="--", label="Slowdowns"),
        Line2D([0], [0], marker="X", color="w", markerfacecolor="#0057ff", markersize=10, label="Blocked intersections"),
        Line2D([0], [0], color="#a8a8a8", linewidth=2, label="Road network"),
    ]
    ax.legend(handles=legend_handles, loc="upper left")
    ax.set_title("Dynamic event map: original vs recalculated route")
    ax.set_aspect("equal", adjustable="box")
    ax.axis("off")

    fig.savefig(
        output_path,
        dpi=180,
        bbox_inches="tight",
        facecolor="white",
    )
    plt.close(fig)

def draw_fuel_stations(ax, mapping: dict, station_ids: list[str]) -> None:
    """Scatter a marker at every fuel-station node."""
    if not station_ids:
        return
    nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
    xs, ys = [], []
    for sid in station_ids:
        node = nodes_by_id.get(sid)
        if node is None:
            continue
        xs.append(node["x"])
        ys.append(node["y"])
    if not xs:
        return
    ax.scatter(
        xs, ys,
        marker="s", s=60, color="#1f9e3a",
        edgecolors="white", linewidths=1.4, zorder=10,
    )

    for x, y in zip(xs, ys):
        ax.annotate(
            "F", (x, y), ha="center", va="center",
            color="white", fontsize=4, fontweight="bold", zorder=11,
        )

class CongestionMapViewer:

    PRE_LABEL = "Pre LLM events"
    POST_LABEL = "Post LLM events"

    def __init__(self, mapping, pre_factors, post_factors,
                 start_loc=None, goal_loc=None, place_name=""):
        self.mapping = mapping
        self.nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
        self.roads = list(mapping["roads"])
        self.pre = pre_factors or {}
        self.post = post_factors or {}
        self.start_loc = start_loc
        self.goal_loc = goal_loc
        self.place_name = place_name
        self.current = "pre" # "pre" | "post"
        self.pinned_road = None

        # Color normalization for consistent comparison between pre and post.
        all_vals = list(self.pre.values()) + list(self.post.values())
        vmin = min(all_vals) if all_vals else 1.0
        vmax = max(all_vals) if all_vals else 2.0
        if vmax <= vmin:
            vmax = vmin + 1e-6
        self.norm = Normalize(vmin=vmin, vmax=vmax)
        self.cmap = plt.get_cmap("RdYlGn_r")   # green=free, red=congested

        matplotlib.rcParams["toolbar"] = "None"
        self.fig, self.ax = plt.subplots(figsize=(13, 11))
        try:
            self.fig.canvas.manager.set_window_title(
                "Routly — Congestion Map (pre/post)")
        except Exception:
            pass
        self.fig.subplots_adjust(left=0.03, right=0.99, top=0.92, bottom=0.06)

        self.road_lines: dict[str, Any] = {}
        self._build_map()
        self._add_colorbar()
        self._add_switch()
        self._add_annotation()
        self._connect_events()
        self._refresh_colors()

    # ---- build map ----
    @staticmethod
    def _xy(node):
        return float(node["x"]), float(node["y"])

    def _road_xy(self, road):
        geometry = road.get("geometry")
        if geometry and len(geometry) >= 2:
            return [p[0] for p in geometry], [p[1] for p in geometry]
        fn = self.nodes_by_id.get(road["from"])
        tn = self.nodes_by_id.get(road["to"])
        if fn is None or tn is None:
            return None, None
        x1, y1 = self._xy(fn)
        x2, y2 = self._xy(tn)
        return [x1, x2], [y1, y2]

    def _build_map(self):
        for road in self.roads:
            xs, ys = self._road_xy(road)
            if xs is None:
                continue
            (line,) = self.ax.plot(
                xs, ys, linewidth=2.2, alpha=0.9, zorder=2,
                solid_capstyle="round", picker=5,   # picker -> click
            )
            self.road_lines[road["id"]] = line

        node_xs = [self._xy(n)[0] for n in self.mapping["nodes"]]
        node_ys = [self._xy(n)[1] for n in self.mapping["nodes"]]
        self.ax.scatter(node_xs, node_ys, s=8, color="#333333",
                        zorder=3, alpha=0.6)

        for loc, label, color in ((self.start_loc, "START", "purple"),
                                  (self.goal_loc, "GOAL", "darkred")):
            if loc and loc in self.nodes_by_id:
                x, y = self._xy(self.nodes_by_id[loc])
                self.ax.scatter([x], [y], s=130, color=color,
                                edgecolors="white", linewidths=1.4, zorder=5)
                self.ax.annotate(label, (x, y), textcoords="offset points",
                                 xytext=(6, 6), fontsize=9, fontweight="bold",
                                 color=color, zorder=6)
        self.ax.set_aspect("equal", adjustable="datalim")
        self.ax.axis("off")

    def _add_colorbar(self):
        sm = ScalarMappable(norm=self.norm, cmap=self.cmap)
        sm.set_array([])
        cbar = self.fig.colorbar(sm, ax=self.ax, fraction=0.035, pad=0.02)
        cbar.set_label("congestion-factor (1.0 = free, high = congestion)")

    def _add_switch(self):
        switch_ax = self.fig.add_axes([0.015, 0.85, 0.17, 0.10])
        switch_ax.set_title("Map", fontsize=9)
        self.radio = RadioButtons(switch_ax, (self.PRE_LABEL, self.POST_LABEL),
                                  active=0)
        self.radio.on_clicked(self._on_switch)

    def _add_annotation(self):
        self.hover_annot = self.ax.annotate(
            "", xy=(0, 0), xytext=(14, 14), textcoords="offset points",
            bbox={"boxstyle": "round,pad=0.4", "facecolor": "white",
                  "edgecolor": "#555", "alpha": 0.96},
            fontsize=8.5, zorder=20)
        self.hover_annot.set_visible(False)
        self.info_text = self.fig.text(
            0.015, 0.015,
            "Hover or click on a road to see the pre/post values",
            fontsize=9, va="bottom")

    def _connect_events(self):
        self.fig.canvas.mpl_connect("motion_notify_event", self._on_motion)
        self.fig.canvas.mpl_connect("pick_event", self._on_pick)

    # ---- status/color ----
    def _factor_for(self, road_id):
        data = self.pre if self.current == "pre" else self.post
        return data.get(road_id, 1.0)

    def _refresh_colors(self):
        for road_id, line in self.road_lines.items():
            line.set_color(self.cmap(self.norm(self._factor_for(road_id))))
            line.set_linewidth(5.0 if road_id == self.pinned_road else 2.2)
        label = self.PRE_LABEL if self.current == "pre" else self.POST_LABEL
        suffix = f"  ·  {self.place_name}" if self.place_name else ""
        self.ax.set_title(f"Congestion Factor — {label}{suffix}",
                          fontsize=13, fontweight="bold")
        self.fig.canvas.draw_idle()

    def _on_switch(self, label):
        self.current = "pre" if label == self.PRE_LABEL else "post"
        self._refresh_colors()

    # ---- interaction ----
    def _find_road(self, event):
        for road_id, line in self.road_lines.items():
            contains, _ = line.contains(event)
            if contains:
                return road_id
        return None

    def _describe(self, road_id):
        pre = self.pre.get(road_id)
        post = self.post.get(road_id)
        pre_s = f"{pre:.4g}" if pre is not None else "n/d"
        post_s = f"{post:.4g}" if post is not None else "n/d"
        delta = ""
        if pre is not None and post is not None:
            d = post - pre
            trend = "up" if d > 1e-9 else ("down" if d < -1e-9 else "flat")
            delta = f"   delta {d:+.4g} ({trend})"
        return f"{road_id}\npre: {pre_s}    post: {post_s}{delta}"

    def _on_motion(self, event):
        if event.inaxes != self.ax:
            if self.hover_annot.get_visible():
                self.hover_annot.set_visible(False)
                self.fig.canvas.draw_idle()
            return
        road_id = self._find_road(event)
        if road_id is None:
            if self.hover_annot.get_visible():
                self.hover_annot.set_visible(False)
                self.fig.canvas.draw_idle()
            return
        self.hover_annot.xy = (event.xdata, event.ydata)
        self.hover_annot.set_text(self._describe(road_id))
        self.hover_annot.set_visible(True)
        self.fig.canvas.draw_idle()

    def _on_pick(self, event):
        road_id = next((rid for rid, ln in self.road_lines.items()
                        if ln is event.artist), None)
        if road_id is None:
            return
        self.pinned_road = road_id
        self.info_text.set_text(
            "Road selected → "
            + self._describe(road_id).replace("\n", "   |   "))
        self._refresh_colors()

    def show(self):
        plt.show()

_CONGESTION_RE = re.compile(
    r"\(=\s*\(congestion-factor\s+(\S+?)\)\s*([0-9]*\.?[0-9]+)\)"
)

def parse_congestion_factors(pddl_path: str | Path) -> dict[str, float]:
    """Extracts {road_id: congestion_factor} from the fluent values in a PDDL problem."""
    path = Path(pddl_path)
    if not path.exists():
        return {}
    text = path.read_text(encoding="utf-8")
    factors: dict[str, float] = {}
    for road_id, value in _CONGESTION_RE.findall(text):
        try:
            factors[road_id] = float(value)
        except ValueError:
            continue
    return factors

def open_congestion_map(mapping, pre_problem_path, post_problem_path,
                        start_loc=None, goal_loc=None, place_name=""):

    pre = parse_congestion_factors(pre_problem_path)
    post = parse_congestion_factors(post_problem_path)
    if not pre and not post:
        print("WARNING: no fluent congestion-factor found "
              "(congestion.mode='pddl' needed); congestion map skipped.")
        return None
    viewer = CongestionMapViewer(mapping, pre, post, start_loc, goal_loc,
                                 place_name)
    viewer.show()
    return viewer