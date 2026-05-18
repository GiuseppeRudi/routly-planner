from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Any

import yaml


@dataclass(frozen=True)
class ProjectConfig:

    place_name: str
    network_type: str
    max_nodes: int | None
    vehicle_id: str
    enhsp_jar: Path
    sumo_gui: str
    project_root: Path

    @property
    def place_slug(self) -> str:
        slug = self.place_name.replace(",", "").replace(" ", "_")
        return re.sub(r"[^A-Za-z0-9_\-]", "", slug)

    @property
    def output_dir(self) -> Path:
        return self.project_root / "data" / "processed" / "maps" / self.place_slug

    @property
    def raw_graphml_path(self) -> Path:
        return (
            self.project_root
            / "data"
            / "raw"
            / "osm"
            / f"{self.place_slug}_{self.network_type}.graphml"
        )

    @property
    def mapping_path(self) -> Path:
        return self.output_dir / "roads_mapping.json"

    @property
    def domain_path(self) -> Path:
        return self.project_root / "pddl" / "domains" / "domain-road-network.pddl"

    @property
    def problem_path(self) -> Path:
        return self.project_root / "pddl" / "problems" / f"{self.place_slug}_problem.pddl"

    @property
    def plan_path(self) -> Path:
        return self.project_root / "pddl" / "plans" / f"{self.place_slug}_plan.txt"


def _read_yaml(path: str | Path) -> dict[str, Any]:
    path = Path(path)

    if not path.exists():
        raise FileNotFoundError(f"Configuration file not found: {path}")

    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def load_config(
    area_config_path: str ,
    project_config_path: str,
) -> ProjectConfig:
   

    area_config = _read_yaml(area_config_path)
    project_config = _read_yaml(project_config_path)

    osm_config = area_config.get("osm", {})
    graph_config = area_config.get("graph_simplification", {})
    planner_config = project_config.get("planner", {})
    sumo_config = project_config.get("sumo", {})
    general_config = project_config.get("project", {})

    project_root = Path(general_config.get("project_root", "."))

    enhsp_jar = Path(planner_config.get("enhsp_jar", {}))

    return ProjectConfig(
        place_name=osm_config.get("place_name", "Bologna, Emilia-Romagna, Italy"),
        network_type=osm_config.get("network_type", "drive"),
        max_nodes=graph_config.get("max_nodes_for_pddl"),
        vehicle_id=project_config.get("vehicle_id", "car1"),
        enhsp_jar=enhsp_jar,
        sumo_gui=sumo_config.get("sumo_gui", "sumo-gui"),
        project_root=project_root,
    )