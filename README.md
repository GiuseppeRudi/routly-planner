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
- `scripts/`: executable project steps.
- `data/`: raw and processed data.
- `pddl/`: PDDL domains, problems, and plans.
- `docs/`: project documentation.
- `notebooks/`: exploratory analysis.

## Environment setup

Create the Conda environment:

```bash
conda env create -f environment.yml
```

Activate it:

```bash
conda activate osm-pddl-bologna
```

Register the environment as a Jupyter kernel:

```bash
python -m ipykernel install --user --name osm-pddl-bologna --display-name "Python (osm-pddl-bologna)"
```

Test the installation:

```bash
python -c "import osmnx as ox; import networkx as nx; print('Environment OK')"
```

## First execution

Download the road network around Bologna city center:

```bash
python scripts/01_download_bologna_center_osm.py
```

Simplify it for PDDL:

```bash
python scripts/02_simplify_graph.py
```

Generate a first PDDL problem:

```bash
python scripts/03_generate_pddl_problem.py
```
