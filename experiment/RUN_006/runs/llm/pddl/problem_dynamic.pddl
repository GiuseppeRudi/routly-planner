;; ============================================================
;;  PROBLEM: exp_100_nodes_06_roadabs_comp_node_comp_20260715_150440
;;  Features: tl_cong-pddl-static_llm
;;  Start: loc_0088
;;  Goal:  loc_0085
;; ============================================================

(define (problem exp_100_nodes_06_roadabs_comp_node_comp_20260715_150440_dynamic)
  (:domain road-network)

  (:objects
    car1 - vehicle
    loc_0000 - loc_type_loc_0000
    loc_0001 - loc_type_loc_0001
    loc_0002 - loc_type_loc_0002
    loc_0003 - loc_type_loc_0003
    loc_0004 - loc_type_loc_0004
    loc_0005 - loc_type_loc_0005
    loc_0006 - loc_type_loc_0006
    loc_0007 - loc_type_loc_0007
    loc_0008 - loc_type_loc_0008
    loc_0009 - loc_type_loc_0009
    loc_0010 - loc_type_loc_0010
    loc_0011 - loc_type_loc_0011
    loc_0012 - loc_type_loc_0012
    loc_0013 - loc_type_loc_0013
    loc_0014 - loc_type_loc_0014
    loc_0015 - loc_type_loc_0015
    loc_0016 - loc_type_loc_0016
    loc_0017 - loc_type_loc_0017
    loc_0018 - loc_type_loc_0018
    loc_0019 - loc_type_loc_0019
    loc_0020 - loc_type_loc_0020
    loc_0021 - loc_type_loc_0021
    loc_0022 - loc_type_loc_0022
    loc_0023 - loc_type_loc_0023
    loc_0024 - loc_type_loc_0024
    loc_0025 - loc_type_loc_0025
    loc_0026 - loc_type_loc_0026
    loc_0027 - loc_type_loc_0027
    loc_0028 - loc_type_loc_0028
    loc_0029 - loc_type_loc_0029
    loc_0030 - loc_type_loc_0030
    loc_0031 - loc_type_loc_0031
    loc_0032 - loc_type_loc_0032
    loc_0033 - loc_type_loc_0033
    loc_0034 - loc_type_loc_0034
    loc_0035 - loc_type_loc_0035
    loc_0036 - loc_type_loc_0036
    loc_0037 - loc_type_loc_0037
    loc_0038 - loc_type_loc_0038
    loc_0039 - loc_type_loc_0039
    loc_0040 - loc_type_loc_0040
    loc_0041 - loc_type_loc_0041
    loc_0042 - loc_type_loc_0042
    loc_0043 - loc_type_loc_0043
    loc_0044 - loc_type_loc_0044
    loc_0045 - loc_type_loc_0045
    loc_0046 - loc_type_loc_0046
    loc_0047 - loc_type_loc_0047
    loc_0048 - loc_type_loc_0048
    loc_0049 - loc_type_loc_0049
    loc_0050 - loc_type_loc_0050
    loc_0051 - loc_type_loc_0051
    loc_0052 - loc_type_loc_0052
    loc_0053 - loc_type_loc_0053
    loc_0054 - loc_type_loc_0054
    loc_0055 - loc_type_loc_0055
    loc_0056 - loc_type_loc_0056
    loc_0057 - loc_type_loc_0057
    loc_0058 - loc_type_loc_0058
    loc_0059 - loc_type_loc_0059
    loc_0060 - loc_type_loc_0060
    loc_0061 - loc_type_loc_0061
    loc_0062 - loc_type_loc_0062
    loc_0063 - loc_type_loc_0063
    loc_0064 - loc_type_loc_0064
    loc_0065 - loc_type_loc_0065
    loc_0066 - loc_type_loc_0066
    loc_0067 - loc_type_loc_0067
    loc_0068 - loc_type_loc_0068
    loc_0069 - loc_type_loc_0069
    loc_0070 - loc_type_loc_0070
    loc_0071 - loc_type_loc_0071
    loc_0072 - loc_type_loc_0072
    loc_0073 - loc_type_loc_0073
    loc_0074 - loc_type_loc_0074
    loc_0075 - loc_type_loc_0075
    loc_0076 - loc_type_loc_0076
    loc_0077 - loc_type_loc_0077
    loc_0078 - loc_type_loc_0078
    loc_0079 - loc_type_loc_0079
    loc_0080 - loc_type_loc_0080
    loc_0081 - loc_type_loc_0081
    loc_0082 - loc_type_loc_0082
    loc_0083 - loc_type_loc_0083
    loc_0084 - loc_type_loc_0084
    loc_0085 - loc_type_loc_0085
    loc_0086 - loc_type_loc_0086
    loc_0087 - loc_type_loc_0087
    loc_0088 - loc_type_loc_0088
    loc_0089 - loc_type_loc_0089
    loc_0090 - loc_type_loc_0090
    loc_0091 - loc_type_loc_0091
    loc_0092 - loc_type_loc_0092
    loc_0093 - loc_type_loc_0093
    loc_0094 - loc_type_loc_0094
    loc_0095 - loc_type_loc_0095
    loc_0096 - loc_type_loc_0096
    loc_0097 - loc_type_loc_0097
    loc_0098 - loc_type_loc_0098
    loc_0099 - loc_type_loc_0099
    road_0000 - road_type_road_0000
    road_0001 - road_type_road_0001
    road_0002 - road_type_road_0002
    road_0003 - road_type_road_0003
    road_0004 - road_type_road_0004
    road_0005 - road_type_road_0005
    road_0006 - road_type_road_0006
    road_0007 - road_type_road_0007
    road_0008 - road_type_road_0008
    road_0009 - road_type_road_0009
    road_0010 - road_type_road_0010
    road_0011 - road_type_road_0011
    road_0012 - road_type_road_0012
    road_0013 - road_type_road_0013
    road_0014 - road_type_road_0014
    road_0015 - road_type_road_0015
    road_0016 - road_type_road_0016
    road_0017 - road_type_road_0017
    road_0018 - road_type_road_0018
    road_0019 - road_type_road_0019
    road_0020 - road_type_road_0020
    road_0021 - road_type_road_0021
    road_0022 - road_type_road_0022
    road_0023 - road_type_road_0023
    road_0024 - road_type_road_0024
    road_0025 - road_type_road_0025
    road_0026 - road_type_road_0026
    road_0027 - road_type_road_0027
    road_0028 - road_type_road_0028
    road_0029 - road_type_road_0029
    road_0030 - road_type_road_0030
    road_0031 - road_type_road_0031
    road_0032 - road_type_road_0032
    road_0033 - road_type_road_0033
    road_0034 - road_type_road_0034
    road_0035 - road_type_road_0035
    road_0036 - road_type_road_0036
    road_0037 - road_type_road_0037
    road_0038 - road_type_road_0038
    road_0039 - road_type_road_0039
    road_0040 - road_type_road_0040
    road_0041 - road_type_road_0041
    road_0042 - road_type_road_0042
    road_0043 - road_type_road_0043
    road_0044 - road_type_road_0044
    road_0045 - road_type_road_0045
    road_0046 - road_type_road_0046
    road_0047 - road_type_road_0047
    road_0048 - road_type_road_0048
    road_0049 - road_type_road_0049
    road_0050 - road_type_road_0050
    road_0051 - road_type_road_0051
    road_0052 - road_type_road_0052
    road_0053 - road_type_road_0053
    road_0054 - road_type_road_0054
    road_0055 - road_type_road_0055
    road_0056 - road_type_road_0056
    road_0057 - road_type_road_0057
    road_0058 - road_type_road_0058
    road_0059 - road_type_road_0059
    road_0060 - road_type_road_0060
    road_0061 - road_type_road_0061
    road_0062 - road_type_road_0062
    road_0063 - road_type_road_0063
    road_0064 - road_type_road_0064
    road_0065 - road_type_road_0065
    road_0066 - road_type_road_0066
    road_0067 - road_type_road_0067
    road_0068 - road_type_road_0068
    road_0069 - road_type_road_0069
    road_0070 - road_type_road_0070
    road_0071 - road_type_road_0071
    road_0072 - road_type_road_0072
    road_0073 - road_type_road_0073
    road_0074 - road_type_road_0074
    road_0075 - road_type_road_0075
    road_0076 - road_type_road_0076
    road_0077 - road_type_road_0077
    road_0078 - road_type_road_0078
    road_0079 - road_type_road_0079
    road_0080 - road_type_road_0080
    road_0081 - road_type_road_0081
    road_0082 - road_type_road_0082
    road_0083 - road_type_road_0083
    road_0084 - road_type_road_0084
    road_0085 - road_type_road_0085
    road_0086 - road_type_road_0086
    road_0087 - road_type_road_0087
    road_0088 - road_type_road_0088
    road_0089 - road_type_road_0089
    road_0090 - road_type_road_0090
    road_0091 - road_type_road_0091
    road_0092 - road_type_road_0092
    road_0093 - road_type_road_0093
    road_0094 - road_type_road_0094
    road_0095 - road_type_road_0095
    road_0096 - road_type_road_0096
    road_0097 - road_type_road_0097
    road_0098 - road_type_road_0098
    road_0099 - road_type_road_0099
    road_0100 - road_type_road_0100
    road_0101 - road_type_road_0101
    road_0102 - road_type_road_0102
    road_0103 - road_type_road_0103
    road_0104 - road_type_road_0104
    road_0105 - road_type_road_0105
    road_0106 - road_type_road_0106
    road_0107 - road_type_road_0107
    road_0108 - road_type_road_0108
    road_0109 - road_type_road_0109
    road_0110 - road_type_road_0110
    road_0111 - road_type_road_0111
    road_0112 - road_type_road_0112
    road_0113 - road_type_road_0113
    road_0114 - road_type_road_0114
    road_0115 - road_type_road_0115
    road_0116 - road_type_road_0116
    road_0117 - road_type_road_0117
    road_0118 - road_type_road_0118
    road_0119 - road_type_road_0119
    road_0120 - road_type_road_0120
    road_0121 - road_type_road_0121
    road_0122 - road_type_road_0122
    road_0123 - road_type_road_0123
    road_0124 - road_type_road_0124
    road_0125 - road_type_road_0125
    road_0126 - road_type_road_0126
    road_0127 - road_type_road_0127
    road_0128 - road_type_road_0128
    road_0129 - road_type_road_0129
    road_0130 - road_type_road_0130
    road_0131 - road_type_road_0131
    road_0132 - road_type_road_0132
    road_0133 - road_type_road_0133
    road_0134 - road_type_road_0134
    road_0135 - road_type_road_0135
    road_0136 - road_type_road_0136
    road_0137 - road_type_road_0137
    road_0138 - road_type_road_0138
    road_0139 - road_type_road_0139
    road_0140 - road_type_road_0140
    road_0141 - road_type_road_0141
    road_0142 - road_type_road_0142
    road_0143 - road_type_road_0143
    road_0144 - road_type_road_0144
    road_0145 - road_type_road_0145
    road_0146 - road_type_road_0146
    road_0147 - road_type_road_0147
    road_0148 - road_type_road_0148
    road_0149 - road_type_road_0149
    road_0150 - road_type_road_0150
    road_0151 - road_type_road_0151
    road_0152 - road_type_road_0152
    road_0153 - road_type_road_0153
    road_0154 - road_type_road_0154
    road_0155 - road_type_road_0155
    road_0156 - road_type_road_0156
    road_0157 - road_type_road_0157
    road_0158 - road_type_road_0158
    road_0159 - road_type_road_0159
    road_0160 - road_type_road_0160
    road_0161 - road_type_road_0161
    road_0162 - road_type_road_0162
  )

  (:init
  (at car1 loc_0088)
  (= (travel-time car1) 0)
  (connects road_0000 loc_0000 loc_0087)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.05)
  (= (travel-duration road_0000) 16.4134)
  (connects road_0001 loc_0001 loc_0003)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.17)
  (= (travel-duration road_0001) 1.4644)
  (connects road_0002 loc_0001 loc_0031)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.54)
  (= (travel-duration road_0002) 16.6216)
  (connects road_0003 loc_0002 loc_0064)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.31)
  (= (travel-duration road_0003) 11.9996)
  (connects road_0004 loc_0002 loc_0025)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.23)
  (= (travel-duration road_0004) 12.5745)
  (connects road_0005 loc_0002 loc_0004)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.14)
  (= (travel-duration road_0005) 7.7801)
  (connects road_0006 loc_0003 loc_0001)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.57)
  (= (travel-duration road_0006) 1.9651)
  (connects road_0007 loc_0004 loc_0081)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.14)
  (= (travel-duration road_0007) 14.3878)
  (connects road_0008 loc_0004 loc_0002)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.26)
  (= (travel-duration road_0008) 14.3891)
  (connects road_0009 loc_0005 loc_0050)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.05)
  (= (travel-duration road_0009) 4.6874)
  (connects road_0010 loc_0007 loc_0092)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.05)
  (= (travel-duration road_0010) 2.825)
  (connects road_0011 loc_0008 loc_0055)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.29)
  (= (travel-duration road_0011) 38.0641)
  (connects road_0012 loc_0009 loc_0081)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.75)
  (= (travel-duration road_0012) 32.0599)
  (connects road_0013 loc_0009 loc_0080)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.1)
  (= (travel-duration road_0013) 10.2793)
  (connects road_0014 loc_0009 loc_0053)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.4)
  (= (travel-duration road_0014) 23.3613)
  (connects road_0015 loc_0010 loc_0059)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.0)
  (= (travel-duration road_0015) 1.9345)
  (connects road_0016 loc_0011 loc_0073)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.63)
  (= (travel-duration road_0016) 13.9175)
  (connects road_0017 loc_0012 loc_0013)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.55)
  (= (travel-duration road_0017) 59.1931)
  (connects road_0018 loc_0012 loc_0018)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.5)
  (= (travel-duration road_0018) 20.879)
  (connects road_0019 loc_0013 loc_0096)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.31)
  (= (travel-duration road_0019) 4.6203)
  (connects road_0020 loc_0013 loc_0047)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.2)
  (= (travel-duration road_0020) 12.576)
  (connects road_0021 loc_0015 loc_0034)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.5)
  (= (travel-duration road_0021) 32.0233)
  (connects road_0022 loc_0016 loc_0048)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.25)
  (= (travel-duration road_0022) 15.7819)
  (connects road_0023 loc_0016 loc_0092)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.3)
  (= (travel-duration road_0023) 7.9111)
  (connects road_0024 loc_0017 loc_0060)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.29)
  (= (travel-duration road_0024) 3.0977)
  (connects road_0025 loc_0018 loc_0097)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.65)
  (= (travel-duration road_0025) 36.1424)
  (connects road_0026 loc_0019 loc_0023)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.15)
  (= (travel-duration road_0026) 4.9613)
  (connects road_0027 loc_0019 loc_0095)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.03)
  (= (travel-duration road_0027) 8.7624)
  (connects road_0028 loc_0020 loc_0030)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.05)
  (= (travel-duration road_0028) 19.7941)
  (connects road_0029 loc_0020 loc_0041)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.2)
  (= (travel-duration road_0029) 25.6503)
  (connects road_0030 loc_0021 loc_0080)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.35)
  (= (travel-duration road_0030) 3.6808)
  (connects road_0031 loc_0021 loc_0057)
  (road-open road_0031)
  (= (congestion-factor road_0031) 3.0)  ;; [DYNAMIC EVENT - slowdown] Light congestion on roads near the axis at node loc_0021 (road_0031: 6.9, road_0033: 28.8) reduces speeds by a factor of 3.0. The slowdown affects the primary corridor but keeps the roads open, simulating traffic build‑up on the most direct route.
  (= (travel-duration road_0031) 46.695)  ;; [DYNAMIC EVENT - slowdown] Light congestion on roads near the axis at node loc_0021 (road_0031: 6.9, road_0033: 28.8) reduces speeds by a factor of 3.0. The slowdown affects the primary corridor but keeps the roads open, simulating traffic build‑up on the most direct route.
  (connects road_0032 loc_0022 loc_0065)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.35)
  (= (travel-duration road_0032) 4.2235)
  (connects road_0033 loc_0022 loc_0021)
  (road-open road_0033)
  (= (congestion-factor road_0033) 3.0)  ;; [DYNAMIC EVENT - slowdown] Light congestion on roads near the axis at node loc_0021 (road_0031: 6.9, road_0033: 28.8) reduces speeds by a factor of 3.0. The slowdown affects the primary corridor but keeps the roads open, simulating traffic build‑up on the most direct route.
  (= (travel-duration road_0033) 25.5006)  ;; [DYNAMIC EVENT - slowdown] Light congestion on roads near the axis at node loc_0021 (road_0031: 6.9, road_0033: 28.8) reduces speeds by a factor of 3.0. The slowdown affects the primary corridor but keeps the roads open, simulating traffic build‑up on the most direct route.
  (connects road_0034 loc_0023 loc_0019)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.0)
  (= (travel-duration road_0034) 4.3142)
  (connects road_0035 loc_0024 loc_0033)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.3)
  (= (travel-duration road_0035) 5.1061)
  (connects road_0036 loc_0024 loc_0015)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.45)
  (= (travel-duration road_0036) 40.718)
  (connects road_0037 loc_0025 loc_0002)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.14)
  (= (travel-duration road_0037) 17.4445)
  (connects road_0038 loc_0025 loc_0060)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.26)
  (= (travel-duration road_0038) 9.1162)
  (connects road_0039 loc_0025 loc_0024)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.5)
  (= (travel-duration road_0039) 15.612)
  (connects road_0040 loc_0026 loc_0094)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.1)
  (= (travel-duration road_0040) 15.8261)
  (connects road_0041 loc_0026 loc_0011)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.5)
  (= (travel-duration road_0041) 8.9878)
  (connects road_0042 loc_0027 loc_0050)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.2)
  (= (travel-duration road_0042) 9.0551)
  (connects road_0043 loc_0027 loc_0088)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.15)
  (= (travel-duration road_0043) 24.3262)
  (connects road_0044 loc_0028 loc_0022)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.7)
  (= (travel-duration road_0044) 12.4261)
  (connects road_0045 loc_0030 loc_0078)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.06)
  (= (travel-duration road_0045) 45.5254)
  (connects road_0046 loc_0030 loc_0062)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.23)
  (= (travel-duration road_0046) 12.9805)
  (connects road_0047 loc_0031 loc_0079)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.43)
  (= (travel-duration road_0047) 1.4261)
  (connects road_0048 loc_0031 loc_0001)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.17)
  (= (travel-duration road_0048) 12.5677)
  (connects road_0049 loc_0031 loc_0029)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.7)
  (= (travel-duration road_0049) 50.5573)
  (connects road_0050 loc_0032 loc_0092)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.05)
  (= (travel-duration road_0050) 5.0944)
  (connects road_0051 loc_0033 loc_0024)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.1)
  (= (travel-duration road_0051) 4.3205)
  (connects road_0052 loc_0034 loc_0055)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.31)
  (= (travel-duration road_0052) 28.6553)
  (connects road_0053 loc_0036 loc_0003)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.54)
  (= (travel-duration road_0053) 18.9945)
  (connects road_0054 loc_0037 loc_0052)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.11)
  (= (travel-duration road_0054) 9.9642)
  (connects road_0055 loc_0037 loc_0042)
  (road-open road_0055)
  (= (congestion-factor road_0055) 1.11)
  (= (travel-duration road_0055) 3.0211)
  (connects road_0056 loc_0038 loc_0066)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.15)
  (= (travel-duration road_0056) 0.3768)
  (connects road_0057 loc_0038 loc_0077)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.4)
  (= (travel-duration road_0057) 33.6232)
  (connects road_0058 loc_0038 loc_0057)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.35)
  (= (travel-duration road_0058) 4.1992)
  (connects road_0059 loc_0039 loc_0073)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.11)
  (= (travel-duration road_0059) 0.337)
  (connects road_0060 loc_0041 loc_0063)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.09)
  (= (travel-duration road_0060) 9.4795)
  (connects road_0061 loc_0041 loc_0045)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.2)
  (= (travel-duration road_0061) 4.6543)
  (connects road_0062 loc_0042 loc_0072)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.17)
  (= (travel-duration road_0062) 21.0075)
  (connects road_0063 loc_0043 loc_0026)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.35)
  (= (travel-duration road_0063) 24.2783)
  (connects road_0064 loc_0044 loc_0068)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.25)
  (= (travel-duration road_0064) 28.6676)
  (connects road_0065 loc_0044 loc_0086)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.09)
  (= (travel-duration road_0065) 21.6666)
  (connects road_0066 loc_0045 loc_0041)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.05)
  (= (travel-duration road_0066) 4.0725)
  (connects road_0067 loc_0046 loc_0031)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.9)
  (= (travel-duration road_0067) 16.46)
  (connects road_0068 loc_0047 loc_0075)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.2)
  (= (travel-duration road_0068) 26.5187)
  (connects road_0069 loc_0047 loc_0013)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.14)
  (= (travel-duration road_0069) 11.9472)
  (connects road_0070 loc_0047 loc_0097)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.17)
  (= (travel-duration road_0070) 7.0385)
  (connects road_0071 loc_0048 loc_0081)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.23)
  (= (travel-duration road_0071) 16.1437)
  (connects road_0072 loc_0048 loc_0078)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.26)
  (= (travel-duration road_0072) 8.1001)
  (connects road_0073 loc_0049 loc_0093)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.3)
  (= (travel-duration road_0073) 1.6615)
  (connects road_0074 loc_0050 loc_0066)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.25)
  (= (travel-duration road_0074) 29.4627)
  (connects road_0075 loc_0050 loc_0005)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.15)
  (= (travel-duration road_0075) 5.1338)
  (connects road_0076 loc_0051 loc_0028)
  (road-open road_0076)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close both roads incident on the low‑degree node loc_0051. road_0076 (27.5) connects to loc_0028, and road_0125 (17.9) connects to loc_0078. Blocking both disconnects the two branches and isolates the central corridor, creating a significant detour.
  (road-blocked road_0076)
  (= (congestion-factor road_0076) 1.0)
  (= (travel-duration road_0076) 3.1513)
  (connects road_0077 loc_0052 loc_0040)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.09)
  (= (travel-duration road_0077) 14.8281)
  (connects road_0078 loc_0053 loc_0049)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.2)
  (= (travel-duration road_0078) 10.1164)
  (connects road_0079 loc_0053 loc_0008)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.45)
  (= (travel-duration road_0079) 16.4993)
  (connects road_0080 loc_0054 loc_0058)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.2)
  (= (travel-duration road_0080) 9.9479)
  (connects road_0081 loc_0054 loc_0071)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.2)
  (= (travel-duration road_0081) 5.1252)
  (connects road_0082 loc_0054 loc_0061)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.09)
  (= (travel-duration road_0082) 7.6547)
  (connects road_0083 loc_0054 loc_0089)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.17)
  (= (travel-duration road_0083) 6.6328)
  (connects road_0084 loc_0055 loc_0012)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.9)
  (= (travel-duration road_0084) 12.2829)
  (connects road_0085 loc_0055 loc_0056)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.2)
  (= (travel-duration road_0085) 4.277)
  (connects road_0086 loc_0056 loc_0055)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.11)
  (= (travel-duration road_0086) 11.0962)
  (connects road_0087 loc_0056 loc_0017)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.43)
  (= (travel-duration road_0087) 19.4928)
  (connects road_0088 loc_0057 loc_0038)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.25)
  (= (travel-duration road_0088) 3.8882)
  (connects road_0089 loc_0057 loc_0028)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.7)
  (= (travel-duration road_0089) 9.3987)
  (connects road_0090 loc_0058 loc_0070)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.3)
  (= (travel-duration road_0090) 11.0874)
  (connects road_0091 loc_0058 loc_0043)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.2)
  (= (travel-duration road_0091) 13.5941)
  (connects road_0092 loc_0058 loc_0067)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.15)
  (= (travel-duration road_0092) 5.3643)
  (connects road_0093 loc_0058 loc_0054)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.45)
  (= (travel-duration road_0093) 12.0204)
  (connects road_0094 loc_0059 loc_0010)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.25)
  (= (travel-duration road_0094) 2.4181)
  (connects road_0095 loc_0060 loc_0056)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.29)
  (= (travel-duration road_0095) 20.4437)
  (connects road_0096 loc_0060 loc_0025)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.31)
  (= (travel-duration road_0096) 9.478)
  (connects road_0097 loc_0061 loc_0039)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.11)
  (= (travel-duration road_0097) 12.1363)
  (connects road_0098 loc_0061 loc_0054)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.06)
  (= (travel-duration road_0098) 7.444)
  (connects road_0099 loc_0062 loc_0090)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.14)
  (= (travel-duration road_0099) 15.6793)
  (connects road_0100 loc_0062 loc_0020)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.17)
  (= (travel-duration road_0100) 7.9048)
  (connects road_0101 loc_0062 loc_0030)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.03)
  (= (travel-duration road_0101) 10.8698)
  (connects road_0102 loc_0064 loc_0002)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.23)
  (= (travel-duration road_0102) 17.0568)
  (connects road_0103 loc_0064 loc_0094)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.14)
  (= (travel-duration road_0103) 0.9946)
  (connects road_0104 loc_0064 loc_0074)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.23)
  (= (travel-duration road_0104) 27.8075)
  (connects road_0105 loc_0065 loc_0016)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.3)
  (= (travel-duration road_0105) 1.1092)
  (connects road_0106 loc_0065 loc_0051)
  (road-open road_0106)
  ;; [DYNAMIC EVENT - accident] A single-vehicle collision blocks road_0106 (distance_to_axis 4.3), a key link between loc_0065 and loc_0051 that lies near the direct path between start and goal, forcing drivers to detour around a critical connector.
  (road-blocked road_0106)
  (= (congestion-factor road_0106) 1.0)
  (= (travel-duration road_0106) 7.0947)
  (connects road_0107 loc_0066 loc_0038)
  (road-open road_0107)
  (= (congestion-factor road_0107) 1.35)
  (= (travel-duration road_0107) 0.4423)
  (connects road_0108 loc_0067 loc_0083)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.35)
  (= (travel-duration road_0108) 31.2899)
  (connects road_0109 loc_0067 loc_0068)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.45)
  (= (travel-duration road_0109) 43.2042)
  (connects road_0110 loc_0067 loc_0058)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.65)
  (= (travel-duration road_0110) 7.6966)
  (connects road_0111 loc_0068 loc_0046)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.7)
  (= (travel-duration road_0111) 8.7642)
  (connects road_0112 loc_0069 loc_0067)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.95)
  (= (travel-duration road_0112) 51.351)
  (connects road_0113 loc_0070 loc_0036)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.6)
  (= (travel-duration road_0113) 11.6126)
  (connects road_0114 loc_0070 loc_0046)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.2)
  (= (travel-duration road_0114) 27.6534)
  (connects road_0115 loc_0071 loc_0036)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.2)
  (= (travel-duration road_0115) 7.5617)
  (connects road_0116 loc_0071 loc_0054)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.06)
  (= (travel-duration road_0116) 4.5272)
  (connects road_0117 loc_0072 loc_0089)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.2)
  (= (travel-duration road_0117) 2.7678)
  (connects road_0118 loc_0072 loc_0054)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.11)
  (= (travel-duration road_0118) 7.0865)
  (connects road_0119 loc_0073 loc_0039)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.63)
  (= (travel-duration road_0119) 0.4949)
  (connects road_0120 loc_0074 loc_0037)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.23)
  (= (travel-duration road_0120) 16.1822)
  (connects road_0121 loc_0075 loc_0018)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.2)
  (= (travel-duration road_0121) 3.904)
  (connects road_0122 loc_0076 loc_0035)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.35)
  (= (travel-duration road_0122) 43.7369)
  (connects road_0123 loc_0076 loc_0096)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.11)
  (= (travel-duration road_0123) 19.0643)
  (connects road_0124 loc_0077 loc_0080)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.8)
  (= (travel-duration road_0124) 20.8686)
  (connects road_0125 loc_0078 loc_0051)
  (road-open road_0125)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close both roads incident on the low‑degree node loc_0051. road_0076 (27.5) connects to loc_0028, and road_0125 (17.9) connects to loc_0078. Blocking both disconnects the two branches and isolates the central corridor, creating a significant detour.
  (road-blocked road_0125)
  (= (congestion-factor road_0125) 1.0)
  (= (travel-duration road_0125) 7.8399)
  (connects road_0126 loc_0078 loc_0030)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.23)
  (= (travel-duration road_0126) 52.8267)
  (connects road_0127 loc_0078 loc_0048)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.09)
  (= (travel-duration road_0127) 13.7572)
  (connects road_0128 loc_0079 loc_0031)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.0)
  (= (travel-duration road_0128) 0.9972)
  (connects road_0129 loc_0080 loc_0021)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.35)
  (= (travel-duration road_0129) 3.6808)
  (connects road_0130 loc_0080 loc_0009)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.9)
  (= (travel-duration road_0130) 17.7551)
  (connects road_0131 loc_0081 loc_0087)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.95)
  (= (travel-duration road_0131) 9.2761)
  (connects road_0132 loc_0081 loc_0004)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.23)
  (= (travel-duration road_0132) 15.5237)
  (connects road_0133 loc_0081 loc_0048)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.17)
  (= (travel-duration road_0133) 22.1062)
  (connects road_0134 loc_0082 loc_0044)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.17)
  (= (travel-duration road_0134) 14.5362)
  (connects road_0135 loc_0083 loc_0082)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.25)
  (= (travel-duration road_0135) 46.0383)
  (connects road_0136 loc_0083 loc_0099)
  (road-open road_0136)
  (= (congestion-factor road_0136) 1.2)
  (= (travel-duration road_0136) 4.408)
  (connects road_0137 loc_0084 loc_0085)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.2)
  (= (travel-duration road_0137) 18.4428)
  (connects road_0138 loc_0084 loc_0006)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.15)
  (= (travel-duration road_0138) 6.2434)
  (connects road_0139 loc_0085 loc_0069)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.3)
  (= (travel-duration road_0139) 29.6459)
  (connects road_0140 loc_0087 loc_0081)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.0)
  (= (travel-duration road_0140) 4.757)
  (connects road_0141 loc_0087 loc_0000)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.3)
  (= (travel-duration road_0141) 20.3214)
  (connects road_0142 loc_0087 loc_0069)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.7)
  (= (travel-duration road_0142) 26.1906)
  (connects road_0143 loc_0088 loc_0049)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.1)
  (= (travel-duration road_0143) 14.2064)
  (connects road_0144 loc_0089 loc_0014)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.29)
  (= (travel-duration road_0144) 5.5312)
  (connects road_0145 loc_0090 loc_0019)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.14)
  (= (travel-duration road_0145) 19.0844)
  (connects road_0146 loc_0091 loc_0094)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.03)
  (= (travel-duration road_0146) 5.0851)
  (connects road_0147 loc_0091 loc_0011)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.29)
  (= (travel-duration road_0147) 4.1117)
  (connects road_0148 loc_0092 loc_0032)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.25)
  (= (travel-duration road_0148) 6.0647)
  (connects road_0149 loc_0092 loc_0007)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.1)
  (= (travel-duration road_0149) 2.9596)
  (connects road_0150 loc_0092 loc_0016)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.05)
  (= (travel-duration road_0150) 6.3897)
  (connects road_0151 loc_0093 loc_0077)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.2)
  (= (travel-duration road_0151) 6.8619)
  (connects road_0152 loc_0093 loc_0027)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.2)
  (= (travel-duration road_0152) 13.803)
  (connects road_0153 loc_0094 loc_0091)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.17)
  (= (travel-duration road_0153) 5.7763)
  (connects road_0154 loc_0094 loc_0064)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.14)
  (= (travel-duration road_0154) 0.9946)
  (connects road_0155 loc_0096 loc_0059)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.25)
  (= (travel-duration road_0155) 20.9633)
  (connects road_0156 loc_0096 loc_0076)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.23)
  (= (travel-duration road_0156) 21.1254)
  (connects road_0157 loc_0096 loc_0013)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.09)
  (= (travel-duration road_0157) 3.8444)
  (connects road_0158 loc_0097 loc_0047)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.2)
  (= (travel-duration road_0158) 7.219)
  (connects road_0159 loc_0097 loc_0098)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.37)
  (= (travel-duration road_0159) 11.2536)
  (connects road_0160 loc_0098 loc_0097)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.03)
  (= (travel-duration road_0160) 8.4608)
  (connects road_0161 loc_0099 loc_0083)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.0)
  (= (travel-duration road_0161) 3.6733)
  (connects road_0162 loc_0099 loc_0084)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.25)
  (= (travel-duration road_0162) 13.9101)
  (has-traffic-light loc_0002)
  (has-traffic-light loc_0037)
  (has-traffic-light loc_0048)
  (has-traffic-light loc_0052)
  (has-traffic-light loc_0055)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close both roads incident on the low‑degree node loc_0051. road_0076 (27.5) connects to loc_0028, and road_0125 (17.9) connects to loc_0078. Blocking both disconnects the two branches and isolates the central corridor, creating a significant detour.
  (location-blocked loc_0051)
  )

  (:goal (at car1 loc_0085))

  (:metric minimize (travel-time car1))
)
