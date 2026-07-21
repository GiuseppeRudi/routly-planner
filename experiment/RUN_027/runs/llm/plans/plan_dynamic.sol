Domain parsed
Problem parsed
Grounding..
Grounding Time: 8789
Aibr Preprocessing
|F|:347
|X|:2
Aibr Preprocessing
|A|:216
|P|:1
|E|:216
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 24
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=19.210001
 g(n)= 60.0 h(n)=12.07
 g(n)= 154.0 h(n)=6.28
 g(n)= 192.0 h(n)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal car1 road_0115 loc_0071 loc_0072)
0: -----waiting---- [9.0]
9.0: (start-traversal car1 road_0118 loc_0072 loc_0134)
9.0: -----waiting---- [12.0]
12.0: (start-traversal car1 road_0229 loc_0134 loc_0136)
12.0: -----waiting---- [21.0]
21.0: (start-traversal car1 road_0232 loc_0136 loc_0141)
21.0: -----waiting---- [60.0]
60.0: (start-traversal car1 road_0242 loc_0141 loc_0158)
60.0: -----waiting---- [64.0]
64.0: (start-traversal car1 road_0266 loc_0158 loc_0128)
64.0: -----waiting---- [89.0]
89.0: (start-traversal car1 road_0217 loc_0128 loc_0028)
89.0: -----waiting---- [97.0]
97.0: (start-traversal car1 road_0051 loc_0028 loc_0177)
97.0: -----waiting---- [105.0]
105.0: (start-traversal car1 road_0294 loc_0177 loc_0193)
105.0: -----waiting---- [118.0]
118.0: (start-traversal car1 road_0318 loc_0193 loc_0081)
118.0: -----waiting---- [119.0]
119.0: (start-traversal car1 road_0136 loc_0081 loc_0194)
119.0: -----waiting---- [120.0]
120.0: (start-traversal car1 road_0321 loc_0194 loc_0174)
120.0: -----waiting---- [135.0]
135.0: (start-traversal car1 road_0288 loc_0174 loc_0109)
135.0: -----waiting---- [141.0]
141.0: (start-traversal car1 road_0186 loc_0109 loc_0113)
141.0: -----waiting---- [143.0]
143.0: (start-traversal car1 road_0193 loc_0113 loc_0005)
143.0: -----waiting---- [154.0]
154.0: (start-traversal car1 macro_0000 loc_0005 loc_0112)
154.0: -----waiting---- [177.0]
177.0: (start-traversal car1 road_0192 loc_0112 loc_0076)
177.0: -----waiting---- [192.0]
192.0: (start-traversal car1 road_0128 loc_0076 loc_0074)
192.0: -----waiting---- [200.0]
200.0: (start-traversal car1 road_0122 loc_0074 loc_0077)
200.0: -----waiting---- [210.0]
210.0: (start-traversal car1 road_0129 loc_0077 loc_0148)
210.0: -----waiting---- [215.0]
215.0: (start-traversal car1 road_0252 loc_0148 loc_0165)
215.0: -----waiting---- [227.0]
227.0: (start-traversal car1 road_0277 loc_0165 loc_0164)
227.0: -----waiting---- [234.0]
234.0: (start-traversal car1 road_0274 loc_0164 loc_0075)
234.0: -----waiting---- [238.0]
238.0: (start-traversal car1 road_0126 loc_0075 loc_0058)
238.0: -----waiting---- [251.0]
251.0: (start-traversal car1 road_0099 loc_0058 loc_0090)
251.0: -----waiting---- [270.0]
270.0: (start-traversal car1 road_0151 loc_0090 loc_0088)
270.0: -----waiting---- [313.0]
313.0: (start-traversal car1 road_0148 loc_0088 loc_0104)
313.0: -----waiting---- [315.0]
315.0: (start-traversal car1 road_0181 loc_0104 loc_0115)
315.0: -----waiting---- [328.0]
328.0: (start-traversal car1 road_0198 loc_0115 loc_0120)
328.0: -----waiting---- [352.0]

Plan-Length:410
Elapsed Time: 352.0
Metric (Search):352.0
Planning Time (msec): 18683
Heuristic Time (msec): 367
Search Time (msec): 530
Expanded Nodes:2362
States Evaluated:2379
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:5
Number of Duplicates detected:79
