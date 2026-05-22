from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Any

import yaml


@dataclass(frozen=True)
class ProjectConfig:
    # OSM / map config
    place_name: str
    network_type: str

    # Graph simplification config
    keep_largest_component: bool
    remove_isolated_nodes: bool
    distance_meters: int | None
    max_nodes: int | None

    # Planner / simulator config
    vehicle_id: str
    enhsp_jar: Path
    sumo_gui: str

    # Root
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
        """
        Scenario folder based on graph size.

        Example:
        max_nodes = 80 -> nodes_80
        max_nodes = None -> full_network
        """
        if self.max_nodes is None:
            return "full_network"

        return f"nodes_{self.max_nodes}"

    @property
    def city_dir(self) -> Path:
        """
        Example:
        data/Bologna_Emilia-Romagna_Italy
        """
        return self.project_root / "data" / self.place_slug

    @property
    def simulation_dir(self) -> Path:
        """
        Example:
        data/Bologna_Emilia-Romagna_Italy/nodes_80
        """
        return self.city_dir / self.scenario_slug

    @property
    def output_dir(self) -> Path:
        """
        Alias kept for compatibility with existing scripts.

        Old meaning:
        data/processed/maps/<place_slug>

        New meaning:
        data/<place_slug>/<scenario_slug>
        """
        return self.simulation_dir

    @property
    def raw_graphml_path(self) -> Path:
        """
        GraphML is now simulation-specific.

        Example:
        data/Bologna_Emilia-Romagna_Italy/nodes_80/road_network.graphml
        """
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
        """
        Domain is global because it is not specific to a city/scenario.
        """
        return self.project_root / "pddl" / "domains" / "domain-road-network.pddl"

    @property
    def problem_path(self) -> Path:
        """
        Problem is simulation-specific.
        """
        return self.simulation_dir / "problem.pddl"

    @property
    def plan_path(self) -> Path:
        """
        ENHSP plan is simulation-specific.
        """
        return self.simulation_dir / "plan.txt"

    @property
    def scenarios_dir(self) -> Path:
        """
        Folder for interactive/custom scenarios generated on this map.
        """
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


def _read_yaml(path: str | Path) -> dict[str, Any]:
    path = Path(path)

    if not path.exists():
        raise FileNotFoundError(f"Configuration file not found: {path}")

    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def load_config(
    area_config_path: str | Path,
    project_config_path: str | Path,
) -> ProjectConfig:
    area_config = _read_yaml(area_config_path)
    project_config = _read_yaml(project_config_path)

    osm_config = area_config.get("osm", {})
    graph_config = area_config.get("graph_simplification", {})

    planner_config = project_config.get("planner", {})
    sumo_config = project_config.get("sumo", {})
    general_config = project_config.get("project", {})

    project_root = Path(general_config.get("project_root", "."))

    return ProjectConfig(
        place_name=osm_config.get("place_name", "Bologna, Emilia-Romagna, Italy"),
        network_type=osm_config.get("network_type", "drive"),

        keep_largest_component=graph_config.get("keep_largest_component", True),
        remove_isolated_nodes=graph_config.get("remove_isolated_nodes", True),
        distance_meters=graph_config.get("distance_meters"),
        max_nodes=graph_config.get("max_nodes"),

        vehicle_id=project_config.get("vehicle_id", "car1"),
        enhsp_jar=Path(planner_config.get("enhsp_jar", "planners/enhsp/enhsp-20.jar")),
        sumo_gui=sumo_config.get("sumo_gui", "sumo-gui"),

        project_root=project_root,
    )