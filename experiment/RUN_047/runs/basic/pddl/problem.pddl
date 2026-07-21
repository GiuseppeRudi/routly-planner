;; ============================================================
;;  PROBLEM: exp_300_nodes_08_cong_pddl_hyb_20260715_191756
;;  Features: tl_cong-pddl-hybrid_llm_macro
;;  Start: loc_0189
;;  Goal:  loc_0170
;; ============================================================

(define (problem exp_300_nodes_08_cong_pddl_hyb_20260715_191756)
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
    loc_0152 - loc_type_loc_0152
    loc_0153 - loc_type_loc_0153
    loc_0154 - loc_type_loc_0154
    loc_0155 - loc_type_loc_0155
    loc_0156 - loc_type_loc_0156
    loc_0157 - loc_type_loc_0157
    loc_0158 - loc_type_loc_0158
    loc_0159 - loc_type_loc_0159
    loc_0160 - loc_type_loc_0160
    loc_0161 - loc_type_loc_0161
    loc_0162 - loc_type_loc_0162
    loc_0163 - loc_type_loc_0163
    loc_0164 - loc_type_loc_0164
    loc_0165 - loc_type_loc_0165
    loc_0166 - loc_type_loc_0166
    loc_0167 - loc_type_loc_0167
    loc_0168 - loc_type_loc_0168
    loc_0169 - loc_type_loc_0169
    loc_0170 - loc_type_loc_0170
    loc_0171 - loc_type_loc_0171
    loc_0172 - loc_type_loc_0172
    loc_0173 - loc_type_loc_0173
    loc_0174 - loc_type_loc_0174
    loc_0175 - loc_type_loc_0175
    loc_0176 - loc_type_loc_0176
    loc_0177 - loc_type_loc_0177
    loc_0178 - loc_type_loc_0178
    loc_0179 - loc_type_loc_0179
    loc_0180 - loc_type_loc_0180
    loc_0181 - loc_type_loc_0181
    loc_0182 - loc_type_loc_0182
    loc_0183 - loc_type_loc_0183
    loc_0184 - loc_type_loc_0184
    loc_0185 - loc_type_loc_0185
    loc_0187 - loc_type_loc_0187
    loc_0188 - loc_type_loc_0188
    loc_0189 - loc_type_loc_0189
    loc_0191 - loc_type_loc_0191
    loc_0192 - loc_type_loc_0192
    loc_0193 - loc_type_loc_0193
    loc_0194 - loc_type_loc_0194
    loc_0195 - loc_type_loc_0195
    loc_0196 - loc_type_loc_0196
    loc_0197 - loc_type_loc_0197
    loc_0198 - loc_type_loc_0198
    loc_0199 - loc_type_loc_0199
    loc_0200 - loc_type_loc_0200
    loc_0201 - loc_type_loc_0201
    loc_0202 - loc_type_loc_0202
    loc_0203 - loc_type_loc_0203
    loc_0204 - loc_type_loc_0204
    loc_0205 - loc_type_loc_0205
    loc_0206 - loc_type_loc_0206
    loc_0207 - loc_type_loc_0207
    loc_0208 - loc_type_loc_0208
    loc_0209 - loc_type_loc_0209
    loc_0210 - loc_type_loc_0210
    loc_0211 - loc_type_loc_0211
    loc_0212 - loc_type_loc_0212
    loc_0213 - loc_type_loc_0213
    loc_0214 - loc_type_loc_0214
    loc_0215 - loc_type_loc_0215
    loc_0216 - loc_type_loc_0216
    loc_0217 - loc_type_loc_0217
    loc_0218 - loc_type_loc_0218
    loc_0219 - loc_type_loc_0219
    loc_0220 - loc_type_loc_0220
    loc_0221 - loc_type_loc_0221
    loc_0222 - loc_type_loc_0222
    loc_0223 - loc_type_loc_0223
    loc_0224 - loc_type_loc_0224
    loc_0226 - loc_type_loc_0226
    loc_0227 - loc_type_loc_0227
    loc_0228 - loc_type_loc_0228
    loc_0229 - loc_type_loc_0229
    loc_0230 - loc_type_loc_0230
    loc_0231 - loc_type_loc_0231
    loc_0232 - loc_type_loc_0232
    loc_0233 - loc_type_loc_0233
    loc_0234 - loc_type_loc_0234
    loc_0235 - loc_type_loc_0235
    loc_0236 - loc_type_loc_0236
    loc_0237 - loc_type_loc_0237
    loc_0238 - loc_type_loc_0238
    loc_0239 - loc_type_loc_0239
    loc_0240 - loc_type_loc_0240
    loc_0241 - loc_type_loc_0241
    loc_0242 - loc_type_loc_0242
    loc_0243 - loc_type_loc_0243
    loc_0244 - loc_type_loc_0244
    loc_0245 - loc_type_loc_0245
    loc_0247 - loc_type_loc_0247
    loc_0248 - loc_type_loc_0248
    loc_0249 - loc_type_loc_0249
    loc_0250 - loc_type_loc_0250
    loc_0251 - loc_type_loc_0251
    loc_0253 - loc_type_loc_0253
    loc_0254 - loc_type_loc_0254
    loc_0255 - loc_type_loc_0255
    loc_0257 - loc_type_loc_0257
    loc_0258 - loc_type_loc_0258
    loc_0259 - loc_type_loc_0259
    loc_0260 - loc_type_loc_0260
    loc_0261 - loc_type_loc_0261
    loc_0262 - loc_type_loc_0262
    loc_0263 - loc_type_loc_0263
    loc_0264 - loc_type_loc_0264
    loc_0265 - loc_type_loc_0265
    loc_0266 - loc_type_loc_0266
    loc_0267 - loc_type_loc_0267
    loc_0268 - loc_type_loc_0268
    loc_0269 - loc_type_loc_0269
    loc_0270 - loc_type_loc_0270
    loc_0271 - loc_type_loc_0271
    loc_0272 - loc_type_loc_0272
    loc_0273 - loc_type_loc_0273
    loc_0274 - loc_type_loc_0274
    loc_0275 - loc_type_loc_0275
    loc_0276 - loc_type_loc_0276
    loc_0277 - loc_type_loc_0277
    loc_0278 - loc_type_loc_0278
    loc_0279 - loc_type_loc_0279
    loc_0280 - loc_type_loc_0280
    loc_0281 - loc_type_loc_0281
    loc_0282 - loc_type_loc_0282
    loc_0283 - loc_type_loc_0283
    loc_0285 - loc_type_loc_0285
    loc_0286 - loc_type_loc_0286
    loc_0287 - loc_type_loc_0287
    loc_0288 - loc_type_loc_0288
    loc_0289 - loc_type_loc_0289
    loc_0290 - loc_type_loc_0290
    loc_0291 - loc_type_loc_0291
    loc_0292 - loc_type_loc_0292
    loc_0293 - loc_type_loc_0293
    loc_0294 - loc_type_loc_0294
    loc_0295 - loc_type_loc_0295
    loc_0296 - loc_type_loc_0296
    loc_0297 - loc_type_loc_0297
    loc_0298 - loc_type_loc_0298
    loc_0299 - loc_type_loc_0299
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
    macro_0031 - road_type_macro_0031
    macro_0032 - road_type_macro_0032
    macro_0033 - road_type_macro_0033
    macro_0034 - road_type_macro_0034
    macro_0035 - road_type_macro_0035
    macro_0036 - road_type_macro_0036
    macro_0037 - road_type_macro_0037
    macro_0038 - road_type_macro_0038
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
    road_0026 - road_type_road_0026
    road_0027 - road_type_road_0027
    road_0028 - road_type_road_0028
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
    road_0058 - road_type_road_0058
    road_0059 - road_type_road_0059
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
    road_0090 - road_type_road_0090
    road_0094 - road_type_road_0094
    road_0095 - road_type_road_0095
    road_0096 - road_type_road_0096
    road_0097 - road_type_road_0097
    road_0099 - road_type_road_0099
    road_0100 - road_type_road_0100
    road_0101 - road_type_road_0101
    road_0102 - road_type_road_0102
    road_0103 - road_type_road_0103
    road_0104 - road_type_road_0104
    road_0105 - road_type_road_0105
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
    road_0155 - road_type_road_0155
    road_0157 - road_type_road_0157
    road_0158 - road_type_road_0158
    road_0159 - road_type_road_0159
    road_0161 - road_type_road_0161
    road_0162 - road_type_road_0162
    road_0163 - road_type_road_0163
    road_0164 - road_type_road_0164
    road_0165 - road_type_road_0165
    road_0166 - road_type_road_0166
    road_0167 - road_type_road_0167
    road_0168 - road_type_road_0168
    road_0169 - road_type_road_0169
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
    road_0215 - road_type_road_0215
    road_0216 - road_type_road_0216
    road_0217 - road_type_road_0217
    road_0218 - road_type_road_0218
    road_0219 - road_type_road_0219
    road_0220 - road_type_road_0220
    road_0221 - road_type_road_0221
    road_0222 - road_type_road_0222
    road_0223 - road_type_road_0223
    road_0226 - road_type_road_0226
    road_0227 - road_type_road_0227
    road_0228 - road_type_road_0228
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
    road_0245 - road_type_road_0245
    road_0246 - road_type_road_0246
    road_0247 - road_type_road_0247
    road_0248 - road_type_road_0248
    road_0249 - road_type_road_0249
    road_0250 - road_type_road_0250
    road_0251 - road_type_road_0251
    road_0252 - road_type_road_0252
    road_0253 - road_type_road_0253
    road_0254 - road_type_road_0254
    road_0255 - road_type_road_0255
    road_0256 - road_type_road_0256
    road_0257 - road_type_road_0257
    road_0258 - road_type_road_0258
    road_0259 - road_type_road_0259
    road_0260 - road_type_road_0260
    road_0261 - road_type_road_0261
    road_0262 - road_type_road_0262
    road_0263 - road_type_road_0263
    road_0264 - road_type_road_0264
    road_0265 - road_type_road_0265
    road_0266 - road_type_road_0266
    road_0269 - road_type_road_0269
    road_0270 - road_type_road_0270
    road_0272 - road_type_road_0272
    road_0273 - road_type_road_0273
    road_0274 - road_type_road_0274
    road_0275 - road_type_road_0275
    road_0276 - road_type_road_0276
    road_0277 - road_type_road_0277
    road_0278 - road_type_road_0278
    road_0279 - road_type_road_0279
    road_0280 - road_type_road_0280
    road_0281 - road_type_road_0281
    road_0282 - road_type_road_0282
    road_0283 - road_type_road_0283
    road_0285 - road_type_road_0285
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
    road_0297 - road_type_road_0297
    road_0298 - road_type_road_0298
    road_0299 - road_type_road_0299
    road_0300 - road_type_road_0300
    road_0301 - road_type_road_0301
    road_0302 - road_type_road_0302
    road_0303 - road_type_road_0303
    road_0304 - road_type_road_0304
    road_0305 - road_type_road_0305
    road_0306 - road_type_road_0306
    road_0307 - road_type_road_0307
    road_0309 - road_type_road_0309
    road_0310 - road_type_road_0310
    road_0311 - road_type_road_0311
    road_0312 - road_type_road_0312
    road_0313 - road_type_road_0313
    road_0314 - road_type_road_0314
    road_0315 - road_type_road_0315
    road_0316 - road_type_road_0316
    road_0317 - road_type_road_0317
    road_0318 - road_type_road_0318
    road_0321 - road_type_road_0321
    road_0323 - road_type_road_0323
    road_0324 - road_type_road_0324
    road_0325 - road_type_road_0325
    road_0327 - road_type_road_0327
    road_0328 - road_type_road_0328
    road_0329 - road_type_road_0329
    road_0330 - road_type_road_0330
    road_0331 - road_type_road_0331
    road_0332 - road_type_road_0332
    road_0333 - road_type_road_0333
    road_0334 - road_type_road_0334
    road_0335 - road_type_road_0335
    road_0336 - road_type_road_0336
    road_0337 - road_type_road_0337
    road_0338 - road_type_road_0338
    road_0339 - road_type_road_0339
    road_0340 - road_type_road_0340
    road_0341 - road_type_road_0341
    road_0342 - road_type_road_0342
    road_0344 - road_type_road_0344
    road_0345 - road_type_road_0345
    road_0346 - road_type_road_0346
    road_0347 - road_type_road_0347
    road_0348 - road_type_road_0348
    road_0349 - road_type_road_0349
    road_0350 - road_type_road_0350
    road_0351 - road_type_road_0351
    road_0352 - road_type_road_0352
    road_0353 - road_type_road_0353
    road_0354 - road_type_road_0354
    road_0355 - road_type_road_0355
    road_0356 - road_type_road_0356
    road_0357 - road_type_road_0357
    road_0358 - road_type_road_0358
    road_0359 - road_type_road_0359
    road_0360 - road_type_road_0360
    road_0361 - road_type_road_0361
    road_0364 - road_type_road_0364
    road_0366 - road_type_road_0366
    road_0367 - road_type_road_0367
    road_0368 - road_type_road_0368
    road_0369 - road_type_road_0369
    road_0370 - road_type_road_0370
    road_0371 - road_type_road_0371
    road_0372 - road_type_road_0372
    road_0373 - road_type_road_0373
    road_0374 - road_type_road_0374
    road_0375 - road_type_road_0375
    road_0376 - road_type_road_0376
    road_0377 - road_type_road_0377
    road_0379 - road_type_road_0379
    road_0380 - road_type_road_0380
    road_0381 - road_type_road_0381
    road_0382 - road_type_road_0382
    road_0383 - road_type_road_0383
    road_0384 - road_type_road_0384
    road_0385 - road_type_road_0385
    road_0386 - road_type_road_0386
    road_0387 - road_type_road_0387
    road_0388 - road_type_road_0388
    road_0390 - road_type_road_0390
    road_0391 - road_type_road_0391
    road_0392 - road_type_road_0392
    road_0393 - road_type_road_0393
    road_0395 - road_type_road_0395
    road_0396 - road_type_road_0396
    road_0397 - road_type_road_0397
    road_0398 - road_type_road_0398
    road_0400 - road_type_road_0400
    road_0401 - road_type_road_0401
    road_0402 - road_type_road_0402
    road_0403 - road_type_road_0403
    road_0404 - road_type_road_0404
    road_0405 - road_type_road_0405
    road_0406 - road_type_road_0406
    road_0407 - road_type_road_0407
    road_0408 - road_type_road_0408
    road_0409 - road_type_road_0409
    road_0410 - road_type_road_0410
    road_0411 - road_type_road_0411
    road_0412 - road_type_road_0412
    road_0414 - road_type_road_0414
    road_0415 - road_type_road_0415
    road_0416 - road_type_road_0416
    road_0417 - road_type_road_0417
    road_0419 - road_type_road_0419
    road_0420 - road_type_road_0420
    road_0422 - road_type_road_0422
    road_0423 - road_type_road_0423
    road_0424 - road_type_road_0424
    road_0425 - road_type_road_0425
    road_0426 - road_type_road_0426
    road_0430 - road_type_road_0430
    road_0431 - road_type_road_0431
    road_0432 - road_type_road_0432
    road_0433 - road_type_road_0433
    road_0435 - road_type_road_0435
    road_0437 - road_type_road_0437
    road_0438 - road_type_road_0438
    road_0439 - road_type_road_0439
    road_0440 - road_type_road_0440
    road_0441 - road_type_road_0441
    road_0442 - road_type_road_0442
    road_0443 - road_type_road_0443
    road_0444 - road_type_road_0444
    road_0445 - road_type_road_0445
    road_0446 - road_type_road_0446
    road_0447 - road_type_road_0447
    road_0448 - road_type_road_0448
    road_0449 - road_type_road_0449
    road_0450 - road_type_road_0450
    road_0451 - road_type_road_0451
    road_0452 - road_type_road_0452
    road_0453 - road_type_road_0453
    road_0454 - road_type_road_0454
    road_0455 - road_type_road_0455
    road_0456 - road_type_road_0456
    road_0457 - road_type_road_0457
    road_0458 - road_type_road_0458
    road_0459 - road_type_road_0459
    road_0460 - road_type_road_0460
    road_0461 - road_type_road_0461
    road_0462 - road_type_road_0462
    road_0463 - road_type_road_0463
    road_0464 - road_type_road_0464
    road_0465 - road_type_road_0465
    road_0466 - road_type_road_0466
    road_0467 - road_type_road_0467
    road_0468 - road_type_road_0468
    road_0470 - road_type_road_0470
    road_0472 - road_type_road_0472
    road_0473 - road_type_road_0473
    road_0474 - road_type_road_0474
    road_0475 - road_type_road_0475
    road_0476 - road_type_road_0476
    road_0478 - road_type_road_0478
    road_0479 - road_type_road_0479
    road_0480 - road_type_road_0480
    road_0481 - road_type_road_0481
    road_0482 - road_type_road_0482
    road_0483 - road_type_road_0483
    road_0484 - road_type_road_0484
    road_0485 - road_type_road_0485
    road_0486 - road_type_road_0486
    road_0487 - road_type_road_0487
    road_0488 - road_type_road_0488
    road_0489 - road_type_road_0489
    road_0490 - road_type_road_0490
    road_0493 - road_type_road_0493
    road_0494 - road_type_road_0494
    road_0495 - road_type_road_0495
    road_0496 - road_type_road_0496
    road_0497 - road_type_road_0497
    road_0498 - road_type_road_0498
    road_0499 - road_type_road_0499
    road_0500 - road_type_road_0500
    road_0501 - road_type_road_0501
    road_0502 - road_type_road_0502
    road_0503 - road_type_road_0503


    ;; BEGIN DYNAMIC CONGESTION WINDOWS
    tw_00000 - window_type_tw_00000
    tw_00030 - window_type_tw_00030
    tw_00060 - window_type_tw_00060
    tw_00090 - window_type_tw_00090
    tw_00120 - window_type_tw_00120
    ;; END DYNAMIC CONGESTION WINDOWS
  )

  (:init
  (at car1 loc_0189)
  (= (travel-time car1) 0)
  (connects macro_0000 loc_0008 loc_0114)
  (road-open macro_0000)
  (= (congestion-factor macro_0000) 1.15)
  (connects macro_0001 loc_0012 loc_0161)
  (road-open macro_0001)
  (= (congestion-factor macro_0001) 1.06)
  (connects macro_0002 loc_0016 loc_0285)
  (road-open macro_0002)
  (= (congestion-factor macro_0002) 1.05)
  (connects macro_0003 loc_0016 loc_0188)
  (road-open macro_0003)
  (= (congestion-factor macro_0003) 1.0)
  (connects macro_0004 loc_0021 loc_0022)
  (road-open macro_0004)
  (= (congestion-factor macro_0004) 1.11)
  (connects macro_0005 loc_0034 loc_0035)
  (road-open macro_0005)
  (= (congestion-factor macro_0005) 1.0)
  (connects macro_0006 loc_0035 loc_0296)
  (road-open macro_0006)
  (= (congestion-factor macro_0006) 1.0)
  (connects macro_0007 loc_0035 loc_0156)
  (road-open macro_0007)
  (= (congestion-factor macro_0007) 1.0)
  (connects macro_0008 loc_0038 loc_0280)
  (road-open macro_0008)
  (= (congestion-factor macro_0008) 1.06)
  (connects macro_0009 loc_0052 loc_0267)
  (road-open macro_0009)
  (= (congestion-factor macro_0009) 1.03)
  (connects macro_0010 loc_0053 loc_0071)
  (road-open macro_0010)
  (= (congestion-factor macro_0010) 1.0)
  (connects macro_0011 loc_0054 loc_0127)
  (road-open macro_0011)
  (= (congestion-factor macro_0011) 1.05)
  (connects macro_0012 loc_0054 loc_0004)
  (road-open macro_0012)
  (= (congestion-factor macro_0012) 1.0)
  (connects macro_0013 loc_0057 loc_0064)
  (road-open macro_0013)
  (= (congestion-factor macro_0013) 1.06)
  (connects macro_0014 loc_0063 loc_0166)
  (road-open macro_0014)
  (= (congestion-factor macro_0014) 1.0)
  (connects macro_0015 loc_0084 loc_0249)
  (road-open macro_0015)
  (= (congestion-factor macro_0015) 1.03)
  (connects macro_0016 loc_0095 loc_0166)
  (road-open macro_0016)
  (= (congestion-factor macro_0016) 1.0)
  (connects macro_0017 loc_0096 loc_0166)
  (road-open macro_0017)
  (= (congestion-factor macro_0017) 1.1)
  (connects macro_0018 loc_0098 loc_0099)
  (road-open macro_0018)
  (= (congestion-factor macro_0018) 1.0)
  (connects macro_0019 loc_0102 loc_0293)
  (road-open macro_0019)
  (= (congestion-factor macro_0019) 1.0)
  (connects macro_0020 loc_0125 loc_0283)
  (road-open macro_0020)
  (= (congestion-factor macro_0020) 1.1)
  (connects macro_0021 loc_0131 loc_0130)
  (road-open macro_0021)
  (= (congestion-factor macro_0021) 1.05)
  (connects macro_0022 loc_0131 loc_0130)
  (road-open macro_0022)
  (= (congestion-factor macro_0022) 1.0)
  (connects macro_0023 loc_0133 loc_0132)
  (road-open macro_0023)
  (= (congestion-factor macro_0023) 1.0)
  (connects macro_0024 loc_0133 loc_0132)
  (road-open macro_0024)
  (= (congestion-factor macro_0024) 1.0)
  (connects macro_0025 loc_0154 loc_0157)
  (road-open macro_0025)
  (= (congestion-factor macro_0025) 1.05)
  (connects macro_0026 loc_0161 loc_0012)
  (road-open macro_0026)
  (= (congestion-factor macro_0026) 1.0)
  (connects macro_0027 loc_0176 loc_0103)
  (road-open macro_0027)
  (= (congestion-factor macro_0027) 1.1)
  (connects macro_0028 loc_0184 loc_0068)
  (road-open macro_0028)
  (= (congestion-factor macro_0028) 1.06)
  (connects macro_0029 loc_0187 loc_0127)
  (road-open macro_0029)
  (= (congestion-factor macro_0029) 1.06)
  (connects macro_0030 loc_0218 loc_0153)
  (road-open macro_0030)
  (= (congestion-factor macro_0030) 1.1)
  (connects macro_0031 loc_0229 loc_0099)
  (road-open macro_0031)
  (= (congestion-factor macro_0031) 1.04)
  (connects macro_0032 loc_0233 loc_0141)
  (road-open macro_0032)
  (= (congestion-factor macro_0032) 1.0)
  (connects macro_0033 loc_0241 loc_0114)
  (road-open macro_0033)
  (= (congestion-factor macro_0033) 1.05)
  (connects macro_0034 loc_0244 loc_0245)
  (road-open macro_0034)
  (= (congestion-factor macro_0034) 1.05)
  (connects macro_0035 loc_0255 loc_0164)
  (road-open macro_0035)
  (= (congestion-factor macro_0035) 1.05)
  (connects macro_0036 loc_0280 loc_0038)
  (road-open macro_0036)
  (= (congestion-factor macro_0036) 1.09)
  (connects macro_0037 loc_0293 loc_0102)
  (road-open macro_0037)
  (= (congestion-factor macro_0037) 1.05)
  (connects macro_0038 loc_0293 loc_0201)
  (road-open macro_0038)
  (= (congestion-factor macro_0038) 1.15)
  (connects road_0000 loc_0000 loc_0215)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.06)
  (connects road_0001 loc_0000 loc_0050)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.09)
  (connects road_0002 loc_0000 loc_0029)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.0)
  (connects road_0003 loc_0001 loc_0120)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.0)
  (connects road_0004 loc_0001 loc_0056)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.03)
  (connects road_0005 loc_0002 loc_0188)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.0)
  (connects road_0006 loc_0004 loc_0216)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.0)
  (connects road_0007 loc_0004 loc_0046)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.0)
  (connects road_0008 loc_0005 loc_0085)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.0)
  (connects road_0009 loc_0006 loc_0127)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.0)
  (connects road_0010 loc_0007 loc_0114)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.05)
  (connects road_0012 loc_0009 loc_0157)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.1)
  (connects road_0013 loc_0010 loc_0008)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.1)
  (connects road_0014 loc_0010 loc_0115)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.1)
  (connects road_0015 loc_0011 loc_0241)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.0)
  (connects road_0016 loc_0012 loc_0163)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.03)
  (connects road_0017 loc_0012 loc_0094)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.0)
  (connects road_0019 loc_0013 loc_0135)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.0)
  (connects road_0020 loc_0013 loc_0017)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.0)
  (connects road_0021 loc_0013 loc_0237)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.08)
  (connects road_0022 loc_0014 loc_0088)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.1)
  (connects road_0023 loc_0014 loc_0015)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.02)
  (connects road_0026 loc_0017 loc_0013)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.0)
  (connects road_0027 loc_0019 loc_0221)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.06)
  (connects road_0028 loc_0020 loc_0222)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.06)
  (connects road_0030 loc_0021 loc_0022)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.17)
  (connects road_0031 loc_0022 loc_0224)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.09)
  (connects road_0032 loc_0023 loc_0254)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.0)
  (connects road_0033 loc_0024 loc_0017)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.0)
  (connects road_0034 loc_0024 loc_0097)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.03)
  (connects road_0035 loc_0024 loc_0060)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.09)
  (connects road_0036 loc_0025 loc_0147)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.14)
  (connects road_0037 loc_0025 loc_0026)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.06)
  (connects road_0038 loc_0026 loc_0090)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.05)
  (connects road_0039 loc_0026 loc_0025)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.03)
  (connects road_0040 loc_0026 loc_0273)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.11)
  (connects road_0041 loc_0027 loc_0219)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.05)
  (connects road_0042 loc_0027 loc_0286)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.15)
  (connects road_0043 loc_0028 loc_0164)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.0)
  (connects road_0044 loc_0029 loc_0107)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.0)
  (connects road_0045 loc_0029 loc_0000)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.09)
  (connects road_0046 loc_0030 loc_0010)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.05)
  (connects road_0047 loc_0030 loc_0146)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.0)
  (connects road_0048 loc_0031 loc_0154)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.05)
  (connects road_0049 loc_0031 loc_0032)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.1)
  (connects road_0050 loc_0032 loc_0218)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.0)
  (connects road_0051 loc_0032 loc_0030)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.1)
  (connects road_0052 loc_0033 loc_0039)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.0)
  (connects road_0053 loc_0034 loc_0033)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.0)
  (connects road_0058 loc_0037 loc_0223)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.03)
  (connects road_0059 loc_0038 loc_0220)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.11)
  (connects road_0061 loc_0038 loc_0037)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.05)
  (connects road_0062 loc_0039 loc_0044)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.0)
  (connects road_0063 loc_0039 loc_0222)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.0)
  (connects road_0064 loc_0040 loc_0038)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.05)
  (connects road_0065 loc_0041 loc_0211)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.2)
  (connects road_0066 loc_0042 loc_0043)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.0)
  (connects road_0067 loc_0042 loc_0178)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.06)
  (connects road_0068 loc_0042 loc_0266)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.03)
  (connects road_0069 loc_0042 loc_0077)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.09)
  (connects road_0070 loc_0043 loc_0177)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.05)
  (connects road_0071 loc_0043 loc_0078)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.0)
  (connects road_0072 loc_0043 loc_0045)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.0)
  (connects road_0073 loc_0043 loc_0042)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.05)
  (connects road_0074 loc_0044 loc_0040)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.05)
  (connects road_0075 loc_0045 loc_0034)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.0)
  (connects road_0076 loc_0045 loc_0044)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.05)
  (connects road_0077 loc_0045 loc_0043)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.0)
  (connects road_0078 loc_0046 loc_0053)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.05)
  (connects road_0079 loc_0046 loc_0005)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.0)
  (connects road_0080 loc_0047 loc_0049)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.09)
  (connects road_0081 loc_0048 loc_0004)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.0)
  (connects road_0082 loc_0049 loc_0087)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.0)
  (connects road_0083 loc_0049 loc_0216)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.03)
  (connects road_0084 loc_0050 loc_0029)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.05)
  (connects road_0085 loc_0050 loc_0119)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.11)
  (connects road_0086 loc_0051 loc_0059)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.0)
  (connects road_0087 loc_0051 loc_0052)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.03)
  (connects road_0088 loc_0052 loc_0051)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.03)
  (connects road_0090 loc_0053 loc_0047)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.1)
  (connects road_0094 loc_0055 loc_0116)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.11)
  (connects road_0095 loc_0055 loc_0011)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.1)
  (connects road_0096 loc_0056 loc_0064)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.0)
  (connects road_0097 loc_0057 loc_0023)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.0)
  (connects road_0099 loc_0058 loc_0051)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.03)
  (connects road_0100 loc_0059 loc_0060)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.05)
  (connects road_0101 loc_0059 loc_0061)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.15)
  (connects road_0102 loc_0060 loc_0024)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.06)
  (connects road_0103 loc_0060 loc_0147)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.17)
  (connects road_0104 loc_0061 loc_0025)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.1)
  (connects road_0105 loc_0062 loc_0051)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.0)
  (connects road_0107 loc_0064 loc_0065)
  (road-open road_0107)
  (= (congestion-factor road_0107) 1.0)
  (connects road_0108 loc_0065 loc_0164)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.06)
  (connects road_0109 loc_0065 loc_0066)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.0)
  (connects road_0110 loc_0066 loc_0270)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.0)
  (connects road_0111 loc_0066 loc_0056)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.0)
  (connects road_0112 loc_0067 loc_0068)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.03)
  (connects road_0113 loc_0068 loc_0069)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.06)
  (connects road_0114 loc_0068 loc_0183)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.09)
  (connects road_0115 loc_0069 loc_0068)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.06)
  (connects road_0116 loc_0069 loc_0185)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.05)
  (connects road_0117 loc_0070 loc_0016)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.0)
  (connects road_0118 loc_0071 loc_0047)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.0)
  (connects road_0120 loc_0073 loc_0249)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.03)
  (connects road_0121 loc_0074 loc_0180)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.17)
  (connects road_0122 loc_0075 loc_0228)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.06)
  (connects road_0123 loc_0076 loc_0141)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.0)
  (connects road_0124 loc_0077 loc_0247)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.0)
  (connects road_0125 loc_0078 loc_0160)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.0)
  (connects road_0126 loc_0079 loc_0161)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.0)
  (connects road_0127 loc_0079 loc_0080)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.1)
  (connects road_0128 loc_0079 loc_0296)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.1)
  (connects road_0129 loc_0080 loc_0079)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.0)
  (connects road_0130 loc_0081 loc_0161)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.05)
  (connects road_0131 loc_0081 loc_0108)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.0)
  (connects road_0132 loc_0081 loc_0126)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.1)
  (connects road_0133 loc_0082 loc_0272)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.06)
  (connects road_0134 loc_0083 loc_0254)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.0)
  (connects road_0135 loc_0083 loc_0082)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.05)
  (connects road_0137 loc_0085 loc_0084)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.0)
  (connects road_0138 loc_0086 loc_0143)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.0)
  (connects road_0139 loc_0086 loc_0122)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.2)
  (connects road_0140 loc_0087 loc_0070)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.0)
  (connects road_0141 loc_0088 loc_0182)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.0)
  (connects road_0142 loc_0088 loc_0278)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.1)
  (connects road_0143 loc_0089 loc_0027)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.05)
  (connects road_0144 loc_0089 loc_0090)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.05)
  (connects road_0145 loc_0090 loc_0025)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.05)
  (connects road_0146 loc_0091 loc_0089)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.05)
  (connects road_0147 loc_0091 loc_0257)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.05)
  (connects road_0148 loc_0092 loc_0062)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.0)
  (connects road_0149 loc_0093 loc_0282)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.05)
  (connects road_0150 loc_0093 loc_0092)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.0)
  (connects road_0151 loc_0094 loc_0012)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.03)
  (connects road_0152 loc_0094 loc_0267)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.0)
  (connects road_0153 loc_0094 loc_0093)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.05)
  (connects road_0155 loc_0096 loc_0168)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.1)
  (connects road_0157 loc_0097 loc_0096)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.05)
  (connects road_0158 loc_0097 loc_0166)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.0)
  (connects road_0159 loc_0097 loc_0024)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.09)
  (connects road_0161 loc_0099 loc_0226)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.05)
  (connects road_0162 loc_0099 loc_0227)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.02)
  (connects road_0163 loc_0100 loc_0292)
  (road-open road_0163)
  (= (congestion-factor road_0163) 1.05)
  (connects road_0164 loc_0100 loc_0101)
  (road-open road_0164)
  (= (congestion-factor road_0164) 1.1)
  (connects road_0165 loc_0101 loc_0100)
  (road-open road_0165)
  (= (congestion-factor road_0165) 1.05)
  (connects road_0166 loc_0101 loc_0204)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.05)
  (connects road_0167 loc_0101 loc_0201)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.05)
  (connects road_0168 loc_0102 loc_0193)
  (road-open road_0168)
  (= (congestion-factor road_0168) 1.05)
  (connects road_0169 loc_0102 loc_0212)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.0)
  (connects road_0171 loc_0103 loc_0243)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.05)
  (connects road_0172 loc_0103 loc_0195)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.0)
  (connects road_0173 loc_0104 loc_0103)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.0)
  (connects road_0174 loc_0104 loc_0176)
  (road-open road_0174)
  (= (congestion-factor road_0174) 1.05)
  (connects road_0175 loc_0105 loc_0140)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.06)
  (connects road_0176 loc_0105 loc_0106)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.06)
  (connects road_0177 loc_0105 loc_0014)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.04)
  (connects road_0178 loc_0106 loc_0136)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.0)
  (connects road_0179 loc_0106 loc_0105)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.03)
  (connects road_0180 loc_0106 loc_0137)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.04)
  (connects road_0181 loc_0107 loc_0110)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.0)
  (connects road_0182 loc_0107 loc_0029)
  (road-open road_0182)
  (= (congestion-factor road_0182) 1.0)
  (connects road_0183 loc_0107 loc_0109)
  (road-open road_0183)
  (= (congestion-factor road_0183) 1.0)
  (connects road_0184 loc_0108 loc_0238)
  (road-open road_0184)
  (= (congestion-factor road_0184) 1.05)
  (connects road_0185 loc_0108 loc_0081)
  (road-open road_0185)
  (= (congestion-factor road_0185) 1.1)
  (connects road_0186 loc_0109 loc_0161)
  (road-open road_0186)
  (= (congestion-factor road_0186) 1.06)
  (connects road_0187 loc_0109 loc_0107)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.06)
  (connects road_0188 loc_0110 loc_0217)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.0)
  (connects road_0189 loc_0111 loc_0174)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.15)
  (connects road_0190 loc_0111 loc_0110)
  (road-open road_0190)
  (= (congestion-factor road_0190) 1.05)
  (connects road_0191 loc_0112 loc_0283)
  (road-open road_0191)
  (= (congestion-factor road_0191) 1.05)
  (connects road_0192 loc_0113 loc_0115)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.15)
  (connects road_0193 loc_0113 loc_0114)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.05)
  (connects road_0194 loc_0113 loc_0234)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.0)
  (connects road_0195 loc_0114 loc_0008)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.0)
  (connects road_0196 loc_0114 loc_0113)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.0)
  (connects road_0197 loc_0115 loc_0011)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.1)
  (connects road_0198 loc_0116 loc_0215)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.1)
  (connects road_0199 loc_0116 loc_0268)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.06)
  (connects road_0200 loc_0116 loc_0055)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.06)
  (connects road_0201 loc_0117 loc_0291)
  (road-open road_0201)
  (= (congestion-factor road_0201) 1.03)
  (connects road_0202 loc_0117 loc_0290)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.09)
  (connects road_0203 loc_0118 loc_0210)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.11)
  (connects road_0204 loc_0119 loc_0001)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.09)
  (connects road_0205 loc_0119 loc_0269)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.1)
  (connects road_0206 loc_0120 loc_0086)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.2)
  (connects road_0207 loc_0121 loc_0120)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.05)
  (connects road_0208 loc_0121 loc_0123)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.15)
  (connects road_0209 loc_0122 loc_0121)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.2)
  (connects road_0210 loc_0122 loc_0087)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.0)
  (connects road_0211 loc_0123 loc_0001)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.06)
  (connects road_0212 loc_0123 loc_0121)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.0)
  (connects road_0213 loc_0124 loc_0149)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.0)
  (connects road_0215 loc_0125 loc_0171)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.0)
  (connects road_0216 loc_0126 loc_0124)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.15)
  (connects road_0217 loc_0126 loc_0058)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.05)
  (connects road_0218 loc_0127 loc_0055)
  (road-open road_0218)
  (= (congestion-factor road_0218) 1.17)
  (connects road_0219 loc_0128 loc_0288)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.0)
  (connects road_0220 loc_0129 loc_0130)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.05)
  (connects road_0221 loc_0130 loc_0134)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.05)
  (connects road_0222 loc_0130 loc_0129)
  (road-open road_0222)
  (= (congestion-factor road_0222) 1.05)
  (connects road_0223 loc_0130 loc_0133)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.0)
  (connects road_0226 loc_0131 loc_0132)
  (road-open road_0226)
  (= (congestion-factor road_0226) 1.0)
  (connects road_0227 loc_0132 loc_0131)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.05)
  (connects road_0228 loc_0132 loc_0236)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.04)
  (connects road_0232 loc_0134 loc_0135)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.05)
  (connects road_0233 loc_0134 loc_0214)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.15)
  (connects road_0234 loc_0134 loc_0130)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.0)
  (connects road_0235 loc_0135 loc_0013)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.05)
  (connects road_0236 loc_0135 loc_0134)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.1)
  (connects road_0237 loc_0135 loc_0213)
  (road-open road_0237)
  (= (congestion-factor road_0237) 1.0)
  (connects road_0238 loc_0136 loc_0261)
  (road-open road_0238)
  (= (congestion-factor road_0238) 1.0)
  (connects road_0239 loc_0136 loc_0138)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.0)
  (connects road_0240 loc_0136 loc_0106)
  (road-open road_0240)
  (= (congestion-factor road_0240) 1.0)
  (connects road_0241 loc_0136 loc_0181)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.0)
  (connects road_0242 loc_0137 loc_0139)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.04)
  (connects road_0243 loc_0138 loc_0137)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.05)
  (connects road_0244 loc_0139 loc_0138)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.05)
  (connects road_0245 loc_0139 loc_0297)
  (road-open road_0245)
  (= (congestion-factor road_0245) 1.04)
  (connects road_0246 loc_0139 loc_0277)
  (road-open road_0246)
  (= (congestion-factor road_0246) 1.0)
  (connects road_0247 loc_0140 loc_0274)
  (road-open road_0247)
  (= (congestion-factor road_0247) 1.1)
  (connects road_0248 loc_0140 loc_0105)
  (road-open road_0248)
  (= (congestion-factor road_0248) 1.03)
  (connects road_0249 loc_0140 loc_0288)
  (road-open road_0249)
  (= (congestion-factor road_0249) 1.0)
  (connects road_0250 loc_0141 loc_0076)
  (road-open road_0250)
  (= (congestion-factor road_0250) 1.1)
  (connects road_0251 loc_0141 loc_0192)
  (road-open road_0251)
  (= (congestion-factor road_0251) 1.1)
  (connects road_0252 loc_0142 loc_0184)
  (road-open road_0252)
  (= (congestion-factor road_0252) 1.03)
  (connects road_0253 loc_0142 loc_0164)
  (road-open road_0253)
  (= (congestion-factor road_0253) 1.06)
  (connects road_0254 loc_0143 loc_0144)
  (road-open road_0254)
  (= (congestion-factor road_0254) 1.0)
  (connects road_0255 loc_0144 loc_0070)
  (road-open road_0255)
  (= (congestion-factor road_0255) 1.0)
  (connects road_0256 loc_0145 loc_0153)
  (road-open road_0256)
  (= (congestion-factor road_0256) 1.05)
  (connects road_0257 loc_0146 loc_0218)
  (road-open road_0257)
  (= (congestion-factor road_0257) 1.0)
  (connects road_0258 loc_0146 loc_0152)
  (road-open road_0258)
  (= (congestion-factor road_0258) 1.0)
  (connects road_0259 loc_0146 loc_0030)
  (road-open road_0259)
  (= (congestion-factor road_0259) 1.0)
  (connects road_0260 loc_0147 loc_0148)
  (road-open road_0260)
  (= (congestion-factor road_0260) 1.1)
  (connects road_0261 loc_0147 loc_0060)
  (road-open road_0261)
  (= (congestion-factor road_0261) 1.06)
  (connects road_0262 loc_0147 loc_0025)
  (road-open road_0262)
  (= (congestion-factor road_0262) 1.06)
  (connects road_0263 loc_0148 loc_0169)
  (road-open road_0263)
  (= (congestion-factor road_0263) 1.05)
  (connects road_0264 loc_0148 loc_0061)
  (road-open road_0264)
  (= (congestion-factor road_0264) 1.0)
  (connects road_0265 loc_0149 loc_0172)
  (road-open road_0265)
  (= (congestion-factor road_0265) 1.0)
  (connects road_0266 loc_0149 loc_0165)
  (road-open road_0266)
  (= (congestion-factor road_0266) 1.1)
  (connects road_0269 loc_0152 loc_0146)
  (road-open road_0269)
  (= (congestion-factor road_0269) 1.0)
  (connects road_0270 loc_0153 loc_0031)
  (road-open road_0270)
  (= (congestion-factor road_0270) 1.1)
  (connects road_0272 loc_0154 loc_0155)
  (road-open road_0272)
  (= (congestion-factor road_0272) 1.05)
  (connects road_0273 loc_0155 loc_0162)
  (road-open road_0273)
  (= (congestion-factor road_0273) 1.0)
  (connects road_0274 loc_0155 loc_0157)
  (road-open road_0274)
  (= (congestion-factor road_0274) 1.1)
  (connects road_0275 loc_0155 loc_0156)
  (road-open road_0275)
  (= (congestion-factor road_0275) 1.1)
  (connects road_0276 loc_0156 loc_0153)
  (road-open road_0276)
  (= (congestion-factor road_0276) 1.1)
  (connects road_0277 loc_0157 loc_0295)
  (road-open road_0277)
  (= (congestion-factor road_0277) 1.05)
  (connects road_0278 loc_0158 loc_0263)
  (road-open road_0278)
  (= (congestion-factor road_0278) 1.14)
  (connects road_0279 loc_0158 loc_0163)
  (road-open road_0279)
  (= (congestion-factor road_0279) 1.11)
  (connects road_0280 loc_0159 loc_0117)
  (road-open road_0280)
  (= (congestion-factor road_0280) 1.0)
  (connects road_0281 loc_0160 loc_0158)
  (road-open road_0281)
  (= (congestion-factor road_0281) 1.0)
  (connects road_0282 loc_0160 loc_0159)
  (road-open road_0282)
  (= (congestion-factor road_0282) 1.0)
  (connects road_0283 loc_0161 loc_0079)
  (road-open road_0283)
  (= (congestion-factor road_0283) 1.2)
  (connects road_0285 loc_0161 loc_0109)
  (road-open road_0285)
  (= (congestion-factor road_0285) 1.06)
  (connects road_0286 loc_0162 loc_0155)
  (road-open road_0286)
  (= (congestion-factor road_0286) 1.05)
  (connects road_0287 loc_0163 loc_0012)
  (road-open road_0287)
  (= (congestion-factor road_0287) 1.03)
  (connects road_0288 loc_0163 loc_0158)
  (road-open road_0288)
  (= (congestion-factor road_0288) 1.03)
  (connects road_0289 loc_0163 loc_0118)
  (road-open road_0289)
  (= (congestion-factor road_0289) 1.09)
  (connects road_0290 loc_0164 loc_0142)
  (road-open road_0290)
  (= (congestion-factor road_0290) 1.06)
  (connects road_0291 loc_0164 loc_0065)
  (road-open road_0291)
  (= (congestion-factor road_0291) 1.09)
  (connects road_0292 loc_0165 loc_0125)
  (road-open road_0292)
  (= (congestion-factor road_0292) 1.1)
  (connects road_0293 loc_0165 loc_0170)
  (road-open road_0293)
  (= (congestion-factor road_0293) 1.0)
  (connects road_0294 loc_0166 loc_0097)
  (road-open road_0294)
  (= (congestion-factor road_0294) 1.09)
  (connects road_0295 loc_0167 loc_0063)
  (road-open road_0295)
  (= (congestion-factor road_0295) 1.0)
  (connects road_0297 loc_0168 loc_0096)
  (road-open road_0297)
  (= (congestion-factor road_0297) 1.0)
  (connects road_0298 loc_0169 loc_0148)
  (road-open road_0298)
  (= (congestion-factor road_0298) 1.05)
  (connects road_0299 loc_0170 loc_0124)
  (road-open road_0299)
  (= (congestion-factor road_0299) 1.05)
  (connects road_0300 loc_0171 loc_0125)
  (road-open road_0300)
  (= (congestion-factor road_0300) 1.0)
  (connects road_0301 loc_0172 loc_0108)
  (road-open road_0301)
  (= (congestion-factor road_0301) 1.15)
  (connects road_0302 loc_0173 loc_0283)
  (road-open road_0302)
  (= (congestion-factor road_0302) 1.0)
  (connects road_0303 loc_0173 loc_0217)
  (road-open road_0303)
  (= (congestion-factor road_0303) 1.05)
  (connects road_0304 loc_0174 loc_0109)
  (road-open road_0304)
  (= (congestion-factor road_0304) 1.05)
  (connects road_0305 loc_0174 loc_0294)
  (road-open road_0305)
  (= (congestion-factor road_0305) 1.1)
  (connects road_0306 loc_0175 loc_0294)
  (road-open road_0306)
  (= (congestion-factor road_0306) 1.0)
  (connects road_0307 loc_0176 loc_0018)
  (road-open road_0307)
  (= (congestion-factor road_0307) 1.1)
  (connects road_0309 loc_0177 loc_0289)
  (road-open road_0309)
  (= (congestion-factor road_0309) 1.05)
  (connects road_0310 loc_0177 loc_0040)
  (road-open road_0310)
  (= (congestion-factor road_0310) 1.0)
  (connects road_0311 loc_0178 loc_0289)
  (road-open road_0311)
  (= (congestion-factor road_0311) 1.11)
  (connects road_0312 loc_0178 loc_0042)
  (road-open road_0312)
  (= (congestion-factor road_0312) 1.11)
  (connects road_0313 loc_0179 loc_0077)
  (road-open road_0313)
  (= (congestion-factor road_0313) 1.0)
  (connects road_0314 loc_0179 loc_0042)
  (road-open road_0314)
  (= (congestion-factor road_0314) 1.09)
  (connects road_0315 loc_0180 loc_0202)
  (road-open road_0315)
  (= (congestion-factor road_0315) 1.1)
  (connects road_0316 loc_0180 loc_0189)
  (road-open road_0316)
  (= (congestion-factor road_0316) 1.11)
  (connects road_0317 loc_0183 loc_0142)
  (road-open road_0317)
  (= (congestion-factor road_0317) 1.06)
  (connects road_0318 loc_0183 loc_0184)
  (road-open road_0318)
  (= (congestion-factor road_0318) 1.03)
  (connects road_0321 loc_0187 loc_0281)
  (road-open road_0321)
  (= (congestion-factor road_0321) 1.0)
  (connects road_0323 loc_0188 loc_0262)
  (road-open road_0323)
  (= (congestion-factor road_0323) 1.1)
  (connects road_0324 loc_0188 loc_0003)
  (road-open road_0324)
  (= (congestion-factor road_0324) 1.1)
  (connects road_0325 loc_0189 loc_0012)
  (road-open road_0325)
  (= (congestion-factor road_0325) 1.03)
  (connects road_0327 loc_0191 loc_0195)
  (road-open road_0327)
  (= (congestion-factor road_0327) 1.0)
  (connects road_0328 loc_0192 loc_0212)
  (road-open road_0328)
  (= (congestion-factor road_0328) 1.06)
  (connects road_0329 loc_0192 loc_0193)
  (road-open road_0329)
  (= (congestion-factor road_0329) 1.05)
  (connects road_0330 loc_0192 loc_0075)
  (road-open road_0330)
  (= (congestion-factor road_0330) 1.06)
  (connects road_0331 loc_0193 loc_0102)
  (road-open road_0331)
  (= (congestion-factor road_0331) 1.0)
  (connects road_0332 loc_0193 loc_0244)
  (road-open road_0332)
  (= (congestion-factor road_0332) 1.05)
  (connects road_0333 loc_0194 loc_0232)
  (road-open road_0333)
  (= (congestion-factor road_0333) 1.1)
  (connects road_0334 loc_0194 loc_0233)
  (road-open road_0334)
  (= (congestion-factor road_0334) 1.0)
  (connects road_0335 loc_0195 loc_0191)
  (road-open road_0335)
  (= (congestion-factor road_0335) 1.0)
  (connects road_0336 loc_0195 loc_0176)
  (road-open road_0336)
  (= (congestion-factor road_0336) 1.1)
  (connects road_0337 loc_0195 loc_0103)
  (road-open road_0337)
  (= (congestion-factor road_0337) 1.05)
  (connects road_0338 loc_0196 loc_0103)
  (road-open road_0338)
  (= (congestion-factor road_0338) 1.0)
  (connects road_0339 loc_0196 loc_0100)
  (road-open road_0339)
  (= (congestion-factor road_0339) 1.1)
  (connects road_0340 loc_0197 loc_0196)
  (road-open road_0340)
  (= (congestion-factor road_0340) 1.05)
  (connects road_0341 loc_0197 loc_0198)
  (road-open road_0341)
  (= (congestion-factor road_0341) 1.1)
  (connects road_0342 loc_0198 loc_0197)
  (road-open road_0342)
  (= (congestion-factor road_0342) 1.05)
  (connects road_0344 loc_0199 loc_0102)
  (road-open road_0344)
  (= (congestion-factor road_0344) 1.0)
  (connects road_0345 loc_0200 loc_0230)
  (road-open road_0345)
  (= (congestion-factor road_0345) 1.0)
  (connects road_0346 loc_0200 loc_0041)
  (road-open road_0346)
  (= (congestion-factor road_0346) 1.11)
  (connects road_0347 loc_0201 loc_0203)
  (road-open road_0347)
  (= (congestion-factor road_0347) 1.05)
  (connects road_0348 loc_0201 loc_0101)
  (road-open road_0348)
  (= (congestion-factor road_0348) 1.0)
  (connects road_0349 loc_0202 loc_0205)
  (road-open road_0349)
  (= (congestion-factor road_0349) 1.1)
  (connects road_0350 loc_0202 loc_0203)
  (road-open road_0350)
  (= (congestion-factor road_0350) 1.2)
  (connects road_0351 loc_0203 loc_0210)
  (road-open road_0351)
  (= (congestion-factor road_0351) 1.2)
  (connects road_0352 loc_0203 loc_0201)
  (road-open road_0352)
  (= (congestion-factor road_0352) 1.1)
  (connects road_0353 loc_0203 loc_0202)
  (road-open road_0353)
  (= (congestion-factor road_0353) 1.05)
  (connects road_0354 loc_0204 loc_0197)
  (road-open road_0354)
  (= (congestion-factor road_0354) 1.1)
  (connects road_0355 loc_0204 loc_0205)
  (road-open road_0355)
  (= (congestion-factor road_0355) 1.15)
  (connects road_0356 loc_0204 loc_0101)
  (road-open road_0356)
  (= (congestion-factor road_0356) 1.05)
  (connects road_0357 loc_0205 loc_0074)
  (road-open road_0357)
  (= (congestion-factor road_0357) 1.15)
  (connects road_0358 loc_0205 loc_0202)
  (road-open road_0358)
  (= (congestion-factor road_0358) 1.2)
  (connects road_0359 loc_0205 loc_0204)
  (road-open road_0359)
  (= (congestion-factor road_0359) 1.05)
  (connects road_0360 loc_0206 loc_0295)
  (road-open road_0360)
  (= (congestion-factor road_0360) 1.0)
  (connects road_0361 loc_0207 loc_0034)
  (road-open road_0361)
  (= (congestion-factor road_0361) 1.0)
  (connects road_0364 loc_0209 loc_0208)
  (road-open road_0364)
  (= (congestion-factor road_0364) 1.0)
  (connects road_0366 loc_0210 loc_0041)
  (road-open road_0366)
  (= (congestion-factor road_0366) 1.09)
  (connects road_0367 loc_0210 loc_0230)
  (road-open road_0367)
  (= (congestion-factor road_0367) 1.0)
  (connects road_0368 loc_0211 loc_0293)
  (road-open road_0368)
  (= (congestion-factor road_0368) 1.1)
  (connects road_0369 loc_0211 loc_0248)
  (road-open road_0369)
  (= (congestion-factor road_0369) 1.1)
  (connects road_0370 loc_0211 loc_0212)
  (road-open road_0370)
  (= (congestion-factor road_0370) 1.11)
  (connects road_0371 loc_0212 loc_0192)
  (road-open road_0371)
  (= (congestion-factor road_0371) 1.03)
  (connects road_0372 loc_0212 loc_0141)
  (road-open road_0372)
  (= (congestion-factor road_0372) 1.1)
  (connects road_0373 loc_0213 loc_0135)
  (road-open road_0373)
  (= (congestion-factor road_0373) 1.05)
  (connects road_0374 loc_0214 loc_0134)
  (road-open road_0374)
  (= (congestion-factor road_0374) 1.0)
  (connects road_0375 loc_0215 loc_0054)
  (road-open road_0375)
  (= (congestion-factor road_0375) 1.09)
  (connects road_0376 loc_0216 loc_0123)
  (road-open road_0376)
  (= (congestion-factor road_0376) 1.06)
  (connects road_0377 loc_0217 loc_0239)
  (road-open road_0377)
  (= (congestion-factor road_0377) 1.0)
  (connects road_0379 loc_0219 loc_0253)
  (road-open road_0379)
  (= (congestion-factor road_0379) 1.05)
  (connects road_0380 loc_0220 loc_0038)
  (road-open road_0380)
  (= (congestion-factor road_0380) 1.06)
  (connects road_0381 loc_0220 loc_0020)
  (road-open road_0381)
  (= (congestion-factor road_0381) 1.03)
  (connects road_0382 loc_0221 loc_0220)
  (road-open road_0382)
  (= (congestion-factor road_0382) 1.03)
  (connects road_0383 loc_0221 loc_0020)
  (road-open road_0383)
  (= (congestion-factor road_0383) 1.11)
  (connects road_0384 loc_0222 loc_0021)
  (road-open road_0384)
  (= (congestion-factor road_0384) 1.11)
  (connects road_0385 loc_0223 loc_0037)
  (road-open road_0385)
  (= (congestion-factor road_0385) 1.11)
  (connects road_0386 loc_0223 loc_0019)
  (road-open road_0386)
  (= (congestion-factor road_0386) 1.09)
  (connects road_0387 loc_0224 loc_0223)
  (road-open road_0387)
  (= (congestion-factor road_0387) 1.2)
  (connects road_0388 loc_0224 loc_0019)
  (road-open road_0388)
  (= (congestion-factor road_0388) 1.03)
  (connects road_0390 loc_0226 loc_0227)
  (road-open road_0390)
  (= (congestion-factor road_0390) 1.04)
  (connects road_0391 loc_0227 loc_0228)
  (road-open road_0391)
  (= (congestion-factor road_0391) 1.04)
  (connects road_0392 loc_0228 loc_0229)
  (road-open road_0392)
  (= (congestion-factor road_0392) 1.1)
  (connects road_0393 loc_0229 loc_0075)
  (road-open road_0393)
  (= (congestion-factor road_0393) 1.0)
  (connects road_0395 loc_0230 loc_0179)
  (road-open road_0395)
  (= (congestion-factor road_0395) 1.03)
  (connects road_0396 loc_0231 loc_0293)
  (road-open road_0396)
  (= (congestion-factor road_0396) 1.0)
  (connects road_0397 loc_0231 loc_0201)
  (road-open road_0397)
  (= (congestion-factor road_0397) 1.0)
  (connects road_0398 loc_0232 loc_0178)
  (road-open road_0398)
  (= (congestion-factor road_0398) 1.17)
  (connects road_0400 loc_0233 loc_0077)
  (road-open road_0400)
  (= (congestion-factor road_0400) 1.0)
  (connects road_0401 loc_0234 loc_0113)
  (road-open road_0401)
  (= (congestion-factor road_0401) 1.0)
  (connects road_0402 loc_0235 loc_0236)
  (road-open road_0402)
  (= (congestion-factor road_0402) 1.0)
  (connects road_0403 loc_0236 loc_0235)
  (road-open road_0403)
  (= (congestion-factor road_0403) 1.05)
  (connects road_0404 loc_0236 loc_0297)
  (road-open road_0404)
  (= (congestion-factor road_0404) 1.02)
  (connects road_0405 loc_0237 loc_0275)
  (road-open road_0405)
  (= (congestion-factor road_0405) 1.15)
  (connects road_0406 loc_0237 loc_0276)
  (road-open road_0406)
  (= (congestion-factor road_0406) 1.1)
  (connects road_0407 loc_0238 loc_0108)
  (road-open road_0407)
  (= (congestion-factor road_0407) 1.05)
  (connects road_0408 loc_0238 loc_0173)
  (road-open road_0408)
  (= (congestion-factor road_0408) 1.05)
  (connects road_0409 loc_0239 loc_0111)
  (road-open road_0409)
  (= (congestion-factor road_0409) 1.05)
  (connects road_0410 loc_0239 loc_0238)
  (road-open road_0410)
  (= (congestion-factor road_0410) 1.05)
  (connects road_0411 loc_0240 loc_0241)
  (road-open road_0411)
  (= (congestion-factor road_0411) 1.1)
  (connects road_0412 loc_0240 loc_0249)
  (road-open road_0412)
  (= (congestion-factor road_0412) 1.0)
  (connects road_0414 loc_0241 loc_0240)
  (road-open road_0414)
  (= (congestion-factor road_0414) 1.0)
  (connects road_0415 loc_0242 loc_0102)
  (road-open road_0415)
  (= (congestion-factor road_0415) 1.0)
  (connects road_0416 loc_0242 loc_0244)
  (road-open road_0416)
  (= (congestion-factor road_0416) 1.0)
  (connects road_0417 loc_0243 loc_0292)
  (road-open road_0417)
  (= (congestion-factor road_0417) 1.05)
  (connects road_0419 loc_0245 loc_0195)
  (road-open road_0419)
  (= (congestion-factor road_0419) 1.1)
  (connects road_0420 loc_0245 loc_0243)
  (road-open road_0420)
  (= (congestion-factor road_0420) 1.0)
  (connects road_0422 loc_0247 loc_0200)
  (road-open road_0422)
  (= (congestion-factor road_0422) 1.09)
  (connects road_0423 loc_0247 loc_0287)
  (road-open road_0423)
  (= (congestion-factor road_0423) 1.0)
  (connects road_0424 loc_0248 loc_0211)
  (road-open road_0424)
  (= (congestion-factor road_0424) 1.05)
  (connects road_0425 loc_0249 loc_0187)
  (road-open road_0425)
  (= (congestion-factor road_0425) 1.0)
  (connects road_0426 loc_0250 loc_0054)
  (road-open road_0426)
  (= (congestion-factor road_0426) 1.0)
  (connects road_0430 loc_0253 loc_0083)
  (road-open road_0430)
  (= (congestion-factor road_0430) 1.1)
  (connects road_0431 loc_0253 loc_0091)
  (road-open road_0431)
  (= (congestion-factor road_0431) 1.05)
  (connects road_0432 loc_0254 loc_0255)
  (road-open road_0432)
  (= (congestion-factor road_0432) 1.05)
  (connects road_0433 loc_0254 loc_0257)
  (road-open road_0433)
  (= (congestion-factor road_0433) 1.0)
  (connects road_0435 loc_0255 loc_0057)
  (road-open road_0435)
  (= (congestion-factor road_0435) 1.03)
  (connects road_0437 loc_0257 loc_0259)
  (road-open road_0437)
  (= (congestion-factor road_0437) 1.0)
  (connects road_0438 loc_0257 loc_0091)
  (road-open road_0438)
  (= (congestion-factor road_0438) 1.05)
  (connects road_0439 loc_0259 loc_0257)
  (road-open road_0439)
  (= (congestion-factor road_0439) 1.05)
  (connects road_0440 loc_0259 loc_0260)
  (road-open road_0440)
  (= (congestion-factor road_0440) 1.0)
  (connects road_0441 loc_0260 loc_0261)
  (road-open road_0441)
  (= (congestion-factor road_0441) 1.06)
  (connects road_0442 loc_0260 loc_0258)
  (road-open road_0442)
  (= (congestion-factor road_0442) 1.06)
  (connects road_0443 loc_0261 loc_0136)
  (road-open road_0443)
  (= (congestion-factor road_0443) 1.0)
  (connects road_0444 loc_0261 loc_0258)
  (road-open road_0444)
  (= (congestion-factor road_0444) 1.06)
  (connects road_0445 loc_0263 loc_0158)
  (road-open road_0445)
  (= (congestion-factor road_0445) 1.0)
  (connects road_0446 loc_0263 loc_0159)
  (road-open road_0446)
  (= (congestion-factor road_0446) 1.03)
  (connects road_0447 loc_0264 loc_0078)
  (road-open road_0447)
  (= (congestion-factor road_0447) 1.0)
  (connects road_0448 loc_0264 loc_0266)
  (road-open road_0448)
  (= (congestion-factor road_0448) 1.06)
  (connects road_0449 loc_0265 loc_0194)
  (road-open road_0449)
  (= (congestion-factor road_0449) 1.05)
  (connects road_0450 loc_0265 loc_0232)
  (road-open road_0450)
  (= (congestion-factor road_0450) 1.11)
  (connects road_0451 loc_0266 loc_0290)
  (road-open road_0451)
  (= (congestion-factor road_0451) 1.03)
  (connects road_0452 loc_0266 loc_0042)
  (road-open road_0452)
  (= (congestion-factor road_0452) 1.06)
  (connects road_0453 loc_0267 loc_0052)
  (road-open road_0453)
  (= (congestion-factor road_0453) 1.03)
  (connects road_0454 loc_0267 loc_0094)
  (road-open road_0454)
  (= (congestion-factor road_0454) 1.03)
  (connects road_0455 loc_0268 loc_0116)
  (road-open road_0455)
  (= (congestion-factor road_0455) 1.0)
  (connects road_0456 loc_0269 loc_0119)
  (road-open road_0456)
  (= (congestion-factor road_0456) 1.0)
  (connects road_0457 loc_0270 loc_0143)
  (road-open road_0457)
  (= (congestion-factor road_0457) 1.05)
  (connects road_0458 loc_0270 loc_0271)
  (road-open road_0458)
  (= (congestion-factor road_0458) 1.0)
  (connects road_0459 loc_0271 loc_0270)
  (road-open road_0459)
  (= (congestion-factor road_0459) 1.0)
  (connects road_0460 loc_0272 loc_0286)
  (road-open road_0460)
  (= (congestion-factor road_0460) 1.03)
  (connects road_0461 loc_0272 loc_0219)
  (road-open road_0461)
  (= (congestion-factor road_0461) 1.05)
  (connects road_0462 loc_0273 loc_0026)
  (road-open road_0462)
  (= (congestion-factor road_0462) 1.03)
  (connects road_0463 loc_0273 loc_0027)
  (road-open road_0463)
  (= (congestion-factor road_0463) 1.0)
  (connects road_0464 loc_0274 loc_0140)
  (road-open road_0464)
  (= (congestion-factor road_0464) 1.05)
  (connects road_0465 loc_0275 loc_0237)
  (road-open road_0465)
  (= (congestion-factor road_0465) 1.0)
  (connects road_0466 loc_0276 loc_0132)
  (road-open road_0466)
  (= (congestion-factor road_0466) 1.06)
  (connects road_0467 loc_0276 loc_0277)
  (road-open road_0467)
  (= (congestion-factor road_0467) 1.06)
  (connects road_0468 loc_0277 loc_0298)
  (road-open road_0468)
  (= (congestion-factor road_0468) 1.06)
  (connects road_0470 loc_0279 loc_0038)
  (road-open road_0470)
  (= (congestion-factor road_0470) 1.0)
  (connects road_0472 loc_0280 loc_0265)
  (road-open road_0472)
  (= (congestion-factor road_0472) 1.06)
  (connects road_0473 loc_0282 loc_0093)
  (road-open road_0473)
  (= (congestion-factor road_0473) 1.0)
  (connects road_0474 loc_0283 loc_0112)
  (road-open road_0474)
  (= (congestion-factor road_0474) 1.05)
  (connects road_0475 loc_0283 loc_0172)
  (road-open road_0475)
  (= (congestion-factor road_0475) 1.1)
  (connects road_0476 loc_0283 loc_0173)
  (road-open road_0476)
  (= (congestion-factor road_0476) 1.0)
  (connects road_0478 loc_0285 loc_0144)
  (road-open road_0478)
  (= (congestion-factor road_0478) 1.1)
  (connects road_0479 loc_0285 loc_0185)
  (road-open road_0479)
  (= (congestion-factor road_0479) 1.05)
  (connects road_0480 loc_0286 loc_0273)
  (road-open road_0480)
  (= (congestion-factor road_0480) 1.09)
  (connects road_0481 loc_0287 loc_0247)
  (road-open road_0481)
  (= (congestion-factor road_0481) 1.0)
  (connects road_0482 loc_0288 loc_0128)
  (road-open road_0482)
  (= (congestion-factor road_0482) 1.0)
  (connects road_0483 loc_0288 loc_0140)
  (road-open road_0483)
  (= (congestion-factor road_0483) 1.0)
  (connects road_0484 loc_0289 loc_0280)
  (road-open road_0484)
  (= (congestion-factor road_0484) 1.11)
  (connects road_0485 loc_0290 loc_0117)
  (road-open road_0485)
  (= (congestion-factor road_0485) 1.06)
  (connects road_0486 loc_0290 loc_0264)
  (road-open road_0486)
  (= (congestion-factor road_0486) 1.11)
  (connects road_0487 loc_0291 loc_0118)
  (road-open road_0487)
  (= (congestion-factor road_0487) 1.05)
  (connects road_0488 loc_0291 loc_0263)
  (road-open road_0488)
  (= (congestion-factor road_0488) 1.03)
  (connects road_0489 loc_0292 loc_0100)
  (road-open road_0489)
  (= (congestion-factor road_0489) 1.05)
  (connects road_0490 loc_0292 loc_0242)
  (road-open road_0490)
  (= (congestion-factor road_0490) 1.0)
  (connects road_0493 loc_0294 loc_0175)
  (road-open road_0493)
  (= (congestion-factor road_0493) 1.05)
  (connects road_0494 loc_0294 loc_0299)
  (road-open road_0494)
  (= (congestion-factor road_0494) 1.05)
  (connects road_0495 loc_0294 loc_0174)
  (road-open road_0495)
  (= (congestion-factor road_0495) 1.0)
  (connects road_0496 loc_0295 loc_0251)
  (road-open road_0496)
  (= (congestion-factor road_0496) 1.0)
  (connects road_0497 loc_0295 loc_0206)
  (road-open road_0497)
  (= (congestion-factor road_0497) 1.0)
  (connects road_0498 loc_0296 loc_0045)
  (road-open road_0498)
  (= (congestion-factor road_0498) 1.05)
  (connects road_0499 loc_0297 loc_0139)
  (road-open road_0499)
  (= (congestion-factor road_0499) 1.0)
  (connects road_0500 loc_0297 loc_0105)
  (road-open road_0500)
  (= (congestion-factor road_0500) 1.04)
  (connects road_0501 loc_0298 loc_0017)
  (road-open road_0501)
  (= (congestion-factor road_0501) 1.04)
  (connects road_0502 loc_0298 loc_0237)
  (road-open road_0502)
  (= (congestion-factor road_0502) 1.04)
  (connects road_0503 loc_0299 loc_0294)
  (road-open road_0503)
  (= (congestion-factor road_0503) 1.0)
  ;; BEGIN DYNAMIC CONGESTION PROFILE
  (= (sim-time) 0)
  (current-window tw_00000)
  (= (window-start tw_00000) 0)
  (= (window-start tw_00030) 30)
  (= (window-start tw_00060) 60)
  (= (window-start tw_00090) 90)
  (= (window-start tw_00120) 120)
  (next-window tw_00000 tw_00030)
  (next-window tw_00030 tw_00060)
  (next-window tw_00060 tw_00090)
  (next-window tw_00090 tw_00120)
  (static-road macro_0000)
  (= (travel-duration macro_0000) 9.3954)
  (static-road macro_0001)
  (= (travel-duration macro_0001) 20.6123)
  (static-road macro_0002)
  (= (travel-duration macro_0002) 27.9983)
  (static-road macro_0004)
  (= (travel-duration macro_0004) 11.5596)
  (static-road macro_0005)
  (= (travel-duration macro_0005) 14.8014)
  (static-road macro_0006)
  (= (travel-duration macro_0006) 38.1735)
  (static-road macro_0007)
  (= (travel-duration macro_0007) 16.7011)
  (static-road macro_0008)
  (= (travel-duration macro_0008) 12.7129)
  (static-road macro_0009)
  (= (travel-duration macro_0009) 16.5136)
  (static-road macro_0010)
  (= (travel-duration macro_0010) 72.7649)
  (static-road macro_0012)
  (= (travel-duration macro_0012) 22.4073)
  (static-road macro_0013)
  (= (travel-duration macro_0013) 19.5807)
  (static-road macro_0014)
  (= (travel-duration macro_0014) 19.2236)
  (static-road macro_0015)
  (= (travel-duration macro_0015) 29.9892)
  (static-road macro_0016)
  (= (travel-duration macro_0016) 28.7147)
  (static-road macro_0018)
  (= (travel-duration macro_0018) 1.6833)
  (static-road macro_0020)
  (= (travel-duration macro_0020) 26.2875)
  (static-road macro_0021)
  (= (travel-duration macro_0021) 39.117)
  (static-road macro_0022)
  (= (travel-duration macro_0022) 37.2279)
  (static-road macro_0023)
  (= (travel-duration macro_0023) 43.5785)
  (static-road macro_0024)
  (= (travel-duration macro_0024) 43.5521)
  (static-road macro_0025)
  (= (travel-duration macro_0025) 21.7712)
  (static-road macro_0026)
  (= (travel-duration macro_0026) 26.1156)
  (static-road macro_0027)
  (= (travel-duration macro_0027) 17.162)
  (static-road macro_0028)
  (= (travel-duration macro_0028) 10.0607)
  (static-road macro_0029)
  (= (travel-duration macro_0029) 19.0769)
  (static-road macro_0031)
  (= (travel-duration macro_0031) 5.7066)
  (static-road macro_0032)
  (= (travel-duration macro_0032) 47.7019)
  (static-road macro_0035)
  (= (travel-duration macro_0035) 23.6637)
  (static-road macro_0036)
  (= (travel-duration macro_0036) 13.1289)
  (static-road macro_0037)
  (= (travel-duration macro_0037) 14.5889)
  (static-road macro_0038)
  (= (travel-duration macro_0038) 37.1055)
  (static-road road_0000)
  (= (travel-duration road_0000) 14.579)
  (static-road road_0001)
  (= (travel-duration road_0001) 7.3643)
  (static-road road_0002)
  (= (travel-duration road_0002) 10.5532)
  (static-road road_0005)
  (= (travel-duration road_0005) 1.6957)
  (static-road road_0006)
  (= (travel-duration road_0006) 91.1375)
  (static-road road_0007)
  (= (travel-duration road_0007) 3.0661)
  (static-road road_0008)
  (= (travel-duration road_0008) 14.1402)
  (static-road road_0009)
  (= (travel-duration road_0009) 8.3307)
  (static-road road_0010)
  (= (travel-duration road_0010) 4.4442)
  (static-road road_0013)
  (= (travel-duration road_0013) 9.0094)
  (static-road road_0014)
  (= (travel-duration road_0014) 15.5119)
  (static-road road_0016)
  (= (travel-duration road_0016) 9.4348)
  (static-road road_0017)
  (= (travel-duration road_0017) 10.2232)
  (static-road road_0020)
  (= (travel-duration road_0020) 1.9345)
  (static-road road_0021)
  (= (travel-duration road_0021) 6.3654)
  (static-road road_0023)
  (= (travel-duration road_0023) 10.5371)
  (static-road road_0030)
  (= (travel-duration road_0030) 6.1919)
  (static-road road_0032)
  (= (travel-duration road_0032) 16.9003)
  (static-road road_0034)
  (= (travel-duration road_0034) 17.6903)
  (static-road road_0035)
  (= (travel-duration road_0035) 3.8444)
  (static-road road_0036)
  (= (travel-duration road_0036) 6.8581)
  (static-road road_0039)
  (= (travel-duration road_0039) 8.4608)
  (static-road road_0040)
  (= (travel-duration road_0040) 5.0711)
  (static-road road_0041)
  (= (travel-duration road_0041) 1.1416)
  (static-road road_0042)
  (= (travel-duration road_0042) 0.563)
  (static-road road_0043)
  (= (travel-duration road_0043) 6.6411)
  (static-road road_0044)
  (= (travel-duration road_0044) 42.9485)
  (static-road road_0045)
  (= (travel-duration road_0045) 11.503)
  (static-road road_0046)
  (= (travel-duration road_0046) 11.8697)
  (static-road road_0048)
  (= (travel-duration road_0048) 12.2527)
  (static-road road_0050)
  (= (travel-duration road_0050) 8.5983)
  (static-road road_0052)
  (= (travel-duration road_0052) 12.4241)
  (static-road road_0053)
  (= (travel-duration road_0053) 36.8307)
  (static-road road_0058)
  (= (travel-duration road_0058) 15.0452)
  (static-road road_0059)
  (= (travel-duration road_0059) 1.1069)
  (static-road road_0061)
  (= (travel-duration road_0061) 31.2266)
  (static-road road_0062)
  (= (travel-duration road_0062) 22.9341)
  (static-road road_0063)
  (= (travel-duration road_0063) 19.8776)
  (static-road road_0064)
  (= (travel-duration road_0064) 9.0963)
  (static-road road_0065)
  (= (travel-duration road_0065) 16.3245)
  (static-road road_0067)
  (= (travel-duration road_0067) 4.5272)
  (static-road road_0068)
  (= (travel-duration road_0068) 7.2334)
  (static-road road_0069)
  (= (travel-duration road_0069) 6.1792)
  (static-road road_0070)
  (= (travel-duration road_0070) 8.9552)
  (static-road road_0072)
  (= (travel-duration road_0072) 4.6646)
  (static-road road_0073)
  (= (travel-duration road_0073) 8.7044)
  (static-road road_0074)
  (= (travel-duration road_0074) 5.4132)
  (static-road road_0075)
  (= (travel-duration road_0075) 23.1777)
  (static-road road_0076)
  (= (travel-duration road_0076) 31.2858)
  (static-road road_0078)
  (= (travel-duration road_0078) 23.7053)
  (static-road road_0079)
  (= (travel-duration road_0079) 4.547)
  (static-road road_0080)
  (= (travel-duration road_0080) 5.5174)
  (static-road road_0081)
  (= (travel-duration road_0081) 13.9002)
  (static-road road_0083)
  (= (travel-duration road_0083) 1.5401)
  (static-road road_0084)
  (= (travel-duration road_0084) 19.7941)
  (static-road road_0085)
  (= (travel-duration road_0085) 23.7265)
  (static-road road_0087)
  (= (travel-duration road_0087) 3.6711)
  (static-road road_0088)
  (= (travel-duration road_0088) 9.8511)
  (static-road road_0094)
  (= (travel-duration road_0094) 10.9162)
  (static-road road_0097)
  (= (travel-duration road_0097) 15.3114)
  (static-road road_0099)
  (= (travel-duration road_0099) 30.8713)
  (static-road road_0100)
  (= (travel-duration road_0100) 40.0986)
  (static-road road_0101)
  (= (travel-duration road_0101) 16.0073)
  (static-road road_0102)
  (= (travel-duration road_0102) 3.7386)
  (static-road road_0103)
  (= (travel-duration road_0103) 12.2616)
  (static-road road_0105)
  (= (travel-duration road_0105) 22.6039)
  (static-road road_0108)
  (= (travel-duration road_0108) 13.7165)
  (static-road road_0112)
  (= (travel-duration road_0112) 6.5535)
  (static-road road_0113)
  (= (travel-duration road_0113) 5.209)
  (static-road road_0114)
  (= (travel-duration road_0114) 7.7437)
  (static-road road_0115)
  (= (travel-duration road_0115) 5.209)
  (static-road road_0116)
  (= (travel-duration road_0116) 10.5819)
  (static-road road_0118)
  (= (travel-duration road_0118) 48.3079)
  (static-road road_0120)
  (= (travel-duration road_0120) 18.0762)
  (static-road road_0121)
  (= (travel-duration road_0121) 7.9629)
  (static-road road_0122)
  (= (travel-duration road_0122) 4.6761)
  (static-road road_0123)
  (= (travel-duration road_0123) 11.9141)
  (static-road road_0126)
  (= (travel-duration road_0126) 4.757)
  (static-road road_0127)
  (= (travel-duration road_0127) 17.195)
  (static-road road_0129)
  (= (travel-duration road_0129) 15.6318)
  (static-road road_0130)
  (= (travel-duration road_0130) 19.2359)
  (static-road road_0131)
  (= (travel-duration road_0131) 9.3448)
  (static-road road_0133)
  (= (travel-duration road_0133) 18.2743)
  (static-road road_0135)
  (= (travel-duration road_0135) 10.9851)
  (static-road road_0137)
  (= (travel-duration road_0137) 97.7718)
  (static-road road_0141)
  (= (travel-duration road_0141) 6.4144)
  (static-road road_0142)
  (= (travel-duration road_0142) 20.6298)
  (static-road road_0143)
  (= (travel-duration road_0143) 52.3639)
  (static-road road_0144)
  (= (travel-duration road_0144) 15.1452)
  (static-road road_0145)
  (= (travel-duration road_0145) 60.6717)
  (static-road road_0146)
  (= (travel-duration road_0146) 23.1582)
  (static-road road_0147)
  (= (travel-duration road_0147) 23.9876)
  (static-road road_0148)
  (= (travel-duration road_0148) 21.3489)
  (static-road road_0149)
  (= (travel-duration road_0149) 4.1241)
  (static-road road_0150)
  (= (travel-duration road_0150) 28.0814)
  (static-road road_0151)
  (= (travel-duration road_0151) 17.1999)
  (static-road road_0152)
  (= (travel-duration road_0152) 7.2351)
  (static-road road_0153)
  (= (travel-duration road_0153) 10.9284)
  (static-road road_0155)
  (= (travel-duration road_0155) 52.3351)
  (static-road road_0158)
  (= (travel-duration road_0158) 20.0564)
  (static-road road_0159)
  (= (travel-duration road_0159) 18.7208)
  (static-road road_0161)
  (= (travel-duration road_0161) 4.0498)
  (static-road road_0162)
  (= (travel-duration road_0162) 2.754)
  (static-road road_0166)
  (= (travel-duration road_0166) 1.6809)
  (static-road road_0168)
  (= (travel-duration road_0168) 1.069)
  (static-road road_0172)
  (= (travel-duration road_0172) 1.4941)
  (static-road road_0173)
  (= (travel-duration road_0173) 13.5161)
  (static-road road_0174)
  (= (travel-duration road_0174) 2.19)
  (static-road road_0175)
  (= (travel-duration road_0175) 13.2789)
  (static-road road_0176)
  (= (travel-duration road_0176) 2.305)
  (static-road road_0177)
  (= (travel-duration road_0177) 18.4735)
  (static-road road_0178)
  (= (travel-duration road_0178) 2.8801)
  (static-road road_0179)
  (= (travel-duration road_0179) 2.2397)
  (static-road road_0180)
  (= (travel-duration road_0180) 9.616)
  (static-road road_0182)
  (= (travel-duration road_0182) 42.9485)
  (static-road road_0183)
  (= (travel-duration road_0183) 12.6887)
  (static-road road_0184)
  (= (travel-duration road_0184) 2.8628)
  (static-road road_0185)
  (= (travel-duration road_0185) 10.2793)
  (static-road road_0186)
  (= (travel-duration road_0186) 13.9124)
  (static-road road_0187)
  (= (travel-duration road_0187) 6.8144)
  (static-road road_0189)
  (= (travel-duration road_0189) 0.9812)
  (static-road road_0190)
  (= (travel-duration road_0190) 7.4494)
  (static-road road_0191)
  (= (travel-duration road_0191) 0.344)
  (static-road road_0192)
  (= (travel-duration road_0192) 7.7697)
  (static-road road_0193)
  (= (travel-duration road_0193) 10.4105)
  (static-road road_0198)
  (= (travel-duration road_0198) 37.8308)
  (static-road road_0199)
  (= (travel-duration road_0199) 11.5108)
  (static-road road_0200)
  (= (travel-duration road_0200) 10.4245)
  (static-road road_0202)
  (= (travel-duration road_0202) 0.3309)
  (static-road road_0203)
  (= (travel-duration road_0203) 15.3591)
  (static-road road_0204)
  (= (travel-duration road_0204) 9.4795)
  (static-road road_0205)
  (= (travel-duration road_0205) 4.2664)
  (static-road road_0207)
  (= (travel-duration road_0207) 10.1686)
  (static-road road_0210)
  (= (travel-duration road_0210) 20.6732)
  (static-road road_0212)
  (= (travel-duration road_0212) 14.3598)
  (static-road road_0215)
  (= (travel-duration road_0215) 4.4642)
  (static-road road_0216)
  (= (travel-duration road_0216) 9.6949)
  (static-road road_0217)
  (= (travel-duration road_0217) 11.9478)
  (static-road road_0218)
  (= (travel-duration road_0218) 8.1449)
  (static-road road_0219)
  (= (travel-duration road_0219) 3.1969)
  (static-road road_0220)
  (= (travel-duration road_0220) 14.173)
  (static-road road_0221)
  (= (travel-duration road_0221) 54.0524)
  (static-road road_0222)
  (= (travel-duration road_0222) 14.173)
  (static-road road_0223)
  (= (travel-duration road_0223) 12.0209)
  (static-road road_0226)
  (= (travel-duration road_0226) 18.3451)
  (static-road road_0227)
  (= (travel-duration road_0227) 19.2624)
  (static-road road_0228)
  (= (travel-duration road_0228) 9.6677)
  (static-road road_0232)
  (= (travel-duration road_0232) 18.1636)
  (static-road road_0233)
  (= (travel-duration road_0233) 3.5191)
  (static-road road_0234)
  (= (travel-duration road_0234) 51.4785)
  (static-road road_0235)
  (= (travel-duration road_0235) 22.2298)
  (static-road road_0236)
  (= (travel-duration road_0236) 19.0286)
  (static-road road_0238)
  (= (travel-duration road_0238) 20.6252)
  (static-road road_0239)
  (= (travel-duration road_0239) 14.0706)
  (static-road road_0240)
  (= (travel-duration road_0240) 2.8801)
  (static-road road_0241)
  (= (travel-duration road_0241) 7.5627)
  (static-road road_0242)
  (= (travel-duration road_0242) 4.6275)
  (static-road road_0243)
  (= (travel-duration road_0243) 3.2219)
  (static-road road_0244)
  (= (travel-duration road_0244) 11.5496)
  (static-road road_0245)
  (= (travel-duration road_0245) 1.222)
  (static-road road_0246)
  (= (travel-duration road_0246) 18.7213)
  (static-road road_0247)
  (= (travel-duration road_0247) 13.3444)
  (static-road road_0248)
  (= (travel-duration road_0248) 12.9031)
  (static-road road_0249)
  (= (travel-duration road_0249) 2.7985)
  (static-road road_0251)
  (= (travel-duration road_0251) 12.4085)
  (static-road road_0252)
  (= (travel-duration road_0252) 2.2904)
  (static-road road_0253)
  (= (travel-duration road_0253) 13.3972)
  (static-road road_0256)
  (= (travel-duration road_0256) 8.6981)
  (static-road road_0257)
  (= (travel-duration road_0257) 8.6895)
  (static-road road_0259)
  (= (travel-duration road_0259) 8.3463)
  (static-road road_0260)
  (= (travel-duration road_0260) 24.3088)
  (static-road road_0261)
  (= (travel-duration road_0261) 11.1088)
  (static-road road_0263)
  (= (travel-duration road_0263) 6.4414)
  (static-road road_0265)
  (= (travel-duration road_0265) 5.7182)
  (static-road road_0266)
  (= (travel-duration road_0266) 12.6527)
  (static-road road_0269)
  (= (travel-duration road_0269) 7.9167)
  (static-road road_0272)
  (= (travel-duration road_0272) 12.2628)
  (static-road road_0273)
  (= (travel-duration road_0273) 1.5349)
  (static-road road_0274)
  (= (travel-duration road_0274) 9.3156)
  (static-road road_0275)
  (= (travel-duration road_0275) 13.5173)
  (static-road road_0276)
  (= (travel-duration road_0276) 9.7895)
  (static-road road_0278)
  (= (travel-duration road_0278) 5.6282)
  (static-road road_0279)
  (= (travel-duration road_0279) 0.9684)
  (static-road road_0285)
  (= (travel-duration road_0285) 20.1724)
  (static-road road_0286)
  (= (travel-duration road_0286) 1.6116)
  (static-road road_0287)
  (= (travel-duration road_0287) 16.1048)
  (static-road road_0288)
  (= (travel-duration road_0288) 0.8986)
  (static-road road_0289)
  (= (travel-duration road_0289) 24.6424)
  (static-road road_0290)
  (= (travel-duration road_0290) 13.3972)
  (static-road road_0291)
  (= (travel-duration road_0291) 14.1047)
  (static-road road_0292)
  (= (travel-duration road_0292) 8.3005)
  (static-road road_0293)
  (= (travel-duration road_0293) 21.1532)
  (static-road road_0294)
  (= (travel-duration road_0294) 21.8615)
  (static-road road_0295)
  (= (travel-duration road_0295) 5.9954)
  (static-road road_0297)
  (= (travel-duration road_0297) 47.5774)
  (static-road road_0298)
  (= (travel-duration road_0298) 6.4414)
  (static-road road_0299)
  (= (travel-duration road_0299) 13.5607)
  (static-road road_0300)
  (= (travel-duration road_0300) 4.4642)
  (static-road road_0301)
  (= (travel-duration road_0301) 13.3327)
  (static-road road_0302)
  (= (travel-duration road_0302) 3.1105)
  (static-road road_0303)
  (= (travel-duration road_0303) 5.8051)
  (static-road road_0304)
  (= (travel-duration road_0304) 13.8468)
  (static-road road_0305)
  (= (travel-duration road_0305) 6.694)
  (static-road road_0306)
  (= (travel-duration road_0306) 4.8518)
  (static-road road_0307)
  (= (travel-duration road_0307) 4.3377)
  (static-road road_0309)
  (= (travel-duration road_0309) 7.6208)
  (static-road road_0310)
  (= (travel-duration road_0310) 23.0445)
  (static-road road_0311)
  (= (travel-duration road_0311) 6.9946)
  (static-road road_0312)
  (= (travel-duration road_0312) 4.7408)
  (static-road road_0314)
  (= (travel-duration road_0314) 6.9588)
  (static-road road_0315)
  (= (travel-duration road_0315) 17.9738)
  (static-road road_0316)
  (= (travel-duration road_0316) 44.8116)
  (static-road road_0317)
  (= (travel-duration road_0317) 2.221)
  (static-road road_0318)
  (= (travel-duration road_0318) 1.2398)
  (static-road road_0323)
  (= (travel-duration road_0323) 2.417)
  (static-road road_0324)
  (= (travel-duration road_0324) 14.2051)
  (static-road road_0325)
  (= (travel-duration road_0325) 29.2637)
  (static-road road_0327)
  (= (travel-duration road_0327) 10.6108)
  (static-road road_0328)
  (= (travel-duration road_0328) 1.716)
  (static-road road_0329)
  (= (travel-duration road_0329) 7.3877)
  (static-road road_0330)
  (= (travel-duration road_0330) 21.27)
  (static-road road_0331)
  (= (travel-duration road_0331) 1.0181)
  (static-road road_0333)
  (= (travel-duration road_0333) 6.1303)
  (static-road road_0334)
  (= (travel-duration road_0334) 5.1614)
  (static-road road_0335)
  (= (travel-duration road_0335) 10.6108)
  (static-road road_0336)
  (= (travel-duration road_0336) 14.2077)
  (static-road road_0337)
  (= (travel-duration road_0337) 1.5688)
  (static-road road_0338)
  (= (travel-duration road_0338) 13.2017)
  (static-road road_0340)
  (= (travel-duration road_0340) 7.1546)
  (static-road road_0341)
  (= (travel-duration road_0341) 9.6034)
  (static-road road_0342)
  (= (travel-duration road_0342) 9.1669)
  (static-road road_0344)
  (= (travel-duration road_0344) 13.2977)
  (static-road road_0345)
  (= (travel-duration road_0345) 2.1889)
  (static-road road_0346)
  (= (travel-duration road_0346) 9.6697)
  (static-road road_0352)
  (= (travel-duration road_0352) 3.3028)
  (static-road road_0354)
  (= (travel-duration road_0354) 10.5195)
  (static-road road_0360)
  (= (travel-duration road_0360) 8.3787)
  (static-road road_0361)
  (= (travel-duration road_0361) 3.6733)
  (static-road road_0364)
  (= (travel-duration road_0364) 1.6873)
  (static-road road_0366)
  (= (travel-duration road_0366) 9.0563)
  (static-road road_0368)
  (= (travel-duration road_0368) 7.3382)
  (static-road road_0369)
  (= (travel-duration road_0369) 12.0956)
  (static-road road_0370)
  (= (travel-duration road_0370) 13.86)
  (static-road road_0371)
  (= (travel-duration road_0371) 1.6674)
  (static-road road_0373)
  (= (travel-duration road_0373) 5.4963)
  (static-road road_0374)
  (= (travel-duration road_0374) 3.0601)
  (static-road road_0375)
  (= (travel-duration road_0375) 18.2473)
  (static-road road_0376)
  (= (travel-duration road_0376) 20.1722)
  (static-road road_0380)
  (= (travel-duration road_0380) 1.0571)
  (static-road road_0383)
  (= (travel-duration road_0383) 6.3965)
  (static-road road_0385)
  (= (travel-duration road_0385) 16.2138)
  (static-road road_0386)
  (= (travel-duration road_0386) 6.5167)
  (static-road road_0387)
  (= (travel-duration road_0387) 7.1571)
  (static-road road_0390)
  (= (travel-duration road_0390) 1.9079)
  (static-road road_0391)
  (= (travel-duration road_0391) 0.9667)
  (static-road road_0392)
  (= (travel-duration road_0392) 2.1851)
  (static-road road_0396)
  (= (travel-duration road_0396) 9.7336)
  (static-road road_0397)
  (= (travel-duration road_0397) 22.5321)
  (static-road road_0398)
  (= (travel-duration road_0398) 7.3938)
  (static-road road_0400)
  (= (travel-duration road_0400) 11.5913)
  (static-road road_0401)
  (= (travel-duration road_0401) 2.1997)
  (static-road road_0402)
  (= (travel-duration road_0402) 19.028)
  (static-road road_0403)
  (= (travel-duration road_0403) 19.9794)
  (static-road road_0404)
  (= (travel-duration road_0404) 3.0228)
  (static-road road_0406)
  (= (travel-duration road_0406) 1.0343)
  (static-road road_0407)
  (= (travel-duration road_0407) 2.8628)
  (static-road road_0408)
  (= (travel-duration road_0408) 8.8342)
  (static-road road_0410)
  (= (travel-duration road_0410) 5.5782)
  (static-road road_0411)
  (= (travel-duration road_0411) 11.4554)
  (static-road road_0419)
  (= (travel-duration road_0419) 11.1795)
  (static-road road_0422)
  (= (travel-duration road_0422) 16.004)
  (static-road road_0424)
  (= (travel-duration road_0424) 11.5458)
  (static-road road_0426)
  (= (travel-duration road_0426) 4.3142)
  (static-road road_0430)
  (= (travel-duration road_0430) 10.0944)
  (static-road road_0431)
  (= (travel-duration road_0431) 17.1694)
  (static-road road_0432)
  (= (travel-duration road_0432) 10.9801)
  (static-road road_0435)
  (= (travel-duration road_0435) 19.5815)
  (static-road road_0438)
  (= (travel-duration road_0438) 23.9876)
  (static-road road_0439)
  (= (travel-duration road_0439) 1.2386)
  (static-road road_0441)
  (= (travel-duration road_0441) 3.2933)
  (static-road road_0442)
  (= (travel-duration road_0442) 1.0545)
  (static-road road_0443)
  (= (travel-duration road_0443) 20.6252)
  (static-road road_0444)
  (= (travel-duration road_0444) 3.2933)
  (static-road road_0445)
  (= (travel-duration road_0445) 4.937)
  (static-road road_0448)
  (= (travel-duration road_0448) 2.5721)
  (static-road road_0449)
  (= (travel-duration road_0449) 7.961)
  (static-road road_0450)
  (= (travel-duration road_0450) 4.9526)
  (static-road road_0451)
  (= (travel-duration road_0451) 11.2616)
  (static-road road_0452)
  (= (travel-duration road_0452) 7.444)
  (static-road road_0453)
  (= (travel-duration road_0453) 16.3233)
  (static-road road_0454)
  (= (travel-duration road_0454) 7.4521)
  (static-road road_0455)
  (= (travel-duration road_0455) 10.8592)
  (static-road road_0456)
  (= (travel-duration road_0456) 3.8786)
  (static-road road_0457)
  (= (travel-duration road_0457) 19.2712)
  (static-road road_0459)
  (= (travel-duration road_0459) 7.6515)
  (static-road road_0460)
  (= (travel-duration road_0460) 1.6192)
  (static-road road_0461)
  (= (travel-duration road_0461) 0.8906)
  (static-road road_0462)
  (= (travel-duration road_0462) 4.7056)
  (static-road road_0464)
  (= (travel-duration road_0464) 12.7378)
  (static-road road_0465)
  (= (travel-duration road_0465) 91.6019)
  (static-road road_0466)
  (= (travel-duration road_0466) 6.8611)
  (static-road road_0467)
  (= (travel-duration road_0467) 1.2585)
  (static-road road_0468)
  (= (travel-duration road_0468) 0.9967)
  (static-road road_0470)
  (= (travel-duration road_0470) 10.7932)
  (static-road road_0472)
  (= (travel-duration road_0472) 8.2251)
  (static-road road_0473)
  (= (travel-duration road_0473) 3.9278)
  (static-road road_0474)
  (= (travel-duration road_0474) 0.344)
  (static-road road_0475)
  (= (travel-duration road_0475) 26.4182)
  (static-road road_0476)
  (= (travel-duration road_0476) 3.1105)
  (static-road road_0479)
  (= (travel-duration road_0479) 1.8951)
  (static-road road_0480)
  (= (travel-duration road_0480) 2.0406)
  (static-road road_0481)
  (= (travel-duration road_0481) 1.9721)
  (static-road road_0482)
  (= (travel-duration road_0482) 3.1969)
  (static-road road_0483)
  (= (travel-duration road_0483) 2.7985)
  (static-road road_0484)
  (= (travel-duration road_0484) 13.6908)
  (static-road road_0485)
  (= (travel-duration road_0485) 0.3218)
  (static-road road_0486)
  (= (travel-duration road_0486) 9.6694)
  (static-road road_0488)
  (= (travel-duration road_0488) 12.1603)
  (static-road road_0489)
  (= (travel-duration road_0489) 13.4624)
  (static-road road_0493)
  (= (travel-duration road_0493) 5.0944)
  (static-road road_0494)
  (= (travel-duration road_0494) 2.825)
  (static-road road_0495)
  (= (travel-duration road_0495) 6.0854)
  (static-road road_0499)
  (= (travel-duration road_0499) 1.175)
  (static-road road_0500)
  (= (travel-duration road_0500) 14.8164)
  (static-road road_0501)
  (= (travel-duration road_0501) 6.1072)
  (static-road road_0502)
  (= (travel-duration road_0502) 1.237)
  (static-road road_0503)
  (= (travel-duration road_0503) 2.6905)
  (dynamic-road macro_0003)
  (= (travel-duration-window macro_0003 tw_00000) 13.4393)
  (= (travel-duration-window macro_0003 tw_00030) 14.1113)
  (= (travel-duration-window macro_0003 tw_00060) 14.7833)
  (= (travel-duration-window macro_0003 tw_00090) 14.1113)
  (= (travel-duration-window macro_0003 tw_00120) 13.4393)
  (dynamic-road macro_0011)
  (= (travel-duration-window macro_0011 tw_00000) 20.5098)
  (= (travel-duration-window macro_0011 tw_00030) 19.5332)
  (= (travel-duration-window macro_0011 tw_00060) 22.4632)
  (= (travel-duration-window macro_0011 tw_00090) 19.5332)
  (= (travel-duration-window macro_0011 tw_00120) 19.5332)
  (dynamic-road macro_0017)
  (= (travel-duration-window macro_0017 tw_00000) 43.8007)
  (= (travel-duration-window macro_0017 tw_00030) 39.8188)
  (= (travel-duration-window macro_0017 tw_00060) 41.8097)
  (= (travel-duration-window macro_0017 tw_00090) 39.8188)
  (= (travel-duration-window macro_0017 tw_00120) 39.8188)
  (dynamic-road macro_0019)
  (= (travel-duration-window macro_0019 tw_00000) 13.8942)
  (= (travel-duration-window macro_0019 tw_00030) 14.5889)
  (= (travel-duration-window macro_0019 tw_00060) 15.2836)
  (= (travel-duration-window macro_0019 tw_00090) 13.8942)
  (= (travel-duration-window macro_0019 tw_00120) 13.8942)
  (dynamic-road macro_0030)
  (= (travel-duration-window macro_0030 tw_00000) 16.6115)
  (= (travel-duration-window macro_0030 tw_00030) 15.1014)
  (= (travel-duration-window macro_0030 tw_00060) 15.1014)
  (= (travel-duration-window macro_0030 tw_00090) 15.1014)
  (= (travel-duration-window macro_0030 tw_00120) 15.1014)
  (dynamic-road macro_0033)
  (= (travel-duration-window macro_0033 tw_00000) 31.8717)
  (= (travel-duration-window macro_0033 tw_00030) 34.9071)
  (= (travel-duration-window macro_0033 tw_00060) 34.9071)
  (= (travel-duration-window macro_0033 tw_00090) 30.354)
  (= (travel-duration-window macro_0033 tw_00120) 30.354)
  (dynamic-road macro_0034)
  (= (travel-duration-window macro_0034 tw_00000) 1.8813)
  (= (travel-duration-window macro_0034 tw_00030) 1.9708)
  (= (travel-duration-window macro_0034 tw_00060) 2.0604)
  (= (travel-duration-window macro_0034 tw_00090) 1.8813)
  (= (travel-duration-window macro_0034 tw_00120) 1.7917)
  (dynamic-road road_0003)
  (= (travel-duration-window road_0003 tw_00000) 7.4139)
  (= (travel-duration-window road_0003 tw_00030) 8.1553)
  (= (travel-duration-window road_0003 tw_00060) 7.4139)
  (= (travel-duration-window road_0003 tw_00090) 7.4139)
  (= (travel-duration-window road_0003 tw_00120) 7.4139)
  (dynamic-road road_0004)
  (= (travel-duration-window road_0004 tw_00000) 22.8892)
  (= (travel-duration-window road_0004 tw_00030) 23.5558)
  (= (travel-duration-window road_0004 tw_00060) 24.667)
  (= (travel-duration-window road_0004 tw_00090) 22.2225)
  (= (travel-duration-window road_0004 tw_00120) 22.2225)
  (dynamic-road road_0012)
  (= (travel-duration-window road_0012 tw_00000) 13.2916)
  (= (travel-duration-window road_0012 tw_00030) 12.0833)
  (= (travel-duration-window road_0012 tw_00060) 12.0833)
  (= (travel-duration-window road_0012 tw_00090) 12.0833)
  (= (travel-duration-window road_0012 tw_00120) 12.0833)
  (dynamic-road road_0015)
  (= (travel-duration-window road_0015 tw_00000) 8.794)
  (= (travel-duration-window road_0015 tw_00030) 11.4321)
  (= (travel-duration-window road_0015 tw_00060) 9.6733)
  (= (travel-duration-window road_0015 tw_00090) 8.794)
  (= (travel-duration-window road_0015 tw_00120) 8.794)
  (dynamic-road road_0019)
  (= (travel-duration-window road_0019 tw_00000) 21.1712)
  (= (travel-duration-window road_0019 tw_00030) 22.2298)
  (= (travel-duration-window road_0019 tw_00060) 24.3469)
  (= (travel-duration-window road_0019 tw_00090) 21.1712)
  (= (travel-duration-window road_0019 tw_00120) 21.1712)
  (dynamic-road road_0022)
  (= (travel-duration-window road_0022 tw_00000) 2.2982)
  (= (travel-duration-window road_0022 tw_00030) 2.0893)
  (= (travel-duration-window road_0022 tw_00060) 2.0893)
  (= (travel-duration-window road_0022 tw_00090) 2.0893)
  (= (travel-duration-window road_0022 tw_00120) 2.0893)
  (dynamic-road road_0026)
  (= (travel-duration-window road_0026 tw_00000) 1.9345)
  (= (travel-duration-window road_0026 tw_00030) 2.0312)
  (= (travel-duration-window road_0026 tw_00060) 2.2246)
  (= (travel-duration-window road_0026 tw_00090) 2.1279)
  (= (travel-duration-window road_0026 tw_00120) 1.9345)
  (dynamic-road road_0027)
  (= (travel-duration-window road_0027 tw_00000) 0.748)
  (= (travel-duration-window road_0027 tw_00030) 0.8044)
  (= (travel-duration-window road_0027 tw_00060) 0.7056)
  (= (travel-duration-window road_0027 tw_00090) 0.7268)
  (= (travel-duration-window road_0027 tw_00120) 0.7056)
  (dynamic-road road_0028)
  (= (travel-duration-window road_0028 tw_00000) 6.247)
  (= (travel-duration-window road_0028 tw_00030) 6.5417)
  (= (travel-duration-window road_0028 tw_00060) 6.247)
  (= (travel-duration-window road_0028 tw_00090) 5.8934)
  (= (travel-duration-window road_0028 tw_00120) 5.8934)
  (dynamic-road road_0031)
  (= (travel-duration-window road_0031 tw_00000) 1.0451)
  (= (travel-duration-window road_0031 tw_00030) 1.0931)
  (= (travel-duration-window road_0031 tw_00060) 1.0164)
  (= (travel-duration-window road_0031 tw_00090) 0.9876)
  (= (travel-duration-window road_0031 tw_00120) 0.9588)
  (dynamic-road road_0033)
  (= (travel-duration-window road_0033 tw_00000) 16.7707)
  (= (travel-duration-window road_0033 tw_00030) 17.6092)
  (= (travel-duration-window road_0033 tw_00060) 18.4477)
  (= (travel-duration-window road_0033 tw_00090) 16.7707)
  (= (travel-duration-window road_0033 tw_00120) 16.7707)
  (dynamic-road road_0037)
  (= (travel-duration-window road_0037 tw_00000) 8.7072)
  (= (travel-duration-window road_0037 tw_00030) 9.1179)
  (= (travel-duration-window road_0037 tw_00060) 8.9536)
  (= (travel-duration-window road_0037 tw_00090) 8.4608)
  (= (travel-duration-window road_0037 tw_00120) 8.2143)
  (dynamic-road road_0038)
  (= (travel-duration-window road_0038 tw_00000) 45.9989)
  (= (travel-duration-window road_0038 tw_00030) 48.1893)
  (= (travel-duration-window road_0038 tw_00060) 48.1893)
  (= (travel-duration-window road_0038 tw_00090) 43.8085)
  (= (travel-duration-window road_0038 tw_00120) 43.8085)
  (dynamic-road road_0047)
  (= (travel-duration-window road_0047 tw_00000) 8.3463)
  (= (travel-duration-window road_0047 tw_00030) 9.181)
  (= (travel-duration-window road_0047 tw_00060) 8.7637)
  (= (travel-duration-window road_0047 tw_00090) 8.3463)
  (= (travel-duration-window road_0047 tw_00120) 8.3463)
  (dynamic-road road_0049)
  (= (travel-duration-window road_0049 tw_00000) 4.574)
  (= (travel-duration-window road_0049 tw_00030) 4.574)
  (= (travel-duration-window road_0049 tw_00060) 4.3661)
  (= (travel-duration-window road_0049 tw_00090) 4.1582)
  (= (travel-duration-window road_0049 tw_00120) 4.1582)
  (dynamic-road road_0051)
  (= (travel-duration-window road_0051 tw_00000) 9.045)
  (= (travel-duration-window road_0051 tw_00030) 9.045)
  (= (travel-duration-window road_0051 tw_00060) 8.6339)
  (= (travel-duration-window road_0051 tw_00090) 8.2227)
  (= (travel-duration-window road_0051 tw_00120) 8.2227)
  (dynamic-road road_0066)
  (= (travel-duration-window road_0066 tw_00000) 8.2899)
  (= (travel-duration-window road_0066 tw_00030) 9.1189)
  (= (travel-duration-window road_0066 tw_00060) 8.7044)
  (= (travel-duration-window road_0066 tw_00090) 8.2899)
  (= (travel-duration-window road_0066 tw_00120) 8.2899)
  (dynamic-road road_0071)
  (= (travel-duration-window road_0071 tw_00000) 11.3285)
  (= (travel-duration-window road_0071 tw_00030) 13.0277)
  (= (travel-duration-window road_0071 tw_00060) 11.8949)
  (= (travel-duration-window road_0071 tw_00090) 11.3285)
  (= (travel-duration-window road_0071 tw_00120) 11.3285)
  (dynamic-road road_0077)
  (= (travel-duration-window road_0077 tw_00000) 4.6646)
  (= (travel-duration-window road_0077 tw_00030) 4.8978)
  (= (travel-duration-window road_0077 tw_00060) 5.131)
  (= (travel-duration-window road_0077 tw_00090) 4.6646)
  (= (travel-duration-window road_0077 tw_00120) 4.6646)
  (dynamic-road road_0082)
  (= (travel-duration-window road_0082 tw_00000) 8.0787)
  (= (travel-duration-window road_0082 tw_00030) 8.8866)
  (= (travel-duration-window road_0082 tw_00060) 8.0787)
  (= (travel-duration-window road_0082 tw_00090) 8.0787)
  (= (travel-duration-window road_0082 tw_00120) 8.0787)
  (dynamic-road road_0086)
  (= (travel-duration-window road_0086 tw_00000) 6.4647)
  (= (travel-duration-window road_0086 tw_00030) 7.1111)
  (= (travel-duration-window road_0086 tw_00060) 6.4647)
  (= (travel-duration-window road_0086 tw_00090) 6.4647)
  (= (travel-duration-window road_0086 tw_00120) 6.4647)
  (dynamic-road road_0090)
  (= (travel-duration-window road_0090 tw_00000) 11.9689)
  (= (travel-duration-window road_0090 tw_00030) 11.4249)
  (= (travel-duration-window road_0090 tw_00060) 10.8808)
  (= (travel-duration-window road_0090 tw_00090) 10.8808)
  (= (travel-duration-window road_0090 tw_00120) 10.8808)
  (dynamic-road road_0095)
  (= (travel-duration-window road_0095 tw_00000) 26.4037)
  (= (travel-duration-window road_0095 tw_00030) 26.4037)
  (= (travel-duration-window road_0095 tw_00060) 24.0034)
  (= (travel-duration-window road_0095 tw_00090) 24.0034)
  (= (travel-duration-window road_0095 tw_00120) 24.0034)
  (dynamic-road road_0096)
  (= (travel-duration-window road_0096 tw_00000) 4.361)
  (= (travel-duration-window road_0096 tw_00030) 4.4918)
  (= (travel-duration-window road_0096 tw_00060) 5.2332)
  (= (travel-duration-window road_0096 tw_00090) 4.361)
  (= (travel-duration-window road_0096 tw_00120) 4.361)
  (dynamic-road road_0104)
  (= (travel-duration-window road_0104 tw_00000) 24.0949)
  (= (travel-duration-window road_0104 tw_00030) 24.0949)
  (= (travel-duration-window road_0104 tw_00060) 24.0949)
  (= (travel-duration-window road_0104 tw_00090) 21.9045)
  (= (travel-duration-window road_0104 tw_00120) 21.9045)
  (dynamic-road road_0107)
  (= (travel-duration-window road_0107 tw_00000) 8.7952)
  (= (travel-duration-window road_0107 tw_00030) 9.059)
  (= (travel-duration-window road_0107 tw_00060) 10.0265)
  (= (travel-duration-window road_0107 tw_00090) 9.5867)
  (= (travel-duration-window road_0107 tw_00120) 8.7952)
  (dynamic-road road_0109)
  (= (travel-duration-window road_0109 tw_00000) 3.8522)
  (= (travel-duration-window road_0109 tw_00030) 4.0448)
  (= (travel-duration-window road_0109 tw_00060) 4.0448)
  (= (travel-duration-window road_0109 tw_00090) 4.8152)
  (= (travel-duration-window road_0109 tw_00120) 3.8522)
  (dynamic-road road_0110)
  (= (travel-duration-window road_0110 tw_00000) 6.1814)
  (= (travel-duration-window road_0110 tw_00030) 6.1814)
  (= (travel-duration-window road_0110 tw_00060) 7.1087)
  (= (travel-duration-window road_0110 tw_00090) 7.1087)
  (= (travel-duration-window road_0110 tw_00120) 6.1814)
  (dynamic-road road_0111)
  (= (travel-duration-window road_0111 tw_00000) 9.5872)
  (= (travel-duration-window road_0111 tw_00030) 10.0665)
  (= (travel-duration-window road_0111 tw_00060) 9.5872)
  (= (travel-duration-window road_0111 tw_00090) 10.5459)
  (= (travel-duration-window road_0111 tw_00120) 9.5872)
  (dynamic-road road_0117)
  (= (travel-duration-window road_0117 tw_00000) 5.9774)
  (= (travel-duration-window road_0117 tw_00030) 6.2763)
  (= (travel-duration-window road_0117 tw_00060) 7.4718)
  (= (travel-duration-window road_0117 tw_00090) 6.2763)
  (= (travel-duration-window road_0117 tw_00120) 5.9774)
  (dynamic-road road_0124)
  (= (travel-duration-window road_0124 tw_00000) 4.2878)
  (= (travel-duration-window road_0124 tw_00030) 4.545)
  (= (travel-duration-window road_0124 tw_00060) 4.8881)
  (= (travel-duration-window road_0124 tw_00090) 4.4164)
  (= (travel-duration-window road_0124 tw_00120) 4.2878)
  (dynamic-road road_0125)
  (= (travel-duration-window road_0125 tw_00000) 17.9839)
  (= (travel-duration-window road_0125 tw_00030) 20.6815)
  (= (travel-duration-window road_0125 tw_00060) 18.8831)
  (= (travel-duration-window road_0125 tw_00090) 18.8831)
  (= (travel-duration-window road_0125 tw_00120) 17.9839)
  (dynamic-road road_0128)
  (= (travel-duration-window road_0128 tw_00000) 16.9468)
  (= (travel-duration-window road_0128 tw_00030) 16.1765)
  (= (travel-duration-window road_0128 tw_00060) 15.4062)
  (= (travel-duration-window road_0128 tw_00090) 15.4062)
  (= (travel-duration-window road_0128 tw_00120) 15.4062)
  (dynamic-road road_0132)
  (= (travel-duration-window road_0132 tw_00000) 18.3553)
  (= (travel-duration-window road_0132 tw_00030) 16.6867)
  (= (travel-duration-window road_0132 tw_00060) 17.521)
  (= (travel-duration-window road_0132 tw_00090) 16.6867)
  (= (travel-duration-window road_0132 tw_00120) 16.6867)
  (dynamic-road road_0134)
  (= (travel-duration-window road_0134 tw_00000) 8.1339)
  (= (travel-duration-window road_0134 tw_00030) 8.5406)
  (= (travel-duration-window road_0134 tw_00060) 8.9473)
  (= (travel-duration-window road_0134 tw_00090) 8.1339)
  (= (travel-duration-window road_0134 tw_00120) 8.1339)
  (dynamic-road road_0138)
  (= (travel-duration-window road_0138 tw_00000) 2.3377)
  (= (travel-duration-window road_0138 tw_00030) 2.6883)
  (= (travel-duration-window road_0138 tw_00060) 2.3377)
  (= (travel-duration-window road_0138 tw_00090) 2.3377)
  (= (travel-duration-window road_0138 tw_00120) 2.3377)
  (dynamic-road road_0139)
  (= (travel-duration-window road_0139 tw_00000) 8.9039)
  (= (travel-duration-window road_0139 tw_00030) 7.4199)
  (= (travel-duration-window road_0139 tw_00060) 7.4199)
  (= (travel-duration-window road_0139 tw_00090) 7.4199)
  (= (travel-duration-window road_0139 tw_00120) 7.4199)
  (dynamic-road road_0140)
  (= (travel-duration-window road_0140 tw_00000) 24.5002)
  (= (travel-duration-window road_0140 tw_00030) 26.9502)
  (= (travel-duration-window road_0140 tw_00060) 24.5002)
  (= (travel-duration-window road_0140 tw_00090) 24.5002)
  (= (travel-duration-window road_0140 tw_00120) 24.5002)
  (dynamic-road road_0157)
  (= (travel-duration-window road_0157 tw_00000) 34.0176)
  (= (travel-duration-window road_0157 tw_00030) 35.6375)
  (= (travel-duration-window road_0157 tw_00060) 32.3977)
  (= (travel-duration-window road_0157 tw_00090) 32.3977)
  (= (travel-duration-window road_0157 tw_00120) 32.3977)
  (dynamic-road road_0163)
  (= (travel-duration-window road_0163 tw_00000) 13.4624)
  (= (travel-duration-window road_0163 tw_00030) 16.0266)
  (= (travel-duration-window road_0163 tw_00060) 12.8213)
  (= (travel-duration-window road_0163 tw_00090) 13.4624)
  (= (travel-duration-window road_0163 tw_00120) 12.8213)
  (dynamic-road road_0164)
  (= (travel-duration-window road_0164 tw_00000) 8.4219)
  (= (travel-duration-window road_0164 tw_00030) 8.0391)
  (= (travel-duration-window road_0164 tw_00060) 7.6563)
  (= (travel-duration-window road_0164 tw_00090) 7.6563)
  (= (travel-duration-window road_0164 tw_00120) 7.6563)
  (dynamic-road road_0165)
  (= (travel-duration-window road_0165 tw_00000) 8.0391)
  (= (travel-duration-window road_0165 tw_00030) 9.1876)
  (= (travel-duration-window road_0165 tw_00060) 7.6563)
  (= (travel-duration-window road_0165 tw_00090) 8.0391)
  (= (travel-duration-window road_0165 tw_00120) 7.6563)
  (dynamic-road road_0167)
  (= (travel-duration-window road_0167 tw_00000) 0.9362)
  (= (travel-duration-window road_0167 tw_00030) 1.0254)
  (= (travel-duration-window road_0167 tw_00060) 0.8916)
  (= (travel-duration-window road_0167 tw_00090) 0.8916)
  (= (travel-duration-window road_0167 tw_00120) 0.8916)
  (dynamic-road road_0169)
  (= (travel-duration-window road_0169 tw_00000) 6.9039)
  (= (travel-duration-window road_0169 tw_00030) 7.2491)
  (= (travel-duration-window road_0169 tw_00060) 7.5943)
  (= (travel-duration-window road_0169 tw_00090) 6.9039)
  (= (travel-duration-window road_0169 tw_00120) 6.9039)
  (dynamic-road road_0171)
  (= (travel-duration-window road_0171 tw_00000) 10.4987)
  (= (travel-duration-window road_0171 tw_00030) 9.9988)
  (= (travel-duration-window road_0171 tw_00060) 10.9987)
  (= (travel-duration-window road_0171 tw_00090) 9.9988)
  (= (travel-duration-window road_0171 tw_00120) 9.9988)
  (dynamic-road road_0181)
  (= (travel-duration-window road_0181 tw_00000) 7.8399)
  (= (travel-duration-window road_0181 tw_00030) 8.6239)
  (= (travel-duration-window road_0181 tw_00060) 8.2319)
  (= (travel-duration-window road_0181 tw_00090) 7.8399)
  (= (travel-duration-window road_0181 tw_00120) 7.8399)
  (dynamic-road road_0188)
  (= (travel-duration-window road_0188 tw_00000) 3.1513)
  (= (travel-duration-window road_0188 tw_00030) 3.3089)
  (= (travel-duration-window road_0188 tw_00060) 3.4665)
  (= (travel-duration-window road_0188 tw_00090) 3.1513)
  (= (travel-duration-window road_0188 tw_00120) 3.1513)
  (dynamic-road road_0194)
  (= (travel-duration-window road_0194 tw_00000) 2.1997)
  (= (travel-duration-window road_0194 tw_00030) 2.1997)
  (= (travel-duration-window road_0194 tw_00060) 2.1997)
  (= (travel-duration-window road_0194 tw_00090) 2.5296)
  (= (travel-duration-window road_0194 tw_00120) 2.1997)
  (dynamic-road road_0195)
  (= (travel-duration-window road_0195 tw_00000) 4.4318)
  (= (travel-duration-window road_0195 tw_00030) 4.875)
  (= (travel-duration-window road_0195 tw_00060) 5.0965)
  (= (travel-duration-window road_0195 tw_00090) 4.6534)
  (= (travel-duration-window road_0195 tw_00120) 4.4318)
  (dynamic-road road_0196)
  (= (travel-duration-window road_0196 tw_00000) 9.9148)
  (= (travel-duration-window road_0196 tw_00030) 10.4105)
  (= (travel-duration-window road_0196 tw_00060) 10.4105)
  (= (travel-duration-window road_0196 tw_00090) 11.8978)
  (= (travel-duration-window road_0196 tw_00120) 9.9148)
  (dynamic-road road_0197)
  (= (travel-duration-window road_0197 tw_00000) 13.8289)
  (= (travel-duration-window road_0197 tw_00030) 13.2003)
  (= (travel-duration-window road_0197 tw_00060) 13.2003)
  (= (travel-duration-window road_0197 tw_00090) 12.5717)
  (= (travel-duration-window road_0197 tw_00120) 12.5717)
  (dynamic-road road_0201)
  (= (travel-duration-window road_0201 tw_00000) 0.1607)
  (= (travel-duration-window road_0201 tw_00030) 0.1607)
  (= (travel-duration-window road_0201 tw_00060) 0.1732)
  (= (travel-duration-window road_0201 tw_00090) 0.156)
  (= (travel-duration-window road_0201 tw_00120) 0.156)
  (dynamic-road road_0206)
  (= (travel-duration-window road_0206 tw_00000) 6.175)
  (= (travel-duration-window road_0206 tw_00030) 5.9177)
  (= (travel-duration-window road_0206 tw_00060) 5.1458)
  (= (travel-duration-window road_0206 tw_00090) 5.1458)
  (= (travel-duration-window road_0206 tw_00120) 5.1458)
  (dynamic-road road_0208)
  (= (travel-duration-window road_0208 tw_00000) 16.5137)
  (= (travel-duration-window road_0208 tw_00030) 15.7958)
  (= (travel-duration-window road_0208 tw_00060) 14.3598)
  (= (travel-duration-window road_0208 tw_00090) 14.3598)
  (= (travel-duration-window road_0208 tw_00120) 14.3598)
  (dynamic-road road_0209)
  (= (travel-duration-window road_0209 tw_00000) 5.9345)
  (= (travel-duration-window road_0209 tw_00030) 5.1927)
  (= (travel-duration-window road_0209 tw_00060) 4.9454)
  (= (travel-duration-window road_0209 tw_00090) 4.9454)
  (= (travel-duration-window road_0209 tw_00120) 4.9454)
  (dynamic-road road_0211)
  (= (travel-duration-window road_0211 tw_00000) 20.6517)
  (= (travel-duration-window road_0211 tw_00030) 21.6259)
  (= (travel-duration-window road_0211 tw_00060) 19.4828)
  (= (travel-duration-window road_0211 tw_00090) 19.4828)
  (= (travel-duration-window road_0211 tw_00120) 19.4828)
  (dynamic-road road_0213)
  (= (travel-duration-window road_0213 tw_00000) 1.2781)
  (= (travel-duration-window road_0213 tw_00030) 1.4059)
  (= (travel-duration-window road_0213 tw_00060) 1.2781)
  (= (travel-duration-window road_0213 tw_00090) 1.4059)
  (= (travel-duration-window road_0213 tw_00120) 1.2781)
  (dynamic-road road_0237)
  (= (travel-duration-window road_0237 tw_00000) 5.2346)
  (= (travel-duration-window road_0237 tw_00030) 5.4963)
  (= (travel-duration-window road_0237 tw_00060) 5.2346)
  (= (travel-duration-window road_0237 tw_00090) 6.0198)
  (= (travel-duration-window road_0237 tw_00120) 5.2346)
  (dynamic-road road_0250)
  (= (travel-duration-window road_0250 tw_00000) 13.1055)
  (= (travel-duration-window road_0250 tw_00030) 13.1055)
  (= (travel-duration-window road_0250 tw_00060) 12.5098)
  (= (travel-duration-window road_0250 tw_00090) 13.1055)
  (= (travel-duration-window road_0250 tw_00120) 11.9141)
  (dynamic-road road_0254)
  (= (travel-duration-window road_0254 tw_00000) 19.9772)
  (= (travel-duration-window road_0254 tw_00030) 22.9738)
  (= (travel-duration-window road_0254 tw_00060) 20.9761)
  (= (travel-duration-window road_0254 tw_00090) 19.9772)
  (= (travel-duration-window road_0254 tw_00120) 19.9772)
  (dynamic-road road_0255)
  (= (travel-duration-window road_0255 tw_00000) 7.5627)
  (= (travel-duration-window road_0255 tw_00030) 8.319)
  (= (travel-duration-window road_0255 tw_00060) 8.6971)
  (= (travel-duration-window road_0255 tw_00090) 7.5627)
  (= (travel-duration-window road_0255 tw_00120) 7.5627)
  (dynamic-road road_0258)
  (= (travel-duration-window road_0258 tw_00000) 7.9167)
  (= (travel-duration-window road_0258 tw_00030) 8.3126)
  (= (travel-duration-window road_0258 tw_00060) 8.7084)
  (= (travel-duration-window road_0258 tw_00090) 7.9167)
  (= (travel-duration-window road_0258 tw_00120) 7.9167)
  (dynamic-road road_0262)
  (= (travel-duration-window road_0262 tw_00000) 6.3768)
  (= (travel-duration-window road_0262 tw_00030) 6.6776)
  (= (travel-duration-window road_0262 tw_00060) 6.1963)
  (= (travel-duration-window road_0262 tw_00090) 6.1963)
  (= (travel-duration-window road_0262 tw_00120) 6.0158)
  (dynamic-road road_0264)
  (= (travel-duration-window road_0264 tw_00000) 3.2533)
  (= (travel-duration-window road_0264 tw_00030) 3.5787)
  (= (travel-duration-window road_0264 tw_00060) 3.2533)
  (= (travel-duration-window road_0264 tw_00090) 3.2533)
  (= (travel-duration-window road_0264 tw_00120) 3.2533)
  (dynamic-road road_0270)
  (= (travel-duration-window road_0270 tw_00000) 2.3286)
  (= (travel-duration-window road_0270 tw_00030) 2.3286)
  (= (travel-duration-window road_0270 tw_00060) 2.2227)
  (= (travel-duration-window road_0270 tw_00090) 2.1169)
  (= (travel-duration-window road_0270 tw_00120) 2.1169)
  (dynamic-road road_0277)
  (= (travel-duration-window road_0277 tw_00000) 14.5574)
  (= (travel-duration-window road_0277 tw_00030) 16.637)
  (= (travel-duration-window road_0277 tw_00060) 13.8642)
  (= (travel-duration-window road_0277 tw_00090) 13.8642)
  (= (travel-duration-window road_0277 tw_00120) 13.8642)
  (dynamic-road road_0280)
  (= (travel-duration-window road_0280 tw_00000) 8.5383)
  (= (travel-duration-window road_0280 tw_00030) 8.7945)
  (= (travel-duration-window road_0280 tw_00060) 9.9899)
  (= (travel-duration-window road_0280 tw_00090) 8.5383)
  (= (travel-duration-window road_0280 tw_00120) 8.5383)
  (dynamic-road road_0281)
  (= (travel-duration-window road_0281 tw_00000) 14.3874)
  (= (travel-duration-window road_0281 tw_00030) 15.8261)
  (= (travel-duration-window road_0281 tw_00060) 15.8261)
  (= (travel-duration-window road_0281 tw_00090) 14.3874)
  (= (travel-duration-window road_0281 tw_00120) 14.3874)
  (dynamic-road road_0282)
  (= (travel-duration-window road_0282 tw_00000) 5.9918)
  (= (travel-duration-window road_0282 tw_00030) 5.9918)
  (= (travel-duration-window road_0282 tw_00060) 6.591)
  (= (travel-duration-window road_0282 tw_00090) 5.9918)
  (= (travel-duration-window road_0282 tw_00120) 5.9918)
  (dynamic-road road_0283)
  (= (travel-duration-window road_0283 tw_00000) 5.7084)
  (= (travel-duration-window road_0283 tw_00030) 4.757)
  (= (travel-duration-window road_0283 tw_00060) 4.9948)
  (= (travel-duration-window road_0283 tw_00090) 4.757)
  (= (travel-duration-window road_0283 tw_00120) 4.757)
  (dynamic-road road_0313)
  (= (travel-duration-window road_0313 tw_00000) 2.3065)
  (= (travel-duration-window road_0313 tw_00030) 2.3065)
  (= (travel-duration-window road_0313 tw_00060) 2.6525)
  (= (travel-duration-window road_0313 tw_00090) 2.4218)
  (= (travel-duration-window road_0313 tw_00120) 2.3065)
  (dynamic-road road_0321)
  (= (travel-duration-window road_0321 tw_00000) 5.273)
  (= (travel-duration-window road_0321 tw_00030) 5.273)
  (= (travel-duration-window road_0321 tw_00060) 5.8003)
  (= (travel-duration-window road_0321 tw_00090) 5.8003)
  (= (travel-duration-window road_0321 tw_00120) 5.273)
  (dynamic-road road_0332)
  (= (travel-duration-window road_0332 tw_00000) 6.3708)
  (= (travel-duration-window road_0332 tw_00030) 6.0674)
  (= (travel-duration-window road_0332 tw_00060) 6.9776)
  (= (travel-duration-window road_0332 tw_00090) 6.0674)
  (= (travel-duration-window road_0332 tw_00120) 6.0674)
  (dynamic-road road_0339)
  (= (travel-duration-window road_0339 tw_00000) 12.1432)
  (= (travel-duration-window road_0339 tw_00030) 11.0392)
  (= (travel-duration-window road_0339 tw_00060) 11.0392)
  (= (travel-duration-window road_0339 tw_00090) 11.0392)
  (= (travel-duration-window road_0339 tw_00120) 11.0392)
  (dynamic-road road_0347)
  (= (travel-duration-window road_0347 tw_00000) 3.1526)
  (= (travel-duration-window road_0347 tw_00030) 3.603)
  (= (travel-duration-window road_0347 tw_00060) 3.1526)
  (= (travel-duration-window road_0347 tw_00090) 3.1526)
  (= (travel-duration-window road_0347 tw_00120) 3.0025)
  (dynamic-road road_0348)
  (= (travel-duration-window road_0348 tw_00000) 0.8916)
  (= (travel-duration-window road_0348 tw_00030) 0.9808)
  (= (travel-duration-window road_0348 tw_00060) 0.9362)
  (= (travel-duration-window road_0348 tw_00090) 0.8916)
  (= (travel-duration-window road_0348 tw_00120) 0.8916)
  (dynamic-road road_0349)
  (= (travel-duration-window road_0349 tw_00000) 2.7325)
  (= (travel-duration-window road_0349 tw_00030) 2.9809)
  (= (travel-duration-window road_0349 tw_00060) 2.4841)
  (= (travel-duration-window road_0349 tw_00090) 2.7325)
  (= (travel-duration-window road_0349 tw_00120) 2.4841)
  (dynamic-road road_0350)
  (= (travel-duration-window road_0350 tw_00000) 1.2456)
  (= (travel-duration-window road_0350 tw_00030) 1.1418)
  (= (travel-duration-window road_0350 tw_00060) 1.1418)
  (= (travel-duration-window road_0350 tw_00090) 1.038)
  (= (travel-duration-window road_0350 tw_00120) 1.038)
  (dynamic-road road_0351)
  (= (travel-duration-window road_0351 tw_00000) 43.245)
  (= (travel-duration-window road_0351 tw_00030) 40.1479)
  (= (travel-duration-window road_0351 tw_00060) 40.1479)
  (= (travel-duration-window road_0351 tw_00090) 37.0508)
  (= (travel-duration-window road_0351 tw_00120) 37.0508)
  (dynamic-road road_0353)
  (= (travel-duration-window road_0353 tw_00000) 1.0899)
  (= (travel-duration-window road_0353 tw_00030) 1.2456)
  (= (travel-duration-window road_0353 tw_00060) 1.038)
  (= (travel-duration-window road_0353 tw_00090) 1.1418)
  (= (travel-duration-window road_0353 tw_00120) 1.038)
  (dynamic-road road_0355)
  (= (travel-duration-window road_0355 tw_00000) 2.1267)
  (= (travel-duration-window road_0355 tw_00030) 1.8493)
  (= (travel-duration-window road_0355 tw_00060) 1.8493)
  (= (travel-duration-window road_0355 tw_00090) 1.8493)
  (= (travel-duration-window road_0355 tw_00120) 1.8493)
  (dynamic-road road_0356)
  (= (travel-duration-window road_0356 tw_00000) 1.6809)
  (= (travel-duration-window road_0356 tw_00030) 1.761)
  (= (travel-duration-window road_0356 tw_00060) 1.6009)
  (= (travel-duration-window road_0356 tw_00090) 1.6809)
  (= (travel-duration-window road_0356 tw_00120) 1.6009)
  (dynamic-road road_0357)
  (= (travel-duration-window road_0357 tw_00000) 25.943)
  (= (travel-duration-window road_0357 tw_00030) 25.943)
  (= (travel-duration-window road_0357 tw_00060) 23.3783)
  (= (travel-duration-window road_0357 tw_00090) 23.3783)
  (= (travel-duration-window road_0357 tw_00120) 23.3783)
  (dynamic-road road_0358)
  (= (travel-duration-window road_0358 tw_00000) 2.9809)
  (= (travel-duration-window road_0358 tw_00030) 2.6083)
  (= (travel-duration-window road_0358 tw_00060) 2.4841)
  (= (travel-duration-window road_0358 tw_00090) 2.4841)
  (= (travel-duration-window road_0358 tw_00120) 2.4841)
  (dynamic-road road_0359)
  (= (travel-duration-window road_0359 tw_00000) 1.9417)
  (= (travel-duration-window road_0359 tw_00030) 2.0342)
  (= (travel-duration-window road_0359 tw_00060) 1.8493)
  (= (travel-duration-window road_0359 tw_00090) 1.9417)
  (= (travel-duration-window road_0359 tw_00120) 1.8493)
  (dynamic-road road_0367)
  (= (travel-duration-window road_0367 tw_00000) 2.7217)
  (= (travel-duration-window road_0367 tw_00030) 3.0211)
  (= (travel-duration-window road_0367 tw_00060) 2.9667)
  (= (travel-duration-window road_0367 tw_00090) 2.8034)
  (= (travel-duration-window road_0367 tw_00120) 2.7217)
  (dynamic-road road_0372)
  (= (travel-duration-window road_0372 tw_00000) 12.6685)
  (= (travel-duration-window road_0372 tw_00030) 13.8202)
  (= (travel-duration-window road_0372 tw_00060) 12.0927)
  (= (travel-duration-window road_0372 tw_00090) 12.0927)
  (= (travel-duration-window road_0372 tw_00120) 11.5169)
  (dynamic-road road_0377)
  (= (travel-duration-window road_0377 tw_00000) 7.3095)
  (= (travel-duration-window road_0377 tw_00030) 8.0404)
  (= (travel-duration-window road_0377 tw_00060) 8.0404)
  (= (travel-duration-window road_0377 tw_00090) 7.3095)
  (= (travel-duration-window road_0377 tw_00120) 7.3095)
  (dynamic-road road_0379)
  (= (travel-duration-window road_0379 tw_00000) 3.4752)
  (= (travel-duration-window road_0379 tw_00030) 3.6407)
  (= (travel-duration-window road_0379 tw_00060) 3.3097)
  (= (travel-duration-window road_0379 tw_00090) 3.3097)
  (= (travel-duration-window road_0379 tw_00120) 3.3097)
  (dynamic-road road_0381)
  (= (travel-duration-window road_0381 tw_00000) 7.5139)
  (= (travel-duration-window road_0381 tw_00030) 8.0976)
  (= (travel-duration-window road_0381 tw_00060) 7.7328)
  (= (travel-duration-window road_0381 tw_00090) 7.5139)
  (= (travel-duration-window road_0381 tw_00120) 7.2951)
  (dynamic-road road_0382)
  (= (travel-duration-window road_0382 tw_00000) 6.8316)
  (= (travel-duration-window road_0382 tw_00030) 7.5612)
  (= (travel-duration-window road_0382 tw_00060) 6.6327)
  (= (travel-duration-window road_0382 tw_00090) 6.6327)
  (= (travel-duration-window road_0382 tw_00120) 6.6327)
  (dynamic-road road_0384)
  (= (travel-duration-window road_0384 tw_00000) 1.1029)
  (= (travel-duration-window road_0384 tw_00030) 1.0533)
  (= (travel-duration-window road_0384 tw_00060) 1.0831)
  (= (travel-duration-window road_0384 tw_00090) 0.9936)
  (= (travel-duration-window road_0384 tw_00120) 0.9936)
  (dynamic-road road_0388)
  (= (travel-duration-window road_0388 tw_00000) 6.1048)
  (= (travel-duration-window road_0388 tw_00030) 6.579)
  (= (travel-duration-window road_0388 tw_00060) 5.927)
  (= (travel-duration-window road_0388 tw_00090) 5.927)
  (= (travel-duration-window road_0388 tw_00120) 5.927)
  (dynamic-road road_0393)
  (= (travel-duration-window road_0393 tw_00000) 17.2999)
  (= (travel-duration-window road_0393 tw_00030) 19.0299)
  (= (travel-duration-window road_0393 tw_00060) 17.2999)
  (= (travel-duration-window road_0393 tw_00090) 17.2999)
  (= (travel-duration-window road_0393 tw_00120) 17.2999)
  (dynamic-road road_0395)
  (= (travel-duration-window road_0395 tw_00000) 18.4938)
  (= (travel-duration-window road_0395 tw_00030) 19.5711)
  (= (travel-duration-window road_0395 tw_00060) 19.9302)
  (= (travel-duration-window road_0395 tw_00090) 17.9551)
  (= (travel-duration-window road_0395 tw_00120) 17.9551)
  (dynamic-road road_0405)
  (= (travel-duration-window road_0405 tw_00000) 105.3422)
  (= (travel-duration-window road_0405 tw_00030) 91.6019)
  (= (travel-duration-window road_0405 tw_00060) 91.6019)
  (= (travel-duration-window road_0405 tw_00090) 91.6019)
  (= (travel-duration-window road_0405 tw_00120) 91.6019)
  (dynamic-road road_0409)
  (= (travel-duration-window road_0409 tw_00000) 3.285)
  (= (travel-duration-window road_0409 tw_00030) 3.1285)
  (= (travel-duration-window road_0409 tw_00060) 3.5978)
  (= (travel-duration-window road_0409 tw_00090) 3.285)
  (= (travel-duration-window road_0409 tw_00120) 3.1285)
  (dynamic-road road_0412)
  (= (travel-duration-window road_0412 tw_00000) 34.1643)
  (= (travel-duration-window road_0412 tw_00030) 36.9587)
  (= (travel-duration-window road_0412 tw_00060) 38.356)
  (= (travel-duration-window road_0412 tw_00090) 34.1643)
  (= (travel-duration-window road_0412 tw_00120) 34.1643)
  (dynamic-road road_0414)
  (= (travel-duration-window road_0414 tw_00000) 10.414)
  (= (travel-duration-window road_0414 tw_00030) 11.9761)
  (= (travel-duration-window road_0414 tw_00060) 10.9347)
  (= (travel-duration-window road_0414 tw_00090) 10.414)
  (= (travel-duration-window road_0414 tw_00120) 10.414)
  (dynamic-road road_0415)
  (= (travel-duration-window road_0415 tw_00000) 6.9375)
  (= (travel-duration-window road_0415 tw_00030) 6.9375)
  (= (travel-duration-window road_0415 tw_00060) 8.6718)
  (= (travel-duration-window road_0415 tw_00090) 6.9375)
  (= (travel-duration-window road_0415 tw_00120) 6.9375)
  (dynamic-road road_0416)
  (= (travel-duration-window road_0416 tw_00000) 1.6669)
  (= (travel-duration-window road_0416 tw_00030) 1.8336)
  (= (travel-duration-window road_0416 tw_00060) 1.7502)
  (= (travel-duration-window road_0416 tw_00090) 1.6669)
  (= (travel-duration-window road_0416 tw_00120) 1.6669)
  (dynamic-road road_0417)
  (= (travel-duration-window road_0417 tw_00000) 1.1416)
  (= (travel-duration-window road_0417 tw_00030) 1.0872)
  (= (travel-duration-window road_0417 tw_00060) 1.2503)
  (= (travel-duration-window road_0417 tw_00090) 1.0872)
  (= (travel-duration-window road_0417 tw_00120) 1.0872)
  (dynamic-road road_0420)
  (= (travel-duration-window road_0420 tw_00000) 1.7977)
  (= (travel-duration-window road_0420 tw_00030) 1.9774)
  (= (travel-duration-window road_0420 tw_00060) 1.9774)
  (= (travel-duration-window road_0420 tw_00090) 1.7977)
  (= (travel-duration-window road_0420 tw_00120) 1.7977)
  (dynamic-road road_0423)
  (= (travel-duration-window road_0423 tw_00000) 1.9721)
  (= (travel-duration-window road_0423 tw_00030) 1.9721)
  (= (travel-duration-window road_0423 tw_00060) 2.2679)
  (= (travel-duration-window road_0423 tw_00090) 2.0707)
  (= (travel-duration-window road_0423 tw_00120) 1.9721)
  (dynamic-road road_0425)
  (= (travel-duration-window road_0425 tw_00000) 2.0761)
  (= (travel-duration-window road_0425 tw_00030) 2.0761)
  (= (travel-duration-window road_0425 tw_00060) 2.3045)
  (= (travel-duration-window road_0425 tw_00090) 2.2629)
  (= (travel-duration-window road_0425 tw_00120) 2.0761)
  (dynamic-road road_0433)
  (= (travel-duration-window road_0433 tw_00000) 19.2728)
  (= (travel-duration-window road_0433 tw_00030) 19.2728)
  (= (travel-duration-window road_0433 tw_00060) 22.1637)
  (= (travel-duration-window road_0433 tw_00090) 19.2728)
  (= (travel-duration-window road_0433 tw_00120) 19.2728)
  (dynamic-road road_0437)
  (= (travel-duration-window road_0437 tw_00000) 1.1796)
  (= (travel-duration-window road_0437 tw_00030) 1.1796)
  (= (travel-duration-window road_0437 tw_00060) 1.1796)
  (= (travel-duration-window road_0437 tw_00090) 1.4156)
  (= (travel-duration-window road_0437 tw_00120) 1.1796)
  (dynamic-road road_0440)
  (= (travel-duration-window road_0440 tw_00000) 1.0668)
  (= (travel-duration-window road_0440 tw_00030) 1.0668)
  (= (travel-duration-window road_0440 tw_00060) 1.0668)
  (= (travel-duration-window road_0440 tw_00090) 1.1842)
  (= (travel-duration-window road_0440 tw_00120) 1.0668)
  (dynamic-road road_0446)
  (= (travel-duration-window road_0446 tw_00000) 3.2829)
  (= (travel-duration-window road_0446 tw_00030) 3.1873)
  (= (travel-duration-window road_0446 tw_00060) 3.5379)
  (= (travel-duration-window road_0446 tw_00090) 3.1873)
  (= (travel-duration-window road_0446 tw_00120) 3.1873)
  (dynamic-road road_0447)
  (= (travel-duration-window road_0447 tw_00000) 7.1967)
  (= (travel-duration-window road_0447 tw_00030) 7.5565)
  (= (travel-duration-window road_0447 tw_00060) 7.1967)
  (= (travel-duration-window road_0447 tw_00090) 7.9164)
  (= (travel-duration-window road_0447 tw_00120) 7.1967)
  (dynamic-road road_0458)
  (= (travel-duration-window road_0458 tw_00000) 7.6515)
  (= (travel-duration-window road_0458 tw_00030) 7.6515)
  (= (travel-duration-window road_0458 tw_00060) 8.7992)
  (= (travel-duration-window road_0458 tw_00090) 8.7992)
  (= (travel-duration-window road_0458 tw_00120) 7.6515)
  (dynamic-road road_0463)
  (= (travel-duration-window road_0463 tw_00000) 2.2213)
  (= (travel-duration-window road_0463 tw_00030) 2.5545)
  (= (travel-duration-window road_0463 tw_00060) 2.4434)
  (= (travel-duration-window road_0463 tw_00090) 2.2213)
  (= (travel-duration-window road_0463 tw_00120) 2.2213)
  (dynamic-road road_0478)
  (= (travel-duration-window road_0478 tw_00000) 32.4337)
  (= (travel-duration-window road_0478 tw_00030) 29.4852)
  (= (travel-duration-window road_0478 tw_00060) 29.4852)
  (= (travel-duration-window road_0478 tw_00090) 29.4852)
  (= (travel-duration-window road_0478 tw_00120) 29.4852)
  (dynamic-road road_0487)
  (= (travel-duration-window road_0487 tw_00000) 17.1241)
  (= (travel-duration-window road_0487 tw_00030) 16.3087)
  (= (travel-duration-window road_0487 tw_00060) 17.9395)
  (= (travel-duration-window road_0487 tw_00090) 16.3087)
  (= (travel-duration-window road_0487 tw_00120) 16.3087)
  (dynamic-road road_0490)
  (= (travel-duration-window road_0490 tw_00000) 0.8556)
  (= (travel-duration-window road_0490 tw_00030) 0.9412)
  (= (travel-duration-window road_0490 tw_00060) 1.0695)
  (= (travel-duration-window road_0490 tw_00090) 0.8984)
  (= (travel-duration-window road_0490 tw_00120) 0.8556)
  (dynamic-road road_0496)
  (= (travel-duration-window road_0496 tw_00000) 1.0068)
  (= (travel-duration-window road_0496 tw_00030) 1.1075)
  (= (travel-duration-window road_0496 tw_00060) 1.0068)
  (= (travel-duration-window road_0496 tw_00090) 1.0068)
  (= (travel-duration-window road_0496 tw_00120) 1.0068)
  (dynamic-road road_0497)
  (= (travel-duration-window road_0497 tw_00000) 8.3787)
  (= (travel-duration-window road_0497 tw_00030) 9.6355)
  (= (travel-duration-window road_0497 tw_00060) 8.3787)
  (= (travel-duration-window road_0497 tw_00090) 8.3787)
  (= (travel-duration-window road_0497 tw_00120) 8.3787)
  (dynamic-road road_0498)
  (= (travel-duration-window road_0498 tw_00000) 27.6505)
  (= (travel-duration-window road_0498 tw_00030) 30.2839)
  (= (travel-duration-window road_0498 tw_00060) 26.3339)
  (= (travel-duration-window road_0498 tw_00090) 26.3339)
  (= (travel-duration-window road_0498 tw_00120) 26.3339)
  ;; END DYNAMIC CONGESTION PROFILE
  (has-traffic-light loc_0012)
  (has-traffic-light loc_0041)
  (has-traffic-light loc_0051)
  (has-traffic-light loc_0074)
  (has-traffic-light loc_0109)
  (has-traffic-light loc_0180)
  (has-traffic-light loc_0210)
  (has-traffic-light loc_0249)
  )

  (:goal (at car1 loc_0170))

  (:metric minimize (travel-time car1))
)
