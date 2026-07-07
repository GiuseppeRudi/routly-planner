from __future__ import annotations

from pathlib import Path
import re
import json
from typing import Any
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.widgets import Button, RadioButtons, CheckButtons, TextBox
from matplotlib.cm import ScalarMappable
from matplotlib.colors import Normalize
from matplotlib.offsetbox import OffsetImage, AnnotationBbox
import osmnx as ox


def _get_crs(mapping: dict) -> str:
    if "crs" in mapping:
        return mapping["crs"]
    nodes = mapping.get("nodes", [])
    if not nodes:
        return "EPSG:32632"
    try:
        y = float(nodes[0]["y"])
        return "EPSG:32633" if y < 4500000 else "EPSG:32632"
    except Exception:
        return "EPSG:32632"


def plot_graph(graph, output_path: str | Path, title: str = "Road Network") -> None:
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    _, ax = ox.plot_graph(graph, figsize=(12, 12), node_size=30, node_color="#e74c3c", edge_color="#2c3e50", edge_linewidth=1, bgcolor="#f8f9fa", show=False, close=False)
    ax.set_title(title, fontsize=14)
    plt.savefig(output_path, dpi=150, bbox_inches="tight")
    plt.close()


def plot_plan_from_mapping(mapping: dict, planned_roads: list[str], output_path: str | Path, fuel_stations: list[str] | None = None) -> None:
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    fig, ax = plt.subplots(figsize=(12, 12))
    for road in mapping["roads"]:
        geom = road.get("geometry", [])
        if len(geom) >= 2:
            ax.plot([p[0] for p in geom], [p[1] for p in geom], linewidth=0.6, color="black", alpha=0.5, zorder=1)
    for road_id in planned_roads:
        road = next((r for r in mapping["roads"] if r["id"] == road_id), None)
        if road and len(road.get("geometry", [])) >= 2:
            ax.plot([p[0] for p in road["geometry"]], [p[1] for p in road["geometry"]], linewidth=2.5, color="red", zorder=2)
    draw_fuel_stations(ax, mapping, fuel_stations or [])
    if planned_roads:
        first_road = next((r for r in mapping["roads"] if r["id"] == planned_roads[0]), None)
        last_road = next((r for r in mapping["roads"] if r["id"] == planned_roads[-1]), None)
        if first_road and first_road.get("geometry"):
            ax.scatter(first_road["geometry"][0][0], first_road["geometry"][0][1], s=30, color="green", zorder=3)
        if last_road and last_road.get("geometry"):
            ax.scatter(last_road["geometry"][-1][0], last_road["geometry"][-1][1], s=30, color="darkred", zorder=3)
    ax.set_aspect("equal", adjustable="box")
    ax.axis("off")
    plt.savefig(output_path, dpi=150, bbox_inches="tight")
    plt.close(fig)


def _plot_roads(ax, roads_by_id: dict[str, dict], road_ids: list[str], color: str, linewidth: float, alpha: float, zorder: int, linestyle: str = "-") -> None:
    for road_id in road_ids:
        road = roads_by_id.get(road_id)
        if road and len(road.get("geometry", [])) >= 2:
            ax.plot([p[0] for p in road["geometry"]], [p[1] for p in road["geometry"]], color=color, linewidth=linewidth, alpha=alpha, zorder=zorder, linestyle=linestyle, solid_capstyle="round")


def plot_event_map(mapping: dict, original_roads: list[str], recalculated_roads: list[str], blocked_roads: list[dict], blocked_locations: list[dict] | None, start_loc: str | None, goal_loc: str | None, output_path: str | Path, slowed_roads: list[dict] | None = None, station_ids=None) -> None:
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    roads_by_id = {road["id"]: road for road in mapping["roads"]}
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}
    blocked_ids = [entry["id"] for entry in blocked_roads]
    slowed_ids = [entry["id"] for entry in (slowed_roads or [])]
    blocked_location_ids = [entry["id"] for entry in (blocked_locations or [])]

    fig, ax = plt.subplots(figsize=(14, 14))
    _plot_roads(ax, roads_by_id, [road["id"] for road in mapping["roads"]], color="#ffffff", linewidth=0.75, alpha=0.4, zorder=1)
    _plot_roads(ax, roads_by_id, original_roads, color="#0057ff", linewidth=8.0, alpha=0.58, zorder=3) # ➔ Cambiato in Blu
    _plot_roads(ax, roads_by_id, recalculated_roads, color="#00a75a", linewidth=5.0, alpha=0.82, zorder=4)
    _plot_roads(ax, roads_by_id, blocked_ids, color="#e64b35", linewidth=11.0, alpha=0.28, zorder=6) # ➔ Cambiato in Rosso Faded
    _plot_roads(ax, roads_by_id, blocked_ids, color="#e64b35", linewidth=3.6, alpha=0.96, zorder=8)  # ➔ Cambiato in Rosso Solido
    _plot_roads(ax, roads_by_id, slowed_ids, color="#FFD700", linewidth=4.2, alpha=0.96, zorder=7, linestyle="--")

    for location_id in blocked_location_ids:
        node = nodes_by_id.get(location_id)
        if node:
            ax.scatter(node["x"], node["y"], marker="X", s=170, color="#e64b35", edgecolors="white", linewidths=1.6, zorder=11) # ➔ Cambiato in Rosso

    for loc, label, col in ((start_loc, "START", "purple"), (goal_loc, "GOAL", "darkred")):
        if loc and loc in nodes_by_id:
            node = nodes_by_id[loc]
            ax.scatter(node["x"], node["y"], s=120, color=col, zorder=12)
            ax.text(node["x"], node["y"], label, fontsize=11, color="white", fontweight="bold", ha="center", va="bottom", zorder=13)

    legend_handles = [
        Line2D([0], [0], color="#0057ff", linewidth=6, alpha=0.75, label="Original route"),
        Line2D([0], [0], color="#00a75a", linewidth=5, label="Replanned route"),
        Line2D([0], [0], color="#e64b35", linewidth=4, label="Blocked roads"),
        Line2D([0], [0], color="#FFD700", linewidth=4, linestyle="--", label="Slowdowns"),
        Line2D([0], [0], marker="X", color="w", markerfacecolor="#e64b35", markersize=10, label="Blocked intersections"),
        Line2D([0], [0], marker="s", color="w", markerfacecolor="#1f9e3a", markersize=9, label="Fuel stations"),
    ]
    ax.legend(handles=legend_handles, loc="upper left")
    ax.set_title("Dynamic event map: original vs recalculated route")
    ax.set_aspect("equal", adjustable="box")
    ax.axis("off")

    draw_fuel_stations(ax, mapping, station_ids)

    try:
        import contextily as ctx
        ctx.add_basemap(ax, crs=_get_crs(mapping), source=ctx.providers.Esri.WorldImagery, alpha=0.85, zorder=0)
    except Exception:
        pass

    fig.savefig(output_path, dpi=180, bbox_inches="tight", facecolor="white")
    plt.close(fig)

_GAS_ICON_PATH = Path(__file__).resolve().parents[3] / "images" / "gas_station.png"
_GAS_ICON_CACHE = None # ndarray
_GAS_ICON_MISSING = False # True if the icon file is failed to load

from PIL import Image
import numpy as np

def _load_gas_icon():
    """Carica e RIDUCE il PNG una sola volta (icone piccole = redraw veloce)."""
    global _GAS_ICON_CACHE, _GAS_ICON_MISSING
    if _GAS_ICON_MISSING:
        return None
    if _GAS_ICON_CACHE is None:
        try:
            with Image.open(_GAS_ICON_PATH) as img:
                img = img.convert("RGBA")
                img.thumbnail((48, 48))          # <-- downscale una volta sola
                _GAS_ICON_CACHE = np.asarray(img)
        except Exception:
            _GAS_ICON_MISSING = True
            return None
    return _GAS_ICON_CACHE

def draw_fuel_stations(ax, mapping: dict, station_ids: list[str] | None = None,
                       zoom: float = 0.3, zorder: int = 10) -> None:
    # print(station_ids)

    nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
    if station_ids is None:
        station_ids = [n["id"] for n in mapping["nodes"] if n.get("fuel_station")]
    coords = [(nodes_by_id[s]["x"], nodes_by_id[s]["y"])
              for s in station_ids if s in nodes_by_id]
    if not coords:
        return

    icon = _load_gas_icon()
    if icon is not None:
        for x, y in coords:
            ab = AnnotationBbox(OffsetImage(icon, zoom=zoom), (x, y),
                                frameon=False, pad=0.0, zorder=zorder)
            ax.add_artist(ab)
    else:  # fallback
        xs = [c[0] for c in coords]
        ys = [c[1] for c in coords]
        ax.scatter(xs, ys, marker="s", s=60, color="#1f9e3a",
                   edgecolors="white", linewidths=1.4, zorder=zorder)
        for x, y in coords:
            ax.annotate("F", (x, y), ha="center", va="center", color="white",
                        fontsize=4, fontweight="bold", zorder=zorder + 1)


# ═════════════════════
# 1. EVENT MAP VIEWER 
# ═════════════════════
class EventMapViewer:
    def __init__(self, mapping, original_roads, recalculated_roads, blocked_roads, blocked_locations, start_loc=None, goal_loc=None, slowed_roads=None, station_ids=None):
        self.mapping = mapping
        self.station_ids = station_ids
        self.roads_by_id = {r["id"]: r for r in mapping["roads"]}
        self.nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
        self.original_ids = original_roads or []
        self.recalculated_ids = recalculated_roads or []
        self.blocked_ids = [entry["id"] if isinstance(entry, dict) else entry for entry in (blocked_roads or [])]
        self.slowed_ids = [entry["id"] if isinstance(entry, dict) else entry for entry in (slowed_roads or [])]
        self.blocked_loc_ids = [entry["id"] if isinstance(entry, dict) else entry for entry in (blocked_locations or [])]
        self.start_loc = start_loc
        self.goal_loc = goal_loc

        matplotlib.rcParams["toolbar"] = "None"
        self.fig, self.ax = plt.subplots(figsize=(15, 8.5))
        try:
            self.fig.canvas.manager.set_window_title("Routly - Interactive Event Comparison Map")
        except Exception:
            pass
            
        self.fig.subplots_adjust(left=0.20, right=0.98, top=0.92, bottom=0.05)

        self.base_road_lines = []
        self.artists_orig = []
        self.artists_repl = []
        self.artists_events = []

        self._build_map()
        self.base_xlim = self.ax.get_xlim()
        self.base_ylim = self.ax.get_ylim()

        self._add_controls()
        self._set_bg("Satellite")

    def _build_map(self):
        for r in self.mapping["roads"]:
            geom = r.get("geometry", [])
            if len(geom) >= 2:
                (ln,) = self.ax.plot([p[0] for p in geom], [p[1] for p in geom], color="#ffffff", linewidth=0.8, alpha=0.5, zorder=1)
                self.base_road_lines.append(ln)

        for rid in self.original_ids:
            r = self.roads_by_id.get(rid)
            if r and len(r.get("geometry", [])) >= 2:
                (ln,) = self.ax.plot([p[0] for p in r["geometry"]], [p[1] for p in r["geometry"]], color="#0057ff", linewidth=8.0, alpha=0.65, zorder=3) # ➔ Cambiato in Blu
                self.artists_orig.append(ln)

        for rid in self.recalculated_ids:
            r = self.roads_by_id.get(rid)
            if r and len(r.get("geometry", [])) >= 2:
                (ln,) = self.ax.plot([p[0] for p in r["geometry"]], [p[1] for p in r["geometry"]], color="#00a75a", linewidth=5.0, alpha=0.88, zorder=4)
                self.artists_repl.append(ln)

        for rid in self.blocked_ids:
            r = self.roads_by_id.get(rid)
            if r and len(r.get("geometry", [])) >= 2:
                (ln1,) = self.ax.plot([p[0] for p in r["geometry"]], [p[1] for p in r["geometry"]], color="#e64b35", linewidth=11.0, alpha=0.28, zorder=6) # ➔ Cambiato in Rosso Faded
                (ln2,) = self.ax.plot([p[0] for p in r["geometry"]], [p[1] for p in r["geometry"]], color="#e64b35", linewidth=3.6, alpha=0.96, zorder=8)  # ➔ Cambiato in Rosso Solido
                self.artists_events.extend([ln1, ln2])

        for rid in self.slowed_ids:
            r = self.roads_by_id.get(rid)
            if r and len(r.get("geometry", [])) >= 2:
                (ln,) = self.ax.plot([p[0] for p in r["geometry"]], [p[1] for p in r["geometry"]], color="#FFD700", linewidth=4.2, alpha=0.96, zorder=7, linestyle="--")
                self.artists_events.append(ln)

        for lid in self.blocked_loc_ids:
            n = self.nodes_by_id.get(lid)
            if n:
                sc = self.ax.scatter(float(n["x"]), float(n["y"]), marker="X", s=170, color="#e64b35", edgecolors="white", linewidths=1.6, zorder=11) # ➔ Cambiato in Rosso
                self.artists_events.append(sc)

        for loc, label, col in ((self.start_loc, "START", "purple"), (self.goal_loc, "GOAL", "darkred")):
            if loc and loc in self.nodes_by_id:
                n = self.nodes_by_id[loc]
                self.ax.scatter(float(n["x"]), float(n["y"]), s=120, color=col, edgecolors="white", zorder=12)
                self.ax.annotate(label, (float(n["x"]), float(n["y"])), textcoords="offset points", xytext=(6, 6), fontsize=10, fontweight="bold", color="white", zorder=13)

        draw_fuel_stations(self.ax, self.mapping, self.station_ids)
        self.ax.set_aspect("equal", adjustable="datalim")
        self.ax.axis("off")
        self.ax.set_title("Interactive Event Comparison: Original vs Replanned Route", fontsize=12, fontweight="bold", pad=10)

    def _add_controls(self):
        bg_ax = self.fig.add_axes([0.02, 0.80, 0.15, 0.12])
        bg_ax.set_title("Background Map", fontsize=9, fontweight="bold")
        self.bg_radio = RadioButtons(bg_ax, ("Satellite", "OSM Map", "None"), active=0)
        self.bg_radio.on_clicked(self._set_bg)

        layer_ax = self.fig.add_axes([0.02, 0.62, 0.15, 0.15])
        layer_ax.set_title("Toggle Layers", fontsize=9, fontweight="bold")
        self.check = CheckButtons(layer_ax, ("Original Route", "Replanned Route", "LLM Events"), (True, True, True))
        self.check.on_clicked(self._toggle_layer)

        legend_handles = [
            Line2D([0], [0], color="#0057ff", linewidth=6, alpha=0.75, label="Original route"),
            Line2D([0], [0], color="#00a75a", linewidth=5, label="Replanned route"),
            Line2D([0], [0], color="#e64b35", linewidth=4, label="Blocked roads"),
            Line2D([0], [0], color="#FFD700", linewidth=4, linestyle="--", label="Slowdowns"),
            Line2D([0], [0], marker="X", color="w", markerfacecolor="#e64b35", markersize=10, label="Blocked intersections"),
        ]
        self.ax.legend(handles=legend_handles, loc="upper left", fontsize=8, framealpha=0.85)

    def _set_bg(self, label):
        for img in list(self.ax.images):
            try: img.remove()
            except Exception: pass

        if label == "None":
            for ln in self.base_road_lines:
                ln.set_color("#a8a8a8")
                ln.set_alpha(0.75)
            self.ax.set_xlim(self.base_xlim)
            self.ax.set_ylim(self.base_ylim)
            self.fig.canvas.draw_idle()
            return
        elif label == "Satellite":
            for ln in self.base_road_lines: ln.set_color("#ffffff"); ln.set_alpha(0.45)
        elif label == "OSM Map":
            for ln in self.base_road_lines: ln.set_color("#333333"); ln.set_alpha(0.35)

        try:
            import contextily as ctx
            source = ctx.providers.Esri.WorldImagery if label == "Satellite" else ctx.providers.OpenStreetMap.Mapnik
            ctx.add_basemap(self.ax, crs=_get_crs(self.mapping), source=source, alpha=0.88 if label=="Satellite" else 0.70, zorder=0)
            self.ax.set_xlim(self.base_xlim)
            self.ax.set_ylim(self.base_ylim)
        except Exception as e:
            print(f"⚠️ Errore caricamento basemap: {e}")

        self.fig.canvas.draw_idle()

    def _toggle_layer(self, label):
        if label == "Original Route":
            for art in self.artists_orig: art.set_visible(not art.get_visible())
        elif label == "Replanned Route":
            for art in self.artists_repl: art.set_visible(not art.get_visible())
        elif label == "LLM Events":
            for art in self.artists_events: art.set_visible(not art.get_visible())
        self.fig.canvas.draw_idle()

    def show(self):
        plt.show()


# ══════════════════════════════════════════════════════════════════════════════
# 2. CONGESTION MAP VIEWER (LAYOUT A 3 COLONNE: UI SINISTRA, MAPPA, LOG DESTRA)
# ══════════════════════════════════════════════════════════════════════════════
class CongestionMapViewer:
    PRE_LABEL = "Pre LLM events"
    POST_LABEL = "Post LLM events"

    def __init__(self, mapping, pre_factors, post_factors, start_loc=None, goal_loc=None, place_name="", blocked_roads=None, slowdown_roads=None, llm_events_list=None, station_ids=None):
        self.mapping = mapping
        self.station_ids = station_ids
        self.nodes_by_id = {n["id"]: n for n in mapping["nodes"]}
        self.roads = list(mapping["roads"])
        self.pre = pre_factors or {}
        self.post = post_factors or {}
        self.blocked = set(blocked_roads or ())
        self.slowdowns = set(slowdown_roads or ())
        self.start_loc = start_loc
        self.goal_loc = goal_loc
        self.place_name = place_name
        self.current = "pre"
        self.pinned_road = None
        self.llm_events_list = llm_events_list or []

        self.road_descriptions = {}
        for ev in self.llm_events_list:
            desc = ev.get("description", "")
            etype = ev.get("event_type", "incident")
            for r in ev.get("roads", []): self.road_descriptions[r] = f"[{etype.upper()}] {desc}"

        all_vals = list(self.pre.values()) + list(self.post.values())
        vmin, vmax = (min(all_vals), max(all_vals)) if all_vals else (1.0, 2.0)
        if vmax <= vmin: vmax = vmin + 1e-6
        self.norm = Normalize(vmin=vmin, vmax=vmax)
        self.cmap = plt.get_cmap("RdYlGn_r")

        matplotlib.rcParams["toolbar"] = "None"
        self.fig, self.ax = plt.subplots(figsize=(15, 7.5))
        try:
            self.fig.canvas.manager.set_window_title("Routly - Congestion map (pre/post)")
        except Exception:
            pass
            
        self.fig.subplots_adjust(left=0.21, right=0.73, top=0.92, bottom=0.05)

        self.road_lines: dict[str, Any] = {}
        self.llm_text_elements = []
        
        self._build_map()
        self.base_xlim = self.ax.get_xlim()
        self.base_ylim = self.ax.get_ylim()

        self._add_colorbar()
        self._add_legend()
        self._add_bg_switch()
        self._add_switch()
        self._add_search()
        self._add_road_list()
        self._add_llm_events_panel()
        self._add_annotation()
        self._connect_events()
        self._refresh_colors()

    @staticmethod
    def _xy(node): return float(node["x"]), float(node["y"])

    def _road_xy(self, road):
        geom = road.get("geometry")
        if geom and len(geom) >= 2: return [p[0] for p in geom], [p[1] for p in geom]
        fn, tn = self.nodes_by_id.get(road["from"]), self.nodes_by_id.get(road["to"])
        if not fn or not tn: return None, None
        return [self._xy(fn)[0], self._xy(tn)[0]], [self._xy(fn)[1], self._xy(tn)[1]]

    def _build_map(self):
        for road in self.roads:
            xs, ys = self._road_xy(road)
            if xs:
                (line,) = self.ax.plot(xs, ys, linewidth=1.54, alpha=0.9, zorder=2, solid_capstyle="round", picker=5)
                self.road_lines[road["id"]] = line

        self.ax.scatter([self._xy(n)[0] for n in self.mapping["nodes"]], [self._xy(n)[1] for n in self.mapping["nodes"]], s=8, color="#333333", zorder=3, alpha=0.6)
        draw_fuel_stations(self.ax, self.mapping, self.station_ids)

        for loc, label, col in ((self.start_loc, "START", "purple"), (self.goal_loc, "GOAL", "darkred")):
            if loc and loc in self.nodes_by_id:
                x, y = self._xy(self.nodes_by_id[loc])
                self.ax.scatter([x], [y], s=130, color=col, edgecolors="white", linewidths=1.4, zorder=5)
                self.ax.annotate(label, (x, y), textcoords="offset points", xytext=(6, 6), fontsize=9, fontweight="bold", color=col, zorder=6)
        self.ax.set_aspect("equal", adjustable="datalim")
        self.ax.axis("off")

    def _add_colorbar(self):
        sm = ScalarMappable(norm=self.norm, cmap=self.cmap)
        sm.set_array([])
        cbar = self.fig.colorbar(sm, ax=self.ax, fraction=0.04, pad=0.04)
        cbar.set_label("congestion-factor (1.0 = free, higher = congested)")

    def _add_legend(self):
        self.ax.legend(handles=[Line2D([0], [0], color="#9e9e9e", lw=3, label="Blocked road")], loc="lower right", fontsize=8, framealpha=0.9)

    def _add_bg_switch(self):
        bg_ax = self.fig.add_axes([0.015, 0.83, 0.16, 0.10])
        bg_ax.set_title("Background Map", fontsize=8, fontweight="bold")
        self.bg_radio = RadioButtons(bg_ax, ("None", "Satellite", "Map"), active=0)
        self.bg_radio.on_clicked(self._on_bg_switch)

    def _on_bg_switch(self, label):
        for img in list(self.ax.images):
            try: img.remove()
            except Exception: pass

        if label == "None":
            self.ax.set_xlim(self.base_xlim); self.ax.set_ylim(self.base_ylim)
            self.fig.canvas.draw_idle()
            return

        try:
            import contextily as ctx
            source = ctx.providers.Esri.WorldImagery if label == "Satellite" else ctx.providers.OpenStreetMap.Mapnik
            ctx.add_basemap(self.ax, crs=_get_crs(self.mapping), source=source, alpha=0.6, zorder=0)
            self.ax.set_xlim(self.base_xlim); self.ax.set_ylim(self.base_ylim)
        except Exception as e:
            print(f"Errore basemap: {e}")
        self.fig.canvas.draw_idle()

    def _add_switch(self):
        switch_ax = self.fig.add_axes([0.015, 0.72, 0.16, 0.09])
        switch_ax.set_title("Time View", fontsize=8, fontweight="bold")
        self.radio = RadioButtons(switch_ax, (self.PRE_LABEL, self.POST_LABEL), active=0)
        self.radio.on_clicked(self._on_switch)

    def _add_search(self):
        search_ax = self.fig.add_axes([0.015, 0.63, 0.16, 0.04])
        search_ax.set_title("Search road (number)", fontsize=8)
        self.search_box = TextBox(search_ax, "", textalignment="center")
        self.search_box.on_submit(self._on_search)
        self.search_msg = self.fig.text(0.015, 0.61, "", color="red", fontsize=8, va="top")

    def _add_road_list(self):
        def _num(rid):
            m = re.search(r"(\d+)$", rid)
            return int(m.group(1)) if m else 0
        self.list_items = ([(r, "B") for r in sorted(self.blocked, key=_num)] + [(r, "S") for r in sorted(self.slowdowns, key=_num)])
        self.list_offset = 0
        self.VISIBLE_ROWS = 12
        self.list_header = self.fig.text(0.015, 0.58, "", fontsize=8, fontweight="bold", va="top")

        up_ax = self.fig.add_axes([0.015, 0.535, 0.075, 0.03])
        down_ax = self.fig.add_axes([0.098, 0.535, 0.075, 0.03])
        self.btn_up = Button(up_ax, "Up", color="#eee", hovercolor="#ddd")
        self.btn_down = Button(down_ax, "Down", color="#eee", hovercolor="#ddd")
        self.btn_up.label.set_fontsize(8); self.btn_down.label.set_fontsize(8)
        self.btn_up.on_clicked(lambda _e: self._scroll_list(-1))
        self.btn_down.on_clicked(lambda _e: self._scroll_list(1))

        self.row_buttons = []
        top, step = 0.495, 0.036
        for i in range(self.VISIBLE_ROWS):
            row_ax = self.fig.add_axes([0.015, top - i * step, 0.16, 0.03])
            btn = Button(row_ax, "", color="#f5f5f5", hovercolor="#e0e0e0")
            btn.label.set_fontsize(8)
            btn.on_clicked(self._make_row_handler(i))
            self.row_buttons.append(btn)

        self.fig.canvas.mpl_connect("scroll_event", self._on_scroll)
        self._set_list_visible(self.current == "post")

    def _make_row_handler(self, row_index):
        def handler(_event):
            idx = self.list_offset + row_index
            if 0 <= idx < len(self.list_items): self._select_road(self.list_items[idx][0])
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
                btn.label.set_text(""); btn.ax.set_visible(False)
        if total:
            lo, hi = self.list_offset + 1, min(self.list_offset + self.VISIBLE_ROWS, total)
            self.list_header.set_text(f"Blocked [B] / slow [S] ({lo}-{hi} of {total})")
        else: self.list_header.set_text("No blocked / slowdown roads")
        self.fig.canvas.draw_idle()

    def _scroll_list(self, delta):
        max_offset = max(0, len(self.list_items) - self.VISIBLE_ROWS)
        self.list_offset = min(max(0, self.list_offset + delta), max_offset)
        self._refresh_list()

    def _on_scroll(self, event):
        xf = event.x / self.fig.bbox.width if event.x is not None else 1.0
        if xf <= 0.19: self._scroll_list(-1 if event.button == "up" else 1)

    def _add_llm_events_panel(self):
        # t_title = self.fig.text(0.75, 0.90, "LLM INCIDENTS LOG", fontsize=10, fontweight="bold", color="#0057ff", va="top")
        # self.llm_text_elements.append(t_title)

        y_pos = 0.85
        for idx, ev in enumerate(self.llm_events_list, 1):
            if y_pos < 0.08: break
            etype = ev.get("event_type", "incident").upper()
            desc = ev.get("description", "No description provided.")
            roads = ev.get("roads", [])
            wrapped_desc = "\n  ".join([desc[i:i+30] for i in range(0, len(desc), 30)])
            ev_text = f"• Event {idx} ({etype})\n  Roads: {', '.join(roads[:2])}{'...' if len(roads)>2 else ''}\n  Reason: {wrapped_desc}"
            border_color = "#e64b35" if etype != "SLOWDOWN" else "#FFD700" # ➔ Cambiato in Rosso
            t_ev = self.fig.text(0.75, y_pos, ev_text, fontsize=8, va="top", bbox=dict(boxstyle="round,pad=0.3", facecolor="#fdfdfd", edgecolor=border_color, alpha=0.9))
            self.llm_text_elements.append(t_ev); y_pos -= 0.13

    def _set_list_visible(self, visible):
        self.list_header.set_visible(visible)
        for w in (self.btn_up, self.btn_down): w.ax.set_visible(visible); w.set_active(visible)
        for btn in self.row_buttons: btn.set_active(visible)
        if visible: self._refresh_list()
        else:
            for btn in self.row_buttons: btn.ax.set_visible(False)
        for elem in self.llm_text_elements: elem.set_visible(visible)
        self.fig.canvas.draw_idle()

    def _add_annotation(self):
        self.click_annot = self.ax.annotate("", xy=(0, 0), xytext=(30, 30), textcoords="offset points", bbox={"boxstyle": "round,pad=0.4", "facecolor": "white", "edgecolor": "#555", "alpha": 0.96}, arrowprops={"arrowstyle": "-", "color": "#555", "lw": 1.2, "shrinkA": 0, "shrinkB": 0}, fontsize=8.5, zorder=20)
        self.click_annot.set_visible(False)

    def _connect_events(self): self.fig.canvas.mpl_connect("pick_event", self._on_pick)

    def _factor_for(self, road_id):
        data = self.pre if self.current == "pre" else self.post
        return data.get(road_id, 1.0)

    def _refresh_colors(self):
        for road_id, line in self.road_lines.items():
            line.set_linestyle("-")
            if self.current == "post" and road_id in self.blocked: line.set_color("#9e9e9e")
            else: line.set_color(self.cmap(self.norm(self._factor_for(road_id))))
            line.set_linewidth(3.5 if road_id == self.pinned_road else 1.54)
        label = self.PRE_LABEL if self.current == "pre" else self.POST_LABEL
        suffix = f"  -  {self.place_name}" if self.place_name else ""
        self.ax.set_title(f"Congestion factor - {label}{suffix}", fontsize=12, fontweight="bold", pad=12)
        self.fig.canvas.draw_idle()

    def _on_switch(self, label):
        self.current = "pre" if label == self.PRE_LABEL else "post"
        self._set_list_visible(self.current == "post")
        self._refresh_colors()

    def _describe(self, road_id):
        pre, post = self.pre.get(road_id), self.post.get(road_id)
        pre_s = f"{pre:.4g}" if pre is not None else "n/a"
        post_s = f"{post:.4g}" if post is not None else "n/a"
        delta = ""
        if pre is not None and post is not None:
            d = post - pre
            trend = "up" if d > 1e-9 else ("down" if d < -1e-9 else "flat")
            delta = f"   delta {d:+.4g} ({trend})"
        flag = "  [BLOCKED post]" if road_id in self.blocked else ""
        desc_info = f"\nLLM Incident: {self.road_descriptions[road_id]}" if road_id in self.road_descriptions else ""
        return f"{road_id}{flag}\npre: {pre_s}    post: {post_s}{delta}{desc_info}"

    def _deselect(self):
        self.pinned_road = None; self.click_annot.set_visible(False); self.search_msg.set_text("")
        self._refresh_colors(); self.fig.canvas.draw_idle()

    def _on_pick(self, event):
        road_id = next((rid for rid, ln in self.road_lines.items() if ln is event.artist), None)
        if not road_id: return
        me = event.mouseevent
        if me.button == 3:
            if road_id == self.pinned_road: self._deselect()
            return
        self.pinned_road = road_id
        xy = (me.xdata, me.ydata) if (me.xdata and me.ydata) else (self.road_lines[road_id].get_xdata()[len(self.road_lines[road_id].get_xdata())//2], self.road_lines[road_id].get_ydata()[len(self.road_lines[road_id].get_ydata())//2])
        self.click_annot.xy = xy; self.click_annot.set_text(self._describe(road_id)); self.click_annot.set_visible(True)
        self._refresh_colors(); self.fig.canvas.draw_idle()

    def _on_search(self, text):
        road_id = (text or "").strip()
        if not road_id: return
        if not road_id.startswith("road_"): road_id = f"road_{road_id}"
        self._select_road(road_id)

    def _select_road(self, road_id):
        if road_id not in self.road_lines:
            self.search_msg.set_text(f"Road '{road_id}' not found."); self.fig.canvas.draw_idle(); return
        self.search_msg.set_text(""); self.pinned_road = road_id
        line = self.road_lines[road_id]
        xs, ys = line.get_xdata(), line.get_ydata()
        self.click_annot.xy = (xs[len(xs)//2], ys[len(ys)//2])
        self.click_annot.set_text(self._describe(road_id)); self.click_annot.set_visible(True)
        self._refresh_colors(); self.fig.canvas.draw_idle()

    def show(self): plt.show()


_CONGESTION_RE = re.compile(r"\(=\s*\(congestion-factor\s+(\S+?)\)\s*([0-9]*\.?[0-9]+)\)")

def parse_congestion_factors(pddl_path: str | Path) -> dict[str, float]:
    path = Path(pddl_path)
    if not path.exists(): return {}
    factors: dict[str, float] = {}
    for road_id, value in _CONGESTION_RE.findall(path.read_text(encoding="utf-8")):
        try: factors[road_id] = float(value)
        except ValueError: continue
    return factors

_BLOCKED_RE = re.compile(r"\(road-blocked\s+(\S+?)\)")

def parse_blocked_roads(pddl_path: str | Path) -> set[str]:
    path = Path(pddl_path)
    return set(_BLOCKED_RE.findall(path.read_text(encoding="utf-8"))) if path.exists() else set()

_SLOWDOWN_RE = re.compile(r"\(=\s*\(congestion-factor\s+(\S+?)\)\s*[0-9]*\.?[0-9]+\)\s*;;\s*\[DYNAMIC EVENT - slowdown\]")

def parse_slowdown_roads(pddl_path: str | Path) -> set[str]:
    path = Path(pddl_path)
    return set(_SLOWDOWN_RE.findall(path.read_text(encoding="utf-8"))) if path.exists() else set()


def open_congestion_map(mapping, pre_problem_path, post_problem_path, start_loc=None, goal_loc=None, place_name="", station_ids=None):
    pre, post = parse_congestion_factors(pre_problem_path), parse_congestion_factors(post_problem_path)
    blocked, slowdowns = parse_blocked_roads(post_problem_path), parse_slowdown_roads(post_problem_path)
    llm_events_list = []
    log_path = Path(post_problem_path).parent / "incidents_log.json"
    if log_path.exists():
        try:
            with open(log_path, "r", encoding="utf-8") as f: llm_events_list = json.load(f).get("events", [])
        except Exception: pass

    if not pre and not post and not blocked:
        print("WARNING: no congestion-factor/road-blocked fluent found. Congestion map skipped.")
        return None
    viewer = CongestionMapViewer(mapping, pre, post, start_loc, goal_loc, place_name, blocked_roads=blocked, slowdown_roads=slowdowns, llm_events_list=llm_events_list, station_ids=station_ids)
    viewer.show()
    return viewer

def save_congestion_maps(
    mapping,
    pre_problem_path,
    post_problem_path,
    pre_output_path,
    post_output_path,
    start_loc=None,
    goal_loc=None,
    place_name="",
    station_ids=None,
):
    """Render and save the pre/post congestion-factor maps as two PNG images."""
    pre = parse_congestion_factors(pre_problem_path)
    post = parse_congestion_factors(post_problem_path)
    blocked = parse_blocked_roads(post_problem_path)

    if not pre and not post and not blocked:
        print("WARNING: no congestion-factor/road-blocked fluent found "
              "(needs congestion.mode='pddl'); congestion images skipped.")
        return None, None

    nodes_by_id = {n["id"]: n for n in mapping["nodes"]}

    # Shared color normalization across pre and post -> consistent comparison.
    all_vals = list(pre.values()) + list(post.values())
    vmin = min(all_vals) if all_vals else 1.0
    vmax = max(all_vals) if all_vals else 2.0
    if vmax <= vmin:
        vmax = vmin + 1e-6
    norm = Normalize(vmin=vmin, vmax=vmax)
    cmap = plt.get_cmap("RdYlGn_r")

    def _road_xy(road):
        geometry = road.get("geometry")
        if geometry and len(geometry) >= 2:
            return [p[0] for p in geometry], [p[1] for p in geometry]
        fn = nodes_by_id.get(road["from"])
        tn = nodes_by_id.get(road["to"])
        if fn is None or tn is None:
            return None, None
        return [float(fn["x"]), float(tn["x"])], [float(fn["y"]), float(tn["y"])]

    def _render(which, factors, output_path):
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        fig, ax = plt.subplots(figsize=(12, 7))

        for road in mapping["roads"]:
            xs, ys = _road_xy(road)
            if xs is None:
                continue
            rid = road["id"]
            if which == "post" and rid in blocked:
                color = "#9e9e9e" # grey = blocked road (matches viewer)
            else:
                color = cmap(norm(factors.get(rid, 1.0)))
            ax.plot(xs, ys, color=color, linewidth=1.54, alpha=0.9,
                    zorder=2, solid_capstyle="round")

        node_xs = [float(n["x"]) for n in mapping["nodes"]]
        node_ys = [float(n["y"]) for n in mapping["nodes"]]
        ax.scatter(node_xs, node_ys, s=8, color="#333333", zorder=3, alpha=0.6)

        draw_fuel_stations(ax, mapping, station_ids)

        for loc, label, color in ((start_loc, "START", "purple"),
                                  (goal_loc, "GOAL", "darkred")):
            if loc and loc in nodes_by_id:
                x = float(nodes_by_id[loc]["x"])
                y = float(nodes_by_id[loc]["y"])
                ax.scatter([x], [y], s=130, color=color, edgecolors="white",
                           linewidths=1.4, zorder=5)
                ax.annotate(label, (x, y), textcoords="offset points",
                            xytext=(6, 6), fontsize=9, fontweight="bold",
                            color=color, zorder=6)

        sm = ScalarMappable(norm=norm, cmap=cmap)
        sm.set_array([])
        cbar = fig.colorbar(sm, ax=ax, fraction=0.04, pad=0.04)
        cbar.set_label("congestion-factor (1.0 = free, higher = congested)")

        if which == "post" and blocked:
            ax.legend(handles=[Line2D([0], [0], color="#9e9e9e", lw=3,
                                      label="Blocked road")],
                      loc="lower right", fontsize=8, framealpha=0.9)

        title_label = "Pre LLM events" if which == "pre" else "Post LLM events"
        suffix = f"  -  {place_name}" if place_name else ""
        ax.set_title(f"Congestion factor - {title_label}{suffix}",
                     fontsize=12, fontweight="bold", pad=12)
        ax.set_aspect("equal", adjustable="datalim")
        ax.axis("off")

        fig.savefig(output_path, dpi=180, bbox_inches="tight", facecolor="white")
        plt.close(fig)
        return output_path

    pre_path = _render("pre", pre, pre_output_path)
    post_path = _render("post", post, post_output_path)
    print(f"   Congestion map (pre):  {pre_path}")
    print(f"   Congestion map (post): {post_path}")
    return pre_path, post_path
