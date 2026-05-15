from pathlib import Path
import sys

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = PROJECT_ROOT / "src"

if str(SRC_DIR) not in sys.path:
    sys.path.insert(0, str(SRC_DIR))

from osm_pddl_bologna.graph.graph_export import load_graph
from osm_pddl_bologna.pddl.domain_generator import write_domain
from osm_pddl_bologna.pddl.problem_generator import generate_problem_from_graph, write_problem
from osm_pddl_bologna.utils.paths import PROCESSED_DATA_DIR, PDDL_DOMAIN_DIR, PDDL_PROBLEM_DIR, ensure_project_directories
from osm_pddl_bologna.utils.logging_utils import info, success


def main() -> None:
    ensure_project_directories()

    graph_path = PROCESSED_DATA_DIR / "graphs" / "bologna_simplified_graph.graphml"
    domain_path = PDDL_DOMAIN_DIR / "urban_navigation_domain.pddl"
    problem_path = PDDL_PROBLEM_DIR / "bologna_center_problem.pddl"

    info(f"Loading simplified graph: {graph_path}")
    graph = load_graph(graph_path)

    info("Writing PDDL domain")
    write_domain(domain_path)

    info("Generating PDDL problem from graph")
    problem_text = generate_problem_from_graph(graph)
    write_problem(problem_text, problem_path)

    success(f"Domain written to: {domain_path}")
    success(f"Problem written to: {problem_path}")


if __name__ == "__main__":
    main()
