from pathlib import Path
import subprocess


def convert_osm_to_sumo(osm_file: Path, output_net_file: Path) -> None:
    """Convert an OSM file to a SUMO network using netconvert.

    SUMO must be installed separately and netconvert must be available in PATH.
    """
    if not osm_file.exists():
        raise FileNotFoundError(f"OSM file not found: {osm_file}")

    output_net_file.parent.mkdir(parents=True, exist_ok=True)

    command = [
        "netconvert",
        "--osm-files",
        str(osm_file),
        "--output-file",
        str(output_net_file),
    ]

    subprocess.run(command, check=True)
