;; ============================================================
;;  PROBLEM: exp_100_nodes_05_planner_comp_line_comp_20260715_150339
;;  Features: tl_cong-pddl-static_llm_macro
;;  Start: loc_0088
;;  Goal:  loc_0085
;; ============================================================

(define (problem exp_100_nodes_05_planner_comp_line_comp_20260715_150339_dynamic)
  (:domain road-network)

  (:objects
    car1 - vehicle
    loc_0000 - location
    loc_0001 - location
    loc_0002 - location
    loc_0003 - location
    loc_0004 - location
    loc_0005 - location
    loc_0006 - location
    loc_0007 - location
    loc_0008 - location
    loc_0009 - location
    loc_0010 - location
    loc_0011 - location
    loc_0012 - location
    loc_0013 - location
    loc_0014 - location
    loc_0015 - location
    loc_0016 - location
    loc_0017 - location
    loc_0018 - location
    loc_0019 - location
    loc_0020 - location
    loc_0021 - location
    loc_0022 - location
    loc_0023 - location
    loc_0024 - location
    loc_0025 - location
    loc_0026 - location
    loc_0027 - location
    loc_0028 - location
    loc_0029 - location
    loc_0030 - location
    loc_0031 - location
    loc_0032 - location
    loc_0033 - location
    loc_0034 - location
    loc_0035 - location
    loc_0036 - location
    loc_0037 - location
    loc_0038 - location
    loc_0039 - location
    loc_0040 - location
    loc_0041 - location
    loc_0043 - location
    loc_0044 - location
    loc_0045 - location
    loc_0046 - location
    loc_0047 - location
    loc_0048 - location
    loc_0049 - location
    loc_0050 - location
    loc_0051 - location
    loc_0052 - location
    loc_0053 - location
    loc_0054 - location
    loc_0055 - location
    loc_0056 - location
    loc_0057 - location
    loc_0058 - location
    loc_0059 - location
    loc_0060 - location
    loc_0061 - location
    loc_0062 - location
    loc_0063 - location
    loc_0064 - location
    loc_0065 - location
    loc_0066 - location
    loc_0067 - location
    loc_0068 - location
    loc_0069 - location
    loc_0070 - location
    loc_0071 - location
    loc_0072 - location
    loc_0073 - location
    loc_0076 - location
    loc_0077 - location
    loc_0078 - location
    loc_0079 - location
    loc_0080 - location
    loc_0081 - location
    loc_0082 - location
    loc_0083 - location
    loc_0084 - location
    loc_0085 - location
    loc_0086 - location
    loc_0087 - location
    loc_0088 - location
    loc_0089 - location
    loc_0091 - location
    loc_0092 - location
    loc_0093 - location
    loc_0094 - location
    loc_0095 - location
    loc_0096 - location
    loc_0097 - location
    loc_0098 - location
    loc_0099 - location
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
  (ready-road car1 road_0143)
  (= (travel-time car1) 0)
  (connects macro_0000 loc_0002 loc_0081)
  (road-open macro_0000)
  (= (congestion-factor macro_0000) 1.11)
  (= (travel-duration macro_0000) 21.5846)
  (road-next macro_0000 macro_0014)
  (road-next macro_0000 road_0131)
  (road-next macro_0000 road_0133)
  (connects macro_0001 loc_0003 loc_0031)
  (road-open macro_0001)
  (= (congestion-factor macro_0001) 1.09)
  (= (travel-duration macro_0001) 13.1289)
  (road-next macro_0001 macro_0003)
  (road-next macro_0001 road_0047)
  (road-next macro_0001 road_0049)
  (connects macro_0002 loc_0011 loc_0039)
  (road-open macro_0002)
  (= (congestion-factor macro_0002) 1.37)
  (= (travel-duration macro_0002) 12.1135)
  (road-next macro_0002 road_0059)
  (connects macro_0003 loc_0031 loc_0003)
  (road-open macro_0003)
  (= (congestion-factor macro_0003) 1.37)
  (= (travel-duration macro_0003) 16.4308)
  (road-next macro_0003 macro_0001)
  (connects macro_0004 loc_0036 loc_0031)
  (road-open macro_0004)
  (= (congestion-factor macro_0004) 1.2)
  (= (travel-duration macro_0004) 29.2548)
  (road-next macro_0004 macro_0003)
  (road-next macro_0004 road_0047)
  (road-next macro_0004 road_0049)
  (connects macro_0005 loc_0037 loc_0072)
  (road-open macro_0005)
  (= (congestion-factor macro_0005) 1.2)
  (= (travel-duration macro_0005) 24.8122)
  (road-next macro_0005 road_0117)
  (road-next macro_0005 road_0118)
  (connects macro_0006 loc_0047 loc_0018)
  (road-open macro_0006)
  (= (congestion-factor macro_0006) 1.55)
  (= (travel-duration macro_0006) 39.2959)
  (road-next macro_0006 road_0025)
  (connects macro_0007 loc_0050 loc_0038)
  (road-open macro_0007)
  (= (congestion-factor macro_0007) 1.15)
  (= (travel-duration macro_0007) 27.4824)
  (road-next macro_0007 road_0056)
  (road-next macro_0007 road_0057)
  (road-next macro_0007 road_0058)
  (connects macro_0008 loc_0054 loc_0036)
  (road-open macro_0008)
  (= (congestion-factor macro_0008) 1.14)
  (= (travel-duration macro_0008) 12.0526)
  (road-next macro_0008 macro_0004)
  (connects macro_0009 loc_0054 loc_0073)
  (road-open macro_0009)
  (= (congestion-factor macro_0009) 1.03)
  (= (travel-duration macro_0009) 18.8077)
  (connects macro_0010 loc_0056 loc_0060)
  (road-open macro_0010)
  (= (congestion-factor macro_0010) 1.37)
  (= (travel-duration macro_0010) 21.9647)
  (road-next macro_0010 road_0095)
  (road-next macro_0010 road_0096)
  (connects macro_0011 loc_0058 loc_0026)
  (road-open macro_0011)
  (= (congestion-factor macro_0011) 1.35)
  (= (travel-duration macro_0011) 39.5717)
  (road-next macro_0011 road_0040)
  (road-next macro_0011 road_0041)
  (connects macro_0012 loc_0062 loc_0019)
  (road-open macro_0012)
  (= (congestion-factor macro_0012) 1.23)
  (= (travel-duration macro_0012) 37.5081)
  (road-next macro_0012 road_0026)
  (road-next macro_0012 road_0027)
  (connects macro_0013 loc_0064 loc_0037)
  (road-open macro_0013)
  (= (congestion-factor macro_0013) 1.43)
  (= (travel-duration macro_0013) 50.1832)
  (road-next macro_0013 macro_0005)
  (road-next macro_0013 road_0054)
  (connects macro_0014 loc_0081 loc_0002)
  (road-open macro_0014)
  (= (congestion-factor macro_0014) 1.2)
  (= (travel-duration macro_0014) 30.0047)
  (road-next macro_0014 macro_0000)
  (road-next macro_0014 road_0003)
  (road-next macro_0014 road_0004)
  (connects macro_0015 loc_0083 loc_0084)
  (road-open macro_0015)
  (= (congestion-factor macro_0015) 1.15)
  (= (travel-duration macro_0015) 17.0216)
  (road-next macro_0015 road_0137)
  (road-next macro_0015 road_0138)
  (connects macro_0016 loc_0094 loc_0011)
  (road-open macro_0016)
  (= (congestion-factor macro_0016) 1.26)
  (= (travel-duration macro_0016) 10.2366)
  (road-next macro_0016 macro_0002)
  (connects macro_0017 loc_0096 loc_0010)
  (road-open macro_0017)
  (= (congestion-factor macro_0017) 1.3)
  (= (travel-duration macro_0017) 24.3167)
  (road-next macro_0017 road_0015)
  (connects road_0000 loc_0000 loc_0087)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.15)
  (= (travel-duration road_0000) 17.9766)
  (road-next road_0000 road_0140)
  (road-next road_0000 road_0141)
  (road-next road_0000 road_0142)
  (connects road_0001 loc_0001 loc_0003)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.03)
  (= (travel-duration road_0001) 1.2892)
  (road-next road_0001 macro_0001)
  (connects road_0002 loc_0001 loc_0031)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.11)
  (= (travel-duration road_0002) 11.9805)
  (road-next road_0002 macro_0003)
  (road-next road_0002 road_0047)
  (road-next road_0002 road_0049)
  (connects road_0003 loc_0002 loc_0064)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.37)
  (= (travel-duration road_0003) 12.5492)
  (road-next road_0003 macro_0013)
  (road-next road_0003 road_0102)
  (road-next road_0003 road_0103)
  (connects road_0004 loc_0002 loc_0025)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.31)
  (= (travel-duration road_0004) 13.3924)
  (road-next road_0004 road_0037)
  (road-next road_0004 road_0038)
  (road-next road_0004 road_0039)
  (connects road_0008 loc_0004 loc_0002)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.11)
  (= (travel-duration road_0008) 14.2454)
  (road-next road_0008 macro_0000)
  (road-next road_0008 road_0003)
  (road-next road_0008 road_0004)
  (connects road_0009 loc_0005 loc_0050)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.05)
  (= (travel-duration road_0009) 4.6874)
  (road-next road_0009 macro_0007)
  (road-next road_0009 road_0075)
  (connects road_0010 loc_0007 loc_0092)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.05)
  (= (travel-duration road_0010) 2.825)
  (road-next road_0010 road_0148)
  (road-next road_0010 road_0149)
  (road-next road_0010 road_0150)
  (connects road_0011 loc_0008 loc_0055)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.17)
  (= (travel-duration road_0011) 35.1874)
  (road-next road_0011 road_0084)
  (road-next road_0011 road_0085)
  (connects road_0012 loc_0009 loc_0081)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.3)
  (= (travel-duration road_0012) 23.8159)
  (road-next road_0012 macro_0014)
  (road-next road_0012 road_0131)
  (road-next road_0012 road_0133)
  (connects road_0013 loc_0009 loc_0080)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.0)
  (= (travel-duration road_0013) 9.3448)
  (road-next road_0013 road_0129)
  (road-next road_0013 road_0130)
  (connects road_0014 loc_0009 loc_0053)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.3)
  (= (travel-duration road_0014) 21.6927)
  (road-next road_0014 road_0078)
  (road-next road_0014 road_0079)
  (connects road_0015 loc_0010 loc_0059)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.25)
  (= (travel-duration road_0015) 2.4181)
  (road-next road_0015 road_0094)
  (connects road_0017 loc_0012 loc_0013)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.35)
  (= (travel-duration road_0017) 51.5553)
  (road-next road_0017 road_0019)
  (road-next road_0017 road_0020)
  (connects road_0018 loc_0012 loc_0018)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.65)
  (= (travel-duration road_0018) 22.9669)
  (road-next road_0018 road_0025)
  (connects road_0019 loc_0013 loc_0096)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.23)
  (= (travel-duration road_0019) 4.3381)
  (road-next road_0019 macro_0017)
  (road-next road_0019 road_0156)
  (road-next road_0019 road_0157)
  (connects road_0020 loc_0013 loc_0047)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.26)
  (= (travel-duration road_0020) 13.2048)
  (road-next road_0020 macro_0006)
  (road-next road_0020 road_0069)
  (road-next road_0020 road_0070)
  (connects road_0021 loc_0015 loc_0034)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.4)
  (= (travel-duration road_0021) 29.8884)
  (road-next road_0021 road_0052)
  (connects road_0022 loc_0016 loc_0048)
  (road-open road_0022)
  (= (congestion-factor road_0022) 2.8)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (= (travel-duration road_0022) 48.2356)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (road-next road_0022 road_0071)
  (road-next road_0022 road_0072)
  (connects road_0023 loc_0016 loc_0092)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.2)
  (= (travel-duration road_0023) 7.3025)
  (road-next road_0023 road_0148)
  (road-next road_0023 road_0149)
  (road-next road_0023 road_0150)
  (connects road_0024 loc_0017 loc_0060)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.06)
  (= (travel-duration road_0024) 2.5454)
  (road-next road_0024 road_0095)
  (road-next road_0024 road_0096)
  (connects road_0025 loc_0018 loc_0097)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.95)
  (= (travel-duration road_0025) 42.7137)
  (road-next road_0025 road_0158)
  (road-next road_0025 road_0159)
  (connects road_0026 loc_0019 loc_0023)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.2)
  (= (travel-duration road_0026) 5.177)
  (road-next road_0026 road_0034)
  (connects road_0027 loc_0019 loc_0095)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.17)
  (= (travel-duration road_0027) 9.9534)
  (connects road_0028 loc_0020 loc_0030)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.1)
  (= (travel-duration road_0028) 20.7367)
  (road-next road_0028 road_0045)
  (road-next road_0028 road_0046)
  (connects road_0029 loc_0020 loc_0041)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.37)
  (= (travel-duration road_0029) 29.2841)
  (road-next road_0029 road_0060)
  (road-next road_0029 road_0061)
  (connects road_0030 loc_0021 loc_0080)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.15)
  (= (travel-duration road_0030) 3.1355)
  (road-next road_0030 road_0129)
  (road-next road_0030 road_0130)
  (connects road_0031 loc_0021 loc_0057)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.35)
  (= (travel-duration road_0031) 11.3583)
  (road-next road_0031 road_0088)
  (road-next road_0031 road_0089)
  (connects road_0032 loc_0022 loc_0065)
  (road-open road_0032)
  ;; [DYNAMIC EVENT - roadworks] These three roads meet at node loc_0065, a low‑degree junction linking the eastern sub‑area to the core network. Blocking all three removes the primary connection between loc_0065 and its neighbors, creating a significant detour.
  (road-blocked road_0032)
  (= (congestion-factor road_0032) 1.0)
  (= (travel-duration road_0032) 3.1285)
  (road-next road_0032 road_0105)
  (road-next road_0032 road_0106)
  (connects road_0033 loc_0022 loc_0021)
  (road-open road_0033)
  ;; [DYNAMIC EVENT - location closure] loc_0022 incident road
  (road-blocked road_0033)
  (= (congestion-factor road_0033) 1.0)
  (= (travel-duration road_0033) 5.3126)
  (road-next road_0033 road_0030)
  (road-next road_0033 road_0031)
  (connects road_0034 loc_0023 loc_0019)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.1)
  (= (travel-duration road_0034) 4.7456)
  (road-next road_0034 road_0026)
  (road-next road_0034 road_0027)
  (connects road_0035 loc_0024 loc_0033)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.4)
  (= (travel-duration road_0035) 5.4989)
  (road-next road_0035 road_0051)
  (connects road_0036 loc_0024 loc_0015)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.35)
  (= (travel-duration road_0036) 37.9098)
  (road-next road_0036 road_0021)
  (connects road_0037 loc_0025 loc_0002)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.34)
  (= (travel-duration road_0037) 20.3691)
  (road-next road_0037 macro_0000)
  (road-next road_0037 road_0003)
  (road-next road_0037 road_0004)
  (connects road_0038 loc_0025 loc_0060)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.26)
  (= (travel-duration road_0038) 9.1162)
  (road-next road_0038 road_0095)
  (road-next road_0038 road_0096)
  (connects road_0039 loc_0025 loc_0024)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.65)
  (= (travel-duration road_0039) 17.1732)
  (road-next road_0039 road_0035)
  (road-next road_0039 road_0036)
  (connects road_0040 loc_0026 loc_0094)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.25)
  (= (travel-duration road_0040) 17.9842)
  (road-next road_0040 macro_0016)
  (road-next road_0040 road_0154)
  (connects road_0041 loc_0026 loc_0011)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.15)
  (= (travel-duration road_0041) 6.8906)
  (road-next road_0041 macro_0002)
  (connects road_0042 loc_0027 loc_0050)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.1)
  (= (travel-duration road_0042) 8.3005)
  (road-next road_0042 macro_0007)
  (road-next road_0042 road_0075)
  (connects road_0043 loc_0027 loc_0088)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.1)
  (= (travel-duration road_0043) 23.2686)
  (road-next road_0043 road_0143)
  (connects road_0044 loc_0028 loc_0022)
  (road-open road_0044)
  ;; [DYNAMIC EVENT - accident] road_0044 connects loc_0028 to loc_0022 and lies almost directly on the axis (distance 0.1). Its closure would sever the narrow corridor between the two sub‑areas, forcing traffic to detour via longer routes.
  (road-blocked road_0044)
  (= (congestion-factor road_0044) 1.0)
  (= (travel-duration road_0044) 7.3095)
  (road-next road_0044 road_0032)
  (road-next road_0044 road_0033)
  (connects road_0045 loc_0030 loc_0078)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.26)
  (= (travel-duration road_0045) 54.1151)
  (road-next road_0045 road_0125)
  (road-next road_0045 road_0126)
  (road-next road_0045 road_0127)
  (connects road_0046 loc_0030 loc_0062)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.49)
  (= (travel-duration road_0046) 15.7243)
  (road-next road_0046 macro_0012)
  (road-next road_0046 road_0100)
  (road-next road_0046 road_0101)
  (connects road_0047 loc_0031 loc_0079)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.2)
  (= (travel-duration road_0047) 1.1967)
  (road-next road_0047 road_0128)
  (connects road_0049 loc_0031 loc_0029)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.5)
  (= (travel-duration road_0049) 44.6094)
  (connects road_0050 loc_0032 loc_0092)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.05)
  (= (travel-duration road_0050) 5.0944)
  (road-next road_0050 road_0148)
  (road-next road_0050 road_0149)
  (road-next road_0050 road_0150)
  (connects road_0051 loc_0033 loc_0024)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.05)
  (= (travel-duration road_0051) 4.1241)
  (road-next road_0051 road_0035)
  (road-next road_0051 road_0036)
  (connects road_0052 loc_0034 loc_0055)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.29)
  (= (travel-duration road_0052) 28.3268)
  (road-next road_0052 road_0084)
  (road-next road_0052 road_0085)
  (connects road_0054 loc_0037 loc_0052)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.26)
  (= (travel-duration road_0054) 10.3986)
  (road-next road_0054 road_0077)
  (connects road_0056 loc_0038 loc_0066)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.2)
  (= (travel-duration road_0056) 0.3931)
  (connects road_0057 loc_0038 loc_0077)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.2)
  (= (travel-duration road_0057) 28.8199)
  (road-next road_0057 road_0124)
  (connects road_0058 loc_0038 loc_0057)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.0)
  (= (travel-duration road_0058) 3.1105)
  (road-next road_0058 road_0088)
  (road-next road_0058 road_0089)
  (connects road_0059 loc_0039 loc_0073)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.37)
  (= (travel-duration road_0059) 0.4159)
  (connects road_0060 loc_0041 loc_0063)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.2)
  (= (travel-duration road_0060) 10.4361)
  (connects road_0061 loc_0041 loc_0045)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.35)
  (= (travel-duration road_0061) 5.236)
  (road-next road_0061 road_0066)
  (connects road_0063 loc_0043 loc_0026)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.0)
  (= (travel-duration road_0063) 17.9839)
  (road-next road_0063 road_0040)
  (road-next road_0063 road_0041)
  (connects road_0064 loc_0044 loc_0068)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.35)
  (= (travel-duration road_0064) 30.9611)
  (road-next road_0064 road_0111)
  (connects road_0065 loc_0044 loc_0086)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.06)
  (= (travel-duration road_0065) 21.0703)
  (connects road_0066 loc_0045 loc_0041)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.05)
  (= (travel-duration road_0066) 4.0725)
  (road-next road_0066 road_0060)
  (road-next road_0066 road_0061)
  (connects road_0067 loc_0046 loc_0031)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.85)
  (= (travel-duration road_0067) 16.0268)
  (road-next road_0067 macro_0003)
  (road-next road_0067 road_0047)
  (road-next road_0067 road_0049)
  (connects road_0069 loc_0047 loc_0013)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.2)
  (= (travel-duration road_0069) 12.576)
  (road-next road_0069 road_0019)
  (road-next road_0069 road_0020)
  (connects road_0070 loc_0047 loc_0097)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.11)
  (= (travel-duration road_0070) 6.6776)
  (road-next road_0070 road_0158)
  (road-next road_0070 road_0159)
  (connects road_0071 loc_0048 loc_0081)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.31)
  (= (travel-duration road_0071) 17.1937)
  (road-next road_0071 macro_0014)
  (road-next road_0071 road_0131)
  (road-next road_0071 road_0133)
  (connects road_0072 loc_0048 loc_0078)
  (road-open road_0072)
  (= (congestion-factor road_0072) 2.8)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (= (travel-duration road_0072) 21.6003)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (road-next road_0072 road_0125)
  (road-next road_0072 road_0126)
  (road-next road_0072 road_0127)
  (connects road_0073 loc_0049 loc_0093)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.25)
  (= (travel-duration road_0073) 1.5976)
  (road-next road_0073 road_0151)
  (road-next road_0073 road_0152)
  (connects road_0075 loc_0050 loc_0005)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.05)
  (= (travel-duration road_0075) 4.6874)
  (road-next road_0075 road_0009)
  (connects road_0076 loc_0051 loc_0028)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.35)
  (= (travel-duration road_0076) 4.2543)
  (road-next road_0076 road_0044)
  (connects road_0077 loc_0052 loc_0040)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.26)
  (= (travel-duration road_0077) 17.1407)
  (connects road_0078 loc_0053 loc_0049)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.2)
  (= (travel-duration road_0078) 10.1164)
  (road-next road_0078 road_0073)
  (connects road_0079 loc_0053 loc_0008)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.25)
  (= (travel-duration road_0079) 14.2236)
  (road-next road_0079 road_0011)
  (connects road_0080 loc_0054 loc_0058)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.15)
  (= (travel-duration road_0080) 9.5334)
  (road-next road_0080 macro_0011)
  (road-next road_0080 road_0090)
  (road-next road_0080 road_0092)
  (road-next road_0080 road_0093)
  (connects road_0083 loc_0054 loc_0089)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.17)
  (= (travel-duration road_0083) 6.6328)
  (road-next road_0083 road_0144)
  (connects road_0084 loc_0055 loc_0012)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.95)
  (= (travel-duration road_0084) 12.6061)
  (road-next road_0084 road_0017)
  (road-next road_0084 road_0018)
  (connects road_0085 loc_0055 loc_0056)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.37)
  (= (travel-duration road_0085) 4.8829)
  (road-next road_0085 macro_0010)
  (road-next road_0085 road_0086)
  (connects road_0086 loc_0056 loc_0055)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.37)
  (= (travel-duration road_0086) 12.0229)
  (road-next road_0086 road_0084)
  (road-next road_0086 road_0085)
  (connects road_0088 loc_0057 loc_0038)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.25)
  (= (travel-duration road_0088) 3.8882)
  (road-next road_0088 road_0056)
  (road-next road_0088 road_0057)
  (road-next road_0088 road_0058)
  (connects road_0089 loc_0057 loc_0028)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.2)
  (= (travel-duration road_0089) 6.6343)
  (road-next road_0089 road_0044)
  (connects road_0090 loc_0058 loc_0070)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.1)
  (= (travel-duration road_0090) 9.3816)
  (road-next road_0090 road_0113)
  (road-next road_0090 road_0114)
  (connects road_0092 loc_0058 loc_0067)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.1)
  (= (travel-duration road_0092) 5.131)
  (road-next road_0092 road_0108)
  (road-next road_0092 road_0109)
  (road-next road_0092 road_0110)
  (connects road_0093 loc_0058 loc_0054)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.15)
  (= (travel-duration road_0093) 9.5334)
  (road-next road_0093 macro_0008)
  (road-next road_0093 macro_0009)
  (road-next road_0093 road_0080)
  (road-next road_0093 road_0083)
  (connects road_0094 loc_0059 loc_0010)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.0)
  (= (travel-duration road_0094) 1.9345)
  (road-next road_0094 road_0015)
  (connects road_0095 loc_0060 loc_0056)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.34)
  (= (travel-duration road_0095) 21.2361)
  (road-next road_0095 macro_0010)
  (road-next road_0095 road_0086)
  (connects road_0096 loc_0060 loc_0025)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.51)
  (= (travel-duration road_0096) 10.925)
  (road-next road_0096 road_0037)
  (road-next road_0096 road_0038)
  (road-next road_0096 road_0039)
  (connects road_0098 loc_0061 loc_0054)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.06)
  (= (travel-duration road_0098) 7.444)
  (road-next road_0098 macro_0008)
  (road-next road_0098 macro_0009)
  (road-next road_0098 road_0080)
  (road-next road_0098 road_0083)
  (connects road_0100 loc_0062 loc_0020)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.31)
  (= (travel-duration road_0100) 8.8507)
  (road-next road_0100 road_0028)
  (road-next road_0100 road_0029)
  (connects road_0101 loc_0062 loc_0030)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.09)
  (= (travel-duration road_0101) 11.503)
  (road-next road_0101 road_0045)
  (road-next road_0101 road_0046)
  (connects road_0102 loc_0064 loc_0002)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.09)
  (= (travel-duration road_0102) 16.6544)
  (road-next road_0102 macro_0000)
  (road-next road_0102 road_0003)
  (road-next road_0102 road_0004)
  (connects road_0103 loc_0064 loc_0094)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.2)
  (= (travel-duration road_0103) 1.0469)
  (road-next road_0103 macro_0016)
  (road-next road_0103 road_0154)
  (connects road_0105 loc_0065 loc_0016)
  (road-open road_0105)
  ;; [DYNAMIC EVENT - roadworks] These three roads meet at node loc_0065, a low‑degree junction linking the eastern sub‑area to the core network. Blocking all three removes the primary connection between loc_0065 and its neighbors, creating a significant detour.
  (road-blocked road_0105)
  (= (congestion-factor road_0105) 1.0)
  (= (travel-duration road_0105) 0.8532)
  (road-next road_0105 road_0022)
  (road-next road_0105 road_0023)
  (connects road_0106 loc_0065 loc_0051)
  (road-open road_0106)
  ;; [DYNAMIC EVENT - roadworks] These three roads meet at node loc_0065, a low‑degree junction linking the eastern sub‑area to the core network. Blocking all three removes the primary connection between loc_0065 and its neighbors, creating a significant detour.
  (road-blocked road_0106)
  (= (congestion-factor road_0106) 1.0)
  (= (travel-duration road_0106) 7.0947)
  (road-next road_0106 road_0076)
  (connects road_0108 loc_0067 loc_0083)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.3)
  (= (travel-duration road_0108) 30.131)
  (road-next road_0108 macro_0015)
  (road-next road_0108 road_0135)
  (connects road_0109 loc_0067 loc_0068)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.25)
  (= (travel-duration road_0109) 37.245)
  (road-next road_0109 road_0111)
  (connects road_0110 loc_0067 loc_0058)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.25)
  (= (travel-duration road_0110) 5.8307)
  (road-next road_0110 macro_0011)
  (road-next road_0110 road_0090)
  (road-next road_0110 road_0092)
  (road-next road_0110 road_0093)
  (connects road_0111 loc_0068 loc_0046)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.6)
  (= (travel-duration road_0111) 8.2486)
  (road-next road_0111 road_0067)
  (connects road_0112 loc_0069 loc_0067)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.7)
  (= (travel-duration road_0112) 44.7676)
  (road-next road_0112 road_0108)
  (road-next road_0112 road_0109)
  (road-next road_0112 road_0110)
  (connects road_0113 loc_0070 loc_0036)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.1)
  (= (travel-duration road_0113) 7.9837)
  (road-next road_0113 macro_0004)
  (connects road_0114 loc_0070 loc_0046)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.1)
  (= (travel-duration road_0114) 25.349)
  (road-next road_0114 road_0067)
  (connects road_0116 loc_0071 loc_0054)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.0)
  (= (travel-duration road_0116) 4.271)
  (road-next road_0116 macro_0008)
  (road-next road_0116 macro_0009)
  (road-next road_0116 road_0080)
  (road-next road_0116 road_0083)
  (connects road_0117 loc_0072 loc_0089)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.2)
  (= (travel-duration road_0117) 2.7678)
  (road-next road_0117 road_0144)
  (connects road_0118 loc_0072 loc_0054)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.14)
  (= (travel-duration road_0118) 7.2781)
  (road-next road_0118 macro_0008)
  (road-next road_0118 macro_0009)
  (road-next road_0118 road_0080)
  (road-next road_0118 road_0083)
  (connects road_0122 loc_0076 loc_0035)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.15)
  (= (travel-duration road_0122) 37.2574)
  (connects road_0123 loc_0076 loc_0096)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.06)
  (= (travel-duration road_0123) 18.2056)
  (road-next road_0123 macro_0017)
  (road-next road_0123 road_0156)
  (road-next road_0123 road_0157)
  (connects road_0124 loc_0077 loc_0080)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.35)
  (= (travel-duration road_0124) 15.6514)
  (road-next road_0124 road_0129)
  (road-next road_0124 road_0130)
  (connects road_0125 loc_0078 loc_0051)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.4)
  (= (travel-duration road_0125) 10.9759)
  (road-next road_0125 road_0076)
  (connects road_0126 loc_0078 loc_0030)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.37)
  (= (travel-duration road_0126) 58.8395)
  (road-next road_0126 road_0045)
  (road-next road_0126 road_0046)
  (connects road_0127 loc_0078 loc_0048)
  (road-open road_0127)
  (= (congestion-factor road_0127) 2.8)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (= (travel-duration road_0127) 39.9602)  ;; [DYNAMIC EVENT - slowdown] Roads 0022, 0072, and 0127 form a cluster around node loc_0048, which sits near the central axis. Slowing these three roads (severity 2.8) simulates construction affecting the main corridor, increasing travel time without closing the link.
  (road-next road_0127 road_0071)
  (road-next road_0127 road_0072)
  (connects road_0128 loc_0079 loc_0031)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.06)
  (= (travel-duration road_0128) 1.0571)
  (road-next road_0128 macro_0003)
  (road-next road_0128 road_0047)
  (road-next road_0128 road_0049)
  (connects road_0129 loc_0080 loc_0021)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.3)
  (= (travel-duration road_0129) 3.5445)
  (road-next road_0129 road_0030)
  (road-next road_0129 road_0031)
  (connects road_0130 loc_0080 loc_0009)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.45)
  (= (travel-duration road_0130) 13.5499)
  (road-next road_0130 road_0012)
  (road-next road_0130 road_0013)
  (road-next road_0130 road_0014)
  (connects road_0131 loc_0081 loc_0087)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.5)
  (= (travel-duration road_0131) 7.1355)
  (road-next road_0131 road_0140)
  (road-next road_0131 road_0141)
  (road-next road_0131 road_0142)
  (connects road_0133 loc_0081 loc_0048)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.26)
  (= (travel-duration road_0133) 23.2874)
  (road-next road_0133 road_0071)
  (road-next road_0133 road_0072)
  (connects road_0134 loc_0082 loc_0044)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.2)
  (= (travel-duration road_0134) 14.9089)
  (road-next road_0134 road_0064)
  (road-next road_0134 road_0065)
  (connects road_0135 loc_0083 loc_0082)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.3)
  (= (travel-duration road_0135) 47.8799)
  (road-next road_0135 road_0134)
  (connects road_0137 loc_0084 loc_0085)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.2)
  (= (travel-duration road_0137) 18.4428)
  (road-next road_0137 road_0139)
  (goal-road road_0137)
  (connects road_0138 loc_0084 loc_0006)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.0)
  (= (travel-duration road_0138) 5.429)
  (connects road_0139 loc_0085 loc_0069)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.3)
  (= (travel-duration road_0139) 29.6459)
  (road-next road_0139 road_0112)
  (connects road_0140 loc_0087 loc_0081)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.15)
  (= (travel-duration road_0140) 5.4705)
  (road-next road_0140 macro_0014)
  (road-next road_0140 road_0131)
  (road-next road_0140 road_0133)
  (connects road_0141 loc_0087 loc_0000)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.2)
  (= (travel-duration road_0141) 18.7582)
  (road-next road_0141 road_0000)
  (connects road_0142 loc_0087 loc_0069)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.5)
  (= (travel-duration road_0142) 23.1093)
  (road-next road_0142 road_0112)
  (connects road_0143 loc_0088 loc_0049)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.05)
  (= (travel-duration road_0143) 13.5607)
  (road-next road_0143 road_0073)
  (connects road_0144 loc_0089 loc_0014)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.29)
  (= (travel-duration road_0144) 5.5312)
  (connects road_0146 loc_0091 loc_0094)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.09)
  (= (travel-duration road_0146) 5.3813)
  (road-next road_0146 macro_0016)
  (road-next road_0146 road_0154)
  (connects road_0147 loc_0091 loc_0011)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.0)
  (= (travel-duration road_0147) 3.1873)
  (road-next road_0147 macro_0002)
  (connects road_0148 loc_0092 loc_0032)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.15)
  (= (travel-duration road_0148) 5.5796)
  (road-next road_0148 road_0050)
  (connects road_0149 loc_0092 loc_0007)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.05)
  (= (travel-duration road_0149) 2.825)
  (road-next road_0149 road_0010)
  (connects road_0150 loc_0092 loc_0016)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.2)
  (= (travel-duration road_0150) 7.3025)
  (road-next road_0150 road_0022)
  (road-next road_0150 road_0023)
  (connects road_0151 loc_0093 loc_0077)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.2)
  (= (travel-duration road_0151) 6.8619)
  (road-next road_0151 road_0124)
  (connects road_0152 loc_0093 loc_0027)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.15)
  (= (travel-duration road_0152) 13.2278)
  (road-next road_0152 road_0042)
  (road-next road_0152 road_0043)
  (connects road_0154 loc_0094 loc_0064)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.23)
  (= (travel-duration road_0154) 1.0731)
  (road-next road_0154 macro_0013)
  (road-next road_0154 road_0102)
  (road-next road_0154 road_0103)
  (connects road_0156 loc_0096 loc_0076)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.09)
  (= (travel-duration road_0156) 18.7208)
  (road-next road_0156 road_0122)
  (road-next road_0156 road_0123)
  (connects road_0157 loc_0096 loc_0013)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.11)
  (= (travel-duration road_0157) 3.9149)
  (road-next road_0157 road_0019)
  (road-next road_0157 road_0020)
  (connects road_0158 loc_0097 loc_0047)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.34)
  (= (travel-duration road_0158) 8.0612)
  (road-next road_0158 macro_0006)
  (road-next road_0158 road_0069)
  (road-next road_0158 road_0070)
  (connects road_0159 loc_0097 loc_0098)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.43)
  (= (travel-duration road_0159) 11.7465)
  (road-next road_0159 road_0160)
  (connects road_0160 loc_0098 loc_0097)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.06)
  (= (travel-duration road_0160) 8.7072)
  (road-next road_0160 road_0158)
  (road-next road_0160 road_0159)
  (connects road_0161 loc_0099 loc_0083)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.05)
  (= (travel-duration road_0161) 3.857)
  (road-next road_0161 macro_0015)
  (road-next road_0161 road_0135)
  (has-traffic-light loc_0002)
  (has-traffic-light loc_0037)
  (has-traffic-light loc_0048)
  (has-traffic-light loc_0052)
  (has-traffic-light loc_0055)
  ;; [DYNAMIC EVENT - roadworks] These three roads meet at node loc_0065, a low‑degree junction linking the eastern sub‑area to the core network. Blocking all three removes the primary connection between loc_0065 and its neighbors, creating a significant detour.
  (location-blocked loc_0022)
  ;; [DYNAMIC EVENT - roadworks] These three roads meet at node loc_0065, a low‑degree junction linking the eastern sub‑area to the core network. Blocking all three removes the primary connection between loc_0065 and its neighbors, creating a significant detour.
  (location-blocked loc_0065)
  )

  (:goal (reached-goal car1))

  (:metric minimize (travel-time car1))
)
