Domain parsed
Problem parsed
Grounding..
Grounding Time: 1988
Aibr Preprocessing
|F|:212
|X|:3
Aibr Preprocessing
|A|:147
|P|:1
|E|:130
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 17
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (refuel car1 loc_0088)
0: (start-traversal car1 road_0143 loc_0088 loc_0049)
0: -----waiting---- [15.0]
15.0: (start-traversal car1 road_0073 loc_0049 loc_0093)
15.0: -----waiting---- [17.0]
17.0: (start-traversal car1 road_0151 loc_0093 loc_0077)
17.0: -----waiting---- [25.0]
25.0: (start-traversal car1 road_0124 loc_0077 loc_0080)
25.0: -----waiting---- [46.0]
46.0: (start-traversal car1 road_0130 loc_0080 loc_0009)
46.0: -----waiting---- [63.0]
63.0: (start-traversal car1 road_0012 loc_0009 loc_0081)
63.0: -----waiting---- [89.0]
89.0: (start-traversal car1 road_0131 loc_0081 loc_0087)
89.0: -----waiting---- [99.0]
99.0: (start-traversal car1 road_0140 loc_0087 loc_0081)
99.0: -----waiting---- [105.0]
105.0: (start-traversal car1 road_0131 loc_0081 loc_0087)
105.0: -----waiting---- [115.0]
115.0: (start-traversal car1 road_0142 loc_0087 loc_0069)
115.0: -----waiting---- [139.0]
139.0: (start-traversal car1 road_0112 loc_0069 loc_0067)
139.0: -----waiting---- [183.0]
183.0: (refuel car1 loc_0067)
183.0: (start-traversal car1 road_0108 loc_0067 loc_0083)
183.0: -----waiting---- [216.0]
216.0: (start-traversal car1 macro_0012 loc_0083 loc_0084)
216.0: -----waiting---- [235.0]
235.0: (start-traversal car1 road_0137 loc_0084 loc_0085)
235.0: -----waiting---- [252.0]

Plan-Length:282
Elapsed Time: 252.0
Metric (Search):252.0
Planning Time (msec): 5921
Heuristic Time (msec): 1051
Search Time (msec): 1552
Expanded Nodes:22827
States Evaluated:23680
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:697
Number of Duplicates detected:101
