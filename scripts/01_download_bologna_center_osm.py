from pathlib import Path
import sys

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = PROJECT_ROOT / "src"

if str(SRC_DIR) not in sys.path:
    sys.path.insert(0, str(SRC_DIR))

from osm_pddl_bologna.osm.download_osm import download_graph_from_point, save_graphml
from osm_pddl_bologna.utils.paths import ensure_project_directories, RAW_DATA_DIR
from osm_pddl_bologna.utils.logging_utils import info, success


def main() -> None:
    ensure_project_directories()

    center_latitude = 44.4949
    center_longitude = 11.3426
    distance_meters = 1200

    info("Downloading OSM road network for Bologna city center")

    graph = download_graph_from_point(
        latitude=center_latitude,
        longitude=center_longitude,
        distance_meters=distance_meters,
        network_type="drive",
    )

    output_path = RAW_DATA_DIR / "osm" / "bologna_center_drive.graphml"
    save_graphml(graph, output_path)

    success(f"Graph saved to: {output_path}")
    info(f"Number of nodes: {len(graph.nodes)}")
    info(f"Number of edges: {len(graph.edges)}")


if __name__ == "__main__":
    main()
