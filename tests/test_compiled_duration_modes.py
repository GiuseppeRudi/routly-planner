from __future__ import annotations

from pathlib import Path

import pytest

from src.routly.config import load_config
from src.routly.domain.congestion import (
    CongestionWindowFactor,
    DynamicRoadSelection,
)
from src.routly.features import CongestionConfig, FeatureConfig
from src.routly.planning.plan_parser import parse_start_traversal_roads
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.problem_generator import (
    DYNAMIC_WINDOWS_BEGIN,
    DYNAMIC_WINDOWS_END,
    build_dynamic_congestion_pddl_sections,
    build_road_network_problem,
)


ROADS = [
    {
        "id": "road_0001",
        "from": "loc_a",
        "to": "loc_b",
        "length": 10.0,
        "speed": 5.0,
        "highway": "residential",
    },
    {
        "id": "road_0002",
        "from": "loc_b",
        "to": "loc_c",
        "length": 20.0,
        "speed": 10.0,
        "highway": "residential",
    },
]
NODE_MAP = {
    "loc_a": {"id": "loc_a"},
    "loc_b": {"id": "loc_b"},
    "loc_c": {"id": "loc_c"},
}


def _write_project_config(
    tmp_path: Path,
    *,
    traversal_model: str = "compiled_duration",
    compiled_duration_mode: str | None = None,
) -> Path:
    mode_line = (
        ""
        if compiled_duration_mode is None
        else f'  compiled_duration_mode: "{compiled_duration_mode}"\n'
    )
    config_path = tmp_path / "project.yaml"
    config_path.write_text(
        f"""\
project:
  project_root: "."
  seed: 1
experiment:
  name: "test"
osm:
  place_name: "Test City"
  network_type: "drive"
graph_simplification:
  keep_largest_component: true
  remove_isolated_nodes: true
  distance_meters: 100
  max_nodes: 10
planner:
  enhsp_jar: "planners/enhsp/enhsp-20.jar"
  java_heap_mb: 256
  traversal_model: "{traversal_model}"
{mode_line}sumo:
  sumo_gui: "sumo-gui"
features:
  congestion:
    enabled: false
""",
        encoding="utf-8",
    )
    return config_path


def test_config_default_compiled_duration_mode_is_generic(tmp_path: Path) -> None:
    config = load_config(_write_project_config(tmp_path))

    assert config.traversal_model == "compiled_duration"
    assert config.compiled_duration_mode == "generic"


def test_config_accepts_road_specific_for_compiled_duration(tmp_path: Path) -> None:
    config = load_config(
        _write_project_config(
            tmp_path,
            compiled_duration_mode="road_specific",
        )
    )

    assert config.compiled_duration_mode == "road_specific"


def test_config_rejects_non_generic_mode_for_process(tmp_path: Path) -> None:
    with pytest.raises(ValueError, match="compiled_duration_mode"):
        load_config(
            _write_project_config(
                tmp_path,
                traversal_model="process",
                compiled_duration_mode="road_specific",
            )
        )


def test_config_recognizes_but_rejects_line_graph(tmp_path: Path) -> None:
    with pytest.raises(ValueError, match="not implemented yet"):
        load_config(
            _write_project_config(
                tmp_path,
                compiled_duration_mode="line_graph",
            )
        )


def test_config_rejects_unknown_compiled_duration_mode(tmp_path: Path) -> None:
    with pytest.raises(ValueError, match="generic"):
        load_config(
            _write_project_config(
                tmp_path,
                compiled_duration_mode="surprise",
            )
        )


def test_generic_compiled_duration_keeps_parameterized_action() -> None:
    domain = build_road_network_domain(
        FeatureConfig.base(),
        traversal_model="compiled_duration",
        compiled_duration_mode="generic",
    )

    assert "(:action traverse-road" in domain
    assert "?r - road ?from - location ?to - location" in domain


def test_road_specific_static_actions_use_singleton_parameters() -> None:
    domain = build_road_network_domain(
        FeatureConfig.base(),
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
        roads=ROADS,
        location_ids=list(NODE_MAP),
    )

    assert "(:action traverse-road-static-road_0001" in domain
    assert (
        ":parameters (?v - vehicle ?r - road_type_road_0001 "
        "?from - loc_type_loc_a ?to - loc_type_loc_b)"
    ) in domain
    assert "?r - road ?from - location ?to - location" not in domain
    assert "(at ?v loc_a)" not in domain
    assert "(increase (sim-time)" not in domain
    assert "(:constants" not in domain


def test_road_specific_dynamic_actions_are_generated_per_road_window() -> None:
    features = FeatureConfig(
        congestion=CongestionConfig(enabled=True, mode="pddl", type="dynamic")
    )
    domain = build_road_network_domain(
        features,
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
        time_window_starts=[0, 30],
        roads=ROADS,
        dynamic_road_ids={"road_0001"},
        location_ids=list(NODE_MAP),
    )

    assert "(:action traverse-road-dynamic-road_0001-tw_00030" in domain
    assert "?w - window_type_tw_00030" in domain
    assert "(current-window ?w)" in domain
    assert "window_type_tw_00000 window_type_tw_00030" in domain
    assert "(dynamic-road ?r)" in domain
    assert "(:action traverse-road-static-road_0002" in domain
    assert "(static-road ?r)" in domain
    assert "(increase (sim-time)" in domain


def test_road_specific_problem_declares_singleton_typed_objects() -> None:
    problem = build_road_network_problem(
        node_map=NODE_MAP,
        roads=ROADS,
        start_loc="loc_a",
        goal_loc="loc_c",
        features=FeatureConfig.base(),
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
    )
    domain = build_road_network_domain(
        FeatureConfig.base(),
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
        roads=ROADS,
        location_ids=list(NODE_MAP),
    )

    assert "car1 - vehicle" in problem
    assert "loc_a - loc_type_loc_a" in problem
    assert "loc_b - loc_type_loc_b" in problem
    assert "road_0001 - road_type_road_0001" in problem
    assert "road_0002 - road_type_road_0002" in problem
    assert "(= (travel-duration road_0001)" in problem
    assert "loc_type_loc_a loc_type_loc_b loc_type_loc_c" in domain
    assert "road_type_road_0001 road_type_road_0002" in domain


def test_road_specific_dynamic_problem_marks_singleton_window_objects() -> None:
    features = FeatureConfig(
        congestion=CongestionConfig(enabled=True, mode="pddl", type="dynamic")
    )
    problem = build_road_network_problem(
        node_map=NODE_MAP,
        roads=ROADS,
        start_loc="loc_a",
        goal_loc="loc_c",
        features=features,
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
    )

    assert DYNAMIC_WINDOWS_BEGIN in problem
    assert "tw_00000 - window_type_tw_00000" in problem
    assert "tw_00000\n    - time-window" not in problem
    assert DYNAMIC_WINDOWS_END in problem


def test_dynamic_window_section_is_mode_aware_for_replanning() -> None:
    features = FeatureConfig(
        congestion=CongestionConfig(enabled=True, mode="pddl", type="dynamic")
    )
    profile = {
        "road_0001": [
            CongestionWindowFactor(start=0, factor=1.0),
            CongestionWindowFactor(start=30, factor=2.0),
        ]
    }
    selection = DynamicRoadSelection(
        dynamic_roads={"road_0001"},
        static_roads={"road_0002"},
        reasons_by_road={},
    )

    generic_windows, _ = build_dynamic_congestion_pddl_sections(
        profile,
        roads=ROADS,
        features=features,
        traversal_model="compiled_duration",
        compiled_duration_mode="generic",
        dynamic_road_selection=selection,
    )
    singleton_windows, _ = build_dynamic_congestion_pddl_sections(
        profile,
        roads=ROADS,
        features=features,
        traversal_model="compiled_duration",
        compiled_duration_mode="road_specific",
        dynamic_road_selection=selection,
    )

    assert "tw_00000 tw_00030" in generic_windows
    assert "- time-window" in generic_windows
    assert "tw_00000 - window_type_tw_00000" in singleton_windows
    assert "tw_00030 - window_type_tw_00030" in singleton_windows
    assert "- time-window" not in singleton_windows


def test_plan_parser_extracts_road_specific_actions() -> None:
    plan_text = """\
Problem Solved
0.0: (traverse-road-static-road_0001 car1 road_0001 loc_a loc_b)
1.0: (traverse-road-dynamic-road_0002-tw_00030 car1 road_0002 loc_b loc_c tw_00030)
"""

    assert parse_start_traversal_roads(plan_text) == ["road_0001", "road_0002"]
