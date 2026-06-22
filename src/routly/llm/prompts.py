from __future__ import annotations

import json
from typing import Any


def build_random_prompt(
    candidates: list[dict[str, Any]],
    node_count: int,
    road_count: int,
    max_events: int,
    max_roads_per_event: int,
    max_total_closures: int,
) -> str:
    """Prompt used when strategic_injection is False: the LLM only sees a
    random sample of roads and their direct neighbors, with no notion of
    start/goal or overall topology."""
    return (
        f"You are a traffic incident generator for a specific city.\n"
        f"The road network has {node_count} intersections and {road_count} roads.\n"
        f"Generate between 1 and {max_events} traffic events using only the roads from the "
        f"candidate clusters below. Each cluster lists a road and the roads directly connected "
        f"to it (sharing an intersection).\n"
        f"Candidates: {json.dumps(candidates)}\n\n"
        f"Each event must have an \"event_type\":\n"
        f"  - \"accident\": blocks exactly one road.\n"
        f"  - \"roadworks\" or \"robbery\": blocks between 1 and {max_roads_per_event} roads, "
        f"which must be connected to each other (pick them from the same cluster, i.e. a road "
        f"plus one or more of its connected_to roads).\n"
        f"Do not reuse the same road in more than one event. The total number of closed roads "
        f"across all events must not exceed {max_total_closures}.\n"
        f"Important: intersections are closed by the pipeline only when two or more roads "
        f"from the same event share that intersection.\n"
        f"You must respond strictly in this JSON format, with no other text before or after:\n"
        f"{{\n"
        f"  \"events\": [\n"
        f"    {{\"event_type\": \"accident\", \"roads\": [\"road_XXXX\"], \"event_description\": \"Short description in English\"}}\n"
        f"  ]\n"
        f"}}"
    )


def build_strategic_prompt(
    topology: dict[str, Any],
    node_count: int,
    road_count: int,
    max_events: int,
    max_roads_per_event: int,
    max_total_closures: int,
    min_severity: float,
    max_severity: float,
) -> str:
    """Prompt used when strategic_injection is True: the LLM only sees a
    compact topology graph (start, goal, node degree, edges, node->roads
    lookup, geometric distance-to-axis) derived from the PDDL problem's
    :init block - never the route/plan computed by the solver. It must infer
    strategically relevant roads itself."""
    return (
        "You are a STRATEGIC ADVERSARY analyzing a road network's structure, "
        "playing the role of a disruption planner for a traffic resilience drill.\n\n"
        "You are given a simplified topology graph extracted from a planning problem: "
        "a set of intersections (nodes) and roads (edges) connecting them, including "
        "the vehicle's start and goal locations, each node's degree (number of roads "
        "touching it), a \"node_roads\" lookup mapping each node id to the list of road "
        "ids incident to it, and each road's \"distance_to_axis\" (perpendicular distance "
        "of the road's midpoint from the straight line between start and goal).\n\n"
        "IMPORTANT: You are NOT given any route, plan, or solver output. You must "
        "reason ONLY from the topology below to guess which roads are most likely "
        "to be structurally critical for travel between start and goal.\n\n"
        "Strategic reasoning guidelines:\n"
        "- Nodes with low degree (1-2) that sit between the start and goal area are "
        "likely 'bridge' connections - removing their roads can force long detours "
        "or disconnect the area entirely.\n"
        "- Nodes with high degree are major intersections; affecting roads there "
        "impacts many alternative paths at once.\n"
        "- Among similarly strategic candidates, prefer roads with a lower "
        "\"distance_to_axis\" - they are more likely to lie on a direct path between "
        "start and goal. This is a soft preference, not a strict rule: a structurally "
        "more critical road farther from the axis can still be a better pick.\n"
        "- Avoid targeting roads directly touching the start or goal node itself "
        "(too easy to detect / unrealistic for this scenario).\n\n"
        "How to build a MULTI-ROAD event (\"roadworks\", \"robbery\", \"slowdown\" with "
        "more than one road): first pick a candidate node from \"nodes\" (e.g. low "
        "degree, or low average distance_to_axis among its roads), then take 2 or more "
        "of its incident roads directly from \"node_roads\" - do not guess adjacency "
        "by eye from the edge list, read it from \"node_roads\".\n"
        "Prefer generating a number of events closer to the upper bound below, and "
        "multi-road clusters (2+ roads) over a single small event, whenever the "
        "topology plausibly supports it - but a smaller or simpler result is fine if "
        "you cannot justify more from the topology.\n\n"
        f"Network size: {node_count} intersections, {road_count} roads "
        f"(showing {len(topology['edges'])} edges"
        + (", topology truncated to a relevant subarea" if topology.get("truncated") else "")
        + f").\n\n"
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
        f"Respond strictly in this JSON format, no other text:\n"
        "{\n"
        '  "events": [\n'
        '    {"event_type": "roadworks", "roads": ["road_XXXX", "road_YYYY"], '
        '"event_description": "..."},\n'
        '    {"event_type": "slowdown", "roads": ["road_ZZZZ"], "severity": 2.5, '
        '"event_description": "..."}\n'
        "  ]\n"
        "}"
    )
