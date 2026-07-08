from __future__ import annotations

from pathlib import Path
import os
import re
import subprocess
import xml.etree.ElementTree as ET
from xml.dom import minidom


from pathlib import Path
import sys

PROJECT_ROOT = Path.cwd()


sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.domain.congestion import BackgroundRoute, generate_background_routes
from src.routly.planning.plan_parser import extract_start_traversal_timestamps
from src.routly.domain.traffic_lights import TrafficLightTiming


def _write_pretty_xml(root: ET.Element, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)

    rough = ET.tostring(root, "utf-8")
    pretty = minidom.parseString(rough).toprettyxml(indent="  ")
    path.write_text(pretty, encoding="utf-8")


def write_nod_xml(
        nodes: list[dict],
        path: str | Path,
        with_traffic_lights: bool = True,
    ) -> None:
    root = ET.Element("nodes")
    for node in nodes:
        is_tl = with_traffic_lights and node.get("traffic_light", False)
        node_type = "traffic_light" if is_tl else "priority"
        if is_tl:
            print(f"Node {node['id']} has traffic light.")
        ET.SubElement(
            root,
            "node",
            id=node["id"],
            x=str(round(node["x"], 2)),
            y=str(round(node["y"], 2)),
            type=node_type,
        )
    _write_pretty_xml(root, path)


def write_edg_xml(roads: list[dict], path: str | Path) -> None:
    root = ET.Element("edges")
    for road in roads:
        edge = ET.SubElement(
            root,
            "edge",
            id=road["id"],
            priority="-1",
            numLanes="1",
            speed=str(road["speed"]),
        )
        edge.set("from", road["from"])
        edge.set("to", road["to"])

        if road.get("geometry") and len(road["geometry"]) > 2:
            shape = " ".join(f"{p[0]:.2f},{p[1]:.2f}" for p in road["geometry"])
            edge.set("shape", shape)

    _write_pretty_xml(root, path)


def build_net(edge_file, node_file, net_file) -> None:
    net_file = Path(net_file)
    net_file.parent.mkdir(parents=True, exist_ok=True)
    cmd = [
        "netconvert",
        "--node-files", str(node_file),
        "--edge-files", str(edge_file),
        "--output-file", str(net_file),
        "--no-turnarounds", "true",
    ]
    print("Running:", " ".join(cmd))
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
    if result.stderr:
        print(result.stderr)
    if result.returncode != 0 or not net_file.exists():
        raise RuntimeError(
            f"netconvert didn't produce the network: {net_file}\n"
            f"return code: {result.returncode}\n"
            f"--- netconvert stderr ---\n{result.stderr}"
        )
    print(f"Network created: {net_file}")


def apply_traffic_light_timings(
    net_file: str | Path,
    timings: dict[str, TrafficLightTiming],
) -> None:
    """
    Apply per-junction timings while preserving netconvert's safe signal states.

    An all-red phase is inserted after yellow when netconvert did not already
    create one.
    """
    net_file = Path(net_file)
    tree = ET.parse(net_file)
    root = tree.getroot()

    for logic in root.findall("tlLogic"):
        timing = timings.get(logic.get("id", ""))
        if timing is None:
            continue

        phases = logic.findall("phase")
        for phase in phases:
            phase.set("duration", str(_duration_for_phase(phase, timing)))

        insertions: list[tuple[int, ET.Element]] = []
        for index, phase in enumerate(phases):
            if _phase_kind(phase) != "yellow":
                continue

            next_phase = phases[(index + 1) % len(phases)]
            if _phase_kind(next_phase) == "red":
                continue

            state = phase.get("state", "")
            insertions.append(
                (
                    index + 1,
                    ET.Element(
                        "phase",
                        duration=str(timing.red),
                        state="r" * len(state),
                    ),
                )
            )

        for index, phase in reversed(insertions):
            logic.insert(index, phase)

    tree.write(net_file, encoding="utf-8", xml_declaration=True)

def _read_net_offset(net_file) -> tuple[float, float]:
    loc = ET.parse(Path(net_file)).getroot().find("location")
    if loc is None:
        return (0.0, 0.0)
    dx, dy = (float(v) for v in loc.get("netOffset", "0,0").split(","))
    return dx, dy

def write_fuel_pois(stations: list[str], nodes: list[dict], path, net_file,
                    icon=None, chosen=None) -> None:
    """Write a SUMO additional file with one POI per fuel station.

    Stations in 'chosen' get an extra red halo POI drawn underneath so the
    stations selected by the planner/controller stand out.
    """
    from pathlib import Path
    nodes_by_id = {n["id"]: n for n in nodes}
    chosen_set = set(chosen or [])
    root = ET.Element("additional")
    dx, dy = _read_net_offset(net_file)
    for sid in stations:
        print(f"Adding fuel station POI for node {sid}"
              + (" [chosen]" if sid in chosen_set else ""))
        node = nodes_by_id.get(sid)
        if node is None:
            continue
        cx = round(node["x"] + dx, 2)
        cy = round(node["y"] + dy, 2)

        # red halo UNDER the icon for chosen stations
        if sid in chosen_set:
            ET.SubElement(root, "poi", id=f"fuel_sel_{sid}",
                x=str(cx), y=str(cy), type="fuel_chosen",
                layer="9", width="22", height="22", color="1,0.15,0.15")

        poi = ET.SubElement(root, "poi", id=f"fuel_{sid}",
            x=str(cx), y=str(cy),
            type="fuel", layer="10", width="10", height="10")
        if icon:
            poi.set("imgFile", str(Path(icon).resolve()))
        else:
            poi.set("color", "1,0.15,0.15" if sid in chosen_set else "0,0.6,0.2")
    _write_pretty_xml(root, path)

def _phase_kind(phase: ET.Element) -> str:
    state = phase.get("state", "")
    if "y" in state or "Y" in state:
        return "yellow"
    if "g" in state or "G" in state:
        return "green"
    return "red"


def _duration_for_phase(
    phase: ET.Element,
    timing: TrafficLightTiming,
) -> int:
    phase_kind = _phase_kind(phase)
    if phase_kind == "yellow":
        return timing.yellow
    if phase_kind == "green":
        return timing.green
    return timing.red


def write_rou_xml(
    edge_sequence: list[str],
    out_path,
    vehicle_id: str = "car1",
    depart_time: float = 0.0,
    background_vehicles: int = 0,
    all_roads: list[dict] | None = None,
    background_routes: list[BackgroundRoute] | None = None,
    seed: int | None = None,
    blocked_roads: list[str] | None = None,
    blocked_locations: list[str] | None = None,
    max_present_time: float | None = None,
    presence_safety_margin: float = 1.15,
    refuel_stops: list[str] | None = None,
    refuel_seconds: float = 0.0,
) -> None:
    """
    Write SUMO route XML.

    background_vehicles: number of extra vehicles to add for congestion simulation.
    all_road_ids: pool of road IDs to use for random background routes.
                  If None, background vehicles use the planned route (less realistic).
    """
    root = ET.Element("routes")
    ET.SubElement(root, "vType", id="car", accel="2.6", decel="4.5",
                  sigma="0.5", length="5.0", maxSpeed="13.9")

    # ── planned vehicle ───────────────────────────────────────────────────────
    vehicle = ET.SubElement(root, "vehicle",
                            id=vehicle_id, type="car",
                            depart=str(depart_time),
                            color="1,0,0")   # red — easy to spot
    ET.SubElement(vehicle, "route", edges=" ".join(edge_sequence))

    if refuel_stops and refuel_seconds > 0 and all_roads:
        road_to = {r["id"]: r["to"] for r in all_roads}
        remaining = list(refuel_stops) # station occurrences, in plan order
        for edge_id in edge_sequence: # scan in route order -> stops stay ordered
            if not remaining:
                break
            dest = road_to.get(edge_id)
            if dest is not None and dest in remaining:
                ET.SubElement(
                    vehicle,
                    "stop",
                    lane=f"{edge_id}_0", # single-lane edges -> lane index _0
                    duration=f"{refuel_seconds:.1f}",
                    parking="false", # halt on the lane (stays visible)
                )
                remaining.remove(dest)
        if remaining:
            print(
                f"WARNING: {len(remaining)} refuel station(s) {remaining} not "
                "matched to an edge in the route; no stop added for them."
            )

    # ── background vehicles ───────────────────────────────────────────────────
    closed_edges = set(blocked_roads) if blocked_roads else set()
    closed_nodes = set(blocked_locations) if blocked_locations else set()

    road_nodes = {}
    road_by_id = {}
    if all_roads:
        for r in all_roads:
            road_nodes[r["id"]] = (r["from"], r["to"])
            road_by_id[r["id"]] = r
    
    # time(road) = length / speed. Roads missing from the table are ignored.
    def _route_seconds(edges):
        total = 0.0
        for rid in edges:
            r = road_by_id.get(rid)
            if not r:
                continue
            speed = float(r.get("speed", 0) or 0)
            if speed > 0:
                total += float(r["length"]) / speed
        return total

    # if no explicit cap was given, derive it from the *actual* planned
    # route (we already have it here, so no estimate is needed).
    if max_present_time is None and road_by_id:
        planned = _route_seconds(edge_sequence)
        if planned > 0:
            max_present_time = planned * presence_safety_margin

    bg_routes = background_routes
    if bg_routes is None and background_vehicles > 0 and all_roads:
        if seed is None:
            raise ValueError(
                "A global seed is required when generating background routes"
            )
        # Filter the pool so random background routes do not even pick blocked infrastructure
        filtered_all_roads = [
            r for r in all_roads
            if r["id"] not in closed_edges
            and r["from"] not in closed_nodes
            and r["to"] not in closed_nodes
        ]
        
        bg_routes = generate_background_routes(filtered_all_roads, background_vehicles, seed)
    elif bg_routes is not None:
        # If background routes are pre-calculated, filter out any route touching blocked components
        filtered_bg_routes = []
        for depart, route in bg_routes:
            route_edges = route.edges if hasattr(route, "edges") else route
            valid = True
            for edge_id in route_edges:
                if edge_id in closed_edges:
                    valid = False
                    break
                if edge_id in road_nodes:
                    fr, to = road_nodes[edge_id]
                    if fr in closed_nodes or to in closed_nodes:
                        valid = False
                        break
            if valid:
                filtered_bg_routes.append((depart, route))
        bg_routes = filtered_bg_routes

    if bg_routes:
        for i, (depart, route) in enumerate(bg_routes):
            route_edges = route.edges if hasattr(route, "edges") else route
            bg = ET.SubElement(root, "vehicle",
                               id=f"bg_{i:04d}", type="car",
                               depart=str(depart), color="0.5,0.5,0.5")
            ET.SubElement(bg, "route", edges=" ".join(route_edges))
    _write_pretty_xml(root, out_path)

def parse_refuel_stops(plan_text: str) -> list[str]:
    stops: list[str] = []
    for line in plan_text.splitlines():
        m = re.search(r";;\s*refuel at\s+(\S+)", line)
        if not m:
            m = re.search(r"\(\s*refuel\s+\S+\s+(\S+)\s*\)", line)
        if m:
            stops.append(m.group(1).strip().rstrip(")"))
    return stops

def compute_simulation_end_time(
    plan_text: str,
    road_sequence: list[str],
    mapping: dict,
    buffer: float = 30,
    extra_seconds: float = 0.0,
) -> float:
    timestamps = extract_start_traversal_timestamps(plan_text)

    if not timestamps:
        print("WARNING: no timestamps found in plan. Using end=3600.")
        return 3600

    last_time = max(timestamps)

    if road_sequence:
        roads_by_id = {road["id"]: road for road in mapping["roads"]}
        last_road = roads_by_id.get(road_sequence[-1])
        if last_road and last_road.get("speed", 0) > 0:
            last_time += last_road["length"] / last_road["speed"]

    end_time = round(last_time + buffer + extra_seconds, 1)
    print(f"Simulation end time: {end_time}s")
    return end_time


def write_view_settings(path: str | Path) -> None:
    root = ET.Element("viewsettings")
    ET.SubElement(root, "delay", value="100")
    ET.SubElement(root, "scheme", name="real world")

    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    ET.ElementTree(root).write(path, encoding="utf-8", xml_declaration=True)


def write_sumocfg(
    net_file: str | Path,
    route_file: str | Path,
    cfg_file: str | Path,
    view_file: str | Path | None = None,
    begin: float = 0,
    end: float = 3600,
    seed: int | None = None,
    additional_files: list[str | Path] | None = None,
) -> None:
    cfg_file = Path(cfg_file)
    def cfg_path_value(path):
        # percorso ASSOLUTO: SUMO non deve risolvere '../../../'
        return str(Path(path).resolve()).replace(os.sep, "/")

    root = ET.Element("configuration")

    input_el = ET.SubElement(root, "input")
    ET.SubElement(input_el, "net-file", value=cfg_path_value(net_file))
    ET.SubElement(input_el, "route-files", value=cfg_path_value(route_file))

    if additional_files:
        ET.SubElement(
            input_el, "additional-files",
            value=",".join(cfg_path_value(p) for p in additional_files),
        )

    time_el = ET.SubElement(root, "time")
    ET.SubElement(time_el, "begin", value=str(begin))
    ET.SubElement(time_el, "end", value=str(end))

    processing = ET.SubElement(root, "processing")
    ET.SubElement(processing, "ignore-route-errors", value="true")
    ET.SubElement(processing, "time-to-teleport", value="60")

    report = ET.SubElement(root, "report")
    ET.SubElement(report, "no-warnings", value="true")

    if seed is not None:
        random_number = ET.SubElement(root, "random_number")
        ET.SubElement(random_number, "seed", value=str(seed))

    if view_file:
        gui_el = ET.SubElement(root, "gui_only")
        ET.SubElement(gui_el, "gui-settings-file", value=cfg_path_value(view_file))

    _write_pretty_xml(root, cfg_file)
