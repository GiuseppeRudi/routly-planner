# Methodology

The project uses a real urban network as input and transforms it into an abstract planning problem.

The transformation follows this interpretation:

- intersections or relevant road points become PDDL locations;
- road segments become connectivity predicates;
- road length becomes a numeric movement cost;
- blocked roads can be represented with a negative precondition;
- a vehicle moves from one location to another using the `move` action.
