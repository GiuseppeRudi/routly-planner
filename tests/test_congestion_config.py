from __future__ import annotations

import pytest

from src.routly.features import FeatureConfig


THRESHOLDS = (
    "    vehicles_for_max_congestion_by_road_class:\n"
    "      local: 20\n"
    "      arterial: 35\n"
    "      major: 50\n"
)


def _write_config(tmp_path, congestion_yaml: str):
    path = tmp_path / "project.yaml"
    path.write_text(
        "features:\n"
        f"  congestion:\n{congestion_yaml}\n",
        encoding="utf-8",
    )
    return path


def test_congestion_disabled_does_not_require_thresholds(tmp_path):
    config = _write_config(tmp_path, "    enabled: false\n")

    features = FeatureConfig.from_yaml(config)

    assert not features.congestion_enabled
    assert not features.congestion_in_pddl


@pytest.mark.parametrize(
    ("mode", "congestion_type"),
    [
        ("sumo", "static"),
        ("pddl", "static"),
        ("pddl", "dynamic"),
    ],
)
def test_supported_congestion_combinations(tmp_path, mode, congestion_type):
    config = _write_config(
        tmp_path,
        "    enabled: true\n"
        f"    mode: {mode}\n"
        f"    type: {congestion_type}\n"
        "    replanning: false\n"
        "    dynamic:\n"
        "      window_seconds: 30\n"
        f"{THRESHOLDS}",
    )

    features = FeatureConfig.from_yaml(config)

    assert features.congestion_enabled
    assert features.congestion.mode == mode
    assert features.congestion.type == congestion_type


def test_dynamic_congestion_is_pddl_only(tmp_path):
    config = _write_config(
        tmp_path,
        "    enabled: true\n"
        "    mode: sumo\n"
        "    type: dynamic\n"
        f"{THRESHOLDS}",
    )

    with pytest.raises(ValueError, match="dynamic.*mode: 'pddl'"):
        FeatureConfig.from_yaml(config)


def test_replanning_is_blocked_explicitly(tmp_path):
    config = _write_config(
        tmp_path,
        "    enabled: true\n"
        "    mode: pddl\n"
        "    type: static\n"
        "    replanning: true\n"
        f"{THRESHOLDS}",
    )

    with pytest.raises(ValueError, match="replanning=true"):
        FeatureConfig.from_yaml(config)


def test_legacy_sumo_only_mode_is_rejected(tmp_path):
    config = _write_config(
        tmp_path,
        "    enabled: true\n"
        "    mode: sumo_only\n"
        "    type: static\n"
        f"{THRESHOLDS}",
    )

    with pytest.raises(ValueError, match="use mode: 'sumo'"):
        FeatureConfig.from_yaml(config)
