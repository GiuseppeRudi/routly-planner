from __future__ import annotations

from pathlib import Path
import re
from typing import Any
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.widgets import Button, RadioButtons, TextBox
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
    """Interactive congestion-factor map: Pre/Post switch, color by intensity,
    click with per-road pre/post values, blocked-road highlighting, a road
    search box, and a clickable list of blocked/slowdown roads."""

    PRE_LABEL = "Pre LLM events"
    POST_LABEL = "Post LLM events"

    def __init__(self, mapping, pre_factors, post_factors,
                 start_loc=None, goal_loc=None, place_name="",
                 blocked_roads=None, slowdown_roads=None):
        self.mapping = mapping
        self.nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
        self.roads = list(mapping["roads"])
        self.pre = pre_factors or {}
        self.post = post_factors or {}
        self.blocked = set(blocked_roads or ())      # blocked roads (post view)
        self.slowdowns = set(slowdown_roads or ())   # slowed roads (post view)
        self.start_loc = start_loc
        self.goal_loc = goal_loc
        self.place_name = place_name
        self.current = "pre"            # "pre" | "post"
        self.pinned_road = None

        # Shared color normalization across pre and post -> consistent compare.
        all_vals = list(self.pre.values()) + list(self.post.values())
        vmin = min(all_vals) if all_vals else 1.0
        vmax = max(all_vals) if all_vals else 2.0
        if vmax <= vmin:
            vmax = vmin + 1e-6
        self.norm = Normalize(vmin=vmin, vmax=vmax)
        self.cmap = plt.get_cmap("RdYlGn_r")   # green=free, red=congested

        matplotlib.rcParams["toolbar"] = "None"
        self.fig, self.ax = plt.subplots(figsize=(12, 7))
        try:
            self.fig.canvas.manager.set_window_title(
                "Routly - Congestion map (pre/post)")
        except Exception:
            pass
        self.fig.subplots_adjust(left=0.02, right=0.86, top=0.93, bottom=0.05)

        self.road_lines: dict[str, Any] = {}
        self._build_map()
        self._add_colorbar()
        self._add_legend()
        self._add_switch()
        self._add_search()
        self._add_road_list()
        self._add_annotation()
        self._connect_events()
        self._refresh_colors()

    # ---- map building ----
    @staticmethod
    def _xy(node):
        """Projected coordinates of a mapping node."""
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
                xs, ys, linewidth=1.54, alpha=0.9, zorder=2,
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
        cbar = self.fig.colorbar(sm, ax=self.ax, fraction=0.04, pad=0.04)
        cbar.set_label("congestion-factor (1.0 = free, higher = congested)")

    def _add_legend(self):
        handles = [Line2D([0], [0], color="#9e9e9e", lw=3,
                          label="Blocked road")]
        self.ax.legend(handles=handles, loc="lower right", fontsize=8,
                       framealpha=0.9)

    def _add_switch(self):
        switch_ax = self.fig.add_axes([0.015, 0.76, 0.15, 0.09])
        switch_ax.set_title("Map", fontsize=8)
        self.radio = RadioButtons(switch_ax, (self.PRE_LABEL, self.POST_LABEL),
                                  active=0)
        self.radio.on_clicked(self._on_switch)

    def _add_search(self):
        search_ax = self.fig.add_axes([0.015, 0.66, 0.15, 0.045])
        search_ax.set_title("Search road (number)", fontsize=8)
        self.search_box = TextBox(search_ax, "", textalignment="center")
        self.search_box.on_submit(self._on_search)
        # Red warning shown right below the search field when not found.
        self.search_msg = self.fig.text(
            0.015, 0.64, "", color="red", fontsize=8, va="top")

    def _add_road_list(self):
        """Clickable list of blocked/slowdown roads under the search field.
        Clicking a row drops that road number into the search box and selects
        it; the Up/Down buttons or the mouse wheel page through long lists."""
        def _num(rid):
            m = re.search(r"(\d+)$", rid)
            return int(m.group(1)) if m else 0

        # Blocked roads first (tag "B"), then slowdown roads (tag "S").
        self.list_items = (
            [(r, "B") for r in sorted(self.blocked, key=_num)]
            + [(r, "S") for r in sorted(self.slowdowns, key=_num)]
        )
        self.list_offset = 0
        self.VISIBLE_ROWS = 13

        self.list_header = self.fig.text(
            0.015, 0.61, "", fontsize=8, fontweight="bold", va="top")

        # Up / Down paging buttons.
        up_ax = self.fig.add_axes([0.015, 0.565, 0.072, 0.03])
        down_ax = self.fig.add_axes([0.093, 0.565, 0.072, 0.03])
        self.btn_up = Button(up_ax, "Up", color="#eee", hovercolor="#ddd")
        self.btn_down = Button(down_ax, "Down", color="#eee", hovercolor="#ddd")
        self.btn_up.label.set_fontsize(8)
        self.btn_down.label.set_fontsize(8)
        self.btn_up.on_clicked(lambda _e: self._scroll_list(-1))
        self.btn_down.on_clicked(lambda _e: self._scroll_list(1))

        # One button per visible row; labels are refreshed on scroll/paging.
        self.row_buttons = []
        top, step = 0.525, 0.036
        for i in range(self.VISIBLE_ROWS):
            row_ax = self.fig.add_axes([0.015, top - i * step, 0.15, 0.03])
            btn = Button(row_ax, "", color="#f5f5f5", hovercolor="#e0e0e0")
            btn.label.set_fontsize(8)
            btn.on_clicked(self._make_row_handler(i))
            self.row_buttons.append(btn)

        self.fig.canvas.mpl_connect("scroll_event", self._on_scroll)
        # The list is only shown on the Post view (the map starts on Pre).
        self._set_list_visible(self.current == "post")

    def _make_row_handler(self, row_index):
        # Bind the visible row position; the road it maps to depends on offset.
        def handler(_event):
            idx = self.list_offset + row_index
            if 0 <= idx < len(self.list_items):
                self._select_road(self.list_items[idx][0])
        return handler

    def _refresh_list(self):
        total = len(self.list_items)
        for i, btn in enumerate(self.row_buttons):
            idx = self.list_offset + i
            if idx < total:
                rid, kind = self.list_items[idx]
                btn.label.set_text(f"{rid}  [{kind}]")
                btn.ax.set_visible(True)
            else:
                btn.label.set_text("")
                btn.ax.set_visible(False)
        if total:
            lo = self.list_offset + 1
            hi = min(self.list_offset + self.VISIBLE_ROWS, total)
            self.list_header.set_text(
                f"Blocked [B] / slowdown [S]  ({lo}-{hi} of {total})")
        else:
            self.list_header.set_text("No blocked / slowdown roads")
        self.fig.canvas.draw_idle()

    def _scroll_list(self, delta):
        max_offset = max(0, len(self.list_items) - self.VISIBLE_ROWS)
        self.list_offset = min(max(0, self.list_offset + delta), max_offset)
        self._refresh_list()

    def _on_scroll(self, event):
        # React to the wheel only when it is over the left panel.
        xf = event.x / self.fig.bbox.width if event.x is not None else 1.0
        if xf > 0.18:
            return
        self._scroll_list(-1 if event.button == "up" else 1)

    def _set_list_visible(self, visible):
        # The blocked/slowdown list only makes sense for the Post view, so it
        # is hidden (and its buttons deactivated) while looking at Pre.
        self.list_header.set_visible(visible)
        for w in (self.btn_up, self.btn_down):
            w.ax.set_visible(visible)
            w.set_active(visible)
        for btn in self.row_buttons:
            btn.set_active(visible)
        if visible:
            self._refresh_list()
        else:
            for btn in self.row_buttons:
                btn.ax.set_visible(False)
        self.fig.canvas.draw_idle()

    def _add_annotation(self):
        # Pop-up box shown on click, with a leader line to the clicked road.
        self.click_annot = self.ax.annotate(
            "", xy=(0, 0), xytext=(30, 30), textcoords="offset points",
            bbox={"boxstyle": "round,pad=0.4", "facecolor": "white",
                  "edgecolor": "#555", "alpha": 0.96},
            arrowprops={"arrowstyle": "-", "color": "#555", "lw": 1.2,
                        "shrinkA": 0, "shrinkB": 0},
            fontsize=8.5, zorder=20)
        self.click_annot.set_visible(False)

    def _connect_events(self):
        self.fig.canvas.mpl_connect("pick_event", self._on_pick)

    # ---- state/color ----
    def _factor_for(self, road_id):
        data = self.pre if self.current == "pre" else self.post
        return data.get(road_id, 1.0)

    def _refresh_colors(self):
        for road_id, line in self.road_lines.items():
            line.set_linestyle("-") # always continuous
            if self.current == "post" and road_id in self.blocked:
                line.set_color("#9e9e9e") # grey = blocked road
            else:
                line.set_color(self.cmap(self.norm(self._factor_for(road_id))))
            line.set_linewidth(3.5 if road_id == self.pinned_road else 1.54)
        label = self.PRE_LABEL if self.current == "pre" else self.POST_LABEL
        suffix = f"  -  {self.place_name}" if self.place_name else ""
        self.ax.set_title(f"Congestion factor - {label}{suffix}",
                          fontsize=12, fontweight="bold", pad=12)
        self.fig.canvas.draw_idle()

    def _on_switch(self, label):
        self.current = "pre" if label == self.PRE_LABEL else "post"
        self._set_list_visible(self.current == "post")
        self._refresh_colors()

    # ---- interaction ----
    def _describe(self, road_id):
        pre = self.pre.get(road_id)
        post = self.post.get(road_id)
        pre_s = f"{pre:.4g}" if pre is not None else "n/a"
        post_s = f"{post:.4g}" if post is not None else "n/a"
        delta = ""
        if pre is not None and post is not None:
            d = post - pre
            trend = "up" if d > 1e-9 else ("down" if d < -1e-9 else "flat")
            delta = f"   delta {d:+.4g} ({trend})"
        flag = "  [BLOCKED post]" if road_id in self.blocked else ""
        return f"{road_id}{flag}\npre: {pre_s}    post: {post_s}{delta}"

    def _deselect(self):
        self.pinned_road = None
        self.click_annot.set_visible(False)
        self.search_msg.set_text("")
        self._refresh_colors()
        self.fig.canvas.draw_idle()

    def _on_pick(self, event):
        road_id = next((rid for rid, ln in self.road_lines.items()
                        if ln is event.artist), None)
        if road_id is None:
            return
        me = event.mouseevent
        # Right-click on the currently selected road -> deselect it.
        if me.button == 3:
            if road_id == self.pinned_road:
                self._deselect()
            return
        self.pinned_road = road_id
        if me.xdata is not None and me.ydata is not None:
            xy = (me.xdata, me.ydata)            # exact click point on the road
        else:
            line = self.road_lines[road_id]
            xs, ys = line.get_xdata(), line.get_ydata()
            xy = (xs[len(xs) // 2], ys[len(ys) // 2])
        self.click_annot.xy = xy
        self.click_annot.set_text(self._describe(road_id))
        self.click_annot.set_visible(True)
        self._refresh_colors()
        self.fig.canvas.draw_idle()

    def _on_search(self, text):
        road_id = (text or "").strip()
        if not road_id:
            return
        if not road_id.startswith("road_"):
            road_id = f"road_{road_id}"
        self._select_road(road_id)

    def _select_road(self, road_id):
        # Shared by the search box and the blocked/slowdown list buttons.
        if road_id not in self.road_lines:
            self.search_msg.set_text(f"Road '{road_id}' not found.")
            self.fig.canvas.draw_idle()
            return
        self.search_msg.set_text("")     # clear previous warning
        self.pinned_road = road_id
        line = self.road_lines[road_id]
        xs, ys = line.get_xdata(), line.get_ydata()
        mid = len(xs) // 2
        self.click_annot.xy = (xs[mid], ys[mid])
        self.click_annot.set_text(self._describe(road_id))
        self.click_annot.set_visible(True)
        self._refresh_colors()
        self.fig.canvas.draw_idle()

    def show(self):
        plt.show()

_CONGESTION_RE = re.compile(
    r"\(=\s*\(congestion-factor\s+(\S+?)\)\s*([0-9]*\.?[0-9]+)\)"
)


def parse_congestion_factors(pddl_path: str | Path) -> dict[str, float]:
    """Extract {road_id: congestion_factor} from the fluents of a PDDL problem."""
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


_BLOCKED_RE = re.compile(r"\(road-blocked\s+(\S+?)\)")


def parse_blocked_roads(pddl_path: str | Path) -> set[str]:
    """Extract the set of blocked roads (road-blocked) from a PDDL problem."""
    path = Path(pddl_path)
    if not path.exists():
        return set()
    return set(_BLOCKED_RE.findall(path.read_text(encoding="utf-8")))


# Slowdown roads are congestion-factor lines that step 04 tags with a
# ";; [DYNAMIC EVENT - slowdown]" comment. The topological recalibration
# skips slowed roads (`if road_id in slowed_road_ids: continue`), so this
# marker survives in problem_dynamic.pddl and is a reliable signal.
_SLOWDOWN_RE = re.compile(
    r"\(=\s*\(congestion-factor\s+(\S+?)\)\s*[0-9]*\.?[0-9]+\)"
    r"\s*;;\s*\[DYNAMIC EVENT - slowdown\]"
)


def parse_slowdown_roads(pddl_path: str | Path) -> set[str]:
    """Extract the set of slowed roads (LLM 'slowdown' events) from a PDDL problem."""
    path = Path(pddl_path)
    if not path.exists():
        return set()
    return set(_SLOWDOWN_RE.findall(path.read_text(encoding="utf-8")))

def open_congestion_map(mapping, pre_problem_path, post_problem_path,
                        start_loc=None, goal_loc=None, place_name=""):
    """Open the interactive pre/post congestion-factor map."""
    pre = parse_congestion_factors(pre_problem_path)
    post = parse_congestion_factors(post_problem_path)
    blocked = parse_blocked_roads(post_problem_path)
    slowdowns = parse_slowdown_roads(post_problem_path)
    if not pre and not post and not blocked:
        print("WARNING: no congestion-factor/road-blocked fluent found "
              "(needs congestion.enabled=true and mode='pddl'); congestion map skipped.")
        return None
    viewer = CongestionMapViewer(mapping, pre, post, start_loc, goal_loc,
                                 place_name, blocked_roads=blocked,
                                 slowdown_roads=slowdowns)
    viewer.show()
    return viewer
