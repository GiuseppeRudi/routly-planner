Domain parsed
Problem parsed
Grounding..
Grounding Time: 69823
Aibr Preprocessing
|F|:713
|X|:2
Aibr Preprocessing
|A|:450
|P|:1
|E|:450
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 114
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=12.93
 g(n)= 24.0 h(n)=6.26
 g(n)= 60.0 h(n)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal car1 road_0325 loc_0189 loc_0012)
0: -----waiting---- [24.0]
24.0: (start-traversal car1 macro_0001 loc_0012 loc_0161)
24.0: -----waiting---- [45.0]
45.0: (start-traversal car1 road_0285 loc_0161 loc_0109)
45.0: -----waiting---- [60.0]
60.0: (start-traversal car1 road_0187 loc_0109 loc_0107)
60.0: -----waiting---- [68.0]
68.0: (start-traversal car1 road_0181 loc_0107 loc_0110)
68.0: -----waiting---- [79.0]
79.0: (start-traversal car1 road_0188 loc_0110 loc_0217)
79.0: -----waiting---- [84.0]
84.0: (start-traversal car1 road_0377 loc_0217 loc_0239)
84.0: -----waiting---- [96.0]
96.0: (start-traversal car1 road_0410 loc_0239 loc_0238)
96.0: -----waiting---- [104.0]
104.0: (start-traversal car1 road_0407 loc_0238 loc_0108)
104.0: -----waiting---- [108.0]
108.0: (start-traversal car1 road_0185 loc_0108 loc_0081)
108.0: -----waiting---- [121.0]
121.0: (start-traversal car1 road_0132 loc_0081 loc_0126)
121.0: -----waiting---- [142.0]
142.0: (start-traversal car1 road_0216 loc_0126 loc_0124)
142.0: -----waiting---- [185.0]
185.0: (start-traversal car1 road_0213 loc_0124 loc_0149)
185.0: -----waiting---- [189.0]
189.0: (start-traversal car1 road_0266 loc_0149 loc_0165)
189.0: -----waiting---- [203.0]
203.0: (start-traversal car1 road_0293 loc_0165 loc_0170)
203.0: -----waiting---- [227.0]

Plan-Length:257
Elapsed Time: 227.0
Metric (Search):227.0
Planning Time (msec): 157841
Heuristic Time (msec): 1631
Search Time (msec): 2306
Expanded Nodes:3421
States Evaluated:3453
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:8
Number of Duplicates detected:127
