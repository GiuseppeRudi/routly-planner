from __future__ import annotations


from pathlib import Path
import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))


from src.routly.config import load_config
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.sumo.sumo_runner import launch_sumo_gui
from src.routly.sumo.sumo_writer import (
    build_net,
    compute_simulation_end_time,
    write_edg_xml,
    write_nod_xml,
    write_rou_xml,
    write_sumocfg,
    write_view_settings,
)


def main() -> None:
    config = load_config("config/bologna_area.yaml")

    mapping = load_mapping(config.mapping_path)
    plan_text = config.plan_path.read_text(encoding="utf-8")
    road_sequence = parse_start_traversal_roads(plan_text)

    if not road_sequence:
        print("WARNING: no road sequence found in plan. Check ENHSP output format.")

    print(f"Found route with {len(road_sequence)} roads.")

    nod_xml = config.output_dir / "road_network.nod.xml"
    edg_xml = config.output_dir / "road_network.edg.xml"
    net_xml = config.output_dir / "road_network.net.xml"
    rou_xml = config.output_dir / "road_network.rou.xml"
    cfg_file = config.output_dir / "road_network.sumocfg"
    view_file = config.output_dir / "viewsettings.xml"

    write_nod_xml(mapping["nodes"], nod_xml)
    write_edg_xml(mapping["roads"], edg_xml)
    build_net(edg_xml, nod_xml, net_xml)

    write_rou_xml(
        road_sequence,
        out_path=rou_xml,
        vehicle_id=config.vehicle_id,
    )

    end_time = compute_simulation_end_time(plan_text, road_sequence, mapping)
    write_view_settings(view_file)
    write_sumocfg(net_xml, rou_xml, cfg_file, view_file=view_file, end=end_time)

    print("\nSUMO FILES CREATED:")
    print(f"  {nod_xml}")
    print(f"  {edg_xml}")
    print(f"  {net_xml}")
    print(f"  {rou_xml}")
    print(f"  {cfg_file}")

    launch_sumo_gui(cfg_file, sumo_gui=config.sumo_gui, vehicle_id=config.vehicle_id)


if __name__ == "__main__":
    main()
