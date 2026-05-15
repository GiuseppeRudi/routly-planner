from pathlib import Path
import sys

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = PROJECT_ROOT / "src"

if str(SRC_DIR) not in sys.path:
    sys.path.insert(0, str(SRC_DIR))

from osm_pddl_bologna.graph.graph_export import load_graph, save_graph
from osm_pddl_bologna.osm.simplify_osm_graph import (
    keep_largest_weakly_connected_component,
    limit_graph_size,
)
from osm_pddl_bologna.utils.paths import RAW_DATA_DIR, PROCESSED_DATA_DIR, ensure_project_directories
from osm_pddl_bologna.utils.logging_utils import info, success


def main() -> None:
    ensure_project_directories()

    input_path = RAW_DATA_DIR / "osm" / "bologna_center_drive.graphml"
    output_path = PROCESSED_DATA_DIR / "graphs" / "bologna_simplified_graph.graphml"

    info(f"Loading graph: {input_path}")
    graph = load_graph(input_path)

    info("Keeping largest connected component")
    graph = keep_largest_weakly_connected_component(graph)

    info("Limiting graph size for PDDL")
    graph = limit_graph_size(graph, max_nodes=80)

    save_graph(graph, output_path)

    success(f"Simplified graph saved to: {output_path}")
    info(f"Number of nodes: {len(graph.nodes)}")
    info(f"Number of edges: {len(graph.edges)}")


if __name__ == "__main__":
    main()
