# OSM PDDL Bologna Planner

This project builds a simplified PDDL planning model from a real OpenStreetMap road network.

The selected area is the center of Bologna, Italy. The goal is to extract a simplified urban road graph and convert it into a PDDL planning problem.

## Main idea

```text
OpenStreetMap
    ↓
OSMnx / SUMO
    ↓
Simplified road graph
    ↓
PDDL domain and problem
    ↓
Planner
    ↓
Generated route / urban plan
```

## Why Bologna?

Bologna city center is a good case study because it contains main roads, many intersections, small streets, realistic urban constraints, and possible alternative paths.

## Main folders

- `src/`: Python source code.
- `scripts/`: executable project steps and pipeline runner.
- `config/`: versioned pipeline and project configuration.
- `data/`: generated experiments, ignored by Git.
- `planners/`: local planner binaries.


## Configuration

The project keeps two versioned YAML files:

- `config/pipeline.yaml`: step order.
- `config/project.yaml`: project, map, planner, SUMO, and feature settings.

Each run creates an experiment folder like:

```text
data/<city>/nodes_<N>_distance_<meters>/<experiment>/
  config/
  map/
  runs/
    basic/
    llm/
  sumo/
```

## First execution

```bash
python scripts/run_pipeline.py
```
