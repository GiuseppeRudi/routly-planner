from pathlib import Path
import xml.etree.ElementTree as ET


def read_sumo_edges(net_file: Path) -> list[dict[str, str]]:
    if not net_file.exists():
        raise FileNotFoundError(f"SUMO network file not found: {net_file}")

    tree = ET.parse(net_file)
    root = tree.getroot()

    edges: list[dict[str, str]] = []
    for edge in root.findall("edge"):
        if edge.get("function") == "internal":
            continue
        edges.append(dict(edge.attrib))

    return edges
