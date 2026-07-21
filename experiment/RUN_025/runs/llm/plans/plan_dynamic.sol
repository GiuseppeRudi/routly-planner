Domain parsed
Problem parsed
Grounding..
Grounding Time: 9533
Aibr Preprocessing
|F|:269
|X|:3
Aibr Preprocessing
|A|:185
|P|:1
|E|:166
Delta time heuristic model:1.0
Delta time planning model:1.0
Delta time search-execution model:1.0
Delta time validation model:1
H1 Setup Time (msec): 62
Setting horizon to:NaN
Running Greedy Best First Search
h(n = s_0)=13.809999
-------------Time: 10s ; Expanded Nodes: 28028 (Avg-Speed 2802.0 n/s); Evaluated States: 29111
-------------Time: 20s ; Expanded Nodes: 59316 (Avg-Speed 2965.0 n/s); Evaluated States: 61302
-------------Time: 30s ; Expanded Nodes: 105841 (Avg-Speed 3528.0 n/s); Evaluated States: 109124
-------------Time: 40s ; Expanded Nodes: 152226 (Avg-Speed 3805.0 n/s); Evaluated States: 156859
-------------Time: 50s ; Expanded Nodes: 195171 (Avg-Speed 3903.0 n/s); Evaluated States: 201143
-------------Time: 60s ; Expanded Nodes: 239267 (Avg-Speed 3987.0 n/s); Evaluated States: 246609
 g(n)= 213.0 h(n)=6.67
 g(n)= 276.0 h(n)=0.0
Extracting plan with execution delta: 1.0
Problem Solved

Found Plan:
0: (start-traversal car1 road_0201 loc_0124 loc_0074)
0: -----waiting---- [14.0]
14.0: (refuel car1 loc_0074)
14.0: (start-traversal car1 road_0115 loc_0074 loc_0136)
14.0: -----waiting---- [16.0]
16.0: (start-traversal car1 road_0220 loc_0136 loc_0111)
16.0: -----waiting---- [23.0]
23.0: (start-traversal car1 road_0178 loc_0111 loc_0115)
23.0: -----waiting---- [40.0]
40.0: (start-traversal car1 road_0184 loc_0115 loc_0035)
40.0: -----waiting---- [44.0]
44.0: (start-traversal car1 road_0051 loc_0035 loc_0115)
44.0: -----waiting---- [48.0]
48.0: (start-traversal car1 road_0184 loc_0115 loc_0035)
48.0: -----waiting---- [52.0]
52.0: (start-traversal car1 road_0051 loc_0035 loc_0115)
52.0: -----waiting---- [56.0]
56.0: (start-traversal car1 road_0184 loc_0115 loc_0035)
56.0: -----waiting---- [60.0]
60.0: (start-traversal car1 road_0051 loc_0035 loc_0115)
60.0: -----waiting---- [64.0]
64.0: (start-traversal car1 road_0184 loc_0115 loc_0035)
64.0: -----waiting---- [68.0]
68.0: (start-traversal car1 road_0051 loc_0035 loc_0115)
68.0: -----waiting---- [72.0]
72.0: (start-traversal car1 road_0185 loc_0115 loc_0017)
72.0: -----waiting---- [88.0]
88.0: (start-traversal car1 road_0025 loc_0017 loc_0080)
88.0: -----waiting---- [115.0]
115.0: (start-traversal car1 road_0121 loc_0080 loc_0015)
115.0: -----waiting---- [130.0]
130.0: (start-traversal car1 road_0021 loc_0015 loc_0083)
130.0: -----waiting---- [159.0]
159.0: (start-traversal car1 road_0128 loc_0083 loc_0084)
159.0: -----waiting---- [163.0]
163.0: (start-traversal car1 macro_0007 loc_0084 loc_0089)
163.0: -----waiting---- [181.0]
181.0: (refuel car1 loc_0089)
181.0: (start-traversal car1 road_0138 loc_0089 loc_0084)
181.0: -----waiting---- [200.0]
200.0: (start-traversal car1 macro_0007 loc_0084 loc_0089)
200.0: -----waiting---- [218.0]
218.0: (start-traversal car1 road_0138 loc_0089 loc_0084)
218.0: -----waiting---- [237.0]
237.0: (start-traversal car1 macro_0007 loc_0084 loc_0089)
237.0: -----waiting---- [255.0]
255.0: (start-traversal car1 road_0139 loc_0089 loc_0040)
255.0: -----waiting---- [264.0]
264.0: (start-traversal car1 road_0060 loc_0040 loc_0004)
264.0: -----waiting---- [276.0]
276.0: (start-traversal car1 road_0006 loc_0004 loc_0094)
276.0: -----waiting---- [287.0]
287.0: (start-traversal car1 road_0149 loc_0094 loc_0138)
287.0: -----waiting---- [288.0]
288.0: (refuel car1 loc_0138)
288.0: (start-traversal car1 road_0223 loc_0138 loc_0094)
288.0: -----waiting---- [290.0]
290.0: (start-traversal car1 road_0149 loc_0094 loc_0138)
290.0: -----waiting---- [291.0]
291.0: (start-traversal car1 road_0222 loc_0138 loc_0134)
291.0: -----waiting---- [297.0]
297.0: (start-traversal car1 road_0216 loc_0134 loc_0021)
297.0: -----waiting---- [301.0]
301.0: (start-traversal car1 road_0031 loc_0021 loc_0104)
301.0: -----waiting---- [313.0]
313.0: (start-traversal car1 road_0166 loc_0104 loc_0061)
313.0: -----waiting---- [314.0]
314.0: (start-traversal car1 road_0096 loc_0061 loc_0134)
314.0: -----waiting---- [328.0]
328.0: (start-traversal car1 road_0215 loc_0134 loc_0138)
328.0: -----waiting---- [334.0]
334.0: (start-traversal car1 road_0223 loc_0138 loc_0094)
334.0: -----waiting---- [336.0]
336.0: (start-traversal car1 road_0149 loc_0094 loc_0138)
336.0: -----waiting---- [337.0]
337.0: (start-traversal car1 road_0223 loc_0138 loc_0094)
337.0: -----waiting---- [339.0]
339.0: (start-traversal car1 road_0149 loc_0094 loc_0138)
339.0: -----waiting---- [340.0]
340.0: (start-traversal car1 road_0222 loc_0138 loc_0134)
340.0: -----waiting---- [346.0]
346.0: (start-traversal car1 road_0216 loc_0134 loc_0021)
346.0: -----waiting---- [350.0]
350.0: (start-traversal car1 road_0031 loc_0021 loc_0104)
350.0: -----waiting---- [362.0]
362.0: (start-traversal car1 road_0167 loc_0104 loc_0059)
362.0: -----waiting---- [363.0]
363.0: (start-traversal car1 road_0090 loc_0059 loc_0104)
363.0: -----waiting---- [364.0]
364.0: (start-traversal car1 road_0167 loc_0104 loc_0059)
364.0: -----waiting---- [365.0]
365.0: (start-traversal car1 road_0090 loc_0059 loc_0104)
365.0: -----waiting---- [366.0]
366.0: (start-traversal car1 road_0167 loc_0104 loc_0059)
366.0: -----waiting---- [367.0]
367.0: (start-traversal car1 road_0090 loc_0059 loc_0104)
367.0: -----waiting---- [368.0]
368.0: (start-traversal car1 road_0167 loc_0104 loc_0059)
368.0: -----waiting---- [369.0]
369.0: (start-traversal car1 road_0091 loc_0059 loc_0139)
369.0: -----waiting---- [381.0]
381.0: (start-traversal car1 road_0225 loc_0139 loc_0090)
381.0: -----waiting---- [389.0]
389.0: (start-traversal car1 road_0141 loc_0090 loc_0081)
389.0: -----waiting---- [411.0]
411.0: (start-traversal car1 road_0123 loc_0081 loc_0101)
411.0: -----waiting---- [416.0]
416.0: (start-traversal car1 road_0161 loc_0101 loc_0056)
416.0: -----waiting---- [424.0]
424.0: (start-traversal car1 road_0084 loc_0056 loc_0005)
424.0: -----waiting---- [439.0]
439.0: (start-traversal car1 macro_0002 loc_0005 loc_0051)
439.0: -----waiting---- [453.0]
453.0: (start-traversal car1 road_0076 loc_0051 loc_0114)
453.0: -----waiting---- [455.0]
455.0: (start-traversal car1 road_0183 loc_0114 loc_0106)
455.0: -----waiting---- [466.0]
466.0: (start-traversal car1 road_0169 loc_0106 loc_0122)
466.0: -----waiting---- [476.0]
476.0: (start-traversal car1 road_0197 loc_0122 loc_0107)
476.0: -----waiting---- [478.0]
478.0: (start-traversal car1 road_0170 loc_0107 loc_0129)
478.0: -----waiting---- [485.0]
485.0: (refuel car1 loc_0129)
485.0: (start-traversal car1 road_0209 loc_0129 loc_0108)
485.0: -----waiting---- [492.0]
492.0: (start-traversal car1 road_0172 loc_0108 loc_0126)
492.0: -----waiting---- [494.0]
494.0: (start-traversal car1 road_0204 loc_0126 loc_0125)
494.0: -----waiting---- [502.0]
502.0: (start-traversal car1 road_0202 loc_0125 loc_0049)
502.0: -----waiting---- [519.0]

Plan-Length:651
Elapsed Time: 519.0
Metric (Search):519.0
Planning Time (msec): 95027
Heuristic Time (msec): 54955
Search Time (msec): 64837
Expanded Nodes:263234
States Evaluated:271799
Fixed constraint violations during search (zero-crossing):0
Number of Dead-Ends detected:7577
Number of Duplicates detected:3616
