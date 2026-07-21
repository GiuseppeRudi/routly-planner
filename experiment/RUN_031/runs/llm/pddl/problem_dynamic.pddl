;; ============================================================
;;  PROBLEM: exp_200_nodes_05_planner_comp_line_comp_20260715_190603
;;  Features: tl_cong-pddl-static_llm_macro
;;  Start: loc_0071
;;  Goal:  loc_0120
;; ============================================================

(define (problem exp_200_nodes_05_planner_comp_line_comp_20260715_190603_dynamic)
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
    loc_0042 - location
    loc_0043 - location
    loc_0044 - location
    loc_0045 - location
    loc_0046 - location
    loc_0047 - location
    loc_0049 - location
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
    loc_0074 - location
    loc_0075 - location
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
    loc_0090 - location
    loc_0091 - location
    loc_0092 - location
    loc_0093 - location
    loc_0094 - location
    loc_0095 - location
    loc_0096 - location
    loc_0097 - location
    loc_0098 - location
    loc_0099 - location
    loc_0101 - location
    loc_0102 - location
    loc_0103 - location
    loc_0104 - location
    loc_0107 - location
    loc_0109 - location
    loc_0110 - location
    loc_0111 - location
    loc_0112 - location
    loc_0113 - location
    loc_0114 - location
    loc_0115 - location
    loc_0116 - location
    loc_0117 - location
    loc_0118 - location
    loc_0119 - location
    loc_0120 - location
    loc_0121 - location
    loc_0122 - location
    loc_0123 - location
    loc_0124 - location
    loc_0125 - location
    loc_0126 - location
    loc_0127 - location
    loc_0128 - location
    loc_0129 - location
    loc_0130 - location
    loc_0131 - location
    loc_0132 - location
    loc_0133 - location
    loc_0134 - location
    loc_0135 - location
    loc_0136 - location
    loc_0137 - location
    loc_0138 - location
    loc_0139 - location
    loc_0140 - location
    loc_0141 - location
    loc_0142 - location
    loc_0143 - location
    loc_0144 - location
    loc_0145 - location
    loc_0146 - location
    loc_0147 - location
    loc_0148 - location
    loc_0150 - location
    loc_0151 - location
    loc_0152 - location
    loc_0153 - location
    loc_0154 - location
    loc_0156 - location
    loc_0157 - location
    loc_0158 - location
    loc_0159 - location
    loc_0160 - location
    loc_0161 - location
    loc_0162 - location
    loc_0163 - location
    loc_0164 - location
    loc_0165 - location
    loc_0166 - location
    loc_0168 - location
    loc_0169 - location
    loc_0170 - location
    loc_0171 - location
    loc_0173 - location
    loc_0174 - location
    loc_0175 - location
    loc_0176 - location
    loc_0177 - location
    loc_0178 - location
    loc_0179 - location
    loc_0180 - location
    loc_0181 - location
    loc_0182 - location
    loc_0183 - location
    loc_0185 - location
    loc_0186 - location
    loc_0187 - location
    loc_0188 - location
    loc_0190 - location
    loc_0191 - location
    loc_0192 - location
    loc_0193 - location
    loc_0194 - location
    loc_0195 - location
    loc_0196 - location
    loc_0197 - location
    loc_0198 - location
    loc_0199 - location
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
    macro_0018 - road_type_macro_0018
    macro_0019 - road_type_macro_0019
    macro_0020 - road_type_macro_0020
    macro_0021 - road_type_macro_0021
    macro_0022 - road_type_macro_0022
    macro_0023 - road_type_macro_0023
    macro_0024 - road_type_macro_0024
    macro_0025 - road_type_macro_0025
    macro_0026 - road_type_macro_0026
    macro_0027 - road_type_macro_0027
    macro_0028 - road_type_macro_0028
    macro_0029 - road_type_macro_0029
    macro_0030 - road_type_macro_0030
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
    road_0012 - road_type_road_0012
    road_0013 - road_type_road_0013
    road_0014 - road_type_road_0014
    road_0015 - road_type_road_0015
    road_0016 - road_type_road_0016
    road_0017 - road_type_road_0017
    road_0019 - road_type_road_0019
    road_0020 - road_type_road_0020
    road_0021 - road_type_road_0021
    road_0022 - road_type_road_0022
    road_0023 - road_type_road_0023
    road_0024 - road_type_road_0024
    road_0025 - road_type_road_0025
    road_0027 - road_type_road_0027
    road_0028 - road_type_road_0028
    road_0030 - road_type_road_0030
    road_0031 - road_type_road_0031
    road_0032 - road_type_road_0032
    road_0033 - road_type_road_0033
    road_0034 - road_type_road_0034
    road_0035 - road_type_road_0035
    road_0036 - road_type_road_0036
    road_0041 - road_type_road_0041
    road_0042 - road_type_road_0042
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
    road_0070 - road_type_road_0070
    road_0071 - road_type_road_0071
    road_0074 - road_type_road_0074
    road_0077 - road_type_road_0077
    road_0078 - road_type_road_0078
    road_0079 - road_type_road_0079
    road_0080 - road_type_road_0080
    road_0081 - road_type_road_0081
    road_0082 - road_type_road_0082
    road_0083 - road_type_road_0083
    road_0086 - road_type_road_0086
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
    road_0101 - road_type_road_0101
    road_0103 - road_type_road_0103
    road_0104 - road_type_road_0104
    road_0105 - road_type_road_0105
    road_0106 - road_type_road_0106
    road_0107 - road_type_road_0107
    road_0108 - road_type_road_0108
    road_0110 - road_type_road_0110
    road_0112 - road_type_road_0112
    road_0113 - road_type_road_0113
    road_0114 - road_type_road_0114
    road_0115 - road_type_road_0115
    road_0116 - road_type_road_0116
    road_0117 - road_type_road_0117
    road_0118 - road_type_road_0118
    road_0119 - road_type_road_0119
    road_0120 - road_type_road_0120
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
    road_0150 - road_type_road_0150
    road_0151 - road_type_road_0151
    road_0152 - road_type_road_0152
    road_0153 - road_type_road_0153
    road_0154 - road_type_road_0154
    road_0155 - road_type_road_0155
    road_0156 - road_type_road_0156
    road_0157 - road_type_road_0157
    road_0160 - road_type_road_0160
    road_0161 - road_type_road_0161
    road_0162 - road_type_road_0162
    road_0166 - road_type_road_0166
    road_0167 - road_type_road_0167
    road_0168 - road_type_road_0168
    road_0169 - road_type_road_0169
    road_0170 - road_type_road_0170
    road_0171 - road_type_road_0171
    road_0172 - road_type_road_0172
    road_0173 - road_type_road_0173
    road_0175 - road_type_road_0175
    road_0176 - road_type_road_0176
    road_0177 - road_type_road_0177
    road_0178 - road_type_road_0178
    road_0179 - road_type_road_0179
    road_0180 - road_type_road_0180
    road_0181 - road_type_road_0181
    road_0185 - road_type_road_0185
    road_0186 - road_type_road_0186
    road_0187 - road_type_road_0187
    road_0188 - road_type_road_0188
    road_0189 - road_type_road_0189
    road_0190 - road_type_road_0190
    road_0192 - road_type_road_0192
    road_0193 - road_type_road_0193
    road_0194 - road_type_road_0194
    road_0195 - road_type_road_0195
    road_0196 - road_type_road_0196
    road_0197 - road_type_road_0197
    road_0198 - road_type_road_0198
    road_0199 - road_type_road_0199
    road_0200 - road_type_road_0200
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
    road_0223 - road_type_road_0223
    road_0224 - road_type_road_0224
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
    road_0239 - road_type_road_0239
    road_0241 - road_type_road_0241
    road_0242 - road_type_road_0242
    road_0243 - road_type_road_0243
    road_0244 - road_type_road_0244
    road_0245 - road_type_road_0245
    road_0246 - road_type_road_0246
    road_0247 - road_type_road_0247
    road_0248 - road_type_road_0248
    road_0249 - road_type_road_0249
    road_0250 - road_type_road_0250
    road_0251 - road_type_road_0251
    road_0252 - road_type_road_0252
    road_0254 - road_type_road_0254
    road_0255 - road_type_road_0255
    road_0256 - road_type_road_0256
    road_0257 - road_type_road_0257
    road_0258 - road_type_road_0258
    road_0259 - road_type_road_0259
    road_0260 - road_type_road_0260
    road_0261 - road_type_road_0261
    road_0262 - road_type_road_0262
    road_0264 - road_type_road_0264
    road_0265 - road_type_road_0265
    road_0266 - road_type_road_0266
    road_0267 - road_type_road_0267
    road_0268 - road_type_road_0268
    road_0269 - road_type_road_0269
    road_0271 - road_type_road_0271
    road_0272 - road_type_road_0272
    road_0273 - road_type_road_0273
    road_0274 - road_type_road_0274
    road_0275 - road_type_road_0275
    road_0276 - road_type_road_0276
    road_0277 - road_type_road_0277
    road_0279 - road_type_road_0279
    road_0280 - road_type_road_0280
    road_0281 - road_type_road_0281
    road_0282 - road_type_road_0282
    road_0286 - road_type_road_0286
    road_0287 - road_type_road_0287
    road_0288 - road_type_road_0288
    road_0289 - road_type_road_0289
    road_0290 - road_type_road_0290
    road_0291 - road_type_road_0291
    road_0292 - road_type_road_0292
    road_0293 - road_type_road_0293
    road_0294 - road_type_road_0294
    road_0295 - road_type_road_0295
    road_0296 - road_type_road_0296
    road_0297 - road_type_road_0297
    road_0298 - road_type_road_0298
    road_0299 - road_type_road_0299
    road_0300 - road_type_road_0300
    road_0301 - road_type_road_0301
    road_0302 - road_type_road_0302
    road_0303 - road_type_road_0303
    road_0307 - road_type_road_0307
    road_0309 - road_type_road_0309
    road_0310 - road_type_road_0310
    road_0311 - road_type_road_0311
    road_0312 - road_type_road_0312
    road_0313 - road_type_road_0313
    road_0315 - road_type_road_0315
    road_0316 - road_type_road_0316
    road_0317 - road_type_road_0317
    road_0318 - road_type_road_0318
    road_0319 - road_type_road_0319
    road_0320 - road_type_road_0320
    road_0321 - road_type_road_0321
    road_0324 - road_type_road_0324
    road_0325 - road_type_road_0325
    road_0326 - road_type_road_0326
    road_0327 - road_type_road_0327
    road_0328 - road_type_road_0328
    road_0329 - road_type_road_0329
    road_0330 - road_type_road_0330
  )

  (:init
  (ready-road car1 road_0115)
  (= (travel-time car1) 0)
  (connects macro_0000 loc_0005 loc_0112)
  (road-open macro_0000)
  (= (congestion-factor macro_0000) 1.11)
  (= (travel-duration macro_0000) 21.5846)
  (road-next macro_0000 macro_0024)
  (road-next macro_0000 road_0190)
  (road-next macro_0000 road_0192)
  (connects macro_0001 loc_0010 loc_0011)
  (road-open macro_0001)
  (= (congestion-factor macro_0001) 1.11)
  (= (travel-duration macro_0001) 11.5596)
  (road-next macro_0001 road_0020)
  (connects macro_0002 loc_0014 loc_0013)
  (road-open macro_0002)
  (= (congestion-factor macro_0002) 1.0)
  (= (travel-duration macro_0002) 101.5911)
  (road-next macro_0002 road_0024)
  (road-next macro_0002 road_0025)
  (connects macro_0003 loc_0015 loc_0173)
  (road-open macro_0003)
  (= (congestion-factor macro_0003) 1.35)
  (= (travel-duration macro_0003) 5.9359)
  (road-next macro_0003 road_0286)
  (road-next macro_0003 road_0287)
  (connects macro_0004 loc_0020 loc_0021)
  (road-open macro_0004)
  (= (congestion-factor macro_0004) 1.05)
  (= (travel-duration macro_0004) 15.5415)
  (road-next macro_0004 macro_0005)
  (road-next macro_0004 macro_0006)
  (connects macro_0005 loc_0021 loc_0197)
  (road-open macro_0005)
  (= (congestion-factor macro_0005) 1.05)
  (= (travel-duration macro_0005) 40.0822)
  (road-next macro_0005 road_0327)
  (connects macro_0006 loc_0021 loc_0017)
  (road-open macro_0006)
  (= (congestion-factor macro_0006) 1.0)
  (= (travel-duration macro_0006) 27.7175)
  (road-next macro_0006 road_0033)
  (road-next macro_0006 road_0034)
  (connects macro_0007 loc_0024 loc_0186)
  (road-open macro_0007)
  (= (congestion-factor macro_0007) 1.17)
  (= (travel-duration macro_0007) 14.0321)
  (road-next macro_0007 macro_0028)
  (road-next macro_0007 road_0309)
  (connects macro_0008 loc_0037 loc_0178)
  (road-open macro_0008)
  ;; [DYNAMIC EVENT - location closure] loc_0178 incident road
  (road-blocked macro_0008)
  (= (congestion-factor macro_0008) 1.0)
  (= (travel-duration macro_0008) 16.0326)
  (road-next macro_0008 road_0296)
  (road-next macro_0008 road_0297)
  (connects macro_0009 loc_0039 loc_0091)
  (road-open macro_0009)
  (= (congestion-factor macro_0009) 1.3)
  (= (travel-duration macro_0009) 25.3931)
  (road-next macro_0009 road_0153)
  (connects macro_0010 loc_0039 loc_0002)
  (road-open macro_0010)
  (= (congestion-factor macro_0010) 1.06)
  (= (travel-duration macro_0010) 23.7517)
  (road-next macro_0010 road_0005)
  (road-next macro_0010 road_0006)
  (connects macro_0011 loc_0040 loc_0166)
  (road-open macro_0011)
  (= (congestion-factor macro_0011) 1.3)
  (= (travel-duration macro_0011) 42.6365)
  (connects macro_0012 loc_0041 loc_0049)
  (road-open macro_0012)
  (= (congestion-factor macro_0012) 1.09)
  (= (travel-duration macro_0012) 14.3402)
  (road-next macro_0012 macro_0014)
  (road-next macro_0012 road_0086)
  (connects macro_0013 loc_0047 loc_0116)
  (road-open macro_0013)
  (= (congestion-factor macro_0013) 1.05)
  (= (travel-duration macro_0013) 20.1847)
  (road-next macro_0013 road_0199)
  (connects macro_0014 loc_0049 loc_0041)
  (road-open macro_0014)
  (= (congestion-factor macro_0014) 1.05)
  (= (travel-duration macro_0014) 14.1113)
  (road-next macro_0014 macro_0012)
  (connects macro_0015 loc_0061 loc_0101)
  (road-open macro_0015)
  (= (congestion-factor macro_0015) 1.1)
  (= (travel-duration macro_0015) 24.5464)
  (connects macro_0016 loc_0068 loc_0116)
  (road-open macro_0016)
  (= (congestion-factor macro_0016) 1.0)
  (= (travel-duration macro_0016) 28.7147)
  (road-next macro_0016 road_0199)
  (connects macro_0017 loc_0069 loc_0116)
  (road-open macro_0017)
  (= (congestion-factor macro_0017) 1.1)
  (= (travel-duration macro_0017) 43.8007)
  (road-next macro_0017 road_0199)
  (connects macro_0018 loc_0073 loc_0195)
  (road-open macro_0018)
  (= (congestion-factor macro_0018) 1.05)
  (= (travel-duration macro_0018) 14.5889)
  (road-next macro_0018 macro_0029)
  (road-next macro_0018 macro_0030)
  (connects macro_0019 loc_0089 loc_0188)
  (road-open macro_0019)
  (= (congestion-factor macro_0019) 1.1)
  (= (travel-duration macro_0019) 26.2875)
  (road-next macro_0019 road_0311)
  (road-next macro_0019 road_0312)
  (road-next macro_0019 road_0313)
  (connects macro_0020 loc_0094 loc_0093)
  (road-open macro_0020)
  (= (congestion-factor macro_0020) 1.05)
  (= (travel-duration macro_0020) 39.117)
  (road-next macro_0020 road_0155)
  (road-next macro_0020 road_0156)
  (road-next macro_0020 road_0157)
  (connects macro_0021 loc_0094 loc_0093)
  (road-open macro_0021)
  (= (congestion-factor macro_0021) 1.1)
  (= (travel-duration macro_0021) 40.9507)
  (road-next macro_0021 road_0155)
  (road-next macro_0021 road_0156)
  (road-next macro_0021 road_0157)
  (connects macro_0022 loc_0096 loc_0095)
  (road-open macro_0022)
  (= (congestion-factor macro_0022) 1.05)
  (= (travel-duration macro_0022) 45.7575)
  (road-next macro_0022 road_0161)
  (road-next macro_0022 road_0162)
  (connects macro_0023 loc_0096 loc_0095)
  (road-open macro_0023)
  (= (congestion-factor macro_0023) 1.15)
  (= (travel-duration macro_0023) 50.085)
  (road-next macro_0023 road_0161)
  (road-next macro_0023 road_0162)
  (connects macro_0024 loc_0112 loc_0005)
  (road-open macro_0024)
  (= (congestion-factor macro_0024) 1.09)
  (= (travel-duration macro_0024) 26.9857)
  (road-next macro_0024 macro_0000)
  (road-next macro_0024 road_0009)
  (road-next macro_0024 road_0010)
  (connects macro_0025 loc_0130 loc_0168)
  (road-open macro_0025)
  (= (congestion-factor macro_0025) 1.25)
  (= (travel-duration macro_0025) 9.3919)
  (connects macro_0026 loc_0161 loc_0099)
  (road-open macro_0026)
  (= (congestion-factor macro_0026) 1.15)
  (= (travel-duration macro_0026) 54.8572)
  (road-next macro_0026 road_0172)
  (road-next macro_0026 road_0173)
  (connects macro_0027 loc_0183 loc_0198)
  (road-open macro_0027)
  (= (congestion-factor macro_0027) 1.02)
  (= (travel-duration macro_0027) 2.1701)
  (road-next macro_0027 road_0328)
  (road-next macro_0027 road_0329)
  (connects macro_0028 loc_0186 loc_0024)
  (road-open macro_0028)
  (= (congestion-factor macro_0028) 1.23)
  (= (travel-duration macro_0028) 14.8152)
  (road-next macro_0028 macro_0007)
  (road-next macro_0028 road_0042)
  (road-next macro_0028 road_0044)
  (connects macro_0029 loc_0195 loc_0073)
  (road-open macro_0029)
  (= (congestion-factor macro_0029) 1.35)
  (= (travel-duration macro_0029) 18.7571)
  (road-next macro_0029 macro_0018)
  (road-next macro_0029 road_0119)
  (road-next macro_0029 road_0120)
  (connects macro_0030 loc_0195 loc_0134)
  (road-open macro_0030)
  (= (congestion-factor macro_0030) 1.2)
  (= (travel-duration macro_0030) 38.7188)
  (road-next macro_0030 road_0229)
  (road-next macro_0030 road_0230)
  (connects road_0000 loc_0000 loc_0146)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.14)
  (= (travel-duration road_0000) 15.6793)
  (road-next road_0000 road_0250)
  (connects road_0001 loc_0000 loc_0035)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.09)
  (= (travel-duration road_0001) 7.3643)
  (road-next road_0001 road_0064)
  (road-next road_0001 road_0065)
  (connects road_0002 loc_0000 loc_0016)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.06)
  (= (travel-duration road_0002) 11.1864)
  (road-next road_0002 road_0031)
  (road-next road_0002 road_0032)
  (connects road_0003 loc_0001 loc_0084)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.15)
  (= (travel-duration road_0003) 8.526)
  (road-next road_0003 road_0141)
  (connects road_0004 loc_0001 loc_0041)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.06)
  (= (travel-duration road_0004) 23.5558)
  (road-next road_0004 macro_0012)
  (connects road_0005 loc_0002 loc_0147)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.1)
  (= (travel-duration road_0005) 100.2513)
  (road-next road_0005 road_0251)
  (connects road_0006 loc_0002 loc_0032)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.03)
  (= (travel-duration road_0006) 3.1581)
  (road-next road_0006 road_0061)
  (road-next road_0006 road_0062)
  (connects road_0007 loc_0003 loc_0060)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.15)
  (= (travel-duration road_0007) 16.2612)
  (connects road_0008 loc_0004 loc_0166)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.0)
  (= (travel-duration road_0008) 8.794)
  (connects road_0009 loc_0005 loc_0113)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.14)
  (= (travel-duration road_0009) 10.4424)
  (road-next road_0009 road_0193)
  (road-next road_0009 road_0194)
  (road-next road_0009 road_0195)
  (connects road_0010 loc_0005 loc_0067)
  (road-open road_0010)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0010)
  (= (congestion-factor road_0010) 1.0)
  (= (travel-duration road_0010) 10.2232)
  (road-next road_0010 road_0106)
  (road-next road_0010 road_0107)
  (road-next road_0010 road_0108)
  (connects road_0012 loc_0006 loc_0098)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.15)
  (= (travel-duration road_0012) 24.3469)
  (road-next road_0012 road_0169)
  (road-next road_0012 road_0170)
  (road-next road_0012 road_0171)
  (connects road_0013 loc_0006 loc_0007)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.0)
  (= (travel-duration road_0013) 1.9345)
  (road-next road_0013 road_0015)
  (connects road_0014 loc_0006 loc_0163)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.06)
  (= (travel-duration road_0014) 6.2475)
  (road-next road_0014 road_0272)
  (road-next road_0014 road_0273)
  (connects road_0015 loc_0007 loc_0006)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.3)
  (= (travel-duration road_0015) 2.5148)
  (road-next road_0015 road_0012)
  (road-next road_0015 road_0013)
  (road-next road_0015 road_0014)
  (connects road_0016 loc_0008 loc_0151)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.54)
  (= (travel-duration road_0016) 1.0867)
  (road-next road_0016 road_0256)
  (road-next road_0016 road_0257)
  (connects road_0017 loc_0009 loc_0152)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.57)
  (= (travel-duration road_0017) 9.2527)
  (road-next road_0017 road_0258)
  (connects road_0019 loc_0010 loc_0011)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.29)
  (= (travel-duration road_0019) 6.827)
  (road-next road_0019 road_0020)
  (connects road_0020 loc_0011 loc_0154)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.37)
  (= (travel-duration road_0020) 1.3136)
  (road-next road_0020 road_0261)
  (road-next road_0020 road_0262)
  (connects road_0021 loc_0012 loc_0007)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.2)
  (= (travel-duration road_0021) 20.1248)
  (road-next road_0021 road_0015)
  (connects road_0022 loc_0012 loc_0070)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.09)
  (= (travel-duration road_0022) 18.7208)
  (road-next road_0022 road_0112)
  (road-next road_0022 road_0113)
  (road-next road_0022 road_0114)
  (connects road_0023 loc_0012 loc_0044)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.09)
  (= (travel-duration road_0023) 3.8444)
  (road-next road_0023 road_0080)
  (road-next road_0023 road_0081)
  (connects road_0024 loc_0013 loc_0102)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.09)
  (= (travel-duration road_0024) 6.5573)
  (road-next road_0024 road_0175)
  (road-next road_0024 road_0176)
  (road-next road_0024 road_0177)
  (connects road_0025 loc_0013 loc_0014)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.34)
  (= (travel-duration road_0025) 11.0072)
  (road-next road_0025 macro_0002)
  (road-next road_0025 road_0027)
  (road-next road_0025 road_0028)
  (connects road_0027 loc_0014 loc_0013)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.03)
  (= (travel-duration road_0027) 8.4608)
  (road-next road_0027 road_0024)
  (road-next road_0027 road_0025)
  (connects road_0028 loc_0014 loc_0181)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.26)
  (= (travel-duration road_0028) 5.7564)
  (road-next road_0028 road_0300)
  (road-next road_0028 road_0301)
  (connects road_0030 loc_0015 loc_0190)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.15)
  (= (travel-duration road_0030) 0.563)
  (road-next road_0030 road_0315)
  (connects road_0031 loc_0016 loc_0074)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.11)
  (= (travel-duration road_0031) 47.6729)
  (road-next road_0031 road_0122)
  (road-next road_0031 road_0123)
  (road-next road_0031 road_0124)
  (connects road_0032 loc_0016 loc_0000)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.17)
  (= (travel-duration road_0032) 12.3473)
  (road-next road_0032 road_0000)
  (road-next road_0032 road_0001)
  (road-next road_0032 road_0002)
  (connects road_0033 loc_0017 loc_0107)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.0)
  (= (travel-duration road_0033) 11.6693)
  (connects road_0034 loc_0017 loc_0018)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.0)
  (= (travel-duration road_0034) 4.1582)
  (connects road_0035 loc_0019 loc_0025)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.09)
  (= (travel-duration road_0035) 13.5423)
  (road-next road_0035 road_0045)
  (road-next road_0035 road_0046)
  (connects road_0036 loc_0020 loc_0019)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.1)
  (= (travel-duration road_0036) 40.5137)
  (road-next road_0036 road_0035)
  (connects road_0041 loc_0023 loc_0153)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.34)
  (= (travel-duration road_0041) 19.5734)
  (road-next road_0041 road_0259)
  (road-next road_0041 road_0260)
  (connects road_0042 loc_0024 loc_0150)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.2)
  (= (travel-duration road_0042) 1.1967)
  (road-next road_0042 road_0254)
  (road-next road_0042 road_0255)
  (connects road_0044 loc_0024 loc_0023)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.55)
  (= (travel-duration road_0044) 46.0964)
  (road-next road_0044 road_0041)
  (connects road_0045 loc_0025 loc_0030)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.1)
  (= (travel-duration road_0045) 25.2275)
  (road-next road_0045 road_0057)
  (connects road_0046 loc_0025 loc_0152)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.03)
  (= (travel-duration road_0046) 20.4739)
  (road-next road_0046 road_0258)
  (connects road_0047 loc_0026 loc_0024)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.5)
  (= (travel-duration road_0047) 12.9947)
  (road-next road_0047 macro_0007)
  (road-next road_0047 road_0042)
  (road-next road_0047 road_0044)
  (connects road_0048 loc_0027 loc_0142)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.51)
  (= (travel-duration road_0048) 20.5417)
  (road-next road_0048 road_0243)
  (road-next road_0048 road_0244)
  (road-next road_0048 road_0245)
  (connects road_0049 loc_0028 loc_0029)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.3)
  (= (travel-duration road_0049) 10.7769)
  (road-next road_0049 road_0053)
  (road-next road_0049 road_0054)
  (road-next road_0049 road_0055)
  (road-next road_0049 road_0056)
  (connects road_0050 loc_0028 loc_0127)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.29)
  (= (travel-duration road_0050) 5.5096)
  (road-next road_0050 road_0214)
  (road-next road_0050 road_0215)
  (connects road_0051 loc_0028 loc_0177)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.14)
  (= (travel-duration road_0051) 8.0059)
  (road-next road_0051 road_0294)
  (road-next road_0051 road_0295)
  (connects road_0052 loc_0028 loc_0054)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.26)
  (= (travel-duration road_0052) 7.143)
  (road-next road_0052 road_0091)
  (connects road_0053 loc_0029 loc_0126)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.15)
  (= (travel-duration road_0053) 9.8081)
  (road-next road_0053 road_0212)
  (road-next road_0053 road_0213)
  (connects road_0054 loc_0029 loc_0055)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.15)
  (= (travel-duration road_0054) 13.0277)
  (road-next road_0054 road_0092)
  (connects road_0055 loc_0029 loc_0031)
  (road-open road_0055)
  (= (congestion-factor road_0055) 1.15)
  (= (travel-duration road_0055) 5.3643)
  (road-next road_0055 road_0058)
  (road-next road_0055 road_0059)
  (road-next road_0055 road_0060)
  (connects road_0056 loc_0029 loc_0028)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.25)
  (= (travel-duration road_0056) 10.3624)
  (road-next road_0056 road_0049)
  (road-next road_0056 road_0050)
  (road-next road_0056 road_0051)
  (road-next road_0056 road_0052)
  (connects road_0057 loc_0030 loc_0026)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.4)
  (= (travel-duration road_0057) 7.2176)
  (road-next road_0057 road_0047)
  (connects road_0058 loc_0031 loc_0020)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.1)
  (= (travel-duration road_0058) 25.4955)
  (road-next road_0058 macro_0004)
  (road-next road_0058 road_0036)
  (connects road_0059 loc_0031 loc_0030)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.2)
  (= (travel-duration road_0059) 35.7552)
  (road-next road_0059 road_0057)
  (connects road_0060 loc_0031 loc_0029)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.2)
  (= (travel-duration road_0060) 5.5975)
  (road-next road_0060 road_0053)
  (road-next road_0060 road_0054)
  (road-next road_0060 road_0055)
  (road-next road_0060 road_0056)
  (connects road_0061 loc_0032 loc_0038)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.0)
  (= (travel-duration road_0061) 22.5765)
  (road-next road_0061 road_0070)
  (road-next road_0061 road_0071)
  (connects road_0062 loc_0032 loc_0003)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.09)
  (= (travel-duration road_0062) 4.9562)
  (road-next road_0062 road_0007)
  (connects road_0063 loc_0034 loc_0002)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.0)
  (= (travel-duration road_0063) 13.9002)
  (road-next road_0063 road_0005)
  (road-next road_0063 road_0006)
  (connects road_0064 loc_0035 loc_0016)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.15)
  (= (travel-duration road_0064) 21.6793)
  (road-next road_0064 road_0031)
  (road-next road_0064 road_0032)
  (connects road_0065 loc_0035 loc_0083)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.06)
  (= (travel-duration road_0065) 22.6578)
  (road-next road_0065 road_0139)
  (road-next road_0065 road_0140)
  (connects road_0066 loc_0036 loc_0043)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.3)
  (= (travel-duration road_0066) 8.4041)
  (road-next road_0066 road_0078)
  (road-next road_0066 road_0079)
  (connects road_0067 loc_0036 loc_0037)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.09)
  (= (travel-duration road_0067) 3.8849)
  (road-next road_0067 macro_0008)
  (road-next road_0067 road_0068)
  (connects road_0068 loc_0037 loc_0036)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.0)
  (= (travel-duration road_0068) 9.7441)
  (road-next road_0068 road_0066)
  (road-next road_0068 road_0067)
  (connects road_0070 loc_0038 loc_0033)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.0)
  (= (travel-duration road_0070) 10.8808)
  (connects road_0071 loc_0038 loc_0051)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.0)
  (= (travel-duration road_0071) 43.839)
  (connects road_0074 loc_0040 loc_0080)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.06)
  (= (travel-duration road_0074) 10.4245)
  (road-next road_0074 road_0133)
  (road-next road_0074 road_0134)
  (road-next road_0074 road_0135)
  (connects road_0077 loc_0042 loc_0036)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.11)
  (= (travel-duration road_0077) 32.7891)
  (road-next road_0077 road_0066)
  (road-next road_0077 road_0067)
  (connects road_0078 loc_0043 loc_0044)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.2)
  (= (travel-duration road_0078) 45.827)
  (road-next road_0078 road_0080)
  (road-next road_0078 road_0081)
  (connects road_0079 loc_0043 loc_0045)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.15)
  (= (travel-duration road_0079) 16.0073)
  (road-next road_0079 road_0082)
  (connects road_0080 loc_0044 loc_0012)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.14)
  (= (travel-duration road_0080) 4.0207)
  (road-next road_0080 road_0021)
  (road-next road_0080 road_0022)
  (road-next road_0080 road_0023)
  (connects road_0081 loc_0044 loc_0102)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.17)
  (= (travel-duration road_0081) 12.2616)
  (road-next road_0081 road_0175)
  (road-next road_0081 road_0176)
  (road-next road_0081 road_0177)
  (connects road_0082 loc_0045 loc_0013)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.45)
  (= (travel-duration road_0082) 31.7615)
  (road-next road_0082 road_0024)
  (road-next road_0082 road_0025)
  (connects road_0083 loc_0046 loc_0036)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.14)
  (= (travel-duration road_0083) 24.9032)
  (road-next road_0083 road_0066)
  (road-next road_0083 road_0067)
  (connects road_0086 loc_0049 loc_0114)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.06)
  (= (travel-duration road_0086) 13.7165)
  (road-next road_0086 road_0196)
  (connects road_0089 loc_0052 loc_0156)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.2)
  (= (travel-duration road_0089) 5.2937)
  (road-next road_0089 road_0264)
  (connects road_0090 loc_0053 loc_0099)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.0)
  (= (travel-duration road_0090) 11.9141)
  (road-next road_0090 road_0172)
  (road-next road_0090 road_0173)
  (connects road_0091 loc_0054 loc_0169)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.43)
  (= (travel-duration road_0091) 6.1315)
  (road-next road_0091 road_0279)
  (road-next road_0091 road_0280)
  (connects road_0092 loc_0055 loc_0111)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.45)
  (= (travel-duration road_0092) 26.0767)
  (road-next road_0092 road_0188)
  (road-next road_0092 road_0189)
  (connects road_0093 loc_0056 loc_0112)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.05)
  (= (travel-duration road_0093) 4.9948)
  (road-next road_0093 macro_0024)
  (road-next road_0093 road_0190)
  (road-next road_0093 road_0192)
  (connects road_0094 loc_0056 loc_0057)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.05)
  (= (travel-duration road_0094) 16.4134)
  (road-next road_0094 road_0096)
  (connects road_0095 loc_0056 loc_0197)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.1)
  (= (travel-duration road_0095) 16.9468)
  (road-next road_0095 road_0327)
  (connects road_0096 loc_0057 loc_0056)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.0)
  (= (travel-duration road_0096) 15.6318)
  (road-next road_0096 road_0093)
  (road-next road_0096 road_0094)
  (road-next road_0096 road_0095)
  (connects road_0097 loc_0058 loc_0112)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.05)
  (= (travel-duration road_0097) 19.2359)
  (road-next road_0097 macro_0024)
  (road-next road_0097 road_0190)
  (road-next road_0097 road_0192)
  (connects road_0098 loc_0058 loc_0075)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.0)
  (= (travel-duration road_0098) 9.3448)
  (road-next road_0098 road_0125)
  (road-next road_0098 road_0126)
  (connects road_0099 loc_0058 loc_0090)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.2)
  (= (travel-duration road_0099) 20.024)
  (road-next road_0099 road_0151)
  (road-next road_0099 road_0152)
  (connects road_0101 loc_0061 loc_0086)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.15)
  (= (travel-duration road_0101) 8.5329)
  (road-next road_0101 road_0144)
  (road-next road_0101 road_0145)
  (connects road_0103 loc_0065 loc_0046)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.2)
  (= (travel-duration road_0103) 25.6186)
  (road-next road_0103 road_0083)
  (connects road_0104 loc_0066 loc_0187)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.0)
  (= (travel-duration road_0104) 3.9278)
  (road-next road_0104 road_0310)
  (connects road_0105 loc_0066 loc_0065)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.15)
  (= (travel-duration road_0105) 32.2936)
  (road-next road_0105 road_0103)
  (connects road_0106 loc_0067 loc_0005)
  (road-open road_0106)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0106)
  (= (congestion-factor road_0106) 1.0)
  (= (travel-duration road_0106) 16.0132)
  (road-next road_0106 macro_0000)
  (road-next road_0106 road_0009)
  (road-next road_0106 road_0010)
  (connects road_0107 loc_0067 loc_0178)
  (road-open road_0107)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the two shortest roads at intersection loc_0067 block the main corridor, forcing detour.
  (road-blocked road_0107)
  (= (congestion-factor road_0107) 1.0)
  (= (travel-duration road_0107) 7.2351)
  (road-next road_0107 road_0296)
  (road-next road_0107 road_0297)
  (connects road_0108 loc_0067 loc_0066)
  (road-open road_0108)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0108)
  (= (congestion-factor road_0108) 1.0)
  (= (travel-duration road_0108) 10.408)
  (road-next road_0108 road_0104)
  (road-next road_0108 road_0105)
  (connects road_0110 loc_0069 loc_0118)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.15)
  (= (travel-duration road_0110) 54.714)
  (road-next road_0110 road_0202)
  (connects road_0112 loc_0070 loc_0069)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.2)
  (= (travel-duration road_0112) 38.8772)
  (road-next road_0112 macro_0017)
  (road-next road_0112 road_0110)
  (connects road_0113 loc_0070 loc_0116)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.03)
  (= (travel-duration road_0113) 20.6581)
  (road-next road_0113 road_0199)
  (connects road_0114 loc_0070 loc_0012)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.09)
  (= (travel-duration road_0114) 18.7208)
  (road-next road_0114 road_0021)
  (road-next road_0114 road_0022)
  (road-next road_0114 road_0023)
  (connects road_0115 loc_0071 loc_0072)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.05)
  (= (travel-duration road_0115) 8.0391)
  (road-next road_0115 road_0116)
  (road-next road_0115 road_0117)
  (road-next road_0115 road_0118)
  (connects road_0116 loc_0072 loc_0071)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.25)
  (= (travel-duration road_0116) 9.5704)
  (road-next road_0116 road_0115)
  (connects road_0117 loc_0072 loc_0137)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.15)
  (= (travel-duration road_0117) 1.841)
  (road-next road_0117 road_0235)
  (connects road_0118 loc_0072 loc_0134)
  (road-open road_0118)
  (= (congestion-factor road_0118) 5.0)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (= (travel-duration road_0118) 4.458)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (road-next road_0118 road_0229)
  (road-next road_0118 road_0230)
  (connects road_0119 loc_0073 loc_0130)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.15)
  (= (travel-duration road_0119) 1.1708)
  (road-next road_0119 macro_0025)
  (road-next road_0119 road_0221)
  (connects road_0120 loc_0073 loc_0143)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.25)
  (= (travel-duration road_0120) 8.6298)
  (road-next road_0120 road_0246)
  (road-next road_0120 road_0247)
  (connects road_0122 loc_0074 loc_0077)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.3)
  (= (travel-duration road_0122) 10.1919)
  (road-next road_0122 road_0129)
  (connects road_0123 loc_0074 loc_0016)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.11)
  (= (travel-duration road_0123) 47.6729)
  (road-next road_0123 road_0031)
  (road-next road_0123 road_0032)
  (connects road_0124 loc_0074 loc_0076)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.03)
  (= (travel-duration road_0124) 12.9015)
  (road-next road_0124 road_0127)
  (road-next road_0124 road_0128)
  (connects road_0125 loc_0075 loc_0164)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.15)
  (= (travel-duration road_0125) 3.1355)
  (road-next road_0125 road_0274)
  (road-next road_0125 road_0275)
  (connects road_0126 loc_0075 loc_0058)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.25)
  (= (travel-duration road_0126) 11.681)
  (road-next road_0126 road_0097)
  (road-next road_0126 road_0098)
  (road-next road_0126 road_0099)
  (connects road_0127 loc_0076 loc_0112)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.09)
  (= (travel-duration road_0127) 14.3062)
  (road-next road_0127 macro_0024)
  (road-next road_0127 road_0190)
  (road-next road_0127 road_0192)
  (connects road_0128 loc_0076 loc_0074)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.2)
  (= (travel-duration road_0128) 7.7144)
  (road-next road_0128 road_0122)
  (road-next road_0128 road_0123)
  (road-next road_0128 road_0124)
  (connects road_0129 loc_0077 loc_0148)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.45)
  (= (travel-duration road_0129) 4.5694)
  (road-next road_0129 road_0252)
  (connects road_0130 loc_0078 loc_0124)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.2)
  (= (travel-duration road_0130) 1.0239)
  (road-next road_0130 road_0209)
  (road-next road_0130 road_0210)
  (connects road_0131 loc_0078 loc_0077)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.15)
  (= (travel-duration road_0131) 8.1589)
  (road-next road_0131 road_0129)
  (connects road_0132 loc_0079 loc_0188)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.05)
  (= (travel-duration road_0132) 0.344)
  (road-next road_0132 road_0311)
  (road-next road_0132 road_0312)
  (road-next road_0132 road_0313)
  (connects road_0133 loc_0080 loc_0146)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.05)
  (= (travel-duration road_0133) 36.1112)
  (road-next road_0133 road_0250)
  (connects road_0134 loc_0080 loc_0179)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.03)
  (= (travel-duration road_0134) 11.185)
  (road-next road_0134 road_0298)
  (connects road_0135 loc_0080 loc_0040)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.11)
  (= (travel-duration road_0135) 10.9162)
  (road-next road_0135 macro_0011)
  (road-next road_0135 road_0074)
  (connects road_0136 loc_0081 loc_0194)
  (road-open road_0136)
  (= (congestion-factor road_0136) 1.26)
  (= (travel-duration road_0136) 0.1966)
  (road-next road_0136 road_0320)
  (road-next road_0136 road_0321)
  (connects road_0137 loc_0081 loc_0193)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.37)
  (= (travel-duration road_0137) 0.4159)
  (road-next road_0137 road_0318)
  (road-next road_0137 road_0319)
  (connects road_0138 loc_0082 loc_0141)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.43)
  (= (travel-duration road_0138) 19.0941)
  (road-next road_0138 road_0241)
  (road-next road_0138 road_0242)
  (connects road_0139 loc_0083 loc_0001)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.06)
  (= (travel-duration road_0139) 9.2186)
  (road-next road_0139 road_0003)
  (road-next road_0139 road_0004)
  (connects road_0140 loc_0083 loc_0180)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.0)
  (= (travel-duration road_0140) 3.8786)
  (road-next road_0140 road_0299)
  (connects road_0141 loc_0084 loc_0061)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.25)
  (= (travel-duration road_0141) 6.4323)
  (road-next road_0141 macro_0015)
  (road-next road_0141 road_0101)
  (connects road_0142 loc_0085 loc_0084)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.1)
  (= (travel-duration road_0142) 10.6528)
  (road-next road_0142 road_0141)
  (connects road_0143 loc_0085 loc_0087)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.1)
  (= (travel-duration road_0143) 15.7958)
  (road-next road_0143 road_0146)
  (road-next road_0143 road_0147)
  (connects road_0144 loc_0086 loc_0085)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.05)
  (= (travel-duration road_0144) 5.1927)
  (road-next road_0144 road_0142)
  (road-next road_0144 road_0143)
  (connects road_0145 loc_0086 loc_0062)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.1)
  (= (travel-duration road_0145) 22.7405)
  (connects road_0146 loc_0087 loc_0001)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.03)
  (= (travel-duration road_0146) 20.0673)
  (road-next road_0146 road_0003)
  (road-next road_0146 road_0004)
  (connects road_0147 loc_0087 loc_0085)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.1)
  (= (travel-duration road_0147) 15.7958)
  (road-next road_0147 road_0142)
  (road-next road_0147 road_0143)
  (connects road_0148 loc_0088 loc_0104)
  (road-open road_0148)
  (= (congestion-factor road_0148) 2.5)  ;; [DYNAMIC EVENT - slowdown] Light construction slows traffic on roads 0151 and 0148 near loc_0088.
  (= (travel-duration road_0148) 3.8342)  ;; [DYNAMIC EVENT - slowdown] Light construction slows traffic on roads 0151 and 0148 near loc_0088.
  (road-next road_0148 road_0180)
  (road-next road_0148 road_0181)
  (connects road_0150 loc_0089 loc_0121)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.0)
  (= (travel-duration road_0150) 4.4642)
  (road-next road_0150 road_0205)
  (connects road_0151 loc_0090 loc_0088)
  (road-open road_0151)
  (= (congestion-factor road_0151) 2.5)  ;; [DYNAMIC EVENT - slowdown] Light construction slows traffic on roads 0151 and 0148 near loc_0088.
  (= (travel-duration road_0151) 22.1298)  ;; [DYNAMIC EVENT - slowdown] Light construction slows traffic on roads 0151 and 0148 near loc_0088.
  (road-next road_0151 road_0148)
  (connects road_0152 loc_0090 loc_0042)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.15)
  (= (travel-duration road_0152) 13.0857)
  (road-next road_0152 road_0077)
  (connects road_0153 loc_0091 loc_0040)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.14)
  (= (travel-duration road_0153) 7.9361)
  (road-next road_0153 macro_0011)
  (road-next road_0153 road_0074)
  (connects road_0154 loc_0092 loc_0093)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.05)
  (= (travel-duration road_0154) 14.173)
  (road-next road_0154 road_0155)
  (road-next road_0154 road_0156)
  (road-next road_0154 road_0157)
  (connects road_0155 loc_0093 loc_0097)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.1)
  (= (travel-duration road_0155) 56.6263)
  (road-next road_0155 road_0166)
  (road-next road_0155 road_0167)
  (road-next road_0155 road_0168)
  (connects road_0156 loc_0093 loc_0092)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.1)
  (= (travel-duration road_0156) 14.848)
  (road-next road_0156 road_0154)
  (connects road_0157 loc_0093 loc_0096)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.15)
  (= (travel-duration road_0157) 13.824)
  (road-next road_0157 macro_0022)
  (road-next road_0157 macro_0023)
  (connects road_0160 loc_0094 loc_0095)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.0)
  (= (travel-duration road_0160) 18.3451)
  (road-next road_0160 road_0161)
  (road-next road_0160 road_0162)
  (connects road_0161 loc_0095 loc_0094)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.15)
  (= (travel-duration road_0161) 21.0969)
  (road-next road_0161 macro_0020)
  (road-next road_0161 macro_0021)
  (road-next road_0161 road_0160)
  (connects road_0162 loc_0095 loc_0162)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.04)
  (= (travel-duration road_0162) 9.6677)
  (connects road_0166 loc_0097 loc_0098)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.05)
  (= (travel-duration road_0166) 18.1636)
  (road-next road_0166 road_0169)
  (road-next road_0166 road_0170)
  (road-next road_0166 road_0171)
  (connects road_0167 loc_0097 loc_0145)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.05)
  (= (travel-duration road_0167) 3.2131)
  (road-next road_0167 road_0249)
  (connects road_0168 loc_0097 loc_0093)
  (road-open road_0168)
  (= (congestion-factor road_0168) 1.05)
  (= (travel-duration road_0168) 54.0524)
  (road-next road_0168 road_0155)
  (road-next road_0168 road_0156)
  (road-next road_0168 road_0157)
  (connects road_0169 loc_0098 loc_0006)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.0)
  (= (travel-duration road_0169) 21.1712)
  (road-next road_0169 road_0012)
  (road-next road_0169 road_0013)
  (road-next road_0169 road_0014)
  (connects road_0170 loc_0098 loc_0097)
  (road-open road_0170)
  (= (congestion-factor road_0170) 1.05)
  (= (travel-duration road_0170) 18.1636)
  (road-next road_0170 road_0166)
  (road-next road_0170 road_0167)
  (road-next road_0170 road_0168)
  (connects road_0171 loc_0098 loc_0144)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.15)
  (= (travel-duration road_0171) 6.0198)
  (road-next road_0171 road_0248)
  (connects road_0172 loc_0099 loc_0053)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.05)
  (= (travel-duration road_0172) 12.5098)
  (road-next road_0172 road_0090)
  (connects road_0173 loc_0099 loc_0129)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.3)
  (= (travel-duration road_0173) 14.6646)
  (road-next road_0173 road_0218)
  (road-next road_0173 road_0219)
  (road-next road_0173 road_0220)
  (connects road_0175 loc_0102 loc_0103)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.15)
  (= (travel-duration road_0175) 25.4137)
  (road-next road_0175 road_0178)
  (road-next road_0175 road_0179)
  (connects road_0176 loc_0102 loc_0044)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.09)
  (= (travel-duration road_0176) 11.4232)
  (road-next road_0176 road_0080)
  (road-next road_0176 road_0081)
  (connects road_0177 loc_0102 loc_0013)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.14)
  (= (travel-duration road_0177) 6.8581)
  (road-next road_0177 road_0024)
  (road-next road_0177 road_0025)
  (connects road_0178 loc_0103 loc_0119)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.0)
  (= (travel-duration road_0178) 6.1346)
  (road-next road_0178 road_0203)
  (connects road_0179 loc_0103 loc_0045)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.25)
  (= (travel-duration road_0179) 4.0667)
  (road-next road_0179 road_0082)
  (connects road_0180 loc_0104 loc_0122)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.2)
  (= (travel-duration road_0180) 6.8619)
  (road-next road_0180 road_0206)
  (connects road_0181 loc_0104 loc_0115)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.0)
  (= (travel-duration road_0181) 11.5025)
  (road-next road_0181 road_0197)
  (road-next road_0181 road_0198)
  (connects road_0185 loc_0109 loc_0174)
  (road-open road_0185)
  (= (congestion-factor road_0185) 1.26)
  (= (travel-duration road_0185) 6.2206)
  (road-next road_0185 road_0288)
  (road-next road_0185 road_0289)
  (connects road_0186 loc_0109 loc_0113)
  (road-open road_0186)
  (= (congestion-factor road_0186) 1.23)
  (= (travel-duration road_0186) 1.0731)
  (road-next road_0186 road_0193)
  (road-next road_0186 road_0194)
  (road-next road_0186 road_0195)
  (connects road_0187 loc_0110 loc_0081)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.49)
  (= (travel-duration road_0187) 12.7221)
  (road-next road_0187 road_0136)
  (road-next road_0187 road_0137)
  (connects road_0188 loc_0111 loc_0109)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.45)
  (= (travel-duration road_0188) 20.8617)
  (road-next road_0188 road_0185)
  (road-next road_0188 road_0186)
  (connects road_0189 loc_0111 loc_0110)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.25)
  (= (travel-duration road_0189) 7.4898)
  (road-next road_0189 road_0187)
  (connects road_0190 loc_0112 loc_0056)
  (road-open road_0190)
  (= (congestion-factor road_0190) 1.1)
  (= (travel-duration road_0190) 5.2327)
  (road-next road_0190 road_0093)
  (road-next road_0190 road_0094)
  (road-next road_0190 road_0095)
  (connects road_0192 loc_0112 loc_0076)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.09)
  (= (travel-duration road_0192) 20.5862)
  (road-next road_0192 road_0127)
  (road-next road_0192 road_0128)
  (connects road_0193 loc_0113 loc_0005)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.11)
  (= (travel-duration road_0193) 15.9576)
  (road-next road_0193 macro_0000)
  (road-next road_0193 road_0009)
  (road-next road_0193 road_0010)
  (connects road_0194 loc_0113 loc_0109)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.11)
  (= (travel-duration road_0194) 0.9684)
  (road-next road_0194 road_0185)
  (road-next road_0194 road_0186)
  (connects road_0195 loc_0113 loc_0082)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.26)
  (= (travel-duration road_0195) 28.4857)
  (road-next road_0195 road_0138)
  (connects road_0196 loc_0114 loc_0049)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.03)
  (= (travel-duration road_0196) 13.3283)
  (road-next road_0196 macro_0014)
  (road-next road_0196 road_0086)
  (connects road_0197 loc_0115 loc_0089)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.05)
  (= (travel-duration road_0197) 7.9232)
  (road-next road_0197 macro_0019)
  (road-next road_0197 road_0150)
  (connects road_0198 loc_0115 loc_0120)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.05)
  (= (travel-duration road_0198) 22.2109)
  (road-next road_0198 road_0204)
  (goal-road road_0198)
  (connects road_0199 loc_0116 loc_0070)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.11)
  (= (travel-duration road_0199) 22.2626)
  (road-next road_0199 road_0112)
  (road-next road_0199 road_0113)
  (road-next road_0199 road_0114)
  (connects road_0200 loc_0117 loc_0047)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.05)
  (= (travel-duration road_0200) 6.2952)
  (road-next road_0200 macro_0013)
  (connects road_0202 loc_0118 loc_0069)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.0)
  (= (travel-duration road_0202) 47.5774)
  (road-next road_0202 macro_0017)
  (road-next road_0202 road_0110)
  (connects road_0203 loc_0119 loc_0103)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.05)
  (= (travel-duration road_0203) 6.4414)
  (road-next road_0203 road_0178)
  (road-next road_0203 road_0179)
  (connects road_0204 loc_0120 loc_0088)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.15)
  (= (travel-duration road_0204) 14.8522)
  (road-next road_0204 road_0148)
  (connects road_0205 loc_0121 loc_0089)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.0)
  (= (travel-duration road_0205) 4.4642)
  (road-next road_0205 macro_0019)
  (road-next road_0205 road_0150)
  (connects road_0206 loc_0122 loc_0075)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.25)
  (= (travel-duration road_0206) 14.4921)
  (road-next road_0206 road_0125)
  (road-next road_0206 road_0126)
  (connects road_0207 loc_0123 loc_0188)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.2)
  (= (travel-duration road_0207) 3.7326)
  (road-next road_0207 road_0311)
  (road-next road_0207 road_0312)
  (road-next road_0207 road_0313)
  (connects road_0208 loc_0123 loc_0148)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.15)
  (= (travel-duration road_0208) 6.3579)
  (road-next road_0208 road_0252)
  (connects road_0209 loc_0124 loc_0076)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.3)
  (= (travel-duration road_0209) 15.6731)
  (road-next road_0209 road_0127)
  (road-next road_0209 road_0128)
  (connects road_0210 loc_0124 loc_0196)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.1)
  (= (travel-duration road_0210) 6.694)
  (road-next road_0210 road_0324)
  (road-next road_0210 road_0325)
  (road-next road_0210 road_0326)
  (connects road_0211 loc_0125 loc_0196)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.05)
  (= (travel-duration road_0211) 5.0944)
  (road-next road_0211 road_0324)
  (road-next road_0211 road_0325)
  (road-next road_0211 road_0326)
  (connects road_0212 loc_0126 loc_0192)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.1)
  (= (travel-duration road_0212) 7.9837)
  (road-next road_0212 road_0317)
  (connects road_0213 loc_0126 loc_0026)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.1)
  (= (travel-duration road_0213) 25.349)
  (road-next road_0213 road_0047)
  (connects road_0214 loc_0127 loc_0192)
  (road-open road_0214)
  (= (congestion-factor road_0214) 1.4)
  (= (travel-duration road_0214) 8.822)
  (road-next road_0214 road_0317)
  (connects road_0215 loc_0127 loc_0028)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.14)
  (= (travel-duration road_0215) 4.8689)
  (road-next road_0215 road_0049)
  (road-next road_0215 road_0050)
  (road-next road_0215 road_0051)
  (road-next road_0215 road_0052)
  (connects road_0216 loc_0128 loc_0054)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.3)
  (= (travel-duration road_0216) 2.9984)
  (road-next road_0216 road_0091)
  (connects road_0217 loc_0128 loc_0028)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.23)
  (= (travel-duration road_0217) 7.8526)
  (road-next road_0217 road_0049)
  (road-next road_0217 road_0050)
  (road-next road_0217 road_0051)
  (road-next road_0217 road_0052)
  (connects road_0218 loc_0129 loc_0143)
  (road-open road_0218)
  (= (congestion-factor road_0218) 1.03)
  (= (travel-duration road_0218) 1.6674)
  (road-next road_0218 road_0246)
  (road-next road_0218 road_0247)
  (connects road_0219 loc_0129 loc_0130)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.15)
  (= (travel-duration road_0219) 8.0913)
  (road-next road_0219 macro_0025)
  (road-next road_0219 road_0221)
  (connects road_0220 loc_0129 loc_0052)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.2)
  (= (travel-duration road_0220) 24.0792)
  (road-next road_0220 road_0089)
  (connects road_0221 loc_0130 loc_0073)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.0)
  (= (travel-duration road_0221) 1.0181)
  (road-next road_0221 macro_0018)
  (road-next road_0221 road_0119)
  (road-next road_0221 road_0120)
  (connects road_0223 loc_0131 loc_0160)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.35)
  (= (travel-duration road_0223) 7.5236)
  (road-next road_0223 road_0269)
  (connects road_0224 loc_0131 loc_0161)
  (road-open road_0224)
  (= (congestion-factor road_0224) 1.1)
  (= (travel-duration road_0224) 5.6775)
  (road-next road_0224 macro_0026)
  (road-next road_0224 road_0271)
  (connects road_0226 loc_0132 loc_0073)
  (road-open road_0226)
  (= (congestion-factor road_0226) 1.0)
  (= (travel-duration road_0226) 13.2977)
  (road-next road_0226 macro_0018)
  (road-next road_0226 road_0119)
  (road-next road_0226 road_0120)
  (connects road_0227 loc_0133 loc_0158)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.15)
  (= (travel-duration road_0227) 2.5172)
  (road-next road_0227 road_0266)
  (connects road_0228 loc_0133 loc_0027)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.29)
  (= (travel-duration road_0228) 10.281)
  (road-next road_0228 road_0048)
  (connects road_0229 loc_0134 loc_0136)
  (road-open road_0229)
  (= (congestion-factor road_0229) 5.0)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (= (travel-duration road_0229) 17.2645)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (road-next road_0229 road_0232)
  (road-next road_0229 road_0233)
  (road-next road_0229 road_0234)
  (connects road_0230 loc_0134 loc_0072)
  (road-open road_0230)
  (= (congestion-factor road_0230) 1.3)
  (= (travel-duration road_0230) 1.1591)
  (road-next road_0230 road_0116)
  (road-next road_0230 road_0117)
  (road-next road_0230 road_0118)
  (connects road_0231 loc_0135 loc_0136)
  (road-open road_0231)
  (= (congestion-factor road_0231) 1.05)
  (= (travel-duration road_0231) 1.0899)
  (road-next road_0231 road_0232)
  (road-next road_0231 road_0233)
  (road-next road_0231 road_0234)
  (connects road_0232 loc_0136 loc_0141)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.1)
  (= (travel-duration road_0232) 41.2079)
  (road-next road_0232 road_0241)
  (road-next road_0232 road_0242)
  (connects road_0233 loc_0136 loc_0134)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.1)
  (= (travel-duration road_0233) 3.3028)
  (road-next road_0233 road_0229)
  (road-next road_0233 road_0230)
  (connects road_0234 loc_0136 loc_0135)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.2)
  (= (travel-duration road_0234) 1.2456)
  (road-next road_0234 road_0231)
  (connects road_0235 loc_0137 loc_0072)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.05)
  (= (travel-duration road_0235) 1.6809)
  (road-next road_0235 road_0116)
  (road-next road_0235 road_0117)
  (road-next road_0235 road_0118)
  (connects road_0236 loc_0138 loc_0020)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.05)
  (= (travel-duration road_0236) 3.857)
  (road-next road_0236 macro_0004)
  (road-next road_0236 road_0036)
  (connects road_0239 loc_0140 loc_0139)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.0)
  (= (travel-duration road_0239) 1.6873)
  (connects road_0241 loc_0141 loc_0027)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.2)
  (= (travel-duration road_0241) 9.3749)
  (road-next road_0241 road_0048)
  (connects road_0242 loc_0141 loc_0158)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.26)
  (= (travel-duration road_0242) 3.4294)
  (road-next road_0242 road_0266)
  (connects road_0243 loc_0142 loc_0195)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.5)
  (= (travel-duration road_0243) 10.0066)
  (road-next road_0243 macro_0029)
  (road-next road_0243 macro_0030)
  (connects road_0244 loc_0142 loc_0170)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.25)
  (= (travel-duration road_0244) 13.745)
  (road-next road_0244 road_0281)
  (connects road_0245 loc_0142 loc_0143)
  (road-open road_0245)
  (= (congestion-factor road_0245) 1.11)
  (= (travel-duration road_0245) 13.86)
  (road-next road_0245 road_0246)
  (road-next road_0245 road_0247)
  (connects road_0246 loc_0143 loc_0129)
  (road-open road_0246)
  (= (congestion-factor road_0246) 1.14)
  (= (travel-duration road_0246) 1.8455)
  (road-next road_0246 road_0218)
  (road-next road_0246 road_0219)
  (road-next road_0246 road_0220)
  (connects road_0247 loc_0143 loc_0099)
  (road-open road_0247)
  (= (congestion-factor road_0247) 1.15)
  (= (travel-duration road_0247) 13.2444)
  (road-next road_0247 road_0172)
  (road-next road_0247 road_0173)
  (connects road_0248 loc_0144 loc_0098)
  (road-open road_0248)
  (= (congestion-factor road_0248) 1.0)
  (= (travel-duration road_0248) 5.2346)
  (road-next road_0248 road_0169)
  (road-next road_0248 road_0170)
  (road-next road_0248 road_0171)
  (connects road_0249 loc_0145 loc_0097)
  (road-open road_0249)
  (= (congestion-factor road_0249) 1.0)
  (= (travel-duration road_0249) 3.0601)
  (road-next road_0249 road_0166)
  (road-next road_0249 road_0167)
  (road-next road_0249 road_0168)
  (connects road_0250 loc_0146 loc_0039)
  (road-open road_0250)
  (= (congestion-factor road_0250) 1.14)
  (= (travel-duration road_0250) 19.0844)
  (road-next road_0250 macro_0009)
  (road-next road_0250 macro_0010)
  (connects road_0251 loc_0147 loc_0087)
  (road-open road_0251)
  (= (congestion-factor road_0251) 1.06)
  (= (travel-duration road_0251) 20.1722)
  (road-next road_0251 road_0146)
  (road-next road_0251 road_0147)
  (connects road_0252 loc_0148 loc_0165)
  (road-open road_0252)
  (= (congestion-factor road_0252) 1.5)
  (= (travel-duration road_0252) 10.9642)
  (road-next road_0252 road_0276)
  (road-next road_0252 road_0277)
  (connects road_0254 loc_0150 loc_0024)
  (road-open road_0254)
  (= (congestion-factor road_0254) 1.11)
  (= (travel-duration road_0254) 1.1069)
  (road-next road_0254 macro_0007)
  (road-next road_0254 road_0042)
  (road-next road_0254 road_0044)
  (connects road_0255 loc_0150 loc_0009)
  (road-open road_0255)
  (= (congestion-factor road_0255) 1.26)
  (= (travel-duration road_0255) 9.1918)
  (road-next road_0255 road_0017)
  (connects road_0256 loc_0151 loc_0150)
  (road-open road_0256)
  (= (congestion-factor road_0256) 1.2)
  (= (travel-duration road_0256) 7.9592)
  (road-next road_0256 road_0254)
  (road-next road_0256 road_0255)
  (connects road_0257 loc_0151 loc_0009)
  (road-open road_0257)
  (= (congestion-factor road_0257) 1.37)
  (= (travel-duration road_0257) 7.8948)
  (road-next road_0257 road_0017)
  (connects road_0258 loc_0152 loc_0010)
  (road-open road_0258)
  (= (congestion-factor road_0258) 1.37)
  (= (travel-duration road_0258) 1.3613)
  (road-next road_0258 macro_0001)
  (road-next road_0258 road_0019)
  (connects road_0259 loc_0153 loc_0023)
  (road-open road_0259)
  (= (congestion-factor road_0259) 1.03)
  (= (travel-duration road_0259) 15.0452)
  (road-next road_0259 road_0041)
  (connects road_0260 loc_0153 loc_0008)
  (road-open road_0260)
  (= (congestion-factor road_0260) 1.43)
  (= (travel-duration road_0260) 8.5495)
  (road-next road_0260 road_0016)
  (connects road_0261 loc_0154 loc_0153)
  (road-open road_0261)
  (= (congestion-factor road_0261) 1.09)
  (= (travel-duration road_0261) 6.501)
  (road-next road_0261 road_0259)
  (road-next road_0261 road_0260)
  (connects road_0262 loc_0154 loc_0008)
  (road-open road_0262)
  (= (congestion-factor road_0262) 1.17)
  (= (travel-duration road_0262) 6.9346)
  (road-next road_0262 road_0016)
  (connects road_0264 loc_0156 loc_0157)
  (road-open road_0264)
  (= (congestion-factor road_0264) 1.14)
  (= (travel-duration road_0264) 2.2646)
  (road-next road_0264 road_0265)
  (connects road_0265 loc_0157 loc_0052)
  (road-open road_0265)
  (= (congestion-factor road_0265) 1.0)
  (= (travel-duration road_0265) 17.2999)
  (road-next road_0265 road_0089)
  (connects road_0266 loc_0158 loc_0128)
  (road-open road_0266)
  (= (congestion-factor road_0266) 1.34)
  (= (travel-duration road_0266) 24.0599)
  (road-next road_0266 road_0216)
  (road-next road_0266 road_0217)
  (connects road_0267 loc_0159 loc_0195)
  (road-open road_0267)
  (= (congestion-factor road_0267) 1.05)
  (= (travel-duration road_0267) 10.2203)
  (road-next road_0267 macro_0029)
  (road-next road_0267 macro_0030)
  (connects road_0268 loc_0159 loc_0134)
  (road-open road_0268)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at loc_0134 block roads 0268 and 0229, key links near the axis.
  (road-blocked road_0268)
  (= (congestion-factor road_0268) 1.0)
  (= (travel-duration road_0268) 22.5321)
  (road-next road_0268 road_0229)
  (road-next road_0268 road_0230)
  (connects road_0269 loc_0160 loc_0127)
  (road-open road_0269)
  (= (congestion-factor road_0269) 1.26)
  (= (travel-duration road_0269) 7.9625)
  (road-next road_0269 road_0214)
  (road-next road_0269 road_0215)
  (connects road_0271 loc_0161 loc_0054)
  (road-open road_0271)
  (= (congestion-factor road_0271) 1.05)
  (= (travel-duration road_0271) 12.1708)
  (road-next road_0271 road_0091)
  (connects road_0272 loc_0163 loc_0182)
  (road-open road_0272)
  (= (congestion-factor road_0272) 1.2)
  (= (travel-duration road_0272) 109.9222)
  (road-next road_0272 road_0302)
  (connects road_0273 loc_0163 loc_0183)
  (road-open road_0273)
  (= (congestion-factor road_0273) 1.02)
  (= (travel-duration road_0273) 0.9591)
  (road-next road_0273 macro_0027)
  (road-next road_0273 road_0303)
  (connects road_0274 loc_0164 loc_0075)
  (road-open road_0274)
  (= (congestion-factor road_0274) 1.1)
  (= (travel-duration road_0274) 2.9992)
  (road-next road_0274 road_0125)
  (road-next road_0274 road_0126)
  (connects road_0275 loc_0164 loc_0123)
  (road-open road_0275)
  (= (congestion-factor road_0275) 1.25)
  (= (travel-duration road_0275) 10.5169)
  (road-next road_0275 road_0207)
  (road-next road_0275 road_0208)
  (connects road_0276 loc_0165 loc_0078)
  (road-open road_0276)
  (= (congestion-factor road_0276) 1.4)
  (= (travel-duration road_0276) 4.3799)
  (road-next road_0276 road_0130)
  (road-next road_0276 road_0131)
  (connects road_0277 loc_0165 loc_0164)
  (road-open road_0277)
  (= (congestion-factor road_0277) 1.15)
  (= (travel-duration road_0277) 6.1095)
  (road-next road_0277 road_0274)
  (road-next road_0277 road_0275)
  (connects road_0279 loc_0169 loc_0133)
  (road-open road_0279)
  (= (congestion-factor road_0279) 1.26)
  (= (travel-duration road_0279) 18.5001)
  (road-next road_0279 road_0227)
  (road-next road_0279 road_0228)
  (connects road_0280 loc_0169 loc_0191)
  (road-open road_0280)
  (= (congestion-factor road_0280) 1.4)
  (= (travel-duration road_0280) 2.7609)
  (road-next road_0280 road_0316)
  (connects road_0281 loc_0170 loc_0142)
  (road-open road_0281)
  (= (congestion-factor road_0281) 1.05)
  (= (travel-duration road_0281) 11.5458)
  (road-next road_0281 road_0243)
  (road-next road_0281 road_0244)
  (road-next road_0281 road_0245)
  (connects road_0282 loc_0171 loc_0039)
  (road-open road_0282)
  (= (congestion-factor road_0282) 1.0)
  (= (travel-duration road_0282) 4.3142)
  (road-next road_0282 macro_0009)
  (road-next road_0282 macro_0010)
  (connects road_0286 loc_0173 loc_0059)
  (road-open road_0286)
  (= (congestion-factor road_0286) 1.25)
  (= (travel-duration road_0286) 11.471)
  (connects road_0287 loc_0173 loc_0064)
  (road-open road_0287)
  (= (congestion-factor road_0287) 1.05)
  (= (travel-duration road_0287) 17.1694)
  (connects road_0288 loc_0174 loc_0109)
  (road-open road_0288)
  (= (congestion-factor road_0288) 1.11)
  (= (travel-duration road_0288) 5.4801)
  (road-next road_0288 road_0185)
  (road-next road_0288 road_0186)
  (connects road_0289 loc_0174 loc_0110)
  (road-open road_0289)
  (= (congestion-factor road_0289) 1.31)
  (= (travel-duration road_0289) 4.1754)
  (road-next road_0289 road_0187)
  (connects road_0290 loc_0175 loc_0055)
  (road-open road_0290)
  (= (congestion-factor road_0290) 1.4)
  (= (travel-duration road_0290) 10.0754)
  (road-next road_0290 road_0092)
  (connects road_0291 loc_0175 loc_0177)
  (road-open road_0291)
  (= (congestion-factor road_0291) 1.29)
  (= (travel-duration road_0291) 3.1302)
  (road-next road_0291 road_0294)
  (road-next road_0291 road_0295)
  (connects road_0292 loc_0176 loc_0131)
  (road-open road_0292)
  (= (congestion-factor road_0292) 1.4)
  (= (travel-duration road_0292) 10.6147)
  (road-next road_0292 road_0223)
  (road-next road_0292 road_0224)
  (connects road_0293 loc_0176 loc_0160)
  (road-open road_0293)
  (= (congestion-factor road_0293) 1.2)
  (= (travel-duration road_0293) 5.3541)
  (road-next road_0293 road_0269)
  (connects road_0294 loc_0177 loc_0193)
  (road-open road_0294)
  (= (congestion-factor road_0294) 1.17)
  (= (travel-duration road_0294) 12.7924)
  (road-next road_0294 road_0318)
  (road-next road_0294 road_0319)
  (connects road_0295 loc_0177 loc_0028)
  (road-open road_0295)
  (= (congestion-factor road_0295) 1.23)
  (= (travel-duration road_0295) 8.6379)
  (road-next road_0295 road_0049)
  (road-next road_0295 road_0050)
  (road-next road_0295 road_0051)
  (road-next road_0295 road_0052)
  (connects road_0296 loc_0178 loc_0037)
  (road-open road_0296)
  ;; [DYNAMIC EVENT - location closure] loc_0178 incident road
  (road-blocked road_0296)
  (= (congestion-factor road_0296) 1.0)
  (= (travel-duration road_0296) 15.8478)
  (road-next road_0296 macro_0008)
  (road-next road_0296 road_0068)
  (connects road_0297 loc_0178 loc_0067)
  (road-open road_0297)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the two shortest roads at intersection loc_0067 block the main corridor, forcing detour.
  (road-blocked road_0297)
  (= (congestion-factor road_0297) 1.0)
  (= (travel-duration road_0297) 7.2351)
  (road-next road_0297 road_0106)
  (road-next road_0297 road_0107)
  (road-next road_0297 road_0108)
  (connects road_0298 loc_0179 loc_0080)
  (road-open road_0298)
  (= (congestion-factor road_0298) 1.06)
  (= (travel-duration road_0298) 11.5108)
  (road-next road_0298 road_0133)
  (road-next road_0298 road_0134)
  (road-next road_0298 road_0135)
  (connects road_0299 loc_0180 loc_0083)
  (road-open road_0299)
  (= (congestion-factor road_0299) 1.0)
  (= (travel-duration road_0299) 3.8786)
  (road-next road_0299 road_0139)
  (road-next road_0299 road_0140)
  (connects road_0300 loc_0181 loc_0014)
  (road-open road_0300)
  (= (congestion-factor road_0300) 1.0)
  (= (travel-duration road_0300) 4.5686)
  (road-next road_0300 macro_0002)
  (road-next road_0300 road_0027)
  (road-next road_0300 road_0028)
  (connects road_0301 loc_0181 loc_0015)
  (road-open road_0301)
  (= (congestion-factor road_0301) 1.5)
  (= (travel-duration road_0301) 3.3319)
  (road-next road_0301 macro_0003)
  (road-next road_0301 road_0030)
  (connects road_0302 loc_0182 loc_0163)
  (road-open road_0302)
  (= (congestion-factor road_0302) 1.0)
  (= (travel-duration road_0302) 91.6019)
  (road-next road_0302 road_0272)
  (road-next road_0302 road_0273)
  (connects road_0303 loc_0183 loc_0095)
  (road-open road_0303)
  (= (congestion-factor road_0303) 1.02)
  (= (travel-duration road_0303) 6.6022)
  (road-next road_0303 road_0161)
  (road-next road_0303 road_0162)
  (connects road_0307 loc_0185 loc_0024)
  (road-open road_0307)
  (= (congestion-factor road_0307) 1.03)
  (= (travel-duration road_0307) 11.117)
  (road-next road_0307 macro_0007)
  (road-next road_0307 road_0042)
  (road-next road_0307 road_0044)
  (connects road_0309 loc_0186 loc_0176)
  (road-open road_0309)
  (= (congestion-factor road_0309) 1.31)
  (= (travel-duration road_0309) 10.165)
  (road-next road_0309 road_0292)
  (road-next road_0309 road_0293)
  (connects road_0310 loc_0187 loc_0066)
  (road-open road_0310)
  (= (congestion-factor road_0310) 1.05)
  (= (travel-duration road_0310) 4.1241)
  (road-next road_0310 road_0104)
  (road-next road_0310 road_0105)
  (connects road_0311 loc_0188 loc_0079)
  (road-open road_0311)
  (= (congestion-factor road_0311) 1.15)
  (= (travel-duration road_0311) 0.3768)
  (road-next road_0311 road_0132)
  (connects road_0312 loc_0188 loc_0122)
  (road-open road_0312)
  (= (congestion-factor road_0312) 1.1)
  (= (travel-duration road_0312) 26.4182)
  (road-next road_0312 road_0206)
  (connects road_0313 loc_0188 loc_0123)
  (road-open road_0313)
  (= (congestion-factor road_0313) 1.05)
  (= (travel-duration road_0313) 3.2661)
  (road-next road_0313 road_0207)
  (road-next road_0313 road_0208)
  (connects road_0315 loc_0190 loc_0181)
  (road-open road_0315)
  (= (congestion-factor road_0315) 1.0)
  (= (travel-duration road_0315) 1.8721)
  (road-next road_0315 road_0300)
  (road-next road_0315 road_0301)
  (connects road_0316 loc_0191 loc_0169)
  (road-open road_0316)
  (= (congestion-factor road_0316) 1.0)
  (= (travel-duration road_0316) 1.9721)
  (road-next road_0316 road_0279)
  (road-next road_0316 road_0280)
  (connects road_0317 loc_0192 loc_0186)
  (road-open road_0317)
  (= (congestion-factor road_0317) 1.46)
  (= (travel-duration road_0317) 18.0078)
  (road-next road_0317 macro_0028)
  (road-next road_0317 road_0309)
  (connects road_0318 loc_0193 loc_0081)
  (road-open road_0318)
  (= (congestion-factor road_0318) 1.06)
  (= (travel-duration road_0318) 0.3218)
  (road-next road_0318 road_0136)
  (road-next road_0318 road_0137)
  (connects road_0319 loc_0193 loc_0175)
  (road-open road_0319)
  (= (congestion-factor road_0319) 1.51)
  (= (travel-duration road_0319) 13.1538)
  (road-next road_0319 road_0290)
  (road-next road_0319 road_0291)
  (connects road_0320 loc_0194 loc_0082)
  (road-open road_0320)
  (= (congestion-factor road_0320) 1.25)
  (= (travel-duration road_0320) 20.3858)
  (road-next road_0320 road_0138)
  (connects road_0321 loc_0194 loc_0174)
  (road-open road_0321)
  (= (congestion-factor road_0321) 1.11)
  (= (travel-duration road_0321) 13.1047)
  (road-next road_0321 road_0288)
  (road-next road_0321 road_0289)
  (connects road_0324 loc_0196 loc_0125)
  (road-open road_0324)
  (= (congestion-factor road_0324) 1.05)
  (= (travel-duration road_0324) 5.0944)
  (road-next road_0324 road_0211)
  (connects road_0325 loc_0196 loc_0199)
  (road-open road_0325)
  (= (congestion-factor road_0325) 1.05)
  (= (travel-duration road_0325) 2.825)
  (road-next road_0325 road_0330)
  (connects road_0326 loc_0196 loc_0124)
  (road-open road_0326)
  (= (congestion-factor road_0326) 1.15)
  (= (travel-duration road_0326) 6.9983)
  (road-next road_0326 road_0209)
  (road-next road_0326 road_0210)
  (connects road_0327 loc_0197 loc_0031)
  (road-open road_0327)
  (= (congestion-factor road_0327) 1.15)
  (= (travel-duration road_0327) 30.2839)
  (road-next road_0327 road_0058)
  (road-next road_0327 road_0059)
  (road-next road_0327 road_0060)
  (connects road_0328 loc_0198 loc_0007)
  (road-open road_0328)
  (= (congestion-factor road_0328) 1.04)
  (= (travel-duration road_0328) 6.1072)
  (road-next road_0328 road_0015)
  (connects road_0329 loc_0198 loc_0163)
  (road-open road_0329)
  (= (congestion-factor road_0329) 1.06)
  (= (travel-duration road_0329) 1.2608)
  (road-next road_0329 road_0272)
  (road-next road_0329 road_0273)
  (connects road_0330 loc_0199 loc_0196)
  (road-open road_0330)
  (= (congestion-factor road_0330) 1.05)
  (= (travel-duration road_0330) 2.825)
  (road-next road_0330 road_0324)
  (road-next road_0330 road_0325)
  (road-next road_0330 road_0326)
  (has-traffic-light loc_0005)
  (has-traffic-light loc_0027)
  (has-traffic-light loc_0036)
  (has-traffic-light loc_0076)
  (has-traffic-light loc_0141)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the two shortest roads at intersection loc_0067 block the main corridor, forcing detour.
  (location-blocked loc_0067)
  ;; [DYNAMIC EVENT - roadworks] Roadworks on the two shortest roads at intersection loc_0067 block the main corridor, forcing detour.
  (location-blocked loc_0178)
  )

  (:goal (reached-goal car1))

  (:metric minimize (travel-time car1))
)
