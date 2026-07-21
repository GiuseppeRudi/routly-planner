Domain parsed
Problem parsed
Grounding..
Grounding Time: 128410
Aibr Preprocessing
|F|:226
|X|:3
Aibr Preprocessing
|A|:2048
|P|:1
|E|:143
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 52
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal-dynamic car1 road_0143 loc_0088 loc_0049 tw_00000)
0: -----waiting---- [15.0]
15.0: (start-traversal-dynamic car1 road_0073 loc_0049 loc_0093 tw_00000)
15.0: -----waiting---- [17.0]
17.0: (start-traversal-dynamic car1 road_0151 loc_0093 loc_0077 tw_00000)
17.0: -----waiting---- [24.0]
24.0: (start-traversal-dynamic car1 road_0124 loc_0077 loc_0080 tw_00000)
24.0: -----waiting---- [37.0]
37.0: (start-traversal-dynamic car1 road_0130 loc_0080 loc_0009 tw_00030)
37.0: -----waiting---- [48.0]
48.0: (start-traversal-dynamic car1 road_0012 loc_0009 loc_0081 tw_00030)
48.0: -----waiting---- [68.0]
68.0: (start-traversal-dynamic car1 road_0131 loc_0081 loc_0087 tw_00060)
68.0: -----waiting---- [74.0]
74.0: (start-traversal-dynamic car1 road_0142 loc_0087 loc_0069 tw_00060)
74.0: -----waiting---- [90.0]
90.0: (start-traversal-dynamic car1 road_0112 loc_0069 loc_0067 tw_00090)
90.0: -----waiting---- [121.0]
121.0: (start-traversal-dynamic car1 road_0108 loc_0067 loc_0083 tw_00120)
121.0: -----waiting---- [145.0]
145.0: (start-traversal-dynamic car1 macro_0015 loc_0083 loc_0084 tw_00120)
145.0: -----waiting---- [160.0]
160.0: (start-traversal-dynamic car1 road_0137 loc_0084 loc_0085 tw_00150)
160.0: -----waiting---- [176.0]

Plan-Length:205
Elapsed Time: 176.0
Metric (Search):176.0
Planning Time (msec): 251266
Heuristic Time (msec): 95
Search Time (msec): 161
Expanded Nodes:189
States Evaluated:199
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:3
Number of Duplicates detected:0
