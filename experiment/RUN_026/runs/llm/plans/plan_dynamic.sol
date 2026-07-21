;; ==========================================================
;;  CONTROLLER FUEL PLAN (offline replanning)  [events]
;;  vehicle=car1  start=loc_0124  goal=loc_0049
;;  tank=4.201 L  initial=3.361 L  rate=0.003430 L/m  full_range=1225 m
;;  blocked_roads=11  safety_factor=0.9
;; ==========================================================
;; --- leg 0: loc_0124 -> loc_0002 (station), 663 m, 2.274 L consumed, fuel left 1.087 L
0.000: (start-traversal car1 road_0201 loc_0124 loc_0074)
14.000: (start-traversal car1 road_0115 loc_0074 loc_0136)
16.000: (start-traversal car1 road_0220 loc_0136 loc_0111)
24.000: (start-traversal car1 road_0178 loc_0111 loc_0115)
40.000: (start-traversal car1 road_0185 loc_0115 loc_0017)
55.000: (start-traversal car1 road_0023 loc_0017 loc_0116)
79.000: (start-traversal car1 road_0186 loc_0116 loc_0123)
87.000: (start-traversal car1 road_0199 loc_0123 loc_0002)
;; refuel at loc_0002 -> tank full (4.201 L)
;; --- leg 1: loc_0002 -> loc_0049 (goal), 1089 m, 3.736 L consumed, fuel left 0.465 L
88.000: (start-traversal car1 road_0003 loc_0002 loc_0123)
106.000: (start-traversal car1 road_0200 loc_0123 loc_0099)
128.000: (start-traversal car1 road_0158 loc_0099 loc_0097)
169.000: (start-traversal car1 road_0155 loc_0097 loc_0098)
204.000: (start-traversal car1 road_0157 loc_0098 loc_0070)
211.000: (start-traversal car1 road_0108 loc_0070 loc_0051)
224.000: (start-traversal car1 road_0078 loc_0051 loc_0049)
