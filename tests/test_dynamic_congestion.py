from __future__ import annotations

from src.routly.domain.congestion import compute_dynamic_congestion_profile
from src.routly.features import (
    CongestionConfig,
    DynamicCongestionConfig,
    FeatureConfig,
)
from src.routly.pddl.domain_generator import build_road_network_domain
from src.routly.pddl.problem_generator import build_road_network_problem
from src.routly.pddl.problem_generator import dynamic_congestion_pddl_stats


THRESHOLDS = {
    "local": 2,
    "arterial": 4,
    "major": 6,
}


ROADS = [
    {
        "id": "road_0001",
        "from": "loc_0001",
        "to": "loc_0002",
        "length": 30,
        "speed": 10,
        "highway": "residential",
    },
    {
        "id": "road_0002",
        "from": "loc_0002",
        "to": "loc_0003",
        "length": 30,
        "speed": 10,
        "highway": "primary",
    },
]


def test_dynamic_congestion_profile_groups_routes_by_time_window():
    background_routes = [
        (0, ["road_0001"]),
        (5, ["road_0001"]),
        (35, ["road_0001"]),
    ]

    profile = compute_dynamic_congestion_profile(
        ROADS,
        background_routes,
        max_factor=2.0,
        vehicles_for_max_congestion_by_road_class=THRESHOLDS,
        window_seconds=30,
    )

    assert [(change.start, change.factor) for change in profile["road_0001"]] == [
        (0, 2.0),
        (30, 1.5),
        (60, 1.0),
    ]
    assert [(change.start, change.factor) for change in profile["road_0002"]] == [
        (0, 1.0),
    ]


def test_dynamic_congestion_stats_match_future_update_events():
    profile = compute_dynamic_congestion_profile(
        ROADS,
        [
            (0, ["road_0001"]),
            (5, ["road_0001"]),
            (35, ["road_0001"]),
        ],
        max_factor=2.0,
        vehicles_for_max_congestion_by_road_class=THRESHOLDS,
        window_seconds=30,
    )

    stats = dynamic_congestion_pddl_stats(profile)

    assert stats["roads"] == 2
    assert stats["roads_with_updates"] == 1
    assert stats["future_windows"] == 2
    assert stats["future_updates"] == 2
    assert stats["grounded_update_events"] == 2


def test_dynamic_pddl_contains_time_windows_and_update_events():
    features = FeatureConfig(
        congestion=CongestionConfig(
            enabled=True,
            mode="pddl",
            type="dynamic",
            dynamic=DynamicCongestionConfig(window_seconds=30),
            vehicles_for_max_congestion_by_road_class=THRESHOLDS,
        )
    )
    node_map = {
        "loc_0001": {"id": "loc_0001", "traffic_light": False},
        "loc_0002": {"id": "loc_0002", "traffic_light": False},
        "loc_0003": {"id": "loc_0003", "traffic_light": False},
    }
    background_routes = [
        (0, ["road_0001"]),
        (5, ["road_0001"]),
        (35, ["road_0001"]),
    ]

    domain = build_road_network_domain(features)
    problem = build_road_network_problem(
        node_map=node_map,
        roads=ROADS,
        start_loc="loc_0001",
        goal_loc="loc_0003",
        features=features,
        background_routes=background_routes,
    )

    assert "time-window" in domain
    assert "(sim-time)" in domain
    assert "activate-congestion-window" in domain
    assert "tw_00030 tw_00060" in problem
    assert "(= (sim-time) 0)" in problem
    assert "(congestion-update-pending road_0001 tw_00030)" in problem
    assert "(= (congestion-factor road_0001) 2.0)" in problem


def test_static_pddl_omits_dynamic_window_constructs():
    features = FeatureConfig(
        congestion=CongestionConfig(
            enabled=True,
            mode="pddl",
            type="static",
            vehicles_for_max_congestion_by_road_class=THRESHOLDS,
        )
    )
    node_map = {
        "loc_0001": {"id": "loc_0001", "traffic_light": False},
        "loc_0002": {"id": "loc_0002", "traffic_light": False},
        "loc_0003": {"id": "loc_0003", "traffic_light": False},
    }

    domain = build_road_network_domain(features)
    problem = build_road_network_problem(
        node_map=node_map,
        roads=ROADS,
        start_loc="loc_0001",
        goal_loc="loc_0003",
        features=features,
        background_routes=[(0, ["road_0001", "road_0002"])],
    )

    assert "time-window" not in domain
    assert "activate-congestion-window" not in domain
    assert "DYNAMIC CONGESTION PROFILE" not in problem
    assert "(= (congestion-factor road_0001)" in problem
