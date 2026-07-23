# Routly Planner

Routly Planner builds a PDDL planning problem from a real OpenStreetMap road network, solves the route with ENHSP, and validates the result in SUMO. The current case study uses the road network of Bologna, Italy.

<p align="center">
  <img src="images/bologna_urban_structure.png" alt="Historical and modern road structure of central Bologna" width="620">
</p>

```text
OpenStreetMap
    -> graph simplification and optional macro-roads
    -> PDDL domain and problem
    -> ENHSP plan
    -> optional LLM events or controller replanning
    -> SUMO route validation
```

## Setup

The project uses Conda and Python 3.11:

```bash
conda env create -f environment.yml
conda activate routly
python scripts/run_pipeline.py
```

Java, the configured ENHSP jar, and SUMO are required for the complete pipeline. Useful runner commands are:

```bash
python scripts/run_pipeline.py --help
python scripts/run_pipeline.py <experiment-id> --resume
```

## Configuration

The experiment is controlled by two YAML files:

- `config/pipeline.yaml` selects and orders the pipeline stages.
- `config/project.yaml` configures the map, planner, congestion, fuel, controllers, LLM events, and SUMO.

`config/project.yaml` is intentionally kept comment-free. Before changing it, read the documented example in `docs/project.yaml.example`, which explains the effect of each setting and the valid planner combinations.

The main planner settings describe three independent decisions:

| Setting | Values | Question answered |
| --- | --- | --- |
| `planner.traversal_model` | `process`, `compiled_duration` | How is road traversal represented in PDDL? |
| `planner.state_representation` | `node_based`, `line_graph` | Is the vehicle state a node or a road? |
| `planner.action_generation` | `parameterized`, `compiled` | Does ENHSP ground a generic schema, or does Python emit valid actions? |

Other important switches are:

| Setting | Values | Purpose |
| --- | --- | --- |
| `features.road_abstraction.enabled` | `true`, `false` | Enable macro-road compression |
| `features.congestion.mode` | `sumo`, `pddl` | Display congestion in SUMO or pass it to PDDL |
| `features.congestion.type` | `static`, `dynamic`, `hybrid` | Select the temporal congestion model |
| `features.fuel.enabled` | `true`, `false` | Add fuel consumption and refuelling stations |
| `features.llm_events.enabled` | `true`, `false` | Generate road events and a recalculated route |

Valid combinations and their constraints are documented directly in `config/project.yaml`.

## Planning models and scalability strategies

### PDDL+ process

The original model represents traversal with a start action, a continuous process while the vehicle is on the road, and an arrival event. It can represent the vehicle mid-road, but the additional state and numeric evolution increase planner complexity.

```lisp
(:action start-traverse ...)
(:process traverse-road ...)
(:event arrive ...)
```

`process` supports only:

```yaml
planner:
  traversal_model: process
  state_representation: node_based
  action_generation: parameterized
```

This branch is retained for PDDL+ controller experiments. The external controller solves smaller partial plans while preserving processes and events.

### Compiled duration

For start-to-goal routing, the exact position of the vehicle while it crosses a road is not required. `compiled_duration` therefore models the same transition as one direct action with a precomputed duration:

```lisp
(:durative-action traverse-road
 :parameters (?v - vehicle ?r - road ?from ?to - location)
 :duration (= ?duration (travel-duration ?r))
 :condition (at start (and (at ?v ?from) (connects ?r ?from ?to)))
 :effect (at end (and (at ?v ?to) (not (at ?v ?from)))))
```

Action generation can then follow two strategies:

- `parameterized`: ENHSP receives one generic schema and grounds the Cartesian product of its parameters.
- `compiled`: Python generates only valid road/window schemas. Singleton types bind each schema to its road and reduce planner grounding.

Two planner-side scalability backends are implemented:

- `compiled_duration + node_based + compiled`, which keeps vehicle state on locations but emits only valid road/location schemas.
- `compiled_duration + line_graph`, which makes the vehicle state a road and traverses from one road to the next.

| Traversal model | State representation | Action generation | Status |
| --- | --- | --- | --- |
| `process` | `node_based` | `parameterized` | Implemented; PDDL+ controller branch |
| `compiled_duration` | `node_based` | `parameterized` | Implemented; generic grounding baseline |
| `compiled_duration` | `node_based` | `compiled` | Implemented; current planner-side optimization |
| `compiled_duration` | `line_graph` | `parameterized` | Implemented; road-state grounding baseline |
| `compiled_duration` | `line_graph` | `compiled` | Implemented; transition-specific road-state actions |

In a line graph, the vehicle state is a road and actions represent transitions between connected roads. Start and goal are still selected as nodes in the scenario; the PDDL generation step deterministically converts them to the first and last road of the shortest start-node to goal-node path, computed on road length. This keeps the user workflow unchanged while allowing the planner to compare node-state and road-state formulations.

## Results at a glance

The final report evaluates the three research questions on reproducible Bologna experiments with ENHSP limited to an 8 GB Java heap:

| Research question | Main result |
| --- | --- |
| Model-side scalability | On the fixed 300-node instance, compiled node-based actions reduce grounding time from 40.379 s to 1.063 s (`38.0x`) and planning time from 41.427 s to 2.542 s (`16.3x`) relative to the parameterized node-based baseline. |
| Larger compiled models | Both compiled node-based and compiled line-graph configurations solve instances up to 2,000 requested nodes; compiled node-based planning takes 245.256 s at that size. |
| Controller-side scalability | The monolithic process formulations run out of memory from 200 nodes, while the congestion and fuel controllers solve instances up to 700 nodes by concatenating partial plans. |
| LLM event quality | In 15 final experiments, LLM events hit at least one road of the hidden baseline plan in 73.3% of cases; 60.0% of the relevant event sets not modified by the safeguard produced a different road sequence. |

## Macro-road abstraction

Macro-roads merge linear chains whose intermediate nodes are not planning decisions. Start, goal, fuel stations, and branching intersections remain protected. The planner works on the compressed mapping, while SUMO receives the expanded sequence of original roads.

The following figure comes from the 500-node reference experiment used in the final report. It compares the original mapping with the planning mapping and highlights fused intermediate nodes, traffic lights, fuel stations, and the resulting macro-roads. The planning representation changes from 862 roads and 500 nodes to 829 roads and 483 nodes.

![Original and macro-road planning mappings](images/macro_roads_comparison.png)

## LLM-driven route adaptation

Routly keeps ENHSP responsible for planning and uses the LLM only to propose structured road closures or slowdowns. The LLM receives topology, start, and goal information, but never receives the baseline plan. Python validates each event, protects start and goal, and converts a closure that would make the task unsolvable into a slowdown before the second planning run.

The combined event map shows the complete comparison on one map: blue is the original route, green is the recalculated route, red marks blocked roads, yellow marks slowdowns, and crosses mark blocked intersections.

<p align="center">
  <img src="images/500_nodes_event_map.png" alt="Original and recalculated routes after LLM-generated road events" width="620">
</p>

## Congestion models

PDDL congestion supports three temporal semantics:

- `static`: one factor per road for the complete problem;
- `dynamic`: factors can change between global time windows;
- `hybrid`: only roads with `max(window_factors) - min(window_factors) >= min_temporal_variation` remain dynamic.

In controller-based congestion replanning, each partial PDDL problem receives one static snapshot for its current window. The sequence of snapshots is dynamic even though every individual planner call remains static.

## Controllers and replanning

Planner-side scalability and controller-side scalability are separate branches:

- planner-side optimization uses `compiled_duration` and optionally compiled actions;
- controller-side optimization preserves `process + node_based + parameterized` and concatenates partial plans in Python.

Fuel and congestion replanning controllers are mutually exclusive. Road abstraction may be enabled or disabled in either controller, provided all intermediate plans use the same planning mapping.

| Congestion controller | Fuel controller |
| --- | --- |
| ![Successive route legs produced by the congestion controller](images/congestion_controller_500.png) | ![Successive route legs and refuelling targets produced by the fuel controller](images/fuel_controller_500.png) |

The congestion controller plans against one static snapshot per time window and can reuse a cached plan when the relevant unexecuted costs have not changed. The fuel controller keeps the final goal when it is reachable; otherwise, it selects a reachable station as the next temporary target. Both controllers execute only complete road traversals so every partial plan ends at a valid node state.

## Experiment outputs

Each run stores a complete configuration snapshot and its generated artifacts:

```text
data/<city>/nodes_<N>_distance_<meters>/<experiment>/
  config/                 YAML snapshots
  map/                    graph and macro-road artifacts
  runs/basic/             baseline domain, problem, plan, and images
  runs/llm/               events, recalculated plan, and comparisons
  sumo/                   SUMO network, routes, and reports
```

Main repository folders:

- `src/`: graph, PDDL, planner, SUMO, feature, and controller logic.
- `scripts/`: pipeline stages and the main runner.
- `config/`: versioned YAML configuration.
- `planners/`: local ENHSP binaries.
- `images/`: README figures selected from reproducible experiments.
- `docs/`: implementation and scalability reports.
- `data/`: generated experiment outputs.
