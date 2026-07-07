from __future__ import annotations

import textwrap

import pytest

from src.routly.config import load_config
from src.routly.features import CongestionConfig, FeatureConfig
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.problem_generator import build_road_network_problem
from src.routly.planning.plan_parser import (
    parse_start_traversal_roads,
    parse_start_traversal_steps,
)


def _write_project_config(tmp_path, traversal_model: str) -> str:
    config_path = tmp_path / "project.yaml"
    config_path.write_text(
        textwrap.dedent(
            f"""
            project:
              project_root: "."
              seed: 1
            experiment:
              name: "test"
            osm:
              place_name: "Bologna, Italy"
              network_type: "drive"
            graph_simplification:
              keep_largest_component: true
              remove_isolated_nodes: true
              distance_meters: 1000
              max_nodes: 10
            planner:
              enhsp_jar: "planners/enhsp/enhsp-20.jar"
              traversal_model: "{traversal_model}"
            sumo:
              sumo_gui: "sumo-gui"
            features:
              congestion:
                enabled: false
            """
        ).strip()
        + "\n",
        encoding="utf-8",
    )
    return str(config_path)


def test_project_config_accepts_process_traversal_model(tmp_path):
    config = load_config(_write_project_config(tmp_path, "process"))

    assert config.traversal_model == "process"


def test_project_config_accepts_compiled_duration_traversal_model(tmp_path):
    config = load_config(_write_project_config(tmp_path, "compiled_duration"))

    assert config.traversal_model == "compiled_duration"


def test_project_config_rejects_unknown_traversal_model(tmp_path):
    with pytest.raises(ValueError, match="planner.traversal_model"):
        load_config(_write_project_config(tmp_path, "durative"))


def test_process_domain_keeps_action_process_event_model():
    domain = build_road_network_domain(
        FeatureConfig.base(),
        traversal_model="process",
    )

    assert "(:action start-traversal" in domain
    assert "(:process traverse" in domain
    assert "(:event arrive" in domain


def test_compiled_duration_domain_removes_process_state_machine():
    domain = build_road_network_domain(
        FeatureConfig.base(),
        traversal_model="compiled_duration",
    )

    assert "(:action traverse-road" in domain
    assert "(:action start-traversal" not in domain
    assert "(:process" not in domain
    assert "(:event arrive" not in domain
    assert "(moving" not in domain
    assert "(on-road" not in domain
    assert "distance-remaining" not in domain


def test_compiled_duration_problem_writes_precomputed_duration():
    features = FeatureConfig(
        congestion=CongestionConfig(enabled=True, mode="pddl", type="static")
    )
    problem = build_road_network_problem(
        node_map={
            "loc_1": {"id": "loc_1"},
            "loc_2": {"id": "loc_2"},
        },
        roads=[
            {
                "id": "road_1",
                "from": "loc_1",
                "to": "loc_2",
                "length": 100.0,
                "speed": 10.0,
            }
        ],
        start_loc="loc_1",
        goal_loc="loc_2",
        features=features,
        congestion_factors_override={"road_1": 2.0},
        traversal_model="compiled_duration",
    )

    assert "(= (travel-duration road_1) 20.0)" in problem
    assert "(:metric minimize (travel-time car1))" in problem
    assert "distance-remaining" not in problem


def test_plan_parser_accepts_process_and_compiled_traversal_actions():
    plan_text = """
    0: (start-traversal car1 road_1 loc_1 loc_2)
    10: (traverse-road car1 road_2 loc_2 loc_3)
    """

    steps = parse_start_traversal_steps(plan_text)

    assert parse_start_traversal_roads(plan_text) == ["road_1", "road_2"]
    assert steps[0].timestamp == 0
    assert steps[1].timestamp == 10
    assert steps[1].from_loc == "loc_2"
    assert steps[1].to_loc == "loc_3"
