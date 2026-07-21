# Corrected experiment archive

This directory contains 74 archived experiments: the 52 original valid runs,
16 executed RQ1 scalability attempts, and six corrected RQ2 controller
attempts.

- `RUN_001`--`RUN_013`: 100 requested and 100 original nodes;
- `RUN_014`--`RUN_026`: 150 requested and 150 original nodes;
- `RUN_027`--`RUN_039`: 200 requested and 200 original nodes;
- `RUN_040`--`RUN_052`: 300 requested and 300 original nodes;
- `RUN_053`--`RUN_057`: RQ1-A, five planner encodings at 500 nodes with fully
  dynamic congestion and 300 background vehicles;
- `RUN_058`--`RUN_068`: executed RQ1-B combinations with hybrid congestion at
  500, 1000, 1500, and 2000 nodes and proportional background traffic;
- `RUN_069`--`RUN_071`: congestion controller at 500, 700, and 1000 nodes;
- `RUN_072`--`RUN_074`: fuel controller at 500, 700, and 1000 nodes.

Runs may contain fewer *planning* nodes after macro-road preprocessing. That is
an intentional abstraction and is not the distance-crop error.

The original `RUN_053`--`RUN_091` are excluded because their nominal 500,
700, and 1000-node configurations all saturated at 393 original nodes with
`distance_meters: 1000`. Identifiers from `RUN_053` onward in this corrected
archive were reassigned to corrected campaigns and do not refer to those
discarded outputs. OOM and timeout outcomes are retained because they are
valid scalability results.

## RQ1 scalability

The RQ1 campaign used exact nested graphs at 500, 1000, 1500, and 2000 nodes,
`distance_meters: 4000`, seed 71, macro roads, and an 8192 MB Java heap. Its
traffic density was fixed at 0.6 vehicles per requested node: 300, 600, 900,
and 1200 vehicles respectively.

- RQ1-A (`RUN_053`--`RUN_057`) compares process/node-parameterized against four
  compiled-duration variants under fully dynamic congestion at 500 nodes.
- RQ1-B (`RUN_058`--`RUN_068`) evaluates the same planner axes under hybrid
  congestion, with `hybrid.min_temporal_variation: 0.10`. Parameterized
  configurations reached the resource limit at 500 nodes; compiled node-based
  and line-graph configurations completed through 2000 nodes.
- LLM events were enabled for RQ1. LLM timing improvements are not computed
  when the normalized event sets differ across planner configurations.

The nine RQ1-B combinations skipped by the adaptive stopping rule are absent
from `experiment.csv`, which intentionally contains only attempts that were
actually started.

## RQ2 controllers

The six corrected RQ2 attempts use exact 500, 700, and 1000-node graphs at
2000 metres, 200 background vehicles, an 8192 MB heap, Basic-only execution,
and a four-hour wall-clock budget per run. They preserve the
`process/node_based/parameterized` PDDL+ model and decompose planning into
controller windows or fuel legs.

Both controller types complete at 500 and 700 nodes without OOM. At 1000
nodes, runtime rather than memory is the limiting factor: the congestion
controller reached the 14,400-second timeout after seven completed ENHSP
calls, while the fuel controller was stopped manually after 8,113 seconds and
four completed calls because the observed per-call scaling projected beyond
the same four-hour budget. The latter is recorded as a timeout-class outcome,
with the manual-stop qualification retained in every summary.

These results show that controller decomposition removes the monolithic
pruning/grounding memory bottleneck for the tested instances, but does not make
the parameterized model computationally scalable at 1000 nodes.

`experiment.csv` is the single index for all archived runs. Each run directory
contains its frozen configuration and generated evidence; corrected controller
runs also retain `campaign.log` for timeout and runtime provenance.
