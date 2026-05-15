from osm_pddl_bologna.utils.paths import PROJECT_ROOT


def test_project_root_exists():
    assert PROJECT_ROOT.exists()
