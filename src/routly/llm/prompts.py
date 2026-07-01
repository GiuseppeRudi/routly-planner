from __future__ import annotations

import json
from typing import Any


def build_event_prompt(
    topology: dict[str, Any],
    node_count: int,
    road_count: int,
    max_events: int,
    max_roads_per_event: int,
    max_total_closures: int,
    min_severity: float,
    max_severity: float,
    strategic: bool,
) -> str:
    """Prompt used for both random and strategic injection: the LLM always
    receives the same compact topology graph (start, goal, node degree,
    edges, node->roads lookup, geometric distance-to-axis) derived from the
    PDDL problem's :init block - never the route/plan computed by the
    solver. The `strategic` flag only changes a couple of sentences about
    which roads to prefer; it never changes what data is sent."""
    if strategic:
        bias = (
            "Prefer roads with the lowest \"distance_to_axis\" values: they lie closest to "
            "the direct path between start and goal and are the most likely to force a detour "
            "when closed.\n\n"
        )
    else:
        bias = ""

    if strategic:
        topology_desc = (
            "a set of intersections (nodes) and roads (edges) connecting them, including "
            "the vehicle's start and goal locations, a \"node_roads\" lookup mapping each "
            "node id to the list of road ids incident to it, and each road's "
            "\"distance_to_axis\" (perpendicular distance of the road's midpoint from the "
            "straight line between start and goal)."
        )
    else:
        topology_desc = (
            "a set of intersections (nodes) and roads (edges) connecting them, including "
            "the vehicle's start and goal locations and a \"node_roads\" lookup mapping each "
            "node id to the list of road ids incident to it."
        )

    return (
        "You are a traffic incident generator analyzing a road network's structure.\n\n"
        "You are given a simplified topology graph extracted from a planning problem: "
        + topology_desc + "\n\n"
        "IMPORTANT: You are NOT given any route, plan, or solver output. Reason ONLY from "
        "the topology below.\n\n"
        + bias
        + "How to build a MULTI-ROAD event (\"roadworks\", \"robbery\", \"slowdown\" with "
        "more than one road): first pick a candidate node from \"nodes\", then take 2 or "
        "more of its incident roads directly from \"node_roads\" - do not guess adjacency "
        "by eye from the edge list, read it from \"node_roads\".\n"
        "Avoid targeting roads directly touching the start or goal node itself.\n\n"
        f"Network size: {node_count} intersections, {road_count} roads "
        f"(showing {len(topology['edges'])} edges"
        + (", topology truncated to a relevant subarea" if topology.get("truncated") else "")
        + ").\n\n"
        f"Topology:\n{json.dumps(topology)}\n\n"
        f"Generate between 1 and {max_events} traffic events using ONLY road ids "
        f"that appear in the topology above.\n"
        f"Each event has an \"event_type\":\n"
        f"  - \"accident\": blocks exactly one road completely.\n"
        f"  - \"roadworks\" or \"robbery\": blocks 1 to {max_roads_per_event} roads "
        f"completely; they must share an endpoint with each other (a connected cluster, "
        f"built via \"node_roads\" as explained above).\n"
        f"  - \"slowdown\": does NOT close the road. Use it to simulate light roadworks "
        f"or congestion; the road(s) stay usable but slower. Like roadworks, it can target "
        f"1 to {max_roads_per_event} connected roads. Include a \"severity\" number between "
        f"{min_severity} and {max_severity}, meaning the road's speed is divided by this factor "
        f"(higher severity = slower).\n"
        f"Do not reuse a road across events. Total roads affected by closing events "
        f"(\"accident\", \"roadworks\", \"robbery\") must not exceed {max_total_closures}; "
        f"\"slowdown\" roads do not count against this limit since the road stays open.\n"
        f"Briefly justify each choice in \"event_description\" in terms of the "
        f"topology (e.g. 'low-degree bridge node between the two areas'), in English.\n"
        f"Respond strictly in this JSON format. Output ONLY the JSON object - no "
        f"reasoning, explanation, or markdown before or after it (\"roads\" is a list of "
        f"1 to {max_roads_per_event} road ids - the example below shows the shape, not "
        f"the count you should use):\n"
        "{\n"
        '  "events": [\n'
        '    {"event_type": "roadworks", "roads": ["road_<id_1>", "...", "road_<id_N>"], '
        '"event_description": "..."},\n'
        '    {"event_type": "slowdown", "roads": ["road_<id_1>", "..."], "severity": 2.5, '
        '"event_description": "..."}\n'
        "  ]\n"
        "}"
    )
