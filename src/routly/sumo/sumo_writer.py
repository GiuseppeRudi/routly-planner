from __future__ import annotations

from pathlib import Path
import os
import subprocess
import xml.etree.ElementTree as ET
from xml.dom import minidom


from pathlib import Path
import sys

PROJECT_ROOT = Path.cwd()


sys.path.insert(0, str(PROJECT_ROOT))

from src.routly.planning.plan_parser import extract_start_traversal_timestamps


def _write_pretty_xml(root: ET.Element, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)

    rough = ET.tostring(root, "utf-8")
    pretty = minidom.parseString(rough).toprettyxml(indent="  ")
    path.write_text(pretty, encoding="utf-8")


def write_nod_xml(nodes: list[dict], path: str | Path) -> None:
    root = ET.Element("nodes")
    for node in nodes:
        ET.SubElement(
            root,
            "node",
            id=node["id"],
            x=str(round(node["x"], 2)),
            y=str(round(node["y"], 2)),
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


def build_net(edge_file: str | Path, node_file: str | Path, net_file: str | Path) -> None:
    cmd = [
        "netconvert",
        "--node-files", str(node_file),
        "--edge-files", str(edge_file),
        "--output-file", str(net_file),
        "--no-turnarounds", "true",
    ]
    print("Running:", " ".join(cmd))
    subprocess.run(cmd, check=True)


def write_rou_xml(
    edge_sequence: list[str],
    out_path: str | Path,
    vehicle_id: str = "car1",
    depart_time: float = 0.0,
) -> None:
    root = ET.Element("routes")
    ET.SubElement(
        root,
        "vType",
        id="car",
        accel="2.6",
        decel="4.5",
        sigma="0.5",
        length="5.0",
        maxSpeed="13.9",
    )
    vehicle = ET.SubElement(root, "vehicle", id=vehicle_id, type="car", depart=str(depart_time))
    ET.SubElement(vehicle, "route", edges=" ".join(edge_sequence))
    _write_pretty_xml(root, out_path)


def compute_simulation_end_time(
    plan_text: str,
    road_sequence: list[str],
    mapping: dict,
    buffer: float = 30,
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

    end_time = round(last_time + buffer, 1)
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
) -> None:
    root = ET.Element("configuration")

    input_el = ET.SubElement(root, "input")
    ET.SubElement(input_el, "net-file", value=os.path.basename(net_file))
    ET.SubElement(input_el, "route-files", value=os.path.basename(route_file))

    if view_file:
        ET.SubElement(input_el, "gui-settings-file", value=os.path.basename(view_file))

    time_el = ET.SubElement(root, "time")
    ET.SubElement(time_el, "begin", value=str(begin))
    ET.SubElement(time_el, "end", value=str(end))

    _write_pretty_xml(root, cfg_file)
