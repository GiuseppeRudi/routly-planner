from __future__ import annotations

import osmnx as ox


from pathlib import Path
import sys

PROJECT_ROOT = Path.cwd()


sys.path.insert(0, str(PROJECT_ROOT))


from src.routly.config import load_config
from src.routly.graph.graph_export import plot_plan_from_mapping
from src.routly.pddl.mapping import load_mapping
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.planning.planner_runner import run_enhsp


def main() -> None:
    config = load_config(
        area_config_path="config/bologna_area.yaml",
        project_config_path="config/project_settings.yaml",
    )

    run_enhsp(
        enhsp_jar=config.enhsp_jar,
        domain_path=config.domain_path,
        problem_path=config.problem_path,
        plan_path=config.plan_path,
    )

    mapping = load_mapping(config.mapping_path)

    plan_text = config.plan_path.read_text(encoding="utf-8")
    planned_roads = parse_start_traversal_roads(plan_text)

    print(f"Roads in plan: {len(planned_roads)}")

    plot_plan_from_mapping(
        mapping=mapping,
        planned_roads=planned_roads,
        output_path=config.output_dir / "road_network_plan.png",
    )

    print("\nOUTPUT FILES:")
    print(f"  Plan:       {config.plan_path}")
    print(f"  Plan image: {config.output_dir / 'road_network_plan.png'}")


if __name__ == "__main__":
    main()