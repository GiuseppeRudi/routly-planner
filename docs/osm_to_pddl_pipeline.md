# OSM to PDDL pipeline

1. Download a road network from OpenStreetMap.
2. Represent the road network as a graph.
3. Simplify the graph so that it is small enough for PDDL planning.
4. Convert graph nodes into PDDL locations.
5. Convert graph edges into PDDL connected facts.
6. Add numeric distances as PDDL functions.
7. Run a planner to find a route or urban movement plan.
