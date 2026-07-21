Domain parsed
Problem parsed
Grounding..
Grounding Time: 2005
Aibr Preprocessing
|F|:213
|X|:3
Aibr Preprocessing
|A|:143
|P|:1
|E|:130
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 19
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
25.0: -----waiting---- [43.0]
43.0: (start-traversal car1 road_0130 loc_0080 loc_0009)
43.0: -----waiting---- [58.0]
58.0: (start-traversal car1 road_0012 loc_0009 loc_0081)
58.0: -----waiting---- [83.0]
83.0: (start-traversal car1 road_0131 loc_0081 loc_0087)
83.0: -----waiting---- [90.0]
90.0: (start-traversal car1 road_0140 loc_0087 loc_0081)
90.0: -----waiting---- [96.0]
96.0: (start-traversal car1 road_0131 loc_0081 loc_0087)
96.0: -----waiting---- [103.0]
103.0: (start-traversal car1 road_0140 loc_0087 loc_0081)
103.0: -----waiting---- [109.0]
109.0: (start-traversal car1 macro_0011 loc_0081 loc_0002)
109.0: -----waiting---- [136.0]
136.0: (start-traversal car1 road_0003 loc_0002 loc_0064)
136.0: -----waiting---- [148.0]
148.0: (refuel car1 loc_0064)
148.0: (start-traversal car1 macro_0010 loc_0064 loc_0037)
148.0: -----waiting---- [188.0]
188.0: (start-traversal car1 macro_0002 loc_0037 loc_0072)
188.0: -----waiting---- [213.0]
213.0: (start-traversal car1 road_0118 loc_0072 loc_0054)
213.0: -----waiting---- [221.0]
221.0: (start-traversal car1 road_0080 loc_0054 loc_0058)
221.0: -----waiting---- [231.0]
231.0: (start-traversal car1 road_0092 loc_0058 loc_0067)
231.0: -----waiting---- [237.0]
237.0: (start-traversal car1 road_0108 loc_0067 loc_0083)
237.0: -----waiting---- [270.0]
270.0: (start-traversal car1 macro_0012 loc_0083 loc_0084)
270.0: -----waiting---- [287.0]
287.0: (start-traversal car1 road_0137 loc_0084 loc_0085)
287.0: -----waiting---- [305.0]

Plan-Length:347
Elapsed Time: 305.0
Metric (Search):305.0
Planning Time (msec): 6067
Heuristic Time (msec): 992
Search Time (msec): 1352
Expanded Nodes:16776
States Evaluated:17600
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:606
Number of Duplicates detected:476
