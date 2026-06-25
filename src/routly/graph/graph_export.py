from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.lines import Line2D
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