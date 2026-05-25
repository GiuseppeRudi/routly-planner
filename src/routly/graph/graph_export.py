from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
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
) -> None:


    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    fig, ax = plt.subplots(figsize=(12, 12))

    planned_set = set(planned_roads)

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

    # print(f"Plan image saved: {output_path}")Locations