from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Any

import yaml

import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.utils import read_yaml


@dataclass(frozen=True)
class ProjectConfig:

    seed: int
    place_name: str
    network_type: str

    keep_largest_component: bool
    remove_isolated_nodes: bool
    distance_meters: int 
    max_nodes: int 

    enhsp_jar: Path
    sumo_gui: str
    project_root: Path

    @property
    def place_slug(self) -> str:
        """
        Example:
        Bologna, Emilia-Romagna, Italy
        -> Bologna_Emilia-Romagna_Italy
        """
        slug = self.place_name.replace(",", "").replace(" ", "_")
        return re.sub(r"[^A-Za-z0-9_\-]", "", slug)

    @property
    def scenario_slug(self) -> str:
        return f"nodes_{self.max_nodes}"

    @property
    def city_dir(self) -> Path:
        return self.project_root / "data" / self.place_slug

    @property
    def simulation_dir(self) -> Path:
        return self.city_dir / self.scenario_slug

    @property
    def output_dir(self) -> Path:
        return self.simulation_dir

    @property
    def raw_graphml_path(self) -> Path:
        return self.simulation_dir / "road_network.graphml"

    @property
    def mapping_path(self) -> Path:
        return self.simulation_dir / "roads_mapping.json"

    @property
    def graph_image_path(self) -> Path:
        return self.simulation_dir / "road_network_graph.png"

    @property
    def plan_image_path(self) -> Path:
        return self.simulation_dir / "road_network_plan.png"

    @property
    def domain_path(self) -> Path:
        return self.project_root / "domain" / "dynamic_domain.pddl"

    @property
    def problem_path(self) -> Path:
        return self.simulation_dir / "problem.pddl"

    @property
    def plan_path(self) -> Path:
        return self.simulation_dir / "plan.txt"

    @property
    def scenarios_dir(self) -> Path:
        return self.simulation_dir / "scenarios"

    @property
    def sumo_nod_path(self) -> Path:
        return self.simulation_dir / "road_network.nod.xml"

    @property
    def sumo_edg_path(self) -> Path:
        return self.simulation_dir / "road_network.edg.xml"

    @property
    def sumo_net_path(self) -> Path:
        return self.simulation_dir / "road_network.net.xml"

    @property
    def sumo_rou_path(self) -> Path:
        return self.simulation_dir / "road_network.rou.xml"

    @property
    def sumo_cfg_path(self) -> Path:
        return self.simulation_dir / "road_network.sumocfg"

    @property
    def sumo_viewsettings_path(self) -> Path:
        return self.simulation_dir / "viewsettings.xml"

    @property
    def background_routes_path(self) -> Path:
        return self.simulation_dir / "background_routes.json"

    @property
    def traffic_light_timings_path(self) -> Path:
        return self.simulation_dir / "traffic_light_timings.json"

    @property
    def fuel_stations_path(self) -> Path:
        return self.simulation_dir / "fuel_stations.json"

    @property
    def fuel_poi_path(self) -> Path:
        return self.simulation_dir / "fuel_stations.add.xml"


def  load_config(
    area_config_path: str | Path,
    project_config_path: str | Path,
) -> ProjectConfig:
    area_config = read_yaml(area_config_path)
    project_config = read_yaml(project_config_path)

    osm_config = area_config.get("osm", {})
    graph_config = area_config.get("graph_simplification", {})

    planner_config = project_config.get("planner", {})
    sumo_config = project_config.get("sumo", {})
    general_config = project_config.get("project", {})

    if "seed" not in general_config:
        raise ValueError("Missing required project.seed in project configuration")

    project_root = Path(general_config.get("project_root", "."))

    return ProjectConfig(
        seed=int(general_config["seed"]),
        place_name=osm_config["place_name"],
        network_type=osm_config["network_type"],

        keep_largest_component=graph_config["keep_largest_component"],
        remove_isolated_nodes=graph_config["remove_isolated_nodes"],
        distance_meters=graph_config.get("distance_meters"),
        max_nodes=graph_config.get("max_nodes"),

        enhsp_jar=Path(planner_config["enhsp_jar"]),
        sumo_gui=sumo_config["sumo_gui"],

        project_root=project_root,
    )
