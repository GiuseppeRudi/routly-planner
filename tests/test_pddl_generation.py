import networkx as nx

from osm_pddl_bologna.pddl.problem_generator import generate_problem_from_graph


def test_generate_problem_from_small_graph():
    graph = nx.MultiDiGraph()
    graph.add_node("a", x=0.0, y=0.0)
    graph.add_node("b", x=1.0, y=1.0)
    graph.add_edge("a", "b", length=10)

    problem = generate_problem_from_graph(graph)

    assert "(define (problem" in problem
    assert "(connected loc_1 loc_2)" in problem
    assert "(distance loc_1 loc_2)" in problem
