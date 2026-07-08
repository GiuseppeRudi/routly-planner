from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
import json
from pathlib import Path
from typing import Any

from src.routly.domain.congestion import BackgroundRoute
from src.routly.domain.roads import road_capacity_class
from src.routly.features import RoadAbstractionConfig


@dataclass(frozen=True)
class MacroRoadResult:
    mapping: dict[str, Any]
    expansion: dict[str, Any]
    report: dict[str, Any]
    report_text: str


STOP_REASON_DESCRIPTIONS = {
    "branch": "The next node has more than one useful continuation, so it remains explicit to preserve topology choices.",
    "class_mismatch": "The road capacity class changes and require_same_capacity_class=true prevents merging.",
    "cycle": "The merge would create a cycle or return to an already visited node.",
    "dead_end": "No useful continuation exists from the current road.",
    "fuel_station": "The node contains a fuel station and must remain visible to the planner.",
    "max_length": "The macro-road would exceed max_length_meters.",
    "max_segments": "The macro-road reached max_segments_per_macro.",
    "protected_node": "The node is protected by at least one abstraction rule.",
    "speed_mismatch": "The speed changes beyond speed_tolerance_ratio.",
    "start_goal": "Start and goal nodes cannot be removed.",
    "traffic_light": "The node contains a traffic light and must remain visible to the planner.",
}


METRIC_DESCRIPTIONS = {
    "stop_reasons": (
        "Counts how many macro-road growth attempts terminated for each reason. "
        "This is an operational counter over chain-building decisions, so the same "
        "physical node can be counted multiple times when it stops different "
        "candidate chains."
    ),
    "protected_node_counts": (
        "Counts unique physical nodes protected by each abstraction rule. This is "
        "a topological counter over nodes, so each node is counted once per "
        "protection reason."
    ),
    "why_counts_differ": (
        "The two counters use different units: stop_reasons counts termination "
        "events during macro-road construction, while protected_node_counts counts "
        "distinct protected nodes. Therefore, values such as branch=589 in "
        "stop_reasons and branch=312 in protected_node_counts are both valid."
    ),
}


def require_macro_artifacts(
    scenario: dict[str, Any],
    config: Any,
    enabled: bool,
) -> tuple[Path, Path | None]:
    """Resolve the planner mapping and optional legacy expansion table."""
    map_section = scenario.get("map", {})
    if enabled:
        planning_raw = map_section.get("planning_mapping_path")
        expansion_raw = map_section.get("macro_expansion_path")
        if not planning_raw:
            raise FileNotFoundError(
                "Run build_macro_roads first: road abstraction is enabled but "
                "scenario.yaml has no planning_mapping_path."
            )

        planning_path = resolve_project_path(planning_raw)
        if not planning_path.exists():
            raise FileNotFoundError(
                "Run build_macro_roads first: missing planning mapping: "
                f"{planning_path}"
            )
        expansion_path = resolve_project_path(expansion_raw) if expansion_raw else None
        if expansion_path is not None and not expansion_path.exists():
            expansion_path = None
        return planning_path, expansion_path

    mapping_path = resolve_project_path(map_section.get("mapping_path", config.mapping_path))
    return mapping_path, None


def resolve_project_path(raw_path: str | Path) -> Path:
    path = Path(raw_path)
    if path.is_absolute():
        return path
    return Path.cwd() / path


def build_macro_road_mapping(
    mapping: dict[str, Any],
    start_loc: str,
    goal_loc: str,
    config: RoadAbstractionConfig,
    original_mapping_path: str | Path | None = None,
    macro_mapping_path: str | Path | None = None,
) -> MacroRoadResult:
    nodes_by_id = {node["id"]: dict(node) for node in mapping.get("nodes", [])}
    roads = [dict(road) for road in mapping.get("roads", [])]
    roads_by_id = {road["id"]: road for road in roads}
    outgoing = _outgoing_roads(roads)
    neighbor_count = _undirected_neighbor_counts(roads)
    protected_nodes, protected_reasons, protected_stop_reasons = _protected_nodes(
        nodes_by_id,
        neighbor_count,
        start_loc,
        goal_loc,
    )

    used: set[str] = set()
    macro_roads: list[dict[str, Any]] = []
    expansion: dict[str, list[str]] = {}
    micro_to_macro: dict[str, str] = {}
    stop_reasons: Counter[str] = Counter()
    macro_index = 0

    for road in sorted(roads, key=lambda item: item["id"]):
        road_id = road["id"]
        if road_id in used:
            continue

        chain, reason = _grow_chain(
            start_road=road,
            roads_by_id=roads_by_id,
            outgoing=outgoing,
            protected_nodes=protected_nodes,
            protected_stop_reasons=protected_stop_reasons,
            config=config,
        )
        stop_reasons[reason] += 1

        source_ids = [item["id"] for item in chain]
        used.update(source_ids)

        if len(chain) >= 2:
            macro_id = f"macro_{macro_index:04d}"
            macro_index += 1
            macro_road = _aggregate_macro_road(macro_id, chain, is_macro=True)
        else:
            macro_road = _aggregate_macro_road(source_ids[0], chain, is_macro=False)

        macro_roads.append(macro_road)
        expansion[macro_road["id"]] = source_ids
        for source_id in source_ids:
            micro_to_macro[source_id] = macro_road["id"]

    used_locations = sorted(
        {road["from"] for road in macro_roads} | {road["to"] for road in macro_roads}
    )
    macro_nodes = [nodes_by_id[node_id] for node_id in used_locations if node_id in nodes_by_id]

    macro_mapping = {
        key: value
        for key, value in mapping.items()
        if key not in {"nodes", "roads"}
    }
    macro_mapping["nodes"] = macro_nodes
    macro_mapping["roads"] = sorted(macro_roads, key=lambda item: item["id"])

    expansion_payload = {
        "enabled": True,
        "original_mapping_path": str(original_mapping_path) if original_mapping_path else None,
        "planning_mapping_path": str(macro_mapping_path) if macro_mapping_path else None,
        "macro_to_roads": {
            macro_id: source_ids
            for macro_id, source_ids in sorted(expansion.items())
        },
        "micro_to_macro": {
            road_id: macro_id
            for road_id, macro_id in sorted(micro_to_macro.items())
        },
    }

    report = _build_report(
        original_mapping=mapping,
        macro_mapping=macro_mapping,
        expansion=expansion_payload,
        stop_reasons=stop_reasons,
        protected_reasons=protected_reasons,
        start_loc=start_loc,
        goal_loc=goal_loc,
    )

    return MacroRoadResult(
        mapping=macro_mapping,
        expansion=expansion_payload,
        report=report,
        report_text=macro_report_to_text(report),
    )


def expand_road_id(road_id: str, expansion: dict[str, Any] | None) -> list[str]:
    if not expansion:
        return [road_id]
    macro_to_roads = expansion.get("macro_to_roads", {})
    return list(macro_to_roads.get(road_id, [road_id]))


def expand_road_sequence(
    road_ids: list[str],
    expansion: dict[str, Any] | None,
) -> list[str]:
    expanded: list[str] = []
    for road_id in road_ids:
        expanded.extend(expand_road_id(road_id, expansion))
    return expanded


def expand_background_routes(
    background_routes: list[BackgroundRoute] | None,
    expansion: dict[str, Any] | None,
) -> list[BackgroundRoute] | None:
    if background_routes is None:
        return None
    return [
        (depart, expand_road_sequence(list(route), expansion))
        for depart, route in background_routes
    ]


def validate_expanded_background_routes_for_sumo(
    background_routes: list[BackgroundRoute] | None,
    roads: list[dict[str, Any]],
) -> None:
    """Validate expanded routes for SUMO without rejecting revisited nodes.

    Macro-road expansion can expose internal nodes hidden from the planning
    graph. A route that was cycle-free at macro level may therefore touch an
    internal micro node again after expansion. SUMO only needs the edge sequence
    to be known and connected.
    """
    if background_routes is None:
        return

    road_by_id = {road["id"]: road for road in roads}
    for route_index, (_, route) in enumerate(background_routes):
        if len(route) < 2:
            raise ValueError(
                f"Expanded background route {route_index} must contain at least two roads"
            )

        previous_to: str | None = None
        for road_id in route:
            road = road_by_id.get(road_id)
            if road is None:
                raise ValueError(
                    f"Expanded background route {route_index} contains unknown road {road_id}"
                )
            if previous_to is not None and road["from"] != previous_to:
                raise ValueError(
                    f"Expanded background route {route_index} is disconnected at {road_id}"
                )
            previous_to = road["to"]


def expand_incident_road_ids(
    road_ids: list[str],
    expansion: dict[str, Any] | None,
) -> list[str]:
    return sorted(set(expand_road_sequence(list(road_ids), expansion)))


def macro_expansion_from_mapping(
    planning_mapping: dict[str, Any],
    original_mapping_path: str | Path | None = None,
    planning_mapping_path: str | Path | None = None,
) -> dict[str, Any]:
    """Build the macro expansion table from roads_mapping_macro.json itself."""
    macro_to_roads: dict[str, list[str]] = {}
    micro_to_macro: dict[str, str] = {}

    for road in planning_mapping.get("roads", []):
        road_id = road["id"]
        source_roads = list(road.get("source_roads") or [road_id])
        macro_to_roads[road_id] = source_roads
        for source_road in source_roads:
            micro_to_macro[source_road] = road_id

    return {
        "enabled": True,
        "original_mapping_path": str(original_mapping_path) if original_mapping_path else None,
        "planning_mapping_path": str(planning_mapping_path) if planning_mapping_path else None,
        "macro_to_roads": dict(sorted(macro_to_roads.items())),
        "micro_to_macro": dict(sorted(micro_to_macro.items())),
    }


def load_macro_expansion(path: str | Path | None) -> dict[str, Any] | None:
    if path is None:
        return None
    return json.loads(Path(path).read_text(encoding="utf-8"))


def write_macro_artifacts(
    result: MacroRoadResult,
    mapping_path: str | Path,
    report_json_path: str | Path,
) -> None:
    _write_json(result.mapping, mapping_path)
    _write_json(result.report, report_json_path)


def plot_macro_roads_comparison(
    original_mapping: dict[str, Any],
    macro_mapping: dict[str, Any],
    expansion: dict[str, Any],
    output_path: str | Path,
    start_loc: str,
    goal_loc: str,
) -> None:
    import matplotlib

    matplotlib.use("Agg", force=True)
    import matplotlib.pyplot as plt
    from matplotlib.lines import Line2D

    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    non_fused_color = "#d9903d"
    fused_color = "#1769aa"
    merged_node_color = "#d32f2f"
    fig, axes = plt.subplots(1, 2, figsize=(18, 9))
    micro_to_macro = expansion.get("micro_to_macro", {})
    macro_to_roads = expansion.get("macro_to_roads", {})
    fused_macro_ids = {
        macro_id
        for macro_id, source_roads in macro_to_roads.items()
        if len(source_roads) > 1
    }
    merged_node_ids = _merged_internal_node_ids(macro_mapping, fused_macro_ids)

    _plot_mapping_roads(axes[0], original_mapping, color=non_fused_color, linewidth=0.65)
    for road in original_mapping.get("roads", []):
        macro_id = micro_to_macro.get(road["id"])
        if macro_id in fused_macro_ids:
            _plot_single_road(
                axes[0],
                road,
                color=fused_color,
                linewidth=2.4,
                alpha=0.95,
            )
    _plot_merged_nodes(
        axes[0],
        original_mapping,
        merged_node_ids,
        color=merged_node_color,
    )
    axes[0].set_title(
        f"Original mapping: {len(original_mapping.get('roads', []))} roads, "
        f"{len(original_mapping.get('nodes', []))} nodes"
    )

    for road in macro_mapping.get("roads", []):
        source_count = len(macro_to_roads.get(road["id"], [road["id"]]))
        color = fused_color if source_count > 1 else non_fused_color
        linewidth = 2.8 if source_count > 1 else 0.7
        _plot_single_road(axes[1], road, color=color, linewidth=linewidth, alpha=0.95)
    axes[1].set_title(
        f"Planning mapping: {len(macro_mapping.get('roads', []))} roads, "
        f"{len(macro_mapping.get('nodes', []))} nodes"
    )

    for ax, current_mapping in zip(axes, (original_mapping, macro_mapping)):
        _plot_required_special_nodes(ax, current_mapping, start_loc, goal_loc)
        ax.set_aspect("equal", adjustable="box")
        ax.axis("off")

    macro_count = len(fused_macro_ids)
    merged_micro_count = sum(
        len(source_ids)
        for source_ids in macro_to_roads.values()
        if len(source_ids) > 1
    )
    fig.suptitle(
        "Macro Road Abstraction: "
        f"{macro_count} macro-road da {merged_micro_count} micro-road fuse unite",
        fontsize=13,
    )
    handles = [
        Line2D([0], [0], color=non_fused_color, linewidth=1.8, label="micro-road non fuse"),
        Line2D([0], [0], color=fused_color, linewidth=3.0, label="micro-road fuse / macro-road"),
        Line2D([0], [0], marker="o", color="w", markerfacecolor=merged_node_color, markeredgecolor="white", markersize=8, label="nodo intermedio fuso"),
        Line2D([0], [0], marker="o", color="w", markerfacecolor="#2e7d32", markersize=8, label="start"),
        Line2D([0], [0], marker="o", color="w", markerfacecolor="#c62828", markersize=8, label="goal"),
        Line2D([0], [0], marker="^", color="w", markerfacecolor="#f9a825", markersize=8, label="traffic light"),
        Line2D([0], [0], marker="D", color="w", markerfacecolor="#7b1fa2", markersize=7, label="fuel station"),
    ]
    fig.legend(handles=handles, loc="lower center", ncol=7)
    fig.tight_layout(rect=(0, 0.06, 1, 0.96))
    fig.savefig(output_path, dpi=160, bbox_inches="tight", facecolor="white")
    plt.close(fig)


def macro_report_to_text(report: dict[str, Any]) -> str:
    stats = report["stats"]
    lines = [
        "Macro-Road Abstraction Report",
        "================================",
        f"Start: {report['start_loc']}",
        f"Goal: {report['goal_loc']}",
        "",
        "Stats",
        "-----",
        f"Original nodes: {stats['original_nodes']}",
        f"Original roads: {stats['original_roads']}",
        f"Planning nodes: {stats['planning_nodes']}",
        f"Planning roads: {stats['planning_roads']}",
        f"Road compression ratio: {stats['road_compression_ratio']}",
        f"Node compression ratio: {stats['node_compression_ratio']}",
        f"Macro-roads created: {stats['macro_roads_created']}",
        f"Micro-roads merged: {stats['micro_roads_merged']}",
        "",
        "Stop Reasons",
        "------------",
    ]
    for reason, count in report["stop_reasons"].items():
        lines.append(f"- {reason}: {count}")

    lines.extend(["", "Protected Nodes", "---------------"])
    for reason, count in report["protected_node_counts"].items():
        lines.append(f"- {reason}: {count}")

    lines.extend(["", "Macro-Roads", "-----------"])
    for item in report["macro_roads"]:
        lines.append(
            f"- {item['id']}: {item['from']} -> {item['to']}, "
            f"{item['length']} m, {len(item['source_roads'])} segments"
        )
        lines.append(f"  source_roads: {', '.join(item['source_roads'])}")
    return "\n".join(lines) + "\n"


def _grow_chain(
    start_road: dict[str, Any],
    roads_by_id: dict[str, dict[str, Any]],
    outgoing: dict[str, list[dict[str, Any]]],
    protected_nodes: set[str],
    protected_stop_reasons: dict[str, str],
    config: RoadAbstractionConfig,
) -> tuple[list[dict[str, Any]], str]:
    chain = [start_road]
    seen_roads = {start_road["id"]}
    seen_nodes = {start_road["from"], start_road["to"]}
    total_length = float(start_road.get("length", 0.0))
    capacity_class = road_capacity_class(start_road)

    while len(chain) < config.max_segments_per_macro:
        current = chain[-1]
        current_to = current["to"]
        if current_to in protected_nodes:
            return chain, protected_stop_reasons.get(current_to, "protected_node")

        candidates = [
            road
            for road in outgoing.get(current_to, [])
            if road["id"] not in seen_roads
            and road["to"] != current["from"]
        ]
        if len(candidates) == 0:
            return chain, "dead_end"
        if len(candidates) > 1:
            return chain, "branch"

        candidate = candidates[0]
        if candidate["id"] not in roads_by_id:
            return chain, "unknown_candidate"
        if candidate["to"] in seen_nodes:
            return chain, "cycle"

        reason = _merge_block_reason(chain, candidate, total_length, capacity_class, config)
        if reason is not None:
            return chain, reason

        chain.append(candidate)
        seen_roads.add(candidate["id"])
        seen_nodes.add(candidate["to"])
        total_length += float(candidate.get("length", 0.0))

    return chain, "max_segments"


def _merge_block_reason(
    chain: list[dict[str, Any]],
    candidate: dict[str, Any],
    total_length: float,
    capacity_class: str,
    config: RoadAbstractionConfig,
) -> str | None:
    if total_length + float(candidate.get("length", 0.0)) > config.max_length_meters:
        return "max_length"

    if (
        config.require_same_capacity_class
        and road_capacity_class(candidate) != capacity_class
    ):
        return "class_mismatch"

    previous_speed = float(chain[-1].get("speed", 0.0) or 0.0)
    candidate_speed = float(candidate.get("speed", 0.0) or 0.0)
    if previous_speed > 0 and candidate_speed > 0:
        relative_diff = abs(previous_speed - candidate_speed) / previous_speed
        if relative_diff > config.speed_tolerance_ratio:
            return "speed_mismatch"

    return None


def _aggregate_macro_road(
    road_id: str,
    chain: list[dict[str, Any]],
    is_macro: bool,
) -> dict[str, Any]:
    total_length = round(sum(float(road.get("length", 0.0)) for road in chain), 2)
    speed = _harmonic_speed(chain, total_length)
    highway = _aggregate_highway(chain)
    geometry = _concat_geometry(chain)

    macro_road = {
        "id": road_id,
        "from": chain[0]["from"],
        "to": chain[-1]["to"],
        "length": total_length,
        "speed": speed,
        "highway": highway,
        "geometry": geometry,
        "source_roads": [road["id"] for road in chain],
        "source_nodes": [chain[0]["from"]] + [road["to"] for road in chain],
        "is_macro": is_macro,
        "macro_size": len(chain),
    }
    if "speed_ms" in chain[0]:
        macro_road["speed_ms"] = speed
    return macro_road


def _harmonic_speed(chain: list[dict[str, Any]], total_length: float) -> float:
    denominator = 0.0
    for road in chain:
        speed = float(road.get("speed", road.get("speed_ms", 0.0)) or 0.0)
        if speed <= 0:
            return 0.01
        denominator += float(road.get("length", 0.0)) / speed
    if denominator <= 0:
        return 0.01
    return round(total_length / denominator, 3)


def _aggregate_highway(chain: list[dict[str, Any]]) -> Any:
    tags: list[str] = []
    for road in chain:
        highway = road.get("highway")
        if isinstance(highway, list):
            tags.extend(str(item) for item in highway if item)
        elif highway:
            tags.append(str(highway))
    unique = []
    for tag in tags:
        if tag not in unique:
            unique.append(tag)
    if not unique:
        return None
    return unique[0] if len(unique) == 1 else unique


def _concat_geometry(chain: list[dict[str, Any]]) -> list[list[float]]:
    geometry: list[list[float]] = []
    for road in chain:
        points = road.get("geometry") or []
        if not points:
            continue
        if geometry and points and geometry[-1] == points[0]:
            geometry.extend(points[1:])
        else:
            geometry.extend(points)
    return geometry


def _outgoing_roads(roads: list[dict[str, Any]]) -> dict[str, list[dict[str, Any]]]:
    outgoing: dict[str, list[dict[str, Any]]] = {}
    for road in roads:
        outgoing.setdefault(road["from"], []).append(road)
    for items in outgoing.values():
        items.sort(key=lambda road: road["id"])
    return outgoing


def _undirected_neighbor_counts(roads: list[dict[str, Any]]) -> dict[str, int]:
    neighbors: dict[str, set[str]] = {}
    for road in roads:
        neighbors.setdefault(road["from"], set()).add(road["to"])
        neighbors.setdefault(road["to"], set()).add(road["from"])
    return {node_id: len(items) for node_id, items in neighbors.items()}


def _protected_nodes(
    nodes_by_id: dict[str, dict[str, Any]],
    neighbor_count: dict[str, int],
    start_loc: str,
    goal_loc: str,
) -> tuple[set[str], dict[str, set[str]], dict[str, str]]:
    reasons: dict[str, set[str]] = {}

    def add(node_id: str, reason: str) -> None:
        reasons.setdefault(reason, set()).add(node_id)

    add(start_loc, "start")
    add(goal_loc, "goal")
    for node_id, node in nodes_by_id.items():
        if node.get("traffic_light"):
            add(node_id, "traffic_light")
        if node.get("fuel_station"):
            add(node_id, "fuel_station")
        if neighbor_count.get(node_id, 0) > 2:
            add(node_id, "branch")

    protected = set().union(*reasons.values()) if reasons else set()
    stop_reasons: dict[str, str] = {}
    priority = [
        ("start", "start_goal"),
        ("goal", "start_goal"),
        ("traffic_light", "traffic_light"),
        ("fuel_station", "fuel_station"),
        ("branch", "branch"),
    ]
    for reason, stop_reason in priority:
        for node_id in reasons.get(reason, set()):
            stop_reasons.setdefault(node_id, stop_reason)
    return protected, reasons, stop_reasons


def _build_report(
    original_mapping: dict[str, Any],
    macro_mapping: dict[str, Any],
    expansion: dict[str, Any],
    stop_reasons: Counter[str],
    protected_reasons: dict[str, set[str]],
    start_loc: str,
    goal_loc: str,
) -> dict[str, Any]:
    macro_to_roads = expansion["macro_to_roads"]
    macro_entries = []
    for road in macro_mapping.get("roads", []):
        source_roads = macro_to_roads.get(road["id"], [road["id"]])
        if len(source_roads) < 2:
            continue
        macro_entries.append({
            "id": road["id"],
            "from": road["from"],
            "to": road["to"],
            "length": road["length"],
            "speed": road["speed"],
            "capacity_class": road_capacity_class(road),
            "source_roads": source_roads,
            "source_nodes": road.get("source_nodes", []),
        })

    original_roads = len(original_mapping.get("roads", []))
    planning_roads = len(macro_mapping.get("roads", []))
    original_nodes = len(original_mapping.get("nodes", []))
    planning_nodes = len(macro_mapping.get("nodes", []))
    micro_roads_merged = sum(len(item["source_roads"]) for item in macro_entries)
    original_nodes_by_id = {
        node["id"]: node
        for node in original_mapping.get("nodes", [])
    }
    planning_node_ids = {
        node["id"]
        for node in macro_mapping.get("nodes", [])
    }
    protected_node_reasons: dict[str, list[str]] = {}
    for reason, node_ids in protected_reasons.items():
        for node_id in node_ids:
            protected_node_reasons.setdefault(node_id, []).append(reason)
    protected_nodes = [
        {
            "id": node_id,
            "reasons": sorted(reasons),
            "x": original_nodes_by_id.get(node_id, {}).get("x"),
            "y": original_nodes_by_id.get(node_id, {}).get("y"),
        }
        for node_id, reasons in sorted(protected_node_reasons.items())
    ]
    merged_internal_nodes = [
        {
            "id": node_id,
            "x": node.get("x"),
            "y": node.get("y"),
        }
        for node_id, node in sorted(original_nodes_by_id.items())
        if node_id not in planning_node_ids
    ]

    return {
        "start_loc": start_loc,
        "goal_loc": goal_loc,
        "stats": {
            "original_nodes": original_nodes,
            "original_roads": original_roads,
            "planning_nodes": planning_nodes,
            "planning_roads": planning_roads,
            "road_compression_ratio": _ratio(planning_roads, original_roads),
            "node_compression_ratio": _ratio(planning_nodes, original_nodes),
            "macro_roads_created": len(macro_entries),
            "micro_roads_merged": micro_roads_merged,
        },
        "macro_roads": macro_entries,
        "metric_descriptions": METRIC_DESCRIPTIONS,
        "stop_reason_descriptions": {
            reason: STOP_REASON_DESCRIPTIONS.get(reason, "Undocumented stop reason.")
            for reason in sorted(set(stop_reasons) | set(STOP_REASON_DESCRIPTIONS))
        },
        "stop_reasons": dict(sorted(stop_reasons.items())),
        "protected_node_counts": {
            reason: len(nodes)
            for reason, nodes in sorted(protected_reasons.items())
        },
        "protected_nodes": protected_nodes,
        "merged_internal_nodes": merged_internal_nodes,
    }


def _ratio(value: int, total: int) -> float:
    if total <= 0:
        return 0.0
    return round(value / total, 4)


def _plot_mapping_roads(
    ax: Any,
    mapping: dict[str, Any],
    color: str,
    linewidth: float,
) -> None:
    for road in mapping.get("roads", []):
        _plot_single_road(ax, road, color=color, linewidth=linewidth, alpha=0.75)


def _merged_internal_node_ids(
    macro_mapping: dict[str, Any],
    fused_macro_ids: set[str],
) -> set[str]:
    merged_nodes: set[str] = set()
    for road in macro_mapping.get("roads", []):
        if road["id"] not in fused_macro_ids:
            continue
        source_nodes = list(road.get("source_nodes") or [])
        if len(source_nodes) > 2:
            merged_nodes.update(source_nodes[1:-1])
    return merged_nodes


def _plot_single_road(
    ax: Any,
    road: dict[str, Any],
    color: Any,
    linewidth: float,
    alpha: float,
) -> None:
    geometry = road.get("geometry") or []
    if len(geometry) < 2:
        return
    ax.plot(
        [point[0] for point in geometry],
        [point[1] for point in geometry],
        color=color,
        linewidth=linewidth,
        alpha=alpha,
        solid_capstyle="round",
        zorder=2,
    )


def _plot_mapping_nodes(
    ax: Any,
    mapping: dict[str, Any],
    size: float,
    color: str,
) -> None:
    xs = [float(node["x"]) for node in mapping.get("nodes", [])]
    ys = [float(node["y"]) for node in mapping.get("nodes", [])]
    if xs:
        ax.scatter(xs, ys, s=size, color=color, edgecolors="none", zorder=3)


def _plot_merged_nodes(
    ax: Any,
    mapping: dict[str, Any],
    merged_node_ids: set[str],
    color: str,
) -> None:
    if not merged_node_ids:
        return
    nodes_by_id = {node["id"]: node for node in mapping.get("nodes", [])}
    xs = []
    ys = []
    for node_id in sorted(merged_node_ids):
        node = nodes_by_id.get(node_id)
        if node is None:
            continue
        xs.append(float(node["x"]))
        ys.append(float(node["y"]))
    if xs:
        ax.scatter(
            xs,
            ys,
            s=48,
            marker="o",
            color=color,
            edgecolors="white",
            linewidths=0.8,
            zorder=7,
        )


def _plot_required_special_nodes(
    ax: Any,
    mapping: dict[str, Any],
    start_loc: str,
    goal_loc: str,
) -> None:
    reasons_by_node = _protected_node_reasons_for_plot(mapping, start_loc, goal_loc)
    styles = {
        "start": ("o", "#2e7d32", 70),
        "goal": ("o", "#c62828", 70),
        "traffic_light": ("^", "#f9a825", 44),
        "fuel_station": ("D", "#7b1fa2", 42),
    }

    for node in mapping.get("nodes", []):
        reasons = reasons_by_node.get(node["id"], [])
        if not reasons:
            continue
        reason = _primary_protected_reason(reasons)
        if reason == "branch":
            continue
        marker, color, size = styles[reason]
        ax.scatter(
            node["x"],
            node["y"],
            s=size,
            marker=marker,
            color=color,
            edgecolors="white",
            linewidths=0.6,
            zorder=6,
        )


def _protected_node_reasons_for_plot(
    mapping: dict[str, Any],
    start_loc: str,
    goal_loc: str,
) -> dict[str, list[str]]:
    nodes_by_id = {node["id"]: node for node in mapping.get("nodes", [])}
    neighbor_count = _undirected_neighbor_counts(mapping.get("roads", []))
    _, protected_reasons, _ = _protected_nodes(
        nodes_by_id,
        neighbor_count,
        start_loc,
        goal_loc,
    )
    by_node: dict[str, list[str]] = {}
    for reason, node_ids in protected_reasons.items():
        for node_id in node_ids:
            by_node.setdefault(node_id, []).append(reason)
    return {
        node_id: sorted(reasons)
        for node_id, reasons in by_node.items()
    }


def _primary_protected_reason(reasons: list[str]) -> str:
    for reason in ("start", "goal", "traffic_light", "fuel_station", "branch"):
        if reason in reasons:
            return reason
    return "branch"


def _write_json(payload: dict[str, Any], path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, ensure_ascii=False), encoding="utf-8")
