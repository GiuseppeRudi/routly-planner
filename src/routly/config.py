from __future__ import annotations

from dataclasses import dataclass
import datetime
import os
from pathlib import Path
import re
from typing import Any

import sys

PROJECT_ROOT = Path.cwd()
sys.path.insert(0, str(PROJECT_ROOT))
from src.routly.utils import read_yaml

EXPERIMENT_NAME_ENV = "ROUTLY_EXPERIMENT_NAME"
VALID_TRAVERSAL_MODELS = {"process", "compiled_duration"}
STATE_REPRESENTATION_NODE_BASED = "node_based"
STATE_REPRESENTATION_LINE_GRAPH = "line_graph"
VALID_STATE_REPRESENTATIONS = {
    STATE_REPRESENTATION_NODE_BASED,
    STATE_REPRESENTATION_LINE_GRAPH,
}
ACTION_GENERATION_PARAMETERIZED = "parameterized"
ACTION_GENERATION_COMPILED = "compiled"
VALID_ACTION_GENERATION_MODES = {
    ACTION_GENERATION_PARAMETERIZED,
    ACTION_GENERATION_COMPILED,
}


@dataclass(frozen=True)
class ProjectConfig:

    seed: int
    experiment_name: str
    place_name: str
    network_type: str

    keep_largest_component: bool
    remove_isolated_nodes: bool
    distance_meters: int | None
    max_nodes: int | None

    enhsp_jar: Path
    java_heap_mb: int
    traversal_model: str
    state_representation: str
    action_generation: str
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
        nodes = self.max_nodes if self.max_nodes is not None else "all"
        distance = self.distance_meters if self.distance_meters is not None else "all"
        return f"nodes_{nodes}_distance_{distance}"

    @property
    def city_dir(self) -> Path:
        return self.project_root / "data" / self.place_slug

    @property
    def map_scenario_dir(self) -> Path:
        return self.city_dir / self.scenario_slug

    @property
    def experiment_dir(self) -> Path:
        return self.map_scenario_dir / self.experiment_name

    @property
    def output_dir(self) -> Path:
        return self.experiment_dir

    @property
    def config_dir(self) -> Path:
        return self.experiment_dir / "config"

    @property
    def scenario_path(self) -> Path:
        return self.config_dir / "scenario.yaml"

    @property
    def map_dir(self) -> Path:
        return self.experiment_dir / "map"

    @property
    def runs_dir(self) -> Path:
        return self.experiment_dir / "runs"

    @property
    def basic_run_dir(self) -> Path:
        return self.runs_dir / "basic"

    @property
    def llm_run_dir(self) -> Path:
        return self.runs_dir / "llm"

    @property
    def controller_run_dir(self) -> Path:
        return self.runs_dir / "controller"

    @property
    def basic_pddl_dir(self) -> Path:
        return self.basic_run_dir / "pddl"

    @property
    def basic_plans_dir(self) -> Path:
        return self.basic_run_dir / "plans"

    @property
    def basic_images_dir(self) -> Path:
        return self.basic_run_dir / "images"

    @property
    def basic_artifacts_dir(self) -> Path:
        return self.basic_run_dir / "artifacts"

    @property
    def basic_sumo_dir(self) -> Path:
        return self.basic_run_dir / "sumo"

    @property
    def llm_pddl_dir(self) -> Path:
        return self.llm_run_dir / "pddl"

    @property
    def llm_plans_dir(self) -> Path:
        return self.llm_run_dir / "plans"

    @property
    def llm_images_dir(self) -> Path:
        return self.llm_run_dir / "images"

    @property
    def llm_logs_dir(self) -> Path:
        return self.llm_run_dir / "logs"

    @property
    def llm_sumo_dir(self) -> Path:
        return self.llm_run_dir / "sumo"

    @property
    def controller_pddl_dir(self) -> Path:
        return self.controller_run_dir / "pddl"

    @property
    def controller_plans_dir(self) -> Path:
        return self.controller_run_dir / "plans"

    @property
    def controller_images_dir(self) -> Path:
        return self.controller_run_dir / "images"

    @property
    def controller_logs_dir(self) -> Path:
        return self.controller_run_dir / "logs"

    @property
    def controller_artifacts_dir(self) -> Path:
        return self.controller_run_dir / "artifacts"

    @property
    def controller_sumo_dir(self) -> Path:
        return self.controller_run_dir / "sumo"

    @property
    def sumo_dir(self) -> Path:
        return self.experiment_dir / "sumo"

    @property
    def raw_graphml_path(self) -> Path:
        return self.map_dir / "road_network.graphml"

    @property
    def mapping_path(self) -> Path:
        return self.map_dir / "roads_mapping.json"

    @property
    def macro_mapping_path(self) -> Path:
        return self.map_dir / "roads_mapping_macro.json"

    @property
    def macro_report_json_path(self) -> Path:
        return self.map_dir / "macro_roads_report.json"

    @property
    def macro_comparison_image_path(self) -> Path:
        return self.map_dir / "macro_roads_comparison.png"

    @property
    def legacy_graph_image_path(self) -> Path:
        return self.map_dir / "road_network_graph.png"

    @property
    def graph_base_image_path(self) -> Path:
        return self.map_dir / "road_network_graph_base.png"

    @property
    def graph_macro_image_path(self) -> Path:
        return self.map_dir / "road_network_graph_macro.png"

    @property
    def plan_image_path(self) -> Path:
        return self.basic_images_dir / "road_network_plan.png"

    @property
    def domain_path(self) -> Path:
        return self.basic_pddl_dir / "domain.pddl"

    @property
    def problem_path(self) -> Path:
        return self.basic_pddl_dir / "problem.pddl"

    @property
    def plan_path(self) -> Path:
        return self.basic_plans_dir / "plan.txt"

    @property
    def scenarios_dir(self) -> Path:
        return self.config_dir

    @property
    def dynamic_problem_path(self) -> Path:
        return self.llm_pddl_dir / "problem_dynamic.pddl"

    @property
    def dynamic_domain_path(self) -> Path:
        return self.llm_pddl_dir / "domain_dynamic.pddl"

    @property
    def dynamic_plan_path(self) -> Path:
        return self.llm_plans_dir / "plan_dynamic.sol"

    @property
    def dynamic_plan_image_path(self) -> Path:
        return self.llm_images_dir / "plan_dynamic.png"

    @property
    def event_map_path(self) -> Path:
        return self.llm_images_dir / "event_map.png"

    @property
    def congestion_map_pre_path(self) -> Path:
        return self.llm_images_dir / "congestion_map_pre.png"

    @property
    def congestion_map_post_path(self) -> Path:
        return self.llm_images_dir / "congestion_map_post.png"

    @property
    def incidents_log_path(self) -> Path:
        return self.llm_logs_dir / "incidents_log.json"

    @property
    def controller_plan_path(self) -> Path:
        return self.controller_plans_dir / "plan_controller.txt"

    @property
    def controller_domain_path(self) -> Path:
        return self.controller_pddl_dir / "domain.pddl"

    @property
    def controller_summary_path(self) -> Path:
        return self.controller_logs_dir / "controller_summary.json"

    @property
    def sumo_nod_path(self) -> Path:
        return self.sumo_dir / "road_network.nod.xml"

    @property
    def sumo_edg_path(self) -> Path:
        return self.sumo_dir / "road_network.edg.xml"

    @property
    def sumo_net_path(self) -> Path:
        return self.sumo_dir / "road_network.net.xml"

    @property
    def sumo_rou_path(self) -> Path:
        return self.basic_sumo_dir / "road_network.rou.xml"

    @property
    def sumo_cfg_path(self) -> Path:
        return self.basic_sumo_dir / "road_network.sumocfg"

    @property
    def dynamic_sumo_rou_path(self) -> Path:
        return self.llm_sumo_dir / "road_network_dynamic.rou.xml"

    @property
    def dynamic_sumo_cfg_path(self) -> Path:
        return self.llm_sumo_dir / "road_network_dynamic.sumocfg"

    @property
    def controller_sumo_rou_path(self) -> Path:
        return self.controller_sumo_dir / "road_network_controller.rou.xml"

    @property
    def controller_sumo_cfg_path(self) -> Path:
        return self.controller_sumo_dir / "road_network_controller.sumocfg"

    @property
    def sumo_viewsettings_path(self) -> Path:
        return self.sumo_dir / "viewsettings.xml"

    @property
    def background_routes_path(self) -> Path:
        return self.basic_artifacts_dir / "background_routes.json"

    @property
    def traffic_light_timings_path(self) -> Path:
        return self.basic_artifacts_dir / "traffic_light_timings.json"

    @property
    def fuel_stations_path(self) -> Path:
        return self.basic_artifacts_dir / "fuel_stations.json"

    @property
    def fuel_poi_path(self) -> Path:
        return self.sumo_dir / "fuel_stations.add.xml"


def load_config(
    project_config_path: str | Path,
) -> ProjectConfig:
    project_config = read_yaml(project_config_path)

    osm_config = project_config.get("osm", {})
    graph_config = project_config.get("graph_simplification", {})

    planner_config = project_config.get("planner", {})
    sumo_config = project_config.get("sumo", {})
    general_config = project_config.get("project", {})

    if "seed" not in general_config:
        raise ValueError("Missing required project.seed in project configuration")

    project_root = Path(general_config.get("project_root", "."))
    traversal_model = str(
        planner_config.get("traversal_model", "process")
    ).strip().lower()
    if traversal_model not in VALID_TRAVERSAL_MODELS:
        raise ValueError(
            "planner.traversal_model must be 'process' or 'compiled_duration'"
        )

    state_representation, action_generation = _resolve_planner_axes(planner_config)
    _validate_planner_mode_axes(
        traversal_model,
        state_representation,
        action_generation,
    )

    return ProjectConfig(
        seed=int(general_config["seed"]),
        experiment_name=resolve_experiment_name(project_config),
        place_name=osm_config["place_name"],
        network_type=osm_config["network_type"],

        keep_largest_component=graph_config["keep_largest_component"],
        remove_isolated_nodes=graph_config["remove_isolated_nodes"],
        distance_meters=graph_config.get("distance_meters"),
        max_nodes=graph_config.get("max_nodes"),

        enhsp_jar=Path(planner_config["enhsp_jar"]),
        java_heap_mb=int(planner_config.get("java_heap_mb", 4096)),
        traversal_model=traversal_model,
        state_representation=state_representation,
        action_generation=action_generation,
        sumo_gui=sumo_config["sumo_gui"],

        project_root=project_root,
    )


def _resolve_planner_axes(
    planner_config: dict[str, Any],
) -> tuple[str, str]:
    state_raw = planner_config.get("state_representation")
    action_raw = planner_config.get("action_generation")

    if state_raw is None and action_raw is None:
        return STATE_REPRESENTATION_NODE_BASED, ACTION_GENERATION_PARAMETERIZED

    if state_raw is None or action_raw is None:
        raise ValueError(
            "planner.state_representation and planner.action_generation must "
            "be configured together."
        )

    state_representation = str(state_raw).strip().lower()
    action_generation = str(action_raw).strip().lower()
    if state_representation not in VALID_STATE_REPRESENTATIONS:
        raise ValueError(
            "planner.state_representation must be 'node_based' or 'line_graph'"
        )
    if action_generation not in VALID_ACTION_GENERATION_MODES:
        raise ValueError(
            "planner.action_generation must be 'parameterized' or 'compiled'"
        )

    return state_representation, action_generation


def _validate_planner_mode_axes(
    traversal_model: str,
    state_representation: str,
    action_generation: str,
) -> None:
    if traversal_model != "compiled_duration":
        if (
            state_representation != STATE_REPRESENTATION_NODE_BASED
            or action_generation != ACTION_GENERATION_PARAMETERIZED
        ):
            raise ValueError(
                "planner.state_representation/action_generation are only "
                "configurable when planner.traversal_model='compiled_duration'. "
                "Use node_based/parameterized with traversal_model='process'."
            )
        return

    if state_representation == STATE_REPRESENTATION_LINE_GRAPH:
        raise ValueError(
            "planner.state_representation='line_graph' with "
            f"planner.action_generation='{action_generation}' is recognized "
            "but not implemented yet; line-graph support is reserved for "
            "future development."
        )


def resolve_experiment_name(project_config: dict[str, Any]) -> str:
    experiment_config = project_config.get("experiment", {})

    configured_name = experiment_config.get("name")
    if configured_name:
        return _safe_path_component(str(configured_name), fallback="experiment")

    env_name = os.environ.get(EXPERIMENT_NAME_ENV)
    if env_name:
        return _safe_path_component(env_name, fallback="experiment")

    prefix = _safe_path_component(
        str(experiment_config.get("name_prefix", "experiment")),
        fallback="experiment",
    )
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"{prefix}_{timestamp}"


def _safe_path_component(value: str, fallback: str) -> str:
    slug = re.sub(r"[^A-Za-z0-9_-]+", "_", value.strip())
    slug = slug.strip("_")
    return slug or fallback
