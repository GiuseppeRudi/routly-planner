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
    print(f"Graph image saved: {output_path}")


def plot_plan_from_mapping(
    projected_graph,
    mapping: dict,
    planned_roads: list[str],
    output_path: str | Path,
) -> None:
    """Plot the projected graph and highlight the planned road sequence."""
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    _, ax = ox.plot_graph(
        projected_graph,
        figsize=(12, 12),
        node_size=2,
        node_color="#2c3e50",
        edge_color="#2c3e50",
        edge_linewidth=1,
        bgcolor="#f8f9fa",
        show=False,
        close=False,
    )

    planned_set = set(planned_roads)

    for road in mapping["roads"]:
        if road["id"] not in planned_set:
            continue

        xs = [p[0] for p in road["geometry"]]
        ys = [p[1] for p in road["geometry"]]
        ax.plot(xs, ys, color="red", linewidth=1, zorder=2)
        ax.scatter(xs[0], ys[0], color="green", s=2, zorder=3)
        ax.scatter(xs[-1], ys[-1], color="green", s=2, zorder=3)

        if planned_roads and road["id"] == planned_roads[0]:
            ax.text(xs[0], ys[0], "START", fontsize=10, color="green",
                    ha="center", va="bottom", zorder=4)

        if planned_roads and road["id"] == planned_roads[-1]:
            ax.text(xs[-1], ys[-1], "GOAL", fontsize=10, color="darkred",
                    ha="center", va="bottom", zorder=4)

    plt.savefig(output_path, dpi=150, bbox_inches="tight")
    plt.close()
    print(f"Plan image saved: {output_path}")
