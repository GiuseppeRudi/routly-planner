Domain parsed
Problem parsed
Grounding..
Grounding Time: 2904
Aibr Preprocessing
|F|:337
|X|:2
Aibr Preprocessing
|A|:208
|P|:1
|E|:208
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 21
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=19.71
 g(n)= 129.0 h(n)=12.57
 g(n)= 175.0 h(n)=5.9
 g(n)= 226.0 h(n)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal car1 road_0201 loc_0124 loc_0074)
0: -----waiting---- [15.0]
15.0: (start-traversal car1 road_0115 loc_0074 loc_0136)
15.0: -----waiting---- [17.0]
17.0: (start-traversal car1 road_0220 loc_0136 loc_0111)
17.0: -----waiting---- [25.0]
25.0: (start-traversal car1 road_0178 loc_0111 loc_0115)
25.0: -----waiting---- [41.0]
41.0: (start-traversal car1 road_0185 loc_0115 loc_0017)
41.0: -----waiting---- [57.0]
57.0: (start-traversal car1 road_0025 loc_0017 loc_0080)
57.0: -----waiting---- [85.0]
85.0: (start-traversal car1 road_0121 loc_0080 loc_0015)
85.0: -----waiting---- [100.0]
100.0: (start-traversal car1 road_0021 loc_0015 loc_0083)
100.0: -----waiting---- [129.0]
129.0: (start-traversal car1 road_0128 loc_0083 loc_0084)
129.0: -----waiting---- [134.0]
134.0: (start-traversal car1 macro_0010 loc_0084 loc_0089)
134.0: -----waiting---- [154.0]
154.0: (start-traversal car1 road_0139 loc_0089 loc_0040)
154.0: -----waiting---- [163.0]
163.0: (start-traversal car1 road_0060 loc_0040 loc_0004)
163.0: -----waiting---- [175.0]
175.0: (start-traversal car1 road_0006 loc_0004 loc_0094)
175.0: -----waiting---- [186.0]
186.0: (start-traversal car1 road_0150 loc_0094 loc_0105)
186.0: -----waiting---- [214.0]
214.0: (start-traversal car1 road_0168 loc_0105 loc_0057)
214.0: -----waiting---- [226.0]
226.0: (start-traversal car1 road_0086 loc_0057 loc_0064)
226.0: -----waiting---- [230.0]
230.0: (start-traversal car1 road_0101 loc_0064 loc_0102)
230.0: -----waiting---- [255.0]
255.0: (start-traversal car1 road_0164 loc_0102 loc_0081)
255.0: -----waiting---- [263.0]
263.0: (start-traversal car1 road_0123 loc_0081 loc_0101)
263.0: -----waiting---- [268.0]
268.0: (start-traversal car1 road_0161 loc_0101 loc_0056)
268.0: -----waiting---- [277.0]
277.0: (start-traversal car1 road_0084 loc_0056 loc_0005)
277.0: -----waiting---- [295.0]
295.0: (start-traversal car1 macro_0002 loc_0005 loc_0051)
295.0: -----waiting---- [310.0]
310.0: (start-traversal car1 road_0076 loc_0051 loc_0114)
310.0: -----waiting---- [312.0]
312.0: (start-traversal car1 road_0183 loc_0114 loc_0106)
312.0: -----waiting---- [321.0]
321.0: (start-traversal car1 road_0169 loc_0106 loc_0122)
321.0: -----waiting---- [329.0]
329.0: (start-traversal car1 road_0197 loc_0122 loc_0107)
329.0: -----waiting---- [331.0]
331.0: (start-traversal car1 road_0171 loc_0107 loc_0108)
331.0: -----waiting---- [338.0]
338.0: (start-traversal car1 road_0172 loc_0108 loc_0126)
338.0: -----waiting---- [340.0]
340.0: (start-traversal car1 road_0204 loc_0126 loc_0125)
340.0: -----waiting---- [347.0]
347.0: (start-traversal car1 road_0202 loc_0125 loc_0049)
347.0: -----waiting---- [363.0]

Plan-Length:423
Elapsed Time: 363.0
Metric (Search):363.0
Planning Time (msec): 6576
Heuristic Time (msec): 159
Search Time (msec): 232
Expanded Nodes:1112
States Evaluated:1127
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:3
Number of Duplicates detected:32
