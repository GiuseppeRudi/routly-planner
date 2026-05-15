"""Placeholder script for planner execution.

For now this file documents where the planner command will go.
Later we can connect ENHSP, Fast Downward, planning.domains, or another planner.
"""

from pathlib import Path


def main() -> None:
    domain = Path("pddl/domains/urban_navigation_domain.pddl")
    problem = Path("pddl/problems/bologna_center_problem.pddl")

    print("Planner execution placeholder")
    print(f"Domain:  {domain}")
    print(f"Problem: {problem}")
    print("Next step: configure a real planner command.")


if __name__ == "__main__":
    main()
