import networkx as nx


def keep_largest_weakly_connected_component(graph: nx.MultiDiGraph) -> nx.MultiDiGraph:
    if graph.number_of_nodes() == 0:
        return graph

    largest_component = max(nx.weakly_connected_components(graph), key=len)
    return graph.subgraph(largest_component).copy()


def limit_graph_size(graph: nx.MultiDiGraph, max_nodes: int) -> nx.MultiDiGraph:
    """Keep the most central nodes using degree as a simple first approximation.

    This is intentionally simple. Later we can replace it with a better
    selection strategy around Via Rizzoli, Piazza Maggiore, Due Torri, etc.
    """
    if graph.number_of_nodes() <= max_nodes:
        return graph

    node_degrees = dict(graph.degree())
    selected_nodes = sorted(node_degrees, key=node_degrees.get, reverse=True)[:max_nodes]
    subgraph = graph.subgraph(selected_nodes).copy()

    if subgraph.number_of_nodes() > 0 and not nx.is_weakly_connected(subgraph):
        largest_component = max(nx.weakly_connected_components(subgraph), key=len)
        subgraph = subgraph.subgraph(largest_component).copy()

    return subgraph
