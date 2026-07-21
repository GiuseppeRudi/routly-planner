Domain parsed
Problem parsed
Grounding..
Grounding Time: 2207
Aibr Preprocessing
|F|:214
|X|:2
Aibr Preprocessing
|A|:131
|P|:1
|E|:131
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 29
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal car1 road_0143 loc_0088 loc_0049)
0: -----waiting---- [14.0]
14.0: (start-traversal car1 road_0073 loc_0049 loc_0093)
14.0: -----waiting---- [16.0]
16.0: (start-traversal car1 road_0151 loc_0093 loc_0077)
16.0: -----waiting---- [24.0]
24.0: (start-traversal car1 road_0124 loc_0077 loc_0080)
24.0: -----waiting---- [44.0]
44.0: (start-traversal car1 road_0130 loc_0080 loc_0009)
44.0: -----waiting---- [59.0]
59.0: (start-traversal car1 road_0012 loc_0009 loc_0081)
59.0: -----waiting---- [83.0]
83.0: (start-traversal car1 road_0131 loc_0081 loc_0087)
83.0: -----waiting---- [91.0]
91.0: (start-traversal car1 road_0142 loc_0087 loc_0069)
91.0: -----waiting---- [115.0]
115.0: (start-traversal car1 road_0112 loc_0069 loc_0067)
115.0: -----waiting---- [162.0]
162.0: (start-traversal car1 road_0108 loc_0067 loc_0083)
162.0: -----waiting---- [191.0]
191.0: (start-traversal car1 macro_0015 loc_0083 loc_0084)
191.0: -----waiting---- [209.0]
209.0: (start-traversal car1 road_0137 loc_0084 loc_0085)
209.0: -----waiting---- [227.0]

Plan-Length:251
Elapsed Time: 227.0
Metric (Search):227.0
Planning Time (msec): 4904
Heuristic Time (msec): 123
Search Time (msec): 205
Expanded Nodes:518
States Evaluated:530
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:9
Number of Duplicates detected:12
