;; ============================================================
;;  PROBLEM: exp_150_nodes_06_roadabs_comp_node_comp_20260715_153131
;;  Features: tl_cong-pddl-static_llm
;;  Start: loc_0124
;;  Goal:  loc_0049
;; ============================================================

(define (problem exp_150_nodes_06_roadabs_comp_node_comp_20260715_153131_dynamic)
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
    loc_0100 - loc_type_loc_0100
    loc_0101 - loc_type_loc_0101
    loc_0102 - loc_type_loc_0102
    loc_0103 - loc_type_loc_0103
    loc_0104 - loc_type_loc_0104
    loc_0105 - loc_type_loc_0105
    loc_0106 - loc_type_loc_0106
    loc_0107 - loc_type_loc_0107
    loc_0108 - loc_type_loc_0108
    loc_0109 - loc_type_loc_0109
    loc_0110 - loc_type_loc_0110
    loc_0111 - loc_type_loc_0111
    loc_0112 - loc_type_loc_0112
    loc_0113 - loc_type_loc_0113
    loc_0114 - loc_type_loc_0114
    loc_0115 - loc_type_loc_0115
    loc_0116 - loc_type_loc_0116
    loc_0117 - loc_type_loc_0117
    loc_0118 - loc_type_loc_0118
    loc_0119 - loc_type_loc_0119
    loc_0120 - loc_type_loc_0120
    loc_0121 - loc_type_loc_0121
    loc_0122 - loc_type_loc_0122
    loc_0123 - loc_type_loc_0123
    loc_0124 - loc_type_loc_0124
    loc_0125 - loc_type_loc_0125
    loc_0126 - loc_type_loc_0126
    loc_0127 - loc_type_loc_0127
    loc_0128 - loc_type_loc_0128
    loc_0129 - loc_type_loc_0129
    loc_0130 - loc_type_loc_0130
    loc_0131 - loc_type_loc_0131
    loc_0132 - loc_type_loc_0132
    loc_0133 - loc_type_loc_0133
    loc_0134 - loc_type_loc_0134
    loc_0135 - loc_type_loc_0135
    loc_0136 - loc_type_loc_0136
    loc_0137 - loc_type_loc_0137
    loc_0138 - loc_type_loc_0138
    loc_0139 - loc_type_loc_0139
    loc_0140 - loc_type_loc_0140
    loc_0141 - loc_type_loc_0141
    loc_0142 - loc_type_loc_0142
    loc_0143 - loc_type_loc_0143
    loc_0144 - loc_type_loc_0144
    loc_0145 - loc_type_loc_0145
    loc_0146 - loc_type_loc_0146
    loc_0147 - loc_type_loc_0147
    loc_0148 - loc_type_loc_0148
    loc_0149 - loc_type_loc_0149
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
    road_0163 - road_type_road_0163
    road_0164 - road_type_road_0164
    road_0165 - road_type_road_0165
    road_0166 - road_type_road_0166
    road_0167 - road_type_road_0167
    road_0168 - road_type_road_0168
    road_0169 - road_type_road_0169
    road_0170 - road_type_road_0170
    road_0171 - road_type_road_0171
    road_0172 - road_type_road_0172
    road_0173 - road_type_road_0173
    road_0174 - road_type_road_0174
    road_0175 - road_type_road_0175
    road_0176 - road_type_road_0176
    road_0177 - road_type_road_0177
    road_0178 - road_type_road_0178
    road_0179 - road_type_road_0179
    road_0180 - road_type_road_0180
    road_0181 - road_type_road_0181
    road_0182 - road_type_road_0182
    road_0183 - road_type_road_0183
    road_0184 - road_type_road_0184
    road_0185 - road_type_road_0185
    road_0186 - road_type_road_0186
    road_0187 - road_type_road_0187
    road_0188 - road_type_road_0188
    road_0189 - road_type_road_0189
    road_0190 - road_type_road_0190
    road_0191 - road_type_road_0191
    road_0192 - road_type_road_0192
    road_0193 - road_type_road_0193
    road_0194 - road_type_road_0194
    road_0195 - road_type_road_0195
    road_0196 - road_type_road_0196
    road_0197 - road_type_road_0197
    road_0198 - road_type_road_0198
    road_0199 - road_type_road_0199
    road_0200 - road_type_road_0200
    road_0201 - road_type_road_0201
    road_0202 - road_type_road_0202
    road_0203 - road_type_road_0203
    road_0204 - road_type_road_0204
    road_0205 - road_type_road_0205
    road_0206 - road_type_road_0206
    road_0207 - road_type_road_0207
    road_0208 - road_type_road_0208
    road_0209 - road_type_road_0209
    road_0210 - road_type_road_0210
    road_0211 - road_type_road_0211
    road_0212 - road_type_road_0212
    road_0213 - road_type_road_0213
    road_0214 - road_type_road_0214
    road_0215 - road_type_road_0215
    road_0216 - road_type_road_0216
    road_0217 - road_type_road_0217
    road_0218 - road_type_road_0218
    road_0219 - road_type_road_0219
    road_0220 - road_type_road_0220
    road_0221 - road_type_road_0221
    road_0222 - road_type_road_0222
    road_0223 - road_type_road_0223
    road_0224 - road_type_road_0224
    road_0225 - road_type_road_0225
    road_0226 - road_type_road_0226
    road_0227 - road_type_road_0227
    road_0228 - road_type_road_0228
    road_0229 - road_type_road_0229
    road_0230 - road_type_road_0230
    road_0231 - road_type_road_0231
    road_0232 - road_type_road_0232
    road_0233 - road_type_road_0233
    road_0234 - road_type_road_0234
    road_0235 - road_type_road_0235
    road_0236 - road_type_road_0236
    road_0237 - road_type_road_0237
    road_0238 - road_type_road_0238
    road_0239 - road_type_road_0239
    road_0240 - road_type_road_0240
    road_0241 - road_type_road_0241
    road_0242 - road_type_road_0242
    road_0243 - road_type_road_0243
    road_0244 - road_type_road_0244
  )

  (:init
  (at car1 loc_0124)
  (= (travel-time car1) 0)
  (connects road_0000 loc_0000 loc_0082)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.15)
  (= (travel-duration road_0000) 6.409)
  (connects road_0001 loc_0001 loc_0013)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.0)
  (= (travel-duration road_0001) 1.6873)
  (connects road_0002 loc_0001 loc_0069)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.15)
  (= (travel-duration road_0002) 11.0225)
  (connects road_0003 loc_0002 loc_0123)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.0)
  (= (travel-duration road_0003) 15.6318)
  (connects road_0004 loc_0003 loc_0005)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.17)
  (= (travel-duration road_0004) 1.4644)
  (connects road_0005 loc_0003 loc_0051)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.2)
  (= (travel-duration road_0005) 12.9519)
  (connects road_0006 loc_0004 loc_0094)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.17)
  (= (travel-duration road_0006) 10.7172)
  (connects road_0007 loc_0004 loc_0040)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.11)
  (= (travel-duration road_0007) 11.3478)
  (connects road_0008 loc_0004 loc_0010)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.14)
  (= (travel-duration road_0008) 7.7801)
  (connects road_0009 loc_0005 loc_0003)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.14)
  (= (travel-duration road_0009) 1.4269)
  (connects road_0010 loc_0005 loc_0141)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.17)
  (= (travel-duration road_0010) 9.0786)
  (connects road_0011 loc_0006 loc_0146)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.11)
  (= (travel-duration road_0011) 5.0711)
  (connects road_0012 loc_0006 loc_0147)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.3)
  (= (travel-duration road_0012) 2.8877)
  (connects road_0013 loc_0007 loc_0145)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.3)
  (= (travel-duration road_0013) 75.1174)
  (connects road_0014 loc_0008 loc_0022)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.0)
  (= (travel-duration road_0014) 91.6019)
  (connects road_0015 loc_0009 loc_0032)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.1)
  (= (travel-duration road_0015) 12.4085)
  (connects road_0016 loc_0010 loc_0116)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.2)
  (= (travel-duration road_0016) 15.1451)
  (connects road_0017 loc_0010 loc_0004)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.14)
  (= (travel-duration road_0017) 13.5701)
  (connects road_0018 loc_0012 loc_0075)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.0)
  (= (travel-duration road_0018) 4.4642)
  (connects road_0019 loc_0013 loc_0001)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.15)
  (= (travel-duration road_0019) 1.9404)
  (connects road_0020 loc_0014 loc_0135)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.05)
  (= (travel-duration road_0020) 2.825)
  (connects road_0021 loc_0015 loc_0083)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.17)
  (= (travel-duration road_0021) 35.1874)
  (connects road_0022 loc_0016 loc_0006)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.06)
  (= (travel-duration road_0022) 1.9844)
  (connects road_0023 loc_0017 loc_0116)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.25)
  (= (travel-duration road_0023) 22.8999)
  (connects road_0024 loc_0017 loc_0115)
  (road-open road_0024)
  (= (congestion-factor road_0024) 2.0)  ;; [DYNAMIC EVENT - slowdown] Construction-related congestion on roads 0024 and 0185 at node 0115 reduces speeds by a factor of 2.0; the roads remain open but travel time increases.
  (= (travel-duration road_0024) 19.624)  ;; [DYNAMIC EVENT - slowdown] Construction-related congestion on roads 0024 and 0185 at node 0115 reduces speeds by a factor of 2.0; the roads remain open but travel time increases.
  (connects road_0025 loc_0017 loc_0080)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.3)
  (= (travel-duration road_0025) 21.6927)
  (connects road_0026 loc_0018 loc_0132)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.15)
  (= (travel-duration road_0026) 24.3469)
  (connects road_0027 loc_0018 loc_0087)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.15)
  (= (travel-duration road_0027) 2.2246)
  (connects road_0028 loc_0018 loc_0022)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.12)
  (= (travel-duration road_0028) 6.6011)
  (connects road_0029 loc_0019 loc_0078)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.2)
  (= (travel-duration road_0029) 9.2985)
  (connects road_0030 loc_0020 loc_0128)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.0)
  (= (travel-duration road_0030) 0.5964)
  (connects road_0031 loc_0021 loc_0104)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.37)
  (= (travel-duration road_0031) 11.6975)
  (connects road_0032 loc_0022 loc_0008)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.25)
  (= (travel-duration road_0032) 114.5023)
  (connects road_0033 loc_0022 loc_0131)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.02)
  (= (travel-duration road_0033) 0.9591)
  (connects road_0034 loc_0023 loc_0132)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.1)
  (= (travel-duration road_0034) 5.7581)
  (connects road_0035 loc_0024 loc_0025)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.15)
  (= (travel-duration road_0035) 43.9175)
  (connects road_0036 loc_0024 loc_0031)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.3)
  (= (travel-duration road_0036) 18.0952)
  (connects road_0037 loc_0025 loc_0143)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.2)
  (= (travel-duration road_0037) 4.2323)
  (connects road_0038 loc_0025 loc_0071)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.11)
  (= (travel-duration road_0038) 11.6328)
  (connects road_0039 loc_0026 loc_0148)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.23)
  (= (travel-duration road_0039) 18.0596)
  (connects road_0040 loc_0026 loc_0038)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.4)
  (= (travel-duration road_0040) 2.7609)
  (connects road_0041 loc_0028 loc_0054)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.35)
  (= (travel-duration road_0041) 28.821)
  (connects road_0042 loc_0029 loc_0073)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.1)
  (= (travel-duration road_0042) 14.698)
  (connects road_0043 loc_0029 loc_0135)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.05)
  (= (travel-duration road_0043) 6.3897)
  (connects road_0044 loc_0030 loc_0089)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.31)
  (= (travel-duration road_0044) 3.1457)
  (connects road_0045 loc_0031 loc_0145)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.4)
  (= (travel-duration road_0045) 30.6663)
  (connects road_0046 loc_0032 loc_0062)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.0)
  (= (travel-duration road_0046) 1.6189)
  (connects road_0047 loc_0033 loc_0037)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.2)
  (= (travel-duration road_0047) 5.177)
  (connects road_0048 loc_0033 loc_0140)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.14)
  (= (travel-duration road_0048) 9.6981)
  (connects road_0049 loc_0034 loc_0050)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.1)
  (= (travel-duration road_0049) 20.7367)
  (connects road_0050 loc_0034 loc_0063)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.09)
  (= (travel-duration road_0050) 23.299)
  (connects road_0051 loc_0035 loc_0115)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.25)
  (= (travel-duration road_0051) 3.4081)
  (connects road_0052 loc_0035 loc_0085)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.4)
  (= (travel-duration road_0052) 11.779)
  (connects road_0053 loc_0036 loc_0095)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.25)
  (= (travel-duration road_0053) 3.9107)
  (connects road_0054 loc_0036 loc_0035)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.35)
  (= (travel-duration road_0054) 7.172)
  (connects road_0055 loc_0037 loc_0033)
  (road-open road_0055)
  (= (congestion-factor road_0055) 1.05)
  (= (travel-duration road_0055) 4.5299)
  (connects road_0056 loc_0037 loc_0019)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.25)
  (= (travel-duration road_0056) 9.3379)
  (connects road_0057 loc_0038 loc_0026)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.15)
  (= (travel-duration road_0057) 2.2679)
  (connects road_0058 loc_0039 loc_0053)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.15)
  (= (travel-duration road_0058) 4.5169)
  (connects road_0059 loc_0039 loc_0028)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.25)
  (= (travel-duration road_0059) 35.1017)
  (connects road_0060 loc_0040 loc_0004)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.14)
  (= (travel-duration road_0060) 17.4445)
  (connects road_0061 loc_0040 loc_0089)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.17)
  (= (travel-duration road_0061) 8.4651)
  (connects road_0062 loc_0040 loc_0039)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.25)
  (= (travel-duration road_0062) 13.01)
  (connects road_0063 loc_0041 loc_0046)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.15)
  (= (travel-duration road_0063) 104.8081)
  (connects road_0064 loc_0041 loc_0137)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.06)
  (= (travel-duration road_0064) 3.2501)
  (connects road_0065 loc_0042 loc_0112)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.1)
  (= (travel-duration road_0065) 10.4403)
  (connects road_0066 loc_0043 loc_0055)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.0)
  (= (travel-duration road_0066) 47.5774)
  (connects road_0067 loc_0044 loc_0109)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.05)
  (= (travel-duration road_0067) 6.4414)
  (connects road_0068 loc_0045 loc_0138)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.35)
  (= (travel-duration road_0068) 19.423)
  (connects road_0069 loc_0045 loc_0021)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.25)
  (= (travel-duration road_0069) 7.4898)
  (connects road_0070 loc_0047 loc_0075)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.2)
  (= (travel-duration road_0070) 9.0551)
  (connects road_0071 loc_0047 loc_0124)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.1)
  (= (travel-duration road_0071) 23.2686)
  (connects road_0072 loc_0048 loc_0036)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.55)
  (= (travel-duration road_0072) 11.3297)
  (connects road_0073 loc_0049 loc_0125)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.4)
  (= (travel-duration road_0073) 20.4498)
  (connects road_0074 loc_0050 loc_0113)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.06)
  (= (travel-duration road_0074) 45.5254)
  (connects road_0075 loc_0050 loc_0092)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.2)
  (= (travel-duration road_0075) 12.6639)
  (connects road_0076 loc_0051 loc_0114)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.23)
  (= (travel-duration road_0076) 1.2266)
  (connects road_0077 loc_0051 loc_0003)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.14)
  (= (travel-duration road_0077) 12.2455)
  (connects road_0078 loc_0051 loc_0049)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.6)
  (= (travel-duration road_0078) 47.5833)
  (connects road_0079 loc_0052 loc_0135)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.0)
  (= (travel-duration road_0079) 4.8518)
  (connects road_0080 loc_0053 loc_0039)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.05)
  (= (travel-duration road_0080) 4.1241)
  (connects road_0081 loc_0054 loc_0083)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.2)
  (= (travel-duration road_0081) 26.8486)
  (connects road_0082 loc_0055 loc_0043)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.05)
  (= (travel-duration road_0082) 49.9563)
  (connects road_0083 loc_0055 loc_0042)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.1)
  (= (travel-duration road_0083) 12.2144)
  (connects road_0084 loc_0056 loc_0005)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.14)
  (= (travel-duration road_0084) 14.0609)
  (connects road_0085 loc_0057 loc_0079)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.26)
  (= (travel-duration road_0085) 10.3986)
  (connects road_0086 loc_0057 loc_0064)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.23)
  (= (travel-duration road_0086) 3.3477)
  (connects road_0087 loc_0058 loc_0096)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.15)
  (= (travel-duration road_0087) 0.3768)
  (connects road_0088 loc_0058 loc_0111)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.35)
  (= (travel-duration road_0088) 32.4224)
  (connects road_0089 loc_0058 loc_0085)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.05)
  (= (travel-duration road_0089) 3.2661)
  (connects road_0090 loc_0059 loc_0104)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.03)
  (= (travel-duration road_0090) 0.3127)
  (connects road_0091 loc_0059 loc_0139)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.29)
  (= (travel-duration road_0091) 11.2374)
  (connects road_0092 loc_0060 loc_0128)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.3)
  (= (travel-duration road_0092) 8.6724)
  (connects road_0093 loc_0060 loc_0142)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.35)
  (= (travel-duration road_0093) 14.8447)
  (connects road_0094 loc_0060 loc_0062)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.17)
  (= (travel-duration road_0094) 14.6092)
  (connects road_0095 loc_0061 loc_0105)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.3)
  (= (travel-duration road_0095) 21.2012)
  (connects road_0096 loc_0061 loc_0134)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.09)
  (= (travel-duration road_0096) 12.8686)
  (connects road_0097 loc_0062 loc_0032)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.09)
  (= (travel-duration road_0097) 1.7646)
  (connects road_0098 loc_0062 loc_0009)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.1)
  (= (travel-duration road_0098) 12.6685)
  (connects road_0099 loc_0063 loc_0093)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.06)
  (= (travel-duration road_0099) 9.2186)
  (connects road_0100 loc_0063 loc_0068)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.15)
  (= (travel-duration road_0100) 4.4603)
  (connects road_0101 loc_0064 loc_0102)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.31)
  (= (travel-duration road_0101) 23.5212)
  (connects road_0102 loc_0065 loc_0110)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.0)
  (= (travel-duration road_0102) 20.0564)
  (connects road_0103 loc_0066 loc_0045)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.5)
  (= (travel-duration road_0103) 26.9759)
  (connects road_0104 loc_0067 loc_0098)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.05)
  (= (travel-duration road_0104) 24.0808)
  (connects road_0105 loc_0067 loc_0122)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.0)
  (= (travel-duration road_0105) 19.8776)
  (connects road_0106 loc_0068 loc_0063)
  (road-open road_0106)
  (= (congestion-factor road_0106) 1.05)
  (= (travel-duration road_0106) 4.0725)
  (connects road_0107 loc_0069 loc_0027)
  (road-open road_0107)
  (= (congestion-factor road_0107) 1.15)
  (= (travel-duration road_0107) 10.2345)
  (connects road_0108 loc_0070 loc_0051)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.5)
  (= (travel-duration road_0108) 12.9947)
  (connects road_0109 loc_0071 loc_0109)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.5)
  (= (travel-duration road_0109) 33.1483)
  (connects road_0110 loc_0071 loc_0025)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.23)
  (= (travel-duration road_0110) 12.8904)
  (connects road_0111 loc_0071 loc_0145)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.09)
  (= (travel-duration road_0111) 6.5573)
  (connects road_0112 loc_0072 loc_0128)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.05)
  (= (travel-duration road_0112) 10.2203)
  (connects road_0113 loc_0073 loc_0116)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.09)
  (= (travel-duration road_0113) 14.3062)
  (connects road_0114 loc_0073 loc_0113)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.11)
  (= (travel-duration road_0114) 7.1358)
  (connects road_0115 loc_0074 loc_0136)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.15)
  (= (travel-duration road_0115) 1.4698)
  (connects road_0116 loc_0075 loc_0096)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.2)
  (= (travel-duration road_0116) 28.2842)
  (connects road_0117 loc_0075 loc_0012)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.0)
  (= (travel-duration road_0117) 4.4642)
  (connects road_0118 loc_0077 loc_0048)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.45)
  (= (travel-duration road_0118) 4.5694)
  (connects road_0119 loc_0079 loc_0060)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.4)
  (= (travel-duration road_0119) 19.0452)
  (connects road_0120 loc_0080 loc_0074)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.05)
  (= (travel-duration road_0120) 8.8519)
  (connects road_0121 loc_0080 loc_0015)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.3)
  (= (travel-duration road_0121) 14.7925)
  (connects road_0122 loc_0081 loc_0086)
  (road-open road_0122)
  ;; [DYNAMIC EVENT - location closure] loc_0081 incident road
  (road-blocked road_0122)
  (= (congestion-factor road_0122) 1.0)
  (= (travel-duration road_0122) 8.2899)
  (connects road_0123 loc_0081 loc_0101)
  (road-open road_0123)
  ;; [DYNAMIC EVENT - location closure] loc_0081 incident road
  (road-blocked road_0123)
  (= (congestion-factor road_0123) 1.0)
  (= (travel-duration road_0123) 4.271)
  (connects road_0124 loc_0081 loc_0090)
  (road-open road_0124)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at node 0081 close the three nearby segments (road_0124, road_0125, road_0141) that lie close to the axis, shutting down a key junction and creating a major detour.
  (road-blocked road_0124)
  (= (congestion-factor road_0124) 1.0)
  (= (travel-duration road_0124) 7.0227)
  (connects road_0125 loc_0081 loc_0127)
  (road-open road_0125)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at node 0081 close the three nearby segments (road_0124, road_0125, road_0141) that lie close to the axis, shutting down a key junction and creating a major detour.
  (road-blocked road_0125)
  (= (congestion-factor road_0125) 1.0)
  (= (travel-duration road_0125) 5.669)
  (connects road_0126 loc_0082 loc_0101)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.26)
  (= (travel-duration road_0126) 7.9625)
  (connects road_0127 loc_0083 loc_0024)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.45)
  (= (travel-duration road_0127) 9.3738)
  (connects road_0128 loc_0083 loc_0084)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.29)
  (= (travel-duration road_0128) 4.5977)
  (connects road_0129 loc_0084 loc_0083)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.14)
  (= (travel-duration road_0129) 11.2031)
  (connects road_0130 loc_0084 loc_0030)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.43)
  (= (travel-duration road_0130) 19.4928)
  (connects road_0131 loc_0085 loc_0058)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.35)
  (= (travel-duration road_0131) 4.1992)
  (connects road_0132 loc_0085 loc_0048)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.2)
  (= (travel-duration road_0132) 6.6343)
  (connects road_0133 loc_0086 loc_0100)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.0)
  (= (travel-duration road_0133) 8.5287)
  (connects road_0134 loc_0086 loc_0066)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.25)
  (= (travel-duration road_0134) 14.1606)
  (connects road_0135 loc_0086 loc_0097)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.0)
  (= (travel-duration road_0135) 4.6646)
  (connects road_0136 loc_0086 loc_0081)
  (road-open road_0136)
  ;; [DYNAMIC EVENT - location closure] loc_0081 incident road
  (road-blocked road_0136)
  (= (congestion-factor road_0136) 1.0)
  (= (travel-duration road_0136) 8.2899)
  (connects road_0137 loc_0087 loc_0018)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.2)
  (= (travel-duration road_0137) 2.3214)
  (connects road_0138 loc_0089 loc_0084)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.26)
  (= (travel-duration road_0138) 19.9683)
  (connects road_0139 loc_0089 loc_0040)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.23)
  (= (travel-duration road_0139) 8.8992)
  (connects road_0140 loc_0090 loc_0059)
  (road-open road_0140)
  ;; [DYNAMIC EVENT - location closure] loc_0090 incident road
  (road-blocked road_0140)
  (= (congestion-factor road_0140) 1.0)
  (= (travel-duration road_0140) 10.9336)
  (connects road_0141 loc_0090 loc_0081)
  (road-open road_0141)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at node 0081 close the three nearby segments (road_0124, road_0125, road_0141) that lie close to the axis, shutting down a key junction and creating a major detour.
  (road-blocked road_0141)
  (= (congestion-factor road_0141) 1.0)
  (= (travel-duration road_0141) 7.0227)
  (connects road_0142 loc_0091 loc_0076)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.15)
  (= (travel-duration road_0142) 5.9177)
  (connects road_0143 loc_0092 loc_0133)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.17)
  (= (travel-duration road_0143) 16.0919)
  (connects road_0144 loc_0092 loc_0034)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.09)
  (= (travel-duration road_0144) 7.3643)
  (connects road_0145 loc_0092 loc_0050)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.03)
  (= (travel-duration road_0145) 10.8698)
  (connects road_0146 loc_0093 loc_0091)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.15)
  (= (travel-duration road_0146) 8.526)
  (connects road_0147 loc_0093 loc_0144)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.06)
  (= (travel-duration road_0147) 23.5558)
  (connects road_0148 loc_0094 loc_0004)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.14)
  (= (travel-duration road_0148) 16.2324)
  (connects road_0149 loc_0094 loc_0138)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.14)
  (= (travel-duration road_0149) 0.9946)
  (connects road_0150 loc_0094 loc_0105)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.34)
  (= (travel-duration road_0150) 30.2943)
  (connects road_0151 loc_0095 loc_0029)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.05)
  (= (travel-duration road_0151) 0.8959)
  (connects road_0152 loc_0095 loc_0077)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.2)
  (= (travel-duration road_0152) 8.5136)
  (connects road_0153 loc_0096 loc_0058)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.2)
  (= (travel-duration road_0153) 0.3931)
  (connects road_0154 loc_0097 loc_0119)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.0)
  (= (travel-duration road_0154) 23.1777)
  (connects road_0155 loc_0097 loc_0098)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.15)
  (= (travel-duration road_0155) 34.2654)
  (connects road_0156 loc_0097 loc_0086)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.1)
  (= (travel-duration road_0156) 5.131)
  (connects road_0157 loc_0098 loc_0070)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.2)
  (= (travel-duration road_0157) 6.1865)
  (connects road_0158 loc_0099 loc_0097)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.2)
  (= (travel-duration road_0158) 31.6006)
  (connects road_0159 loc_0100 loc_0056)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.05)
  (= (travel-duration road_0159) 7.6208)
  (connects road_0160 loc_0100 loc_0070)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.25)
  (= (travel-duration road_0160) 28.8057)
  (connects road_0161 loc_0101 loc_0056)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.23)
  (= (travel-duration road_0161) 7.7508)
  (connects road_0162 loc_0101 loc_0081)
  (road-open road_0162)
  ;; [DYNAMIC EVENT - location closure] loc_0081 incident road
  (road-blocked road_0162)
  (= (congestion-factor road_0162) 1.0)
  (= (travel-duration road_0162) 4.271)
  (connects road_0163 loc_0102 loc_0127)
  (road-open road_0163)
  (= (congestion-factor road_0163) 1.65)
  (= (travel-duration road_0163) 3.8057)
  (connects road_0164 loc_0102 loc_0081)
  (road-open road_0164)
  ;; [DYNAMIC EVENT - accident] A collision on road_0164, the shortest segment (0.5 units from the start-goal axis) between nodes 0102 and 0081, blocks traffic entirely and forces vehicles to detour significantly.
  (road-blocked road_0164)
  (= (congestion-factor road_0164) 1.0)
  (= (travel-duration road_0164) 6.3843)
  (connects road_0165 loc_0103 loc_0117)
  (road-open road_0165)
  (= (congestion-factor road_0165) 1.63)
  (= (travel-duration road_0165) 1.1502)
  (connects road_0166 loc_0104 loc_0061)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.2)
  (= (travel-duration road_0166) 0.1872)
  (connects road_0167 loc_0104 loc_0059)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.29)
  (= (travel-duration road_0167) 0.3917)
  (connects road_0168 loc_0105 loc_0057)
  (road-open road_0168)
  (= (congestion-factor road_0168) 1.46)
  (= (travel-duration road_0168) 18.1049)
  (connects road_0169 loc_0106 loc_0122)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.6)
  (= (travel-duration road_0169) 9.4295)
  (connects road_0170 loc_0107 loc_0129)
  (road-open road_0170)
  (= (congestion-factor road_0170) 1.23)
  (= (travel-duration road_0170) 6.5286)
  (connects road_0171 loc_0107 loc_0108)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.29)
  (= (travel-duration road_0171) 6.827)
  (connects road_0172 loc_0108 loc_0126)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.51)
  (= (travel-duration road_0172) 1.4478)
  (connects road_0173 loc_0109 loc_0044)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.35)
  (= (travel-duration road_0173) 8.2818)
  (connects road_0174 loc_0109 loc_0031)
  (road-open road_0174)
  (= (congestion-factor road_0174) 1.2)
  (= (travel-duration road_0174) 3.904)
  (connects road_0175 loc_0110 loc_0055)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.1)
  (= (travel-duration road_0175) 35.6375)
  (connects road_0176 loc_0110 loc_0065)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.09)
  (= (travel-duration road_0176) 21.8615)
  (connects road_0177 loc_0110 loc_0143)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.0)
  (= (travel-duration road_0177) 17.1751)
  (connects road_0178 loc_0111 loc_0115)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.45)
  (= (travel-duration road_0178) 16.8108)
  (connects road_0179 loc_0113 loc_0077)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.25)
  (= (travel-duration road_0179) 9.7999)
  (connects road_0180 loc_0113 loc_0050)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.14)
  (= (travel-duration road_0180) 48.9613)
  (connects road_0181 loc_0113 loc_0073)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.03)
  (= (travel-duration road_0181) 13.3715)
  (connects road_0182 loc_0114 loc_0051)
  (road-open road_0182)
  (= (congestion-factor road_0182) 1.11)
  (= (travel-duration road_0182) 1.1069)
  (connects road_0183 loc_0114 loc_0106)
  (road-open road_0183)
  (= (congestion-factor road_0183) 1.43)
  (= (travel-duration road_0183) 10.432)
  (connects road_0184 loc_0115 loc_0035)
  (road-open road_0184)
  (= (congestion-factor road_0184) 1.35)
  (= (travel-duration road_0184) 3.6808)
  (connects road_0185 loc_0115 loc_0017)
  (road-open road_0185)
  (= (congestion-factor road_0185) 2.0)  ;; [DYNAMIC EVENT - slowdown] Construction-related congestion on roads 0024 and 0185 at node 0115 reduces speeds by a factor of 2.0; the roads remain open but travel time increases.
  (= (travel-duration road_0185) 31.7722)  ;; [DYNAMIC EVENT - slowdown] Construction-related congestion on roads 0024 and 0185 at node 0115 reduces speeds by a factor of 2.0; the roads remain open but travel time increases.
  (connects road_0186 loc_0116 loc_0123)
  (road-open road_0186)
  (= (congestion-factor road_0186) 1.4)
  (= (travel-duration road_0186) 6.6598)
  (connects road_0187 loc_0116 loc_0010)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.09)
  (= (travel-duration road_0187) 13.7568)
  (connects road_0188 loc_0116 loc_0073)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.09)
  (= (travel-duration road_0188) 21.0562)
  (connects road_0189 loc_0117 loc_0114)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.34)
  (= (travel-duration road_0189) 8.8878)
  (connects road_0190 loc_0117 loc_0106)
  (road-open road_0190)
  (= (congestion-factor road_0190) 1.23)
  (= (travel-duration road_0190) 7.088)
  (connects road_0191 loc_0118 loc_0067)
  (road-open road_0191)
  (= (congestion-factor road_0191) 1.0)
  (= (travel-duration road_0191) 12.4241)
  (connects road_0192 loc_0119 loc_0118)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.0)
  (= (travel-duration road_0192) 36.8307)
  (connects road_0193 loc_0119 loc_0149)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.0)
  (= (travel-duration road_0193) 3.6733)
  (connects road_0194 loc_0120 loc_0121)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.1)
  (= (travel-duration road_0194) 16.9059)
  (connects road_0195 loc_0120 loc_0013)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.1)
  (= (travel-duration road_0195) 5.9719)
  (connects road_0196 loc_0121 loc_0099)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.1)
  (= (travel-duration road_0196) 25.085)
  (connects road_0197 loc_0122 loc_0107)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.57)
  (= (travel-duration road_0197) 1.56)
  (connects road_0198 loc_0123 loc_0116)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.05)
  (= (travel-duration road_0198) 4.9948)
  (connects road_0199 loc_0123 loc_0002)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.15)
  (= (travel-duration road_0199) 17.9766)
  (connects road_0200 loc_0123 loc_0099)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.15)
  (= (travel-duration road_0200) 17.7171)
  (connects road_0201 loc_0124 loc_0074)
  (road-open road_0201)
  (= (congestion-factor road_0201) 1.15)
  (= (travel-duration road_0201) 14.8522)
  (connects road_0202 loc_0125 loc_0049)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.0)
  (= (travel-duration road_0202) 14.607)
  (connects road_0203 loc_0125 loc_0103)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.43)
  (= (travel-duration road_0203) 8.5495)
  (connects road_0204 loc_0126 loc_0125)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.11)
  (= (travel-duration road_0204) 6.6203)
  (connects road_0205 loc_0126 loc_0103)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.26)
  (= (travel-duration road_0205) 7.4681)
  (connects road_0206 loc_0127 loc_0026)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.34)
  (= (travel-duration road_0206) 5.7456)
  (connects road_0207 loc_0128 loc_0020)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.2)
  (= (travel-duration road_0207) 0.7157)
  (connects road_0208 loc_0128 loc_0072)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.15)
  (= (travel-duration road_0208) 11.1936)
  (connects road_0209 loc_0129 loc_0108)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.23)
  (= (travel-duration road_0209) 6.2806)
  (connects road_0210 loc_0130 loc_0132)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.15)
  (= (travel-duration road_0210) 19.8935)
  (connects road_0211 loc_0132 loc_0018)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.25)
  (= (travel-duration road_0211) 26.4641)
  (connects road_0212 loc_0132 loc_0130)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.1)
  (= (travel-duration road_0212) 19.0286)
  (connects road_0213 loc_0132 loc_0023)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.1)
  (= (travel-duration road_0213) 5.7581)
  (connects road_0214 loc_0133 loc_0033)
  (road-open road_0214)
  (= (congestion-factor road_0214) 1.17)
  (= (travel-duration road_0214) 19.5866)
  (connects road_0215 loc_0134 loc_0138)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.09)
  (= (travel-duration road_0215) 5.3813)
  (connects road_0216 loc_0134 loc_0021)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.23)
  (= (travel-duration road_0216) 3.9204)
  (connects road_0217 loc_0135 loc_0052)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.0)
  (= (travel-duration road_0217) 4.8518)
  (connects road_0218 loc_0135 loc_0014)
  (road-open road_0218)
  (= (congestion-factor road_0218) 1.05)
  (= (travel-duration road_0218) 2.825)
  (connects road_0219 loc_0135 loc_0029)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.05)
  (= (travel-duration road_0219) 6.3897)
  (connects road_0220 loc_0136 loc_0111)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.1)
  (= (travel-duration road_0220) 6.2901)
  (connects road_0221 loc_0136 loc_0047)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.25)
  (= (travel-duration road_0221) 14.3781)
  (connects road_0222 loc_0138 loc_0134)
  (road-open road_0222)
  (= (congestion-factor road_0222) 1.2)
  (= (travel-duration road_0222) 5.9244)
  (connects road_0223 loc_0138 loc_0094)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.29)
  (= (travel-duration road_0223) 1.1254)
  (connects road_0224 loc_0139 loc_0066)
  (road-open road_0224)
  (= (congestion-factor road_0224) 1.4)
  (= (travel-duration road_0224) 10.0754)
  (connects road_0225 loc_0139 loc_0090)
  (road-open road_0225)
  ;; [DYNAMIC EVENT - location closure] loc_0090 incident road
  (road-blocked road_0225)
  (= (congestion-factor road_0225) 1.0)
  (= (travel-duration road_0225) 2.4265)
  (connects road_0226 loc_0140 loc_0041)
  (road-open road_0226)
  (= (congestion-factor road_0226) 1.14)
  (= (travel-duration road_0226) 15.8462)
  (connects road_0227 loc_0141 loc_0000)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.1)
  (= (travel-duration road_0227) 8.3401)
  (connects road_0228 loc_0141 loc_0082)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.17)
  (= (travel-duration road_0228) 5.2203)
  (connects road_0229 loc_0142 loc_0060)
  (road-open road_0229)
  (= (congestion-factor road_0229) 1.0)
  (= (travel-duration road_0229) 10.996)
  (connects road_0230 loc_0143 loc_0087)
  (road-open road_0230)
  (= (congestion-factor road_0230) 1.15)
  (= (travel-duration road_0230) 19.2863)
  (connects road_0231 loc_0143 loc_0110)
  (road-open road_0231)
  (= (congestion-factor road_0231) 1.14)
  (= (travel-duration road_0231) 19.5796)
  (connects road_0232 loc_0143 loc_0025)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.0)
  (= (travel-duration road_0232) 3.5269)
  (connects road_0233 loc_0144 loc_0011)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.06)
  (= (travel-duration road_0233) 4.6226)
  (connects road_0234 loc_0145 loc_0071)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.46)
  (= (travel-duration road_0234) 8.7831)
  (connects road_0235 loc_0145 loc_0146)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.17)
  (= (travel-duration road_0235) 9.6108)
  (connects road_0236 loc_0146 loc_0007)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.35)
  (= (travel-duration road_0236) 59.1415)
  (connects road_0237 loc_0146 loc_0145)
  (road-open road_0237)
  (= (congestion-factor road_0237) 1.09)
  (= (travel-duration road_0237) 8.9536)
  (connects road_0238 loc_0146 loc_0006)
  (road-open road_0238)
  (= (congestion-factor road_0238) 1.14)
  (= (travel-duration road_0238) 5.2082)
  (connects road_0239 loc_0147 loc_0088)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.15)
  (= (travel-duration road_0239) 1.2503)
  (connects road_0240 loc_0147 loc_0016)
  (road-open road_0240)
  (= (congestion-factor road_0240) 1.2)
  (= (travel-duration road_0240) 0.5875)
  (connects road_0241 loc_0148 loc_0064)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.15)
  (= (travel-duration road_0241) 2.5172)
  (connects road_0242 loc_0148 loc_0079)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.11)
  (= (travel-duration road_0242) 10.5197)
  (connects road_0243 loc_0149 loc_0119)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.0)
  (= (travel-duration road_0243) 3.6733)
  (connects road_0244 loc_0149 loc_0120)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.1)
  (= (travel-duration road_0244) 12.2408)
  (has-traffic-light loc_0004)
  (has-traffic-light loc_0057)
  (has-traffic-light loc_0073)
  (has-traffic-light loc_0079)
  (has-traffic-light loc_0083)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at node 0081 close the three nearby segments (road_0124, road_0125, road_0141) that lie close to the axis, shutting down a key junction and creating a major detour.
  (location-blocked loc_0081)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at node 0081 close the three nearby segments (road_0124, road_0125, road_0141) that lie close to the axis, shutting down a key junction and creating a major detour.
  (location-blocked loc_0090)
  )

  (:goal (at car1 loc_0049))

  (:metric minimize (travel-time car1))
)
