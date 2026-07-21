;; ============================================================
;;  PROBLEM: exp_100_nodes_03_planner_comp_node_comp_20260715_150151
;;  Features: tl_cong-pddl-static_llm_macro
;;  Start: loc_0088
;;  Goal:  loc_0085
;; ============================================================

(define (problem exp_100_nodes_03_planner_comp_node_comp_20260715_150151_dynamic)
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
    loc_0091 - loc_type_loc_0091
    loc_0092 - loc_type_loc_0092
    loc_0093 - loc_type_loc_0093
    loc_0094 - loc_type_loc_0094
    loc_0095 - loc_type_loc_0095
    loc_0096 - loc_type_loc_0096
    loc_0097 - loc_type_loc_0097
    loc_0098 - loc_type_loc_0098
    loc_0099 - loc_type_loc_0099
    macro_0000 - road_type_macro_0000
    macro_0001 - road_type_macro_0001
    macro_0002 - road_type_macro_0002
    macro_0003 - road_type_macro_0003
    macro_0004 - road_type_macro_0004
    macro_0005 - road_type_macro_0005
    macro_0006 - road_type_macro_0006
    macro_0007 - road_type_macro_0007
    macro_0008 - road_type_macro_0008
    macro_0009 - road_type_macro_0009
    macro_0010 - road_type_macro_0010
    macro_0011 - road_type_macro_0011
    macro_0012 - road_type_macro_0012
    macro_0013 - road_type_macro_0013
    macro_0014 - road_type_macro_0014
    macro_0015 - road_type_macro_0015
    macro_0016 - road_type_macro_0016
    macro_0017 - road_type_macro_0017
    road_0000 - road_type_road_0000
    road_0001 - road_type_road_0001
    road_0002 - road_type_road_0002
    road_0003 - road_type_road_0003
    road_0004 - road_type_road_0004
    road_0008 - road_type_road_0008
    road_0009 - road_type_road_0009
    road_0010 - road_type_road_0010
    road_0011 - road_type_road_0011
    road_0012 - road_type_road_0012
    road_0013 - road_type_road_0013
    road_0014 - road_type_road_0014
    road_0015 - road_type_road_0015
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
    road_0049 - road_type_road_0049
    road_0050 - road_type_road_0050
    road_0051 - road_type_road_0051
    road_0052 - road_type_road_0052
    road_0054 - road_type_road_0054
    road_0056 - road_type_road_0056
    road_0057 - road_type_road_0057
    road_0058 - road_type_road_0058
    road_0059 - road_type_road_0059
    road_0060 - road_type_road_0060
    road_0061 - road_type_road_0061
    road_0063 - road_type_road_0063
    road_0064 - road_type_road_0064
    road_0065 - road_type_road_0065
    road_0066 - road_type_road_0066
    road_0067 - road_type_road_0067
    road_0069 - road_type_road_0069
    road_0070 - road_type_road_0070
    road_0071 - road_type_road_0071
    road_0072 - road_type_road_0072
    road_0073 - road_type_road_0073
    road_0075 - road_type_road_0075
    road_0076 - road_type_road_0076
    road_0077 - road_type_road_0077
    road_0078 - road_type_road_0078
    road_0079 - road_type_road_0079
    road_0080 - road_type_road_0080
    road_0083 - road_type_road_0083
    road_0084 - road_type_road_0084
    road_0085 - road_type_road_0085
    road_0086 - road_type_road_0086
    road_0088 - road_type_road_0088
    road_0089 - road_type_road_0089
    road_0090 - road_type_road_0090
    road_0092 - road_type_road_0092
    road_0093 - road_type_road_0093
    road_0094 - road_type_road_0094
    road_0095 - road_type_road_0095
    road_0096 - road_type_road_0096
    road_0098 - road_type_road_0098
    road_0100 - road_type_road_0100
    road_0101 - road_type_road_0101
    road_0102 - road_type_road_0102
    road_0103 - road_type_road_0103
    road_0105 - road_type_road_0105
    road_0106 - road_type_road_0106
    road_0108 - road_type_road_0108
    road_0109 - road_type_road_0109
    road_0110 - road_type_road_0110
    road_0111 - road_type_road_0111
    road_0112 - road_type_road_0112
    road_0113 - road_type_road_0113
    road_0114 - road_type_road_0114
    road_0116 - road_type_road_0116
    road_0117 - road_type_road_0117
    road_0118 - road_type_road_0118
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
    road_0133 - road_type_road_0133
    road_0134 - road_type_road_0134
    road_0135 - road_type_road_0135
    road_0137 - road_type_road_0137
    road_0138 - road_type_road_0138
    road_0139 - road_type_road_0139
    road_0140 - road_type_road_0140
    road_0141 - road_type_road_0141
    road_0142 - road_type_road_0142
    road_0143 - road_type_road_0143
    road_0144 - road_type_road_0144
    road_0146 - road_type_road_0146
    road_0147 - road_type_road_0147
    road_0148 - road_type_road_0148
    road_0149 - road_type_road_0149
    road_0150 - road_type_road_0150
    road_0151 - road_type_road_0151
    road_0152 - road_type_road_0152
    road_0154 - road_type_road_0154
    road_0156 - road_type_road_0156
    road_0157 - road_type_road_0157
    road_0158 - road_type_road_0158
    road_0159 - road_type_road_0159
    road_0160 - road_type_road_0160
    road_0161 - road_type_road_0161
  )

  (:init
  (at car1 loc_0088)
  (= (travel-time car1) 0)
  (connects macro_0000 loc_0002 loc_0081)
  (road-open macro_0000)
  (= (congestion-factor macro_0000) 1.29)
  (= (travel-duration macro_0000) 25.0848)
  (connects macro_0001 loc_0003 loc_0031)
  (road-open macro_0001)
  (= (congestion-factor macro_0001) 1.09)
  (= (travel-duration macro_0001) 13.1289)
  (connects macro_0002 loc_0011 loc_0039)
  (road-open macro_0002)
  (= (congestion-factor macro_0002) 1.51)
  (= (travel-duration macro_0002) 13.3514)
  (connects macro_0003 loc_0031 loc_0003)
  (road-open macro_0003)
  (= (congestion-factor macro_0003) 1.29)
  (= (travel-duration macro_0003) 15.4713)
  (connects macro_0004 loc_0036 loc_0031)
  (road-open macro_0004)
  (= (congestion-factor macro_0004) 1.26)
  (= (travel-duration macro_0004) 30.7175)
  (connects macro_0005 loc_0037 loc_0072)
  (road-open macro_0005)
  (= (congestion-factor macro_0005) 1.09)
  (= (travel-duration macro_0005) 22.5377)
  (connects macro_0006 loc_0047 loc_0018)
  (road-open macro_0006)
  (= (congestion-factor macro_0006) 1.4)
  (= (travel-duration macro_0006) 35.4931)
  (connects macro_0007 loc_0050 loc_0038)
  (road-open macro_0007)
  (= (congestion-factor macro_0007) 1.15)
  (= (travel-duration macro_0007) 27.4824)
  (connects macro_0008 loc_0054 loc_0036)
  (road-open macro_0008)
  (= (congestion-factor macro_0008) 1.06)
  (= (travel-duration macro_0008) 11.2068)
  (connects macro_0009 loc_0054 loc_0073)
  (road-open macro_0009)
  (= (congestion-factor macro_0009) 1.11)
  (= (travel-duration macro_0009) 20.2685)
  (connects macro_0010 loc_0056 loc_0060)
  (road-open macro_0010)
  (= (congestion-factor macro_0010) 1.17)
  (= (travel-duration macro_0010) 18.7582)
  (connects macro_0011 loc_0058 loc_0026)
  (road-open macro_0011)
  (= (congestion-factor macro_0011) 1.2)
  (= (travel-duration macro_0011) 35.1748)
  (connects macro_0012 loc_0062 loc_0019)
  (road-open macro_0012)
  (= (congestion-factor macro_0012) 1.26)
  (= (travel-duration macro_0012) 38.423)
  (connects macro_0013 loc_0064 loc_0037)
  (road-open macro_0013)
  (= (congestion-factor macro_0013) 1.14)
  (= (travel-duration macro_0013) 41.2027)
  (connects macro_0014 loc_0081 loc_0002)
  (road-open macro_0014)
  (= (congestion-factor macro_0014) 1.2)
  (= (travel-duration macro_0014) 30.0047)
  (connects macro_0015 loc_0083 loc_0084)
  (road-open macro_0015)
  (= (congestion-factor macro_0015) 1.25)
  (= (travel-duration macro_0015) 18.5017)
  (connects macro_0016 loc_0094 loc_0011)
  (road-open macro_0016)
  (= (congestion-factor macro_0016) 1.23)
  (= (travel-duration macro_0016) 9.9929)
  (connects macro_0017 loc_0096 loc_0010)
  (road-open macro_0017)
  (= (congestion-factor macro_0017) 1.35)
  (= (travel-duration macro_0017) 25.252)
  (connects road_0000 loc_0000 loc_0087)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.05)
  (= (travel-duration road_0000) 16.4134)
  (connects road_0001 loc_0001 loc_0003)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.06)
  (= (travel-duration road_0001) 1.3267)
  (connects road_0002 loc_0001 loc_0031)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.06)
  (= (travel-duration road_0002) 11.4408)
  (connects road_0003 loc_0002 loc_0064)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.23)
  (= (travel-duration road_0003) 11.2668)
  (connects road_0004 loc_0002 loc_0025)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.09)
  (= (travel-duration road_0004) 11.1433)
  (connects road_0008 loc_0004 loc_0002)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.03)
  (= (travel-duration road_0008) 13.6994)
  (connects road_0009 loc_0005 loc_0050)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.0)
  (= (travel-duration road_0009) 4.4642)
  (connects road_0010 loc_0007 loc_0092)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.05)
  (= (travel-duration road_0010) 2.825)
  (connects road_0011 loc_0008 loc_0055)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.11)
  (= (travel-duration road_0011) 33.7491)
  (connects road_0012 loc_0009 loc_0081)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.45)
  (= (travel-duration road_0012) 26.5639)
  (connects road_0013 loc_0009 loc_0080)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.05)
  (= (travel-duration road_0013) 9.812)
  (connects road_0014 loc_0009 loc_0053)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.25)
  (= (travel-duration road_0014) 20.8583)
  (connects road_0015 loc_0010 loc_0059)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.3)
  (= (travel-duration road_0015) 2.5148)
  (connects road_0017 loc_0012 loc_0013)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.5)
  (= (travel-duration road_0017) 57.2837)
  (connects road_0018 loc_0012 loc_0018)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.45)
  (= (travel-duration road_0018) 20.1831)
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
  (= (congestion-factor road_0021) 1.4)
  (= (travel-duration road_0021) 29.8884)
  (connects road_0022 loc_0016 loc_0048)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.15)
  (= (travel-duration road_0022) 15.0593)
  (connects road_0023 loc_0016 loc_0092)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.3)
  (= (travel-duration road_0023) 7.9111)
  (connects road_0024 loc_0017 loc_0060)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.06)
  (= (travel-duration road_0024) 2.5454)
  (connects road_0025 loc_0018 loc_0097)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.7)
  (= (travel-duration road_0025) 37.2376)
  (connects road_0026 loc_0019 loc_0023)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.15)
  (= (travel-duration road_0026) 4.9613)
  (connects road_0027 loc_0019 loc_0095)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.26)
  (= (travel-duration road_0027) 10.719)
  (connects road_0028 loc_0020 loc_0030)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.25)
  (= (travel-duration road_0028) 23.5644)
  (connects road_0029 loc_0020 loc_0041)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.37)
  (= (travel-duration road_0029) 29.2841)
  (connects road_0030 loc_0021 loc_0080)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.0)
  (= (travel-duration road_0030) 2.7265)
  (connects road_0031 loc_0021 loc_0057)
  (road-open road_0031)
  (= (congestion-factor road_0031) 2.5)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (= (travel-duration road_0031) 36.8092)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (connects road_0032 loc_0022 loc_0065)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.0)
  (= (travel-duration road_0032) 3.1285)
  (connects road_0033 loc_0022 loc_0021)
  (road-open road_0033)
  (= (congestion-factor road_0033) 2.5)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (= (travel-duration road_0033) 21.9145)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (connects road_0034 loc_0023 loc_0019)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.2)
  (= (travel-duration road_0034) 5.177)
  (connects road_0035 loc_0024 loc_0033)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.05)
  (= (travel-duration road_0035) 4.1241)
  (connects road_0036 loc_0024 loc_0015)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.35)
  (= (travel-duration road_0036) 37.9098)
  (connects road_0037 loc_0025 loc_0002)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.23)
  (= (travel-duration road_0037) 19.2445)
  (connects road_0038 loc_0025 loc_0060)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.09)
  (= (travel-duration road_0038) 7.8862)
  (connects road_0039 loc_0025 loc_0024)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.2)
  (= (travel-duration road_0039) 12.4896)
  (connects road_0040 loc_0026 loc_0094)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.15)
  (= (travel-duration road_0040) 16.5455)
  (connects road_0041 loc_0026 loc_0011)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.3)
  (= (travel-duration road_0041) 7.7894)
  (connects road_0042 loc_0027 loc_0050)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.3)
  (= (travel-duration road_0042) 9.8097)
  (connects road_0043 loc_0027 loc_0088)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.15)
  (= (travel-duration road_0043) 24.3262)
  (connects road_0044 loc_0028 loc_0022)
  (road-open road_0044)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the low‑distance connector road_0044 and adjacent road_0076 near junction loc_0028. These roads lie close to the direct path and closing them would force a detour between the northern and southern sectors.
  (road-blocked road_0044)
  (= (congestion-factor road_0044) 1.0)
  (= (travel-duration road_0044) 7.3095)
  (connects road_0045 loc_0030 loc_0078)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.17)
  (= (travel-duration road_0045) 50.2498)
  (connects road_0046 loc_0030 loc_0062)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.57)
  (= (travel-duration road_0046) 16.5686)
  (connects road_0047 loc_0031 loc_0079)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.2)
  (= (travel-duration road_0047) 1.1967)
  (connects road_0049 loc_0031 loc_0029)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.55)
  (= (travel-duration road_0049) 46.0964)
  (connects road_0050 loc_0032 loc_0092)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.05)
  (= (travel-duration road_0050) 5.0944)
  (connects road_0051 loc_0033 loc_0024)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.15)
  (= (travel-duration road_0051) 4.5169)
  (connects road_0052 loc_0034 loc_0055)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.2)
  (= (travel-duration road_0052) 26.8486)
  (connects road_0054 loc_0037 loc_0052)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.11)
  (= (travel-duration road_0054) 9.9642)
  (connects road_0056 loc_0038 loc_0066)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.5)
  (= (travel-duration road_0056) 0.4914)
  (connects road_0057 loc_0038 loc_0077)
  (road-open road_0057)
  ;; [DYNAMIC EVENT - accident] Accident on road_0057 connecting loc_0038 and loc_0077, a key link between the western and eastern sections.
  (road-blocked road_0057)
  (= (congestion-factor road_0057) 1.0)
  (= (travel-duration road_0057) 24.0166)
  (connects road_0058 loc_0038 loc_0057)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.0)
  (= (travel-duration road_0058) 3.1105)
  (connects road_0059 loc_0039 loc_0073)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.51)
  (= (travel-duration road_0059) 0.4585)
  (connects road_0060 loc_0041 loc_0063)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.09)
  (= (travel-duration road_0060) 9.4795)
  (connects road_0061 loc_0041 loc_0045)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.45)
  (= (travel-duration road_0061) 5.6239)
  (connects road_0063 loc_0043 loc_0026)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.05)
  (= (travel-duration road_0063) 18.8831)
  (connects road_0064 loc_0044 loc_0068)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.35)
  (= (travel-duration road_0064) 30.9611)
  (connects road_0065 loc_0044 loc_0086)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.03)
  (= (travel-duration road_0065) 20.4739)
  (connects road_0066 loc_0045 loc_0041)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.1)
  (= (travel-duration road_0066) 4.2664)
  (connects road_0067 loc_0046 loc_0031)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.65)
  (= (travel-duration road_0067) 14.2942)
  (connects road_0069 loc_0047 loc_0013)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.17)
  (= (travel-duration road_0069) 12.2616)
  (connects road_0070 loc_0047 loc_0097)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.17)
  (= (travel-duration road_0070) 7.0385)
  (connects road_0071 loc_0048 loc_0081)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.31)
  (= (travel-duration road_0071) 17.1937)
  (connects road_0072 loc_0048 loc_0078)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.46)
  (= (travel-duration road_0072) 9.3858)
  (connects road_0073 loc_0049 loc_0093)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.45)
  (= (travel-duration road_0073) 1.8532)
  (connects road_0075 loc_0050 loc_0005)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.15)
  (= (travel-duration road_0075) 5.1338)
  (connects road_0076 loc_0051 loc_0028)
  (road-open road_0076)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the low‑distance connector road_0044 and adjacent road_0076 near junction loc_0028. These roads lie close to the direct path and closing them would force a detour between the northern and southern sectors.
  (road-blocked road_0076)
  (= (congestion-factor road_0076) 1.0)
  (= (travel-duration road_0076) 3.1513)
  (connects road_0077 loc_0052 loc_0040)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.11)
  (= (travel-duration road_0077) 15.1002)
  (connects road_0078 loc_0053 loc_0049)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.1)
  (= (travel-duration road_0078) 9.2734)
  (connects road_0079 loc_0053 loc_0008)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.15)
  (= (travel-duration road_0079) 13.0857)
  (connects road_0080 loc_0054 loc_0058)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.25)
  (= (travel-duration road_0080) 10.3624)
  (connects road_0083 loc_0054 loc_0089)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.17)
  (= (travel-duration road_0083) 6.6328)
  (connects road_0084 loc_0055 loc_0012)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.8)
  (= (travel-duration road_0084) 11.6364)
  (connects road_0085 loc_0055 loc_0056)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.2)
  (= (travel-duration road_0085) 4.277)
  (connects road_0086 loc_0056 loc_0055)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.31)
  (= (travel-duration road_0086) 11.809)
  (connects road_0088 loc_0057 loc_0038)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.4)
  (= (travel-duration road_0088) 4.3547)
  (connects road_0089 loc_0057 loc_0028)
  (road-open road_0089)
  ;; [DYNAMIC EVENT - location closure] loc_0028 incident road
  (road-blocked road_0089)
  (= (congestion-factor road_0089) 1.0)
  (= (travel-duration road_0089) 5.5286)
  (connects road_0090 loc_0058 loc_0070)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.3)
  (= (travel-duration road_0090) 11.0874)
  (connects road_0092 loc_0058 loc_0067)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.2)
  (= (travel-duration road_0092) 5.5975)
  (connects road_0093 loc_0058 loc_0054)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.1)
  (= (travel-duration road_0093) 9.1189)
  (connects road_0094 loc_0059 loc_0010)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.0)
  (= (travel-duration road_0094) 1.9345)
  (connects road_0095 loc_0060 loc_0056)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.2)
  (= (travel-duration road_0095) 19.0174)
  (connects road_0096 loc_0060 loc_0025)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.26)
  (= (travel-duration road_0096) 9.1162)
  (connects road_0098 loc_0061 loc_0054)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.11)
  (= (travel-duration road_0098) 7.7952)
  (connects road_0100 loc_0062 loc_0020)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.43)
  (= (travel-duration road_0100) 9.6615)
  (connects road_0101 loc_0062 loc_0030)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.03)
  (= (travel-duration road_0101) 10.8698)
  (connects road_0102 loc_0064 loc_0002)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.14)
  (= (travel-duration road_0102) 17.1124)
  (connects road_0103 loc_0064 loc_0094)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.17)
  (= (travel-duration road_0103) 1.0207)
  (connects road_0105 loc_0065 loc_0016)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.05)
  (= (travel-duration road_0105) 0.8959)
  (connects road_0106 loc_0065 loc_0051)
  (road-open road_0106)
  ;; [DYNAMIC EVENT - robbery] Robbery at junction loc_0051 affecting road_0106 (closest to axis) and road_0125. Blocking these roads disrupts the main east‑west corridor.
  (road-blocked road_0106)
  (= (congestion-factor road_0106) 1.0)
  (= (travel-duration road_0106) 7.0947)
  (connects road_0108 loc_0067 loc_0083)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.5)
  (= (travel-duration road_0108) 34.7666)
  (connects road_0109 loc_0067 loc_0068)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.25)
  (= (travel-duration road_0109) 37.245)
  (connects road_0110 loc_0067 loc_0058)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.25)
  (= (travel-duration road_0110) 5.8307)
  (connects road_0111 loc_0068 loc_0046)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.55)
  (= (travel-duration road_0111) 7.9909)
  (connects road_0112 loc_0069 loc_0067)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.6)
  (= (travel-duration road_0112) 42.1342)
  (connects road_0113 loc_0070 loc_0036)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.25)
  (= (travel-duration road_0113) 9.0724)
  (connects road_0114 loc_0070 loc_0046)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.2)
  (= (travel-duration road_0114) 27.6534)
  (connects road_0116 loc_0071 loc_0054)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.03)
  (= (travel-duration road_0116) 4.3991)
  (connects road_0117 loc_0072 loc_0089)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.4)
  (= (travel-duration road_0117) 3.2291)
  (connects road_0118 loc_0072 loc_0054)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.11)
  (= (travel-duration road_0118) 7.0865)
  (connects road_0122 loc_0076 loc_0035)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.45)
  (= (travel-duration road_0122) 46.9767)
  (connects road_0123 loc_0076 loc_0096)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.06)
  (= (travel-duration road_0123) 18.2056)
  (connects road_0124 loc_0077 loc_0080)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.45)
  (= (travel-duration road_0124) 16.8108)
  (connects road_0125 loc_0078 loc_0051)
  (road-open road_0125)
  ;; [DYNAMIC EVENT - robbery] Robbery at junction loc_0051 affecting road_0106 (closest to axis) and road_0125. Blocking these roads disrupts the main east‑west corridor.
  (road-blocked road_0125)
  (= (congestion-factor road_0125) 1.0)
  (= (travel-duration road_0125) 7.8399)
  (connects road_0126 loc_0078 loc_0030)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.51)
  (= (travel-duration road_0126) 64.8523)
  (connects road_0127 loc_0078 loc_0048)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.17)
  (= (travel-duration road_0127) 14.2715)
  (connects road_0128 loc_0079 loc_0031)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.09)
  (= (travel-duration road_0128) 1.087)
  (connects road_0129 loc_0080 loc_0021)
  (road-open road_0129)
  (= (congestion-factor road_0129) 2.5)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (= (travel-duration road_0129) 10.2245)  ;; [DYNAMIC EVENT - slowdown] Slowdown on three roads near junction loc_0021: road_0031 (very close to axis), road_0033, and road_0129. Severity 2.5 reduces speeds by a factor of 2.5 along this corridor.
  (connects road_0130 loc_0080 loc_0009)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.55)
  (= (travel-duration road_0130) 14.4844)
  (connects road_0131 loc_0081 loc_0087)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.65)
  (= (travel-duration road_0131) 7.849)
  (connects road_0133 loc_0081 loc_0048)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.34)
  (= (travel-duration road_0133) 24.3374)
  (connects road_0134 loc_0082 loc_0044)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.17)
  (= (travel-duration road_0134) 14.5362)
  (connects road_0135 loc_0083 loc_0082)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.3)
  (= (travel-duration road_0135) 47.8799)
  (connects road_0137 loc_0084 loc_0085)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.25)
  (= (travel-duration road_0137) 19.2113)
  (connects road_0138 loc_0084 loc_0006)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.1)
  (= (travel-duration road_0138) 5.9719)
  (connects road_0139 loc_0085 loc_0069)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.35)
  (= (travel-duration road_0139) 30.7861)
  (connects road_0140 loc_0087 loc_0081)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.1)
  (= (travel-duration road_0140) 5.2327)
  (connects road_0141 loc_0087 loc_0000)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.5)
  (= (travel-duration road_0141) 23.4477)
  (connects road_0142 loc_0087 loc_0069)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.15)
  (= (travel-duration road_0142) 17.7171)
  (connects road_0143 loc_0088 loc_0049)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.25)
  (= (travel-duration road_0143) 16.1436)
  (connects road_0144 loc_0089 loc_0014)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.37)
  (= (travel-duration road_0144) 5.8742)
  (connects road_0146 loc_0091 loc_0094)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.03)
  (= (travel-duration road_0146) 5.0851)
  (connects road_0147 loc_0091 loc_0011)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.06)
  (= (travel-duration road_0147) 3.3786)
  (connects road_0148 loc_0092 loc_0032)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.15)
  (= (travel-duration road_0148) 5.5796)
  (connects road_0149 loc_0092 loc_0007)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.25)
  (= (travel-duration road_0149) 3.3631)
  (connects road_0150 loc_0092 loc_0016)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.05)
  (= (travel-duration road_0150) 6.3897)
  (connects road_0151 loc_0093 loc_0077)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.45)
  (= (travel-duration road_0151) 8.2914)
  (connects road_0152 loc_0093 loc_0027)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.1)
  (= (travel-duration road_0152) 12.6527)
  (connects road_0154 loc_0094 loc_0064)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.14)
  (= (travel-duration road_0154) 0.9946)
  (connects road_0156 loc_0096 loc_0076)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.29)
  (= (travel-duration road_0156) 22.1559)
  (connects road_0157 loc_0096 loc_0013)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.06)
  (= (travel-duration road_0157) 3.7386)
  (connects road_0158 loc_0097 loc_0047)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.26)
  (= (travel-duration road_0158) 7.58)
  (connects road_0159 loc_0097 loc_0098)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.4)
  (= (travel-duration road_0159) 11.5001)
  (connects road_0160 loc_0098 loc_0097)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.03)
  (= (travel-duration road_0160) 8.4608)
  (connects road_0161 loc_0099 loc_0083)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.05)
  (= (travel-duration road_0161) 3.857)
  (has-traffic-light loc_0002)
  (has-traffic-light loc_0037)
  (has-traffic-light loc_0048)
  (has-traffic-light loc_0052)
  (has-traffic-light loc_0055)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the low‑distance connector road_0044 and adjacent road_0076 near junction loc_0028. These roads lie close to the direct path and closing them would force a detour between the northern and southern sectors.
  (location-blocked loc_0028)
  ;; [DYNAMIC EVENT - robbery] Robbery at junction loc_0051 affecting road_0106 (closest to axis) and road_0125. Blocking these roads disrupts the main east‑west corridor.
  (location-blocked loc_0051)
  )

  (:goal (at car1 loc_0085))

  (:metric minimize (travel-time car1))
)
