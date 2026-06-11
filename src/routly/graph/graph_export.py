from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import osmnx as ox
import plotly.graph_objects as go


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

    # print(f"Plan image saved: {output_path}")


def _road_segments_trace(
    roads_by_id: dict[str, dict],
    road_ids: list[str],
    name: str,
    line: dict,
    hover_lookup: dict[str, str] | None = None,
) -> go.Scatter | None:
    """Build a single Scatter trace covering many road geometries, separated by None gaps."""
    xs: list[float | None] = []
    ys: list[float | None] = []
    texts: list[str | None] = []

    for road_id in road_ids:
        road = roads_by_id.get(road_id)
        if road is None:
            continue

        geometry = road.get("geometry", [])
        if len(geometry) < 2:
            continue

        hover_text = hover_lookup.get(road_id) if hover_lookup else None

        for x, y in geometry:
            xs.append(x)
            ys.append(y)
            texts.append(hover_text)

        xs.append(None)
        ys.append(None)
        texts.append(None)

    if not xs:
        return None

    return go.Scatter(
        x=xs,
        y=ys,
        mode="lines",
        name=name,
        line=line,
        text=texts,
        hoverinfo="text" if hover_lookup else "skip",
    )


def plot_event_map(
    mapping: dict,
    original_roads: list[str],
    recalculated_roads: list[str],
    blocked_roads: list[dict],
    start_loc: str | None,
    goal_loc: str | None,
    output_path: str | Path,
) -> None:
    """Write an interactive Plotly HTML map comparing the original and
    re-planned routes, highlighting roads closed by LLM-generated events."""
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    roads_by_id = {road["id"]: road for road in mapping["roads"]}
    nodes_by_id = {node["id"]: node for node in mapping["nodes"]}

    traces: list[go.Scatter] = []

    network_trace = _road_segments_trace(
        roads_by_id,
        [road["id"] for road in mapping["roads"]],
        name="Road network",
        line=dict(color="black", width=1),
    )
    if network_trace is not None:
        traces.append(network_trace)

    original_trace = _road_segments_trace(
        roads_by_id,
        original_roads,
        name="Original route",
        line=dict(color="red", width=6),
    )
    if original_trace is not None:
        traces.append(original_trace)

    recalculated_trace = _road_segments_trace(
        roads_by_id,
        recalculated_roads,
        name="Recalculated route",
        line=dict(color="green", width=3),
    )
    if recalculated_trace is not None:
        traces.append(recalculated_trace)

    blocked_hover = {
        entry["id"]: f"{entry['id']} [{entry['event_type']}]: {entry['description']}"
        for entry in blocked_roads
    }
    blocked_trace = _road_segments_trace(
        roads_by_id,
        [entry["id"] for entry in blocked_roads],
        name="Blocked roads",
        line=dict(color="blue", width=4, dash="dash"),
        hover_lookup=blocked_hover,
    )
    if blocked_trace is not None:
        traces.append(blocked_trace)

    if start_loc and start_loc in nodes_by_id:
        node = nodes_by_id[start_loc]
        traces.append(go.Scatter(
            x=[node["x"]],
            y=[node["y"]],
            mode="markers+text",
            name="Start",
            marker=dict(color="purple", size=14),
            text=["START"],
            textposition="top center",
            hoverinfo="text",
            hovertext=[f"Start: {start_loc}"],
        ))

    if goal_loc and goal_loc in nodes_by_id:
        node = nodes_by_id[goal_loc]
        traces.append(go.Scatter(
            x=[node["x"]],
            y=[node["y"]],
            mode="markers+text",
            name="Goal",
            marker=dict(color="darkred", size=14),
            text=["GOAL"],
            textposition="top center",
            hoverinfo="text",
            hovertext=[f"Goal: {goal_loc}"],
        ))

    fig = go.Figure(data=traces)
    fig.update_layout(
        title="Dynamic event map: original vs recalculated route",
        xaxis=dict(visible=False, scaleanchor="y", scaleratio=1),
        yaxis=dict(visible=False),
        plot_bgcolor="white",
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="left", x=0),
        dragmode="pan",
    )

    fig.write_html(output_path, config={"scrollZoom": False, "displaylogo": False})