;; ============================================================
;;  PROBLEM: exp_300_nodes_06_roadabs_comp_node_comp_20260715_191416
;;  Features: tl_cong-pddl-static_llm
;;  Start: loc_0189
;;  Goal:  loc_0170
;; ============================================================

(define (problem exp_300_nodes_06_roadabs_comp_node_comp_20260715_191416)
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
    loc_0150 - loc_type_loc_0150
    loc_0151 - loc_type_loc_0151
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
    loc_0186 - loc_type_loc_0186
    loc_0187 - loc_type_loc_0187
    loc_0188 - loc_type_loc_0188
    loc_0189 - loc_type_loc_0189
    loc_0190 - loc_type_loc_0190
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
    loc_0225 - loc_type_loc_0225
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
    loc_0246 - loc_type_loc_0246
    loc_0247 - loc_type_loc_0247
    loc_0248 - loc_type_loc_0248
    loc_0249 - loc_type_loc_0249
    loc_0250 - loc_type_loc_0250
    loc_0251 - loc_type_loc_0251
    loc_0252 - loc_type_loc_0252
    loc_0253 - loc_type_loc_0253
    loc_0254 - loc_type_loc_0254
    loc_0255 - loc_type_loc_0255
    loc_0256 - loc_type_loc_0256
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
    loc_0284 - loc_type_loc_0284
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
    road_0267 - road_type_road_0267
    road_0268 - road_type_road_0268
    road_0269 - road_type_road_0269
    road_0270 - road_type_road_0270
    road_0271 - road_type_road_0271
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
    road_0284 - road_type_road_0284
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
    road_0296 - road_type_road_0296
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
    road_0308 - road_type_road_0308
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
    road_0319 - road_type_road_0319
    road_0320 - road_type_road_0320
    road_0321 - road_type_road_0321
    road_0322 - road_type_road_0322
    road_0323 - road_type_road_0323
    road_0324 - road_type_road_0324
    road_0325 - road_type_road_0325
    road_0326 - road_type_road_0326
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
    road_0343 - road_type_road_0343
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
    road_0362 - road_type_road_0362
    road_0363 - road_type_road_0363
    road_0364 - road_type_road_0364
    road_0365 - road_type_road_0365
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
    road_0378 - road_type_road_0378
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
    road_0389 - road_type_road_0389
    road_0390 - road_type_road_0390
    road_0391 - road_type_road_0391
    road_0392 - road_type_road_0392
    road_0393 - road_type_road_0393
    road_0394 - road_type_road_0394
    road_0395 - road_type_road_0395
    road_0396 - road_type_road_0396
    road_0397 - road_type_road_0397
    road_0398 - road_type_road_0398
    road_0399 - road_type_road_0399
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
    road_0413 - road_type_road_0413
    road_0414 - road_type_road_0414
    road_0415 - road_type_road_0415
    road_0416 - road_type_road_0416
    road_0417 - road_type_road_0417
    road_0418 - road_type_road_0418
    road_0419 - road_type_road_0419
    road_0420 - road_type_road_0420
    road_0421 - road_type_road_0421
    road_0422 - road_type_road_0422
    road_0423 - road_type_road_0423
    road_0424 - road_type_road_0424
    road_0425 - road_type_road_0425
    road_0426 - road_type_road_0426
    road_0427 - road_type_road_0427
    road_0428 - road_type_road_0428
    road_0429 - road_type_road_0429
    road_0430 - road_type_road_0430
    road_0431 - road_type_road_0431
    road_0432 - road_type_road_0432
    road_0433 - road_type_road_0433
    road_0434 - road_type_road_0434
    road_0435 - road_type_road_0435
    road_0436 - road_type_road_0436
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
    road_0469 - road_type_road_0469
    road_0470 - road_type_road_0470
    road_0471 - road_type_road_0471
    road_0472 - road_type_road_0472
    road_0473 - road_type_road_0473
    road_0474 - road_type_road_0474
    road_0475 - road_type_road_0475
    road_0476 - road_type_road_0476
    road_0477 - road_type_road_0477
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
    road_0491 - road_type_road_0491
    road_0492 - road_type_road_0492
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
  )

  (:init
  (at car1 loc_0189)
  (= (travel-time car1) 0)
  (connects road_0000 loc_0000 loc_0215)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.03)
  (= (travel-duration road_0000) 14.1664)
  (connects road_0001 loc_0000 loc_0050)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.03)
  (= (travel-duration road_0001) 6.959)
  (connects road_0002 loc_0000 loc_0029)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.0)
  (= (travel-duration road_0002) 10.5532)
  (connects road_0003 loc_0001 loc_0120)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.05)
  (= (travel-duration road_0003) 7.7846)
  (connects road_0004 loc_0001 loc_0056)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.03)
  (= (travel-duration road_0004) 22.8892)
  (connects road_0005 loc_0002 loc_0188)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.25)
  (= (travel-duration road_0005) 2.1196)
  (connects road_0006 loc_0004 loc_0216)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.0)
  (= (travel-duration road_0006) 91.1375)
  (connects road_0007 loc_0004 loc_0046)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.0)
  (= (travel-duration road_0007) 3.0661)
  (connects road_0008 loc_0005 loc_0085)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.0)
  (= (travel-duration road_0008) 14.1402)
  (connects road_0009 loc_0006 loc_0127)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.06)
  (= (travel-duration road_0009) 8.8306)
  (connects road_0010 loc_0007 loc_0114)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.2)
  (= (travel-duration road_0010) 5.0791)
  (connects road_0011 loc_0008 loc_0151)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.45)
  (= (travel-duration road_0011) 4.5068)
  (connects road_0012 loc_0009 loc_0157)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.2)
  (= (travel-duration road_0012) 14.4999)
  (connects road_0013 loc_0010 loc_0008)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.15)
  (= (travel-duration road_0013) 9.4189)
  (connects road_0014 loc_0010 loc_0115)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.05)
  (= (travel-duration road_0014) 14.8069)
  (connects road_0015 loc_0011 loc_0241)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.55)
  (= (travel-duration road_0015) 13.6306)
  (connects road_0016 loc_0012 loc_0163)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.06)
  (= (travel-duration road_0016) 9.7096)
  (connects road_0017 loc_0012 loc_0094)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.06)
  (= (travel-duration road_0017) 10.8366)
  (connects road_0018 loc_0012 loc_0252)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.0)
  (= (travel-duration road_0018) 6.8247)
  (connects road_0019 loc_0013 loc_0135)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.1)
  (= (travel-duration road_0019) 23.2884)
  (connects road_0020 loc_0013 loc_0017)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.0)
  (= (travel-duration road_0020) 1.9345)
  (connects road_0021 loc_0013 loc_0237)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.02)
  (= (travel-duration road_0021) 6.0118)
  (connects road_0022 loc_0014 loc_0088)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.1)
  (= (travel-duration road_0022) 2.2982)
  (connects road_0023 loc_0014 loc_0015)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.0)
  (= (travel-duration road_0023) 10.3305)
  (connects road_0024 loc_0016 loc_0186)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.15)
  (= (travel-duration road_0024) 29.0226)
  (connects road_0025 loc_0016 loc_0002)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.2)
  (= (travel-duration road_0025) 14.0924)
  (connects road_0026 loc_0017 loc_0013)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.2)
  (= (travel-duration road_0026) 2.3214)
  (connects road_0027 loc_0019 loc_0221)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.29)
  (= (travel-duration road_0027) 0.9103)
  (connects road_0028 loc_0020 loc_0222)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.34)
  (= (travel-duration road_0028) 7.8972)
  (connects road_0029 loc_0021 loc_0225)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.17)
  (= (travel-duration road_0029) 6.2101)
  (connects road_0030 loc_0021 loc_0022)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.11)
  (= (travel-duration road_0030) 5.8744)
  (connects road_0031 loc_0022 loc_0224)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.26)
  (= (travel-duration road_0031) 1.2081)
  (connects road_0032 loc_0023 loc_0254)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.05)
  (= (travel-duration road_0032) 17.7453)
  (connects road_0033 loc_0024 loc_0017)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.1)
  (= (travel-duration road_0033) 18.4477)
  (connects road_0034 loc_0024 loc_0097)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.06)
  (= (travel-duration road_0034) 18.2056)
  (connects road_0035 loc_0024 loc_0060)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.0)
  (= (travel-duration road_0035) 3.5269)
  (connects road_0036 loc_0025 loc_0147)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.06)
  (= (travel-duration road_0036) 6.3768)
  (connects road_0037 loc_0025 loc_0026)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.06)
  (= (travel-duration road_0037) 8.7072)
  (connects road_0038 loc_0026 loc_0090)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.05)
  (= (travel-duration road_0038) 45.9989)
  (connects road_0039 loc_0026 loc_0025)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.06)
  (= (travel-duration road_0039) 8.7072)
  (connects road_0040 loc_0026 loc_0273)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.03)
  (= (travel-duration road_0040) 4.7056)
  (connects road_0041 loc_0027 loc_0219)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.0)
  (= (travel-duration road_0041) 1.0872)
  (connects road_0042 loc_0027 loc_0286)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.1)
  (= (travel-duration road_0042) 0.5386)
  (connects road_0043 loc_0028 loc_0164)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.05)
  (= (travel-duration road_0043) 6.9731)
  (connects road_0044 loc_0029 loc_0107)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.0)
  (= (travel-duration road_0044) 42.9485)
  (connects road_0045 loc_0029 loc_0000)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.06)
  (= (travel-duration road_0045) 11.1864)
  (connects road_0046 loc_0030 loc_0010)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.05)
  (= (travel-duration road_0046) 11.8697)
  (connects road_0047 loc_0030 loc_0146)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.1)
  (= (travel-duration road_0047) 9.181)
  (connects road_0048 loc_0031 loc_0154)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.25)
  (= (travel-duration road_0048) 14.5866)
  (connects road_0049 loc_0031 loc_0032)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.15)
  (= (travel-duration road_0049) 4.7819)
  (connects road_0050 loc_0032 loc_0218)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.1)
  (= (travel-duration road_0050) 9.4582)
  (connects road_0051 loc_0032 loc_0030)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.05)
  (= (travel-duration road_0051) 8.6339)
  (connects road_0052 loc_0033 loc_0039)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.09)
  (= (travel-duration road_0052) 13.5423)
  (connects road_0053 loc_0034 loc_0033)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.1)
  (= (travel-duration road_0053) 40.5137)
  (connects road_0054 loc_0034 loc_0207)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.0)
  (= (travel-duration road_0054) 3.6733)
  (connects road_0055 loc_0035 loc_0036)
  (road-open road_0055)
  (= (congestion-factor road_0055) 1.0)
  (= (travel-duration road_0055) 15.369)
  (connects road_0056 loc_0035 loc_0208)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.05)
  (= (travel-duration road_0056) 5.7005)
  (connects road_0057 loc_0036 loc_0296)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.0)
  (= (travel-duration road_0057) 22.8045)
  (connects road_0058 loc_0037 loc_0223)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.2)
  (= (travel-duration road_0058) 17.5284)
  (connects road_0059 loc_0038 loc_0220)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.2)
  (= (travel-duration road_0059) 1.1967)
  (connects road_0060 loc_0038 loc_0279)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.14)
  (= (travel-duration road_0060) 12.2455)
  (connects road_0061 loc_0038 loc_0037)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.3)
  (= (travel-duration road_0061) 38.6615)
  (connects road_0062 loc_0039 loc_0044)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.2)
  (= (travel-duration road_0062) 27.5209)
  (connects road_0063 loc_0039 loc_0222)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.03)
  (= (travel-duration road_0063) 20.4739)
  (connects road_0064 loc_0040 loc_0038)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.45)
  (= (travel-duration road_0064) 12.5616)
  (connects road_0065 loc_0041 loc_0211)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.26)
  (= (travel-duration road_0065) 17.1407)
  (connects road_0066 loc_0042 loc_0043)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.2)
  (= (travel-duration road_0066) 9.9479)
  (connects road_0067 loc_0042 loc_0178)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.11)
  (= (travel-duration road_0067) 4.7408)
  (connects road_0068 loc_0042 loc_0266)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.14)
  (= (travel-duration road_0068) 8.0059)
  (connects road_0069 loc_0042 loc_0077)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.06)
  (= (travel-duration road_0069) 6.0092)
  (connects road_0070 loc_0043 loc_0177)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.15)
  (= (travel-duration road_0070) 9.8081)
  (connects road_0071 loc_0043 loc_0078)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.15)
  (= (travel-duration road_0071) 13.0277)
  (connects road_0072 loc_0043 loc_0045)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.1)
  (= (travel-duration road_0072) 5.131)
  (connects road_0073 loc_0043 loc_0042)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.1)
  (= (travel-duration road_0073) 9.1189)
  (connects road_0074 loc_0044 loc_0040)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.35)
  (= (travel-duration road_0074) 6.9598)
  (connects road_0075 loc_0045 loc_0034)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.0)
  (= (travel-duration road_0075) 23.1777)
  (connects road_0076 loc_0045 loc_0044)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.15)
  (= (travel-duration road_0076) 34.2654)
  (connects road_0077 loc_0045 loc_0043)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.05)
  (= (travel-duration road_0077) 4.8978)
  (connects road_0078 loc_0046 loc_0053)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.0)
  (= (travel-duration road_0078) 22.5765)
  (connects road_0079 loc_0046 loc_0005)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.0)
  (= (travel-duration road_0079) 4.547)
  (connects road_0080 loc_0047 loc_0049)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.0)
  (= (travel-duration road_0080) 5.0618)
  (connects road_0081 loc_0048 loc_0004)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.0)
  (= (travel-duration road_0081) 13.9002)
  (connects road_0082 loc_0049 loc_0087)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.0)
  (= (travel-duration road_0082) 8.0787)
  (connects road_0083 loc_0049 loc_0216)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.0)
  (= (travel-duration road_0083) 1.4953)
  (connects road_0084 loc_0050 loc_0029)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.0)
  (= (travel-duration road_0084) 18.8516)
  (connects road_0085 loc_0050 loc_0119)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.06)
  (= (travel-duration road_0085) 22.6578)
  (connects road_0086 loc_0051 loc_0059)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.1)
  (= (travel-duration road_0086) 7.1111)
  (connects road_0087 loc_0051 loc_0052)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.06)
  (= (travel-duration road_0087) 3.778)
  (connects road_0088 loc_0052 loc_0051)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.03)
  (= (travel-duration road_0088) 9.8511)
  (connects road_0089 loc_0052 loc_0284)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.14)
  (= (travel-duration road_0089) 15.5397)
  (connects road_0090 loc_0053 loc_0047)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.0)
  (= (travel-duration road_0090) 10.8808)
  (connects road_0091 loc_0053 loc_0072)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.0)
  (= (travel-duration road_0091) 43.839)
  (connects road_0092 loc_0054 loc_0250)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.05)
  (= (travel-duration road_0092) 4.5299)
  (connects road_0093 loc_0054 loc_0048)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.0)
  (= (travel-duration road_0093) 8.5071)
  (connects road_0094 loc_0055 loc_0116)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.03)
  (= (travel-duration road_0094) 10.1294)
  (connects road_0095 loc_0055 loc_0011)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.3)
  (= (travel-duration road_0095) 31.2044)
  (connects road_0096 loc_0056 loc_0064)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.03)
  (= (travel-duration road_0096) 4.4918)
  (connects road_0097 loc_0057 loc_0023)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.03)
  (= (travel-duration road_0097) 15.7708)
  (connects road_0098 loc_0057 loc_0256)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.0)
  (= (travel-duration road_0098) 11.3285)
  (connects road_0099 loc_0058 loc_0051)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.06)
  (= (travel-duration road_0099) 31.5905)
  (connects road_0100 loc_0059 loc_0060)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.1)
  (= (travel-duration road_0100) 42.008)
  (connects road_0101 loc_0059 loc_0061)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.0)
  (= (travel-duration road_0101) 13.9194)
  (connects road_0102 loc_0060 loc_0024)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.11)
  (= (travel-duration road_0102) 3.9149)
  (connects road_0103 loc_0060 loc_0147)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.0)
  (= (travel-duration road_0103) 10.48)
  (connects road_0104 loc_0061 loc_0025)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.05)
  (= (travel-duration road_0104) 22.9997)
  (connects road_0105 loc_0062 loc_0051)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.03)
  (= (travel-duration road_0105) 23.0966)
  (connects road_0106 loc_0063 loc_0167)
  (road-open road_0106)
  (= (congestion-factor road_0106) 1.05)
  (= (travel-duration road_0106) 6.2952)
  (connects road_0107 loc_0064 loc_0065)
  (road-open road_0107)
  (= (congestion-factor road_0107) 1.03)
  (= (travel-duration road_0107) 9.059)
  (connects road_0108 loc_0065 loc_0164)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.03)
  (= (travel-duration road_0108) 13.3283)
  (connects road_0109 loc_0065 loc_0066)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.05)
  (= (travel-duration road_0109) 4.0448)
  (connects road_0110 loc_0066 loc_0270)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.1)
  (= (travel-duration road_0110) 6.7996)
  (connects road_0111 loc_0066 loc_0056)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.0)
  (= (travel-duration road_0111) 9.5872)
  (connects road_0112 loc_0067 loc_0068)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.11)
  (= (travel-duration road_0112) 7.0625)
  (connects road_0113 loc_0068 loc_0069)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.11)
  (= (travel-duration road_0113) 5.4548)
  (connects road_0114 loc_0068 loc_0183)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.06)
  (= (travel-duration road_0114) 7.5305)
  (connects road_0115 loc_0069 loc_0068)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.0)
  (= (travel-duration road_0115) 4.9142)
  (connects road_0116 loc_0069 loc_0185)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.15)
  (= (travel-duration road_0116) 11.5897)
  (connects road_0117 loc_0070 loc_0016)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.3)
  (= (travel-duration road_0117) 7.7707)
  (connects road_0118 loc_0071 loc_0047)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.0)
  (= (travel-duration road_0118) 48.3079)
  (connects road_0119 loc_0072 loc_0071)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.0)
  (= (travel-duration road_0119) 28.926)
  (connects road_0120 loc_0073 loc_0249)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.0)
  (= (travel-duration road_0120) 16.8409)
  (connects road_0121 loc_0074 loc_0180)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.2)
  (= (travel-duration road_0121) 8.0279)
  (connects road_0122 loc_0075 loc_0228)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.17)
  (= (travel-duration road_0122) 5.1613)
  (connects road_0123 loc_0076 loc_0141)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.1)
  (= (travel-duration road_0123) 13.1055)
  (connects road_0124 loc_0077 loc_0247)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.34)
  (= (travel-duration road_0124) 5.7456)
  (connects road_0125 loc_0078 loc_0160)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.2)
  (= (travel-duration road_0125) 21.5807)
  (connects road_0126 loc_0079 loc_0161)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.0)
  (= (travel-duration road_0126) 4.757)
  (connects road_0127 loc_0079 loc_0080)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.1)
  (= (travel-duration road_0127) 17.195)
  (connects road_0128 loc_0079 loc_0296)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.05)
  (= (travel-duration road_0128) 16.1765)
  (connects road_0129 loc_0080 loc_0079)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.0)
  (= (travel-duration road_0129) 15.6318)
  (connects road_0130 loc_0081 loc_0161)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.2)
  (= (travel-duration road_0130) 21.9839)
  (connects road_0131 loc_0081 loc_0108)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.0)
  (= (travel-duration road_0131) 9.3448)
  (connects road_0132 loc_0081 loc_0126)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.05)
  (= (travel-duration road_0132) 17.521)
  (connects road_0133 loc_0082 loc_0272)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.06)
  (= (travel-duration road_0133) 18.2743)
  (connects road_0134 loc_0083 loc_0254)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.05)
  (= (travel-duration road_0134) 8.5406)
  (connects road_0135 loc_0083 loc_0082)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.05)
  (= (travel-duration road_0135) 10.9851)
  (connects road_0136 loc_0084 loc_0073)
  (road-open road_0136)
  (= (congestion-factor road_0136) 1.0)
  (= (travel-duration road_0136) 11.5661)
  (connects road_0137 loc_0085 loc_0084)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.0)
  (= (travel-duration road_0137) 97.7718)
  (connects road_0138 loc_0086 loc_0143)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.05)
  (= (travel-duration road_0138) 2.4546)
  (connects road_0139 loc_0086 loc_0122)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.1)
  (= (travel-duration road_0139) 8.1619)
  (connects road_0140 loc_0087 loc_0070)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.2)
  (= (travel-duration road_0140) 29.4002)
  (connects road_0141 loc_0088 loc_0182)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.04)
  (= (travel-duration road_0141) 6.671)
  (connects road_0142 loc_0088 loc_0278)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.0)
  (= (travel-duration road_0142) 18.7544)
  (connects road_0143 loc_0089 loc_0027)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.0)
  (= (travel-duration road_0143) 49.8704)
  (connects road_0144 loc_0089 loc_0090)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.0)
  (= (travel-duration road_0144) 14.424)
  (connects road_0145 loc_0090 loc_0025)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.0)
  (= (travel-duration road_0145) 57.7826)
  (connects road_0146 loc_0091 loc_0089)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.05)
  (= (travel-duration road_0146) 23.1582)
  (connects road_0147 loc_0091 loc_0257)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.15)
  (= (travel-duration road_0147) 26.2721)
  (connects road_0148 loc_0092 loc_0062)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.05)
  (= (travel-duration road_0148) 22.4163)
  (connects road_0149 loc_0093 loc_0282)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.1)
  (= (travel-duration road_0149) 4.3205)
  (connects road_0150 loc_0093 loc_0092)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.05)
  (= (travel-duration road_0150) 29.4854)
  (connects road_0151 loc_0094 loc_0012)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.06)
  (= (travel-duration road_0151) 17.5066)
  (connects road_0152 loc_0094 loc_0267)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.03)
  (= (travel-duration road_0152) 7.4521)
  (connects road_0153 loc_0094 loc_0093)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.15)
  (= (travel-duration road_0153) 11.9692)
  (connects road_0154 loc_0095 loc_0063)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.05)
  (= (travel-duration road_0154) 9.9657)
  (connects road_0155 loc_0096 loc_0168)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.0)
  (= (travel-duration road_0155) 47.5774)
  (connects road_0156 loc_0096 loc_0095)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.05)
  (= (travel-duration road_0156) 11.6592)
  (connects road_0157 loc_0097 loc_0096)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.0)
  (= (travel-duration road_0157) 32.3977)
  (connects road_0158 loc_0097 loc_0166)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.06)
  (= (travel-duration road_0158) 21.2598)
  (connects road_0159 loc_0097 loc_0024)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.0)
  (= (travel-duration road_0159) 17.1751)
  (connects road_0160 loc_0098 loc_0190)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.16)
  (= (travel-duration road_0160) 0.9145)
  (connects road_0161 loc_0099 loc_0226)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.05)
  (= (travel-duration road_0161) 4.0498)
  (connects road_0162 loc_0099 loc_0227)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.14)
  (= (travel-duration road_0162) 3.078)
  (connects road_0163 loc_0100 loc_0292)
  (road-open road_0163)
  (= (congestion-factor road_0163) 1.25)
  (= (travel-duration road_0163) 16.0266)
  (connects road_0164 loc_0100 loc_0101)
  (road-open road_0164)
  (= (congestion-factor road_0164) 1.3)
  (= (travel-duration road_0164) 9.9532)
  (connects road_0165 loc_0101 loc_0100)
  (road-open road_0165)
  (= (congestion-factor road_0165) 1.25)
  (= (travel-duration road_0165) 9.5704)
  (connects road_0166 loc_0101 loc_0204)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.3)
  (= (travel-duration road_0166) 2.0811)
  (connects road_0167 loc_0101 loc_0201)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.25)
  (= (travel-duration road_0167) 1.1145)
  (connects road_0168 loc_0102 loc_0193)
  (road-open road_0168)
  (= (congestion-factor road_0168) 1.1)
  (= (travel-duration road_0168) 1.1199)
  (connects road_0169 loc_0102 loc_0212)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.15)
  (= (travel-duration road_0169) 7.9395)
  (connects road_0170 loc_0102 loc_0199)
  (road-open road_0170)
  (= (congestion-factor road_0170) 1.2)
  (= (travel-duration road_0170) 15.9573)
  (connects road_0171 loc_0103 loc_0243)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.1)
  (= (travel-duration road_0171) 10.9987)
  (connects road_0172 loc_0103 loc_0195)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.1)
  (= (travel-duration road_0172) 1.6435)
  (connects road_0173 loc_0104 loc_0103)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.05)
  (= (travel-duration road_0173) 14.1919)
  (connects road_0174 loc_0104 loc_0176)
  (road-open road_0174)
  (= (congestion-factor road_0174) 1.0)
  (= (travel-duration road_0174) 2.0857)
  (connects road_0175 loc_0105 loc_0140)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.11)
  (= (travel-duration road_0175) 13.9053)
  (connects road_0176 loc_0105 loc_0106)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.0)
  (= (travel-duration road_0176) 2.1745)
  (connects road_0177 loc_0105 loc_0014)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.04)
  (= (travel-duration road_0177) 18.4735)
  (connects road_0178 loc_0106 loc_0136)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.0)
  (= (travel-duration road_0178) 2.8801)
  (connects road_0179 loc_0106 loc_0105)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.09)
  (= (travel-duration road_0179) 2.3702)
  (connects road_0180 loc_0106 loc_0137)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.02)
  (= (travel-duration road_0180) 9.4311)
  (connects road_0181 loc_0107 loc_0110)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.15)
  (= (travel-duration road_0181) 9.0159)
  (connects road_0182 loc_0107 loc_0029)
  (road-open road_0182)
  (= (congestion-factor road_0182) 1.06)
  (= (travel-duration road_0182) 45.5254)
  (connects road_0183 loc_0107 loc_0109)
  (road-open road_0183)
  (= (congestion-factor road_0183) 1.0)
  (= (travel-duration road_0183) 12.6887)
  (connects road_0184 loc_0108 loc_0238)
  (road-open road_0184)
  (= (congestion-factor road_0184) 1.05)
  (= (travel-duration road_0184) 2.8628)
  (connects road_0185 loc_0108 loc_0081)
  (road-open road_0185)
  (= (congestion-factor road_0185) 1.2)
  (= (travel-duration road_0185) 11.2137)
  (connects road_0186 loc_0109 loc_0161)
  (road-open road_0186)
  (= (congestion-factor road_0186) 1.0)
  (= (travel-duration road_0186) 13.1249)
  (connects road_0187 loc_0109 loc_0107)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.14)
  (= (travel-duration road_0187) 7.3287)
  (connects road_0188 loc_0110 loc_0217)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.15)
  (= (travel-duration road_0188) 3.624)
  (connects road_0189 loc_0111 loc_0174)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.05)
  (= (travel-duration road_0189) 0.8959)
  (connects road_0190 loc_0111 loc_0110)
  (road-open road_0190)
  (= (congestion-factor road_0190) 1.0)
  (= (travel-duration road_0190) 7.0947)
  (connects road_0191 loc_0112 loc_0283)
  (road-open road_0191)
  (= (congestion-factor road_0191) 1.05)
  (= (travel-duration road_0191) 0.344)
  (connects road_0192 loc_0113 loc_0115)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.15)
  (= (travel-duration road_0192) 7.7697)
  (connects road_0193 loc_0113 loc_0114)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.0)
  (= (travel-duration road_0193) 9.9148)
  (connects road_0194 loc_0113 loc_0234)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.0)
  (= (travel-duration road_0194) 2.1997)
  (connects road_0195 loc_0114 loc_0008)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.3)
  (= (travel-duration road_0195) 5.7613)
  (connects road_0196 loc_0114 loc_0113)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.15)
  (= (travel-duration road_0196) 11.402)
  (connects road_0197 loc_0115 loc_0011)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.3)
  (= (travel-duration road_0197) 16.3432)
  (connects road_0198 loc_0116 loc_0215)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.05)
  (= (travel-duration road_0198) 36.1112)
  (connects road_0199 loc_0116 loc_0268)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.03)
  (= (travel-duration road_0199) 11.185)
  (connects road_0200 loc_0116 loc_0055)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.03)
  (= (travel-duration road_0200) 10.1294)
  (connects road_0201 loc_0117 loc_0291)
  (road-open road_0201)
  (= (congestion-factor road_0201) 1.17)
  (= (travel-duration road_0201) 0.1825)
  (connects road_0202 loc_0117 loc_0290)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.11)
  (= (travel-duration road_0202) 0.337)
  (connects road_0203 loc_0118 loc_0210)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.23)
  (= (travel-duration road_0203) 16.3622)
  (connects road_0204 loc_0119 loc_0001)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.0)
  (= (travel-duration road_0204) 8.6967)
  (connects road_0205 loc_0119 loc_0269)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.1)
  (= (travel-duration road_0205) 4.2664)
  (connects road_0206 loc_0120 loc_0086)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.15)
  (= (travel-duration road_0206) 5.9177)
  (connects road_0207 loc_0121 loc_0120)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.1)
  (= (travel-duration road_0207) 10.6528)
  (connects road_0208 loc_0121 loc_0123)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.05)
  (= (travel-duration road_0208) 15.0778)
  (connects road_0209 loc_0122 loc_0121)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.1)
  (= (travel-duration road_0209) 5.4399)
  (connects road_0210 loc_0122 loc_0087)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.1)
  (= (travel-duration road_0210) 22.7405)
  (connects road_0211 loc_0123 loc_0001)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.06)
  (= (travel-duration road_0211) 20.6517)
  (connects road_0212 loc_0123 loc_0121)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.05)
  (= (travel-duration road_0212) 15.0778)
  (connects road_0213 loc_0124 loc_0149)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.1)
  (= (travel-duration road_0213) 1.4059)
  (connects road_0214 loc_0125 loc_0112)
  (road-open road_0214)
  (= (congestion-factor road_0214) 1.0)
  (= (travel-duration road_0214) 23.5701)
  (connects road_0215 loc_0125 loc_0171)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.0)
  (= (travel-duration road_0215) 4.4642)
  (connects road_0216 loc_0126 loc_0124)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.05)
  (= (travel-duration road_0216) 8.8519)
  (connects road_0217 loc_0126 loc_0058)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.1)
  (= (travel-duration road_0217) 12.5167)
  (connects road_0218 loc_0127 loc_0055)
  (road-open road_0218)
  (= (congestion-factor road_0218) 1.11)
  (= (travel-duration road_0218) 7.7272)
  (connects road_0219 loc_0128 loc_0288)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.0)
  (= (travel-duration road_0219) 3.1969)
  (connects road_0220 loc_0129 loc_0130)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.05)
  (= (travel-duration road_0220) 14.173)
  (connects road_0221 loc_0130 loc_0134)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.05)
  (= (travel-duration road_0221) 54.0524)
  (connects road_0222 loc_0130 loc_0129)
  (road-open road_0222)
  (= (congestion-factor road_0222) 1.15)
  (= (travel-duration road_0222) 15.5229)
  (connects road_0223 loc_0130 loc_0133)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.15)
  (= (travel-duration road_0223) 13.824)
  (connects road_0224 loc_0131 loc_0133)
  (road-open road_0224)
  (= (congestion-factor road_0224) 1.05)
  (= (travel-duration road_0224) 26.4951)
  (connects road_0225 loc_0131 loc_0133)
  (road-open road_0225)
  (= (congestion-factor road_0225) 1.1)
  (= (travel-duration road_0225) 27.7277)
  (connects road_0226 loc_0131 loc_0132)
  (road-open road_0226)
  (= (congestion-factor road_0226) 1.1)
  (= (travel-duration road_0226) 20.1796)
  (connects road_0227 loc_0132 loc_0131)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.05)
  (= (travel-duration road_0227) 19.2624)
  (connects road_0228 loc_0132 loc_0236)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.08)
  (= (travel-duration road_0228) 10.0395)
  (connects road_0229 loc_0133 loc_0131)
  (road-open road_0229)
  (= (congestion-factor road_0229) 1.0)
  (= (travel-duration road_0229) 25.2334)
  (connects road_0230 loc_0133 loc_0131)
  (road-open road_0230)
  (= (congestion-factor road_0230) 1.1)
  (= (travel-duration road_0230) 27.7277)
  (connects road_0231 loc_0133 loc_0130)
  (road-open road_0231)
  (= (congestion-factor road_0231) 1.15)
  (= (travel-duration road_0231) 13.824)
  (connects road_0232 loc_0134 loc_0135)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.05)
  (= (travel-duration road_0232) 18.1636)
  (connects road_0233 loc_0134 loc_0214)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.05)
  (= (travel-duration road_0233) 3.2131)
  (connects road_0234 loc_0134 loc_0130)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.05)
  (= (travel-duration road_0234) 54.0524)
  (connects road_0235 loc_0135 loc_0013)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.0)
  (= (travel-duration road_0235) 21.1712)
  (connects road_0236 loc_0135 loc_0134)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.05)
  (= (travel-duration road_0236) 18.1636)
  (connects road_0237 loc_0135 loc_0213)
  (road-open road_0237)
  (= (congestion-factor road_0237) 1.1)
  (= (travel-duration road_0237) 5.7581)
  (connects road_0238 loc_0136 loc_0261)
  (road-open road_0238)
  (= (congestion-factor road_0238) 1.03)
  (= (travel-duration road_0238) 21.244)
  (connects road_0239 loc_0136 loc_0138)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.0)
  (= (travel-duration road_0239) 14.0706)
  (connects road_0240 loc_0136 loc_0106)
  (road-open road_0240)
  (= (congestion-factor road_0240) 1.06)
  (= (travel-duration road_0240) 3.0529)
  (connects road_0241 loc_0136 loc_0181)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.0)
  (= (travel-duration road_0241) 7.5627)
  (connects road_0242 loc_0137 loc_0139)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.02)
  (= (travel-duration road_0242) 4.5386)
  (connects road_0243 loc_0138 loc_0137)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.25)
  (= (travel-duration road_0243) 3.8357)
  (connects road_0244 loc_0139 loc_0138)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.3)
  (= (travel-duration road_0244) 14.2995)
  (connects road_0245 loc_0139 loc_0297)
  (road-open road_0245)
  (= (congestion-factor road_0245) 1.02)
  (= (travel-duration road_0245) 1.1985)
  (connects road_0246 loc_0139 loc_0277)
  (road-open road_0246)
  (= (congestion-factor road_0246) 1.02)
  (= (travel-duration road_0246) 19.0957)
  (connects road_0247 loc_0140 loc_0274)
  (road-open road_0247)
  (= (congestion-factor road_0247) 1.05)
  (= (travel-duration road_0247) 12.7378)
  (connects road_0248 loc_0140 loc_0105)
  (road-open road_0248)
  (= (congestion-factor road_0248) 1.0)
  (= (travel-duration road_0248) 12.5273)
  (connects road_0249 loc_0140 loc_0288)
  (road-open road_0249)
  (= (congestion-factor road_0249) 1.06)
  (= (travel-duration road_0249) 2.9664)
  (connects road_0250 loc_0141 loc_0076)
  (road-open road_0250)
  (= (congestion-factor road_0250) 1.0)
  (= (travel-duration road_0250) 11.9141)
  (connects road_0251 loc_0141 loc_0192)
  (road-open road_0251)
  (= (congestion-factor road_0251) 1.35)
  (= (travel-duration road_0251) 15.2286)
  (connects road_0252 loc_0142 loc_0184)
  (road-open road_0252)
  (= (congestion-factor road_0252) 1.11)
  (= (travel-duration road_0252) 2.4683)
  (connects road_0253 loc_0142 loc_0164)
  (road-open road_0253)
  (= (congestion-factor road_0253) 1.0)
  (= (travel-duration road_0253) 12.6389)
  (connects road_0254 loc_0143 loc_0144)
  (road-open road_0254)
  (= (congestion-factor road_0254) 1.1)
  (= (travel-duration road_0254) 21.9749)
  (connects road_0255 loc_0144 loc_0070)
  (road-open road_0255)
  (= (congestion-factor road_0255) 1.1)
  (= (travel-duration road_0255) 8.319)
  (connects road_0256 loc_0145 loc_0153)
  (road-open road_0256)
  (= (congestion-factor road_0256) 1.2)
  (= (travel-duration road_0256) 9.9407)
  (connects road_0257 loc_0146 loc_0218)
  (road-open road_0257)
  (= (congestion-factor road_0257) 1.1)
  (= (travel-duration road_0257) 9.5585)
  (connects road_0258 loc_0146 loc_0152)
  (road-open road_0258)
  (= (congestion-factor road_0258) 1.05)
  (= (travel-duration road_0258) 8.3126)
  (connects road_0259 loc_0146 loc_0030)
  (road-open road_0259)
  (= (congestion-factor road_0259) 1.05)
  (= (travel-duration road_0259) 8.7637)
  (connects road_0260 loc_0147 loc_0148)
  (road-open road_0260)
  (= (congestion-factor road_0260) 1.0)
  (= (travel-duration road_0260) 22.0989)
  (connects road_0261 loc_0147 loc_0060)
  (road-open road_0261)
  (= (congestion-factor road_0261) 1.06)
  (= (travel-duration road_0261) 11.1088)
  (connects road_0262 loc_0147 loc_0025)
  (road-open road_0262)
  (= (congestion-factor road_0262) 1.0)
  (= (travel-duration road_0262) 6.0158)
  (connects road_0263 loc_0148 loc_0169)
  (road-open road_0263)
  (= (congestion-factor road_0263) 1.0)
  (= (travel-duration road_0263) 6.1346)
  (connects road_0264 loc_0148 loc_0061)
  (road-open road_0264)
  (= (congestion-factor road_0264) 1.05)
  (= (travel-duration road_0264) 3.416)
  (connects road_0265 loc_0149 loc_0172)
  (road-open road_0265)
  (= (congestion-factor road_0265) 1.1)
  (= (travel-duration road_0265) 6.2901)
  (connects road_0266 loc_0149 loc_0165)
  (road-open road_0266)
  (= (congestion-factor road_0266) 1.0)
  (= (travel-duration road_0266) 11.5025)
  (connects road_0267 loc_0150 loc_0127)
  (road-open road_0267)
  (= (congestion-factor road_0267) 1.1)
  (= (travel-duration road_0267) 8.5236)
  (connects road_0268 loc_0151 loc_0114)
  (road-open road_0268)
  (= (congestion-factor road_0268) 1.15)
  (= (travel-duration road_0268) 5.8211)
  (connects road_0269 loc_0152 loc_0146)
  (road-open road_0269)
  (= (congestion-factor road_0269) 1.0)
  (= (travel-duration road_0269) 7.9167)
  (connects road_0270 loc_0153 loc_0031)
  (road-open road_0270)
  (= (congestion-factor road_0270) 1.4)
  (= (travel-duration road_0270) 2.9636)
  (connects road_0271 loc_0154 loc_0009)
  (road-open road_0271)
  (= (congestion-factor road_0271) 1.2)
  (= (travel-duration road_0271) 10.3814)
  (connects road_0272 loc_0154 loc_0155)
  (road-open road_0272)
  (= (congestion-factor road_0272) 1.2)
  (= (travel-duration road_0272) 14.0146)
  (connects road_0273 loc_0155 loc_0162)
  (road-open road_0273)
  (= (congestion-factor road_0273) 1.05)
  (= (travel-duration road_0273) 1.6116)
  (connects road_0274 loc_0155 loc_0157)
  (road-open road_0274)
  (= (congestion-factor road_0274) 1.0)
  (= (travel-duration road_0274) 8.4687)
  (connects road_0275 loc_0155 loc_0156)
  (road-open road_0275)
  (= (congestion-factor road_0275) 1.25)
  (= (travel-duration road_0275) 15.3606)
  (connects road_0276 loc_0156 loc_0153)
  (road-open road_0276)
  (= (congestion-factor road_0276) 1.25)
  (= (travel-duration road_0276) 11.1244)
  (connects road_0277 loc_0157 loc_0295)
  (road-open road_0277)
  (= (congestion-factor road_0277) 1.2)
  (= (travel-duration road_0277) 16.637)
  (connects road_0278 loc_0158 loc_0263)
  (road-open road_0278)
  (= (congestion-factor road_0278) 1.11)
  (= (travel-duration road_0278) 5.4801)
  (connects road_0279 loc_0158 loc_0163)
  (road-open road_0279)
  (= (congestion-factor road_0279) 1.09)
  (= (travel-duration road_0279) 0.951)
  (connects road_0280 loc_0159 loc_0117)
  (road-open road_0280)
  (= (congestion-factor road_0280) 1.23)
  (= (travel-duration road_0280) 10.5022)
  (connects road_0281 loc_0160 loc_0158)
  (road-open road_0281)
  (= (congestion-factor road_0281) 1.15)
  (= (travel-duration road_0281) 16.5455)
  (connects road_0282 loc_0160 loc_0159)
  (road-open road_0282)
  (= (congestion-factor road_0282) 1.15)
  (= (travel-duration road_0282) 6.8906)
  (connects road_0283 loc_0161 loc_0079)
  (road-open road_0283)
  (= (congestion-factor road_0283) 1.15)
  (= (travel-duration road_0283) 5.4705)
  (connects road_0284 loc_0161 loc_0252)
  (road-open road_0284)
  (= (congestion-factor road_0284) 1.03)
  (= (travel-duration road_0284) 12.9995)
  (connects road_0285 loc_0161 loc_0109)
  (road-open road_0285)
  (= (congestion-factor road_0285) 1.0)
  (= (travel-duration road_0285) 19.3849)
  (connects road_0286 loc_0162 loc_0155)
  (road-open road_0286)
  (= (congestion-factor road_0286) 1.0)
  (= (travel-duration road_0286) 1.5349)
  (connects road_0287 loc_0163 loc_0012)
  (road-open road_0287)
  (= (congestion-factor road_0287) 1.0)
  (= (travel-duration road_0287) 15.83)
  (connects road_0288 loc_0163 loc_0158)
  (road-open road_0288)
  (= (congestion-factor road_0288) 1.03)
  (= (travel-duration road_0288) 0.8986)
  (connects road_0289 loc_0163 loc_0118)
  (road-open road_0289)
  (= (congestion-factor road_0289) 1.06)
  (= (travel-duration road_0289) 23.9642)
  (connects road_0290 loc_0164 loc_0142)
  (road-open road_0290)
  (= (congestion-factor road_0290) 1.09)
  (= (travel-duration road_0290) 13.7764)
  (connects road_0291 loc_0164 loc_0065)
  (road-open road_0291)
  (= (congestion-factor road_0291) 1.0)
  (= (travel-duration road_0291) 12.9401)
  (connects road_0292 loc_0165 loc_0125)
  (road-open road_0292)
  (= (congestion-factor road_0292) 1.0)
  (= (travel-duration road_0292) 7.5459)
  (connects road_0293 loc_0165 loc_0170)
  (road-open road_0293)
  (= (congestion-factor road_0293) 1.0)
  (= (travel-duration road_0293) 21.1532)
  (connects road_0294 loc_0166 loc_0097)
  (road-open road_0294)
  (= (congestion-factor road_0294) 1.03)
  (= (travel-duration road_0294) 20.6581)
  (connects road_0295 loc_0167 loc_0063)
  (road-open road_0295)
  (= (congestion-factor road_0295) 1.0)
  (= (travel-duration road_0295) 5.9954)
  (connects road_0296 loc_0167 loc_0166)
  (road-open road_0296)
  (= (congestion-factor road_0296) 1.05)
  (= (travel-duration road_0296) 13.8895)
  (connects road_0297 loc_0168 loc_0096)
  (road-open road_0297)
  (= (congestion-factor road_0297) 1.0)
  (= (travel-duration road_0297) 47.5774)
  (connects road_0298 loc_0169 loc_0148)
  (road-open road_0298)
  (= (congestion-factor road_0298) 1.05)
  (= (travel-duration road_0298) 6.4414)
  (connects road_0299 loc_0170 loc_0124)
  (road-open road_0299)
  (= (congestion-factor road_0299) 1.0)
  (= (travel-duration road_0299) 12.9149)
  (connects road_0300 loc_0171 loc_0125)
  (road-open road_0300)
  (= (congestion-factor road_0300) 1.0)
  (= (travel-duration road_0300) 4.4642)
  (connects road_0301 loc_0172 loc_0108)
  (road-open road_0301)
  (= (congestion-factor road_0301) 1.1)
  (= (travel-duration road_0301) 12.753)
  (connects road_0302 loc_0173 loc_0283)
  (road-open road_0302)
  (= (congestion-factor road_0302) 1.05)
  (= (travel-duration road_0302) 3.2661)
  (connects road_0303 loc_0173 loc_0217)
  (road-open road_0303)
  (= (congestion-factor road_0303) 1.1)
  (= (travel-duration road_0303) 6.0815)
  (connects road_0304 loc_0174 loc_0109)
  (road-open road_0304)
  (= (congestion-factor road_0304) 1.2)
  (= (travel-duration road_0304) 14.9306)
  (connects road_0305 loc_0174 loc_0294)
  (road-open road_0305)
  (= (congestion-factor road_0305) 1.0)
  (= (travel-duration road_0305) 6.0854)
  (connects road_0306 loc_0175 loc_0294)
  (road-open road_0306)
  (= (congestion-factor road_0306) 1.05)
  (= (travel-duration road_0306) 5.0944)
  (connects road_0307 loc_0176 loc_0018)
  (road-open road_0307)
  (= (congestion-factor road_0307) 1.05)
  (= (travel-duration road_0307) 4.1405)
  (connects road_0308 loc_0176 loc_0104)
  (road-open road_0308)
  (= (congestion-factor road_0308) 1.05)
  (= (travel-duration road_0308) 2.19)
  (connects road_0309 loc_0177 loc_0289)
  (road-open road_0309)
  (= (congestion-factor road_0309) 1.1)
  (= (travel-duration road_0309) 7.9837)
  (connects road_0310 loc_0177 loc_0040)
  (road-open road_0310)
  (= (congestion-factor road_0310) 1.1)
  (= (travel-duration road_0310) 25.349)
  (connects road_0311 loc_0178 loc_0289)
  (road-open road_0311)
  (= (congestion-factor road_0311) 1.17)
  (= (travel-duration road_0311) 7.3727)
  (connects road_0312 loc_0178 loc_0042)
  (road-open road_0312)
  (= (congestion-factor road_0312) 1.11)
  (= (travel-duration road_0312) 4.7408)
  (connects road_0313 loc_0179 loc_0077)
  (road-open road_0313)
  (= (congestion-factor road_0313) 1.35)
  (= (travel-duration road_0313) 3.1138)
  (connects road_0314 loc_0179 loc_0042)
  (road-open road_0314)
  (= (congestion-factor road_0314) 1.17)
  (= (travel-duration road_0314) 7.4696)
  (connects road_0315 loc_0180 loc_0202)
  (road-open road_0315)
  (= (congestion-factor road_0315) 1.25)
  (= (travel-duration road_0315) 20.4248)
  (connects road_0316 loc_0180 loc_0189)
  (road-open road_0316)
  (= (congestion-factor road_0316) 1.06)
  (= (travel-duration road_0316) 42.7931)
  (connects road_0317 loc_0183 loc_0142)
  (road-open road_0317)
  (= (congestion-factor road_0317) 1.0)
  (= (travel-duration road_0317) 2.0953)
  (connects road_0318 loc_0183 loc_0184)
  (road-open road_0318)
  (= (congestion-factor road_0318) 1.03)
  (= (travel-duration road_0318) 1.2398)
  (connects road_0319 loc_0184 loc_0067)
  (road-open road_0319)
  (= (congestion-factor road_0319) 1.14)
  (= (travel-duration road_0319) 3.5665)
  (connects road_0320 loc_0186 loc_0285)
  (road-open road_0320)
  (= (congestion-factor road_0320) 1.15)
  (= (travel-duration road_0320) 1.6423)
  (connects road_0321 loc_0187 loc_0281)
  (road-open road_0321)
  (= (congestion-factor road_0321) 1.3)
  (= (travel-duration road_0321) 6.8549)
  (connects road_0322 loc_0187 loc_0006)
  (road-open road_0322)
  (= (congestion-factor road_0322) 1.03)
  (= (travel-duration road_0322) 9.9564)
  (connects road_0323 loc_0188 loc_0262)
  (road-open road_0323)
  (= (congestion-factor road_0323) 1.1)
  (= (travel-duration road_0323) 2.417)
  (connects road_0324 loc_0188 loc_0003)
  (road-open road_0324)
  (= (congestion-factor road_0324) 1.15)
  (= (travel-duration road_0324) 14.8508)
  (connects road_0325 loc_0189 loc_0012)
  (road-open road_0325)
  (= (congestion-factor road_0325) 1.06)
  (= (travel-duration road_0325) 29.9218)
  (connects road_0326 loc_0190 loc_0099)
  (road-open road_0326)
  (= (congestion-factor road_0326) 1.16)
  (= (travel-duration road_0326) 1.0381)
  (connects road_0327 loc_0191 loc_0195)
  (road-open road_0327)
  (= (congestion-factor road_0327) 1.0)
  (= (travel-duration road_0327) 10.6108)
  (connects road_0328 loc_0192 loc_0212)
  (road-open road_0328)
  (= (congestion-factor road_0328) 1.0)
  (= (travel-duration road_0328) 1.6189)
  (connects road_0329 loc_0192 loc_0193)
  (road-open road_0329)
  (= (congestion-factor road_0329) 1.2)
  (= (travel-duration road_0329) 8.4431)
  (connects road_0330 loc_0192 loc_0075)
  (road-open road_0330)
  (= (congestion-factor road_0330) 1.2)
  (= (travel-duration road_0330) 24.0792)
  (connects road_0331 loc_0193 loc_0102)
  (road-open road_0331)
  (= (congestion-factor road_0331) 1.1)
  (= (travel-duration road_0331) 1.1199)
  (connects road_0332 loc_0193 loc_0244)
  (road-open road_0332)
  (= (congestion-factor road_0332) 1.25)
  (= (travel-duration road_0332) 7.5843)
  (connects road_0333 loc_0194 loc_0232)
  (road-open road_0333)
  (= (congestion-factor road_0333) 1.1)
  (= (travel-duration road_0333) 6.1303)
  (connects road_0334 loc_0194 loc_0233)
  (road-open road_0334)
  (= (congestion-factor road_0334) 1.1)
  (= (travel-duration road_0334) 5.6775)
  (connects road_0335 loc_0195 loc_0191)
  (road-open road_0335)
  (= (congestion-factor road_0335) 1.15)
  (= (travel-duration road_0335) 12.2024)
  (connects road_0336 loc_0195 loc_0176)
  (road-open road_0336)
  (= (congestion-factor road_0336) 1.1)
  (= (travel-duration road_0336) 14.2077)
  (connects road_0337 loc_0195 loc_0103)
  (road-open road_0337)
  (= (congestion-factor road_0337) 1.1)
  (= (travel-duration road_0337) 1.6435)
  (connects road_0338 loc_0196 loc_0103)
  (road-open road_0338)
  (= (congestion-factor road_0338) 1.05)
  (= (travel-duration road_0338) 13.8618)
  (connects road_0339 loc_0196 loc_0100)
  (road-open road_0339)
  (= (congestion-factor road_0339) 1.05)
  (= (travel-duration road_0339) 11.5912)
  (connects road_0340 loc_0197 loc_0196)
  (road-open road_0340)
  (= (congestion-factor road_0340) 1.05)
  (= (travel-duration road_0340) 7.1546)
  (connects road_0341 loc_0197 loc_0198)
  (road-open road_0341)
  (= (congestion-factor road_0341) 1.1)
  (= (travel-duration road_0341) 9.6034)
  (connects road_0342 loc_0198 loc_0197)
  (road-open road_0342)
  (= (congestion-factor road_0342) 1.0)
  (= (travel-duration road_0342) 8.7303)
  (connects road_0343 loc_0199 loc_0293)
  (road-open road_0343)
  (= (congestion-factor road_0343) 1.25)
  (= (travel-duration road_0343) 0.7455)
  (connects road_0344 loc_0199 loc_0102)
  (road-open road_0344)
  (= (congestion-factor road_0344) 1.15)
  (= (travel-duration road_0344) 15.2924)
  (connects road_0345 loc_0200 loc_0230)
  (road-open road_0345)
  (= (congestion-factor road_0345) 1.2)
  (= (travel-duration road_0345) 2.6267)
  (connects road_0346 loc_0200 loc_0041)
  (road-open road_0346)
  (= (congestion-factor road_0346) 1.09)
  (= (travel-duration road_0346) 9.6018)
  (connects road_0347 loc_0201 loc_0203)
  (road-open road_0347)
  (= (congestion-factor road_0347) 1.2)
  (= (travel-duration road_0347) 3.603)
  (connects road_0348 loc_0201 loc_0101)
  (road-open road_0348)
  (= (congestion-factor road_0348) 1.25)
  (= (travel-duration road_0348) 1.1145)
  (connects road_0349 loc_0202 loc_0205)
  (road-open road_0349)
  (= (congestion-factor road_0349) 1.05)
  (= (travel-duration road_0349) 2.6083)
  (connects road_0350 loc_0202 loc_0203)
  (road-open road_0350)
  (= (congestion-factor road_0350) 1.25)
  (= (travel-duration road_0350) 1.2976)
  (connects road_0351 loc_0203 loc_0210)
  (road-open road_0351)
  (= (congestion-factor road_0351) 1.25)
  (= (travel-duration road_0351) 44.7935)
  (connects road_0352 loc_0203 loc_0201)
  (road-open road_0352)
  (= (congestion-factor road_0352) 1.15)
  (= (travel-duration road_0352) 3.4529)
  (connects road_0353 loc_0203 loc_0202)
  (road-open road_0353)
  (= (congestion-factor road_0353) 1.0)
  (= (travel-duration road_0353) 1.038)
  (connects road_0354 loc_0204 loc_0197)
  (road-open road_0354)
  (= (congestion-factor road_0354) 1.1)
  (= (travel-duration road_0354) 10.5195)
  (connects road_0355 loc_0204 loc_0205)
  (road-open road_0355)
  (= (congestion-factor road_0355) 1.15)
  (= (travel-duration road_0355) 2.1267)
  (connects road_0356 loc_0204 loc_0101)
  (road-open road_0356)
  (= (congestion-factor road_0356) 1.0)
  (= (travel-duration road_0356) 1.6009)
  (connects road_0357 loc_0205 loc_0074)
  (road-open road_0357)
  (= (congestion-factor road_0357) 1.35)
  (= (travel-duration road_0357) 29.3627)
  (connects road_0358 loc_0205 loc_0202)
  (road-open road_0358)
  (= (congestion-factor road_0358) 1.0)
  (= (travel-duration road_0358) 2.4841)
  (connects road_0359 loc_0205 loc_0204)
  (road-open road_0359)
  (= (congestion-factor road_0359) 1.0)
  (= (travel-duration road_0359) 1.8493)
  (connects road_0360 loc_0206 loc_0295)
  (road-open road_0360)
  (= (congestion-factor road_0360) 1.0)
  (= (travel-duration road_0360) 8.3787)
  (connects road_0361 loc_0207 loc_0034)
  (road-open road_0361)
  (= (congestion-factor road_0361) 1.05)
  (= (travel-duration road_0361) 3.857)
  (connects road_0362 loc_0207 loc_0035)
  (road-open road_0362)
  (= (congestion-factor road_0362) 1.0)
  (= (travel-duration road_0362) 11.128)
  (connects road_0363 loc_0208 loc_0209)
  (road-open road_0363)
  (= (congestion-factor road_0363) 1.05)
  (= (travel-duration road_0363) 1.7716)
  (connects road_0364 loc_0209 loc_0208)
  (road-open road_0364)
  (= (congestion-factor road_0364) 1.0)
  (= (travel-duration road_0364) 1.6873)
  (connects road_0365 loc_0209 loc_0156)
  (road-open road_0365)
  (= (congestion-factor road_0365) 1.05)
  (= (travel-duration road_0365) 10.064)
  (connects road_0366 loc_0210 loc_0041)
  (road-open road_0366)
  (= (congestion-factor road_0366) 1.11)
  (= (travel-duration road_0366) 9.1142)
  (connects road_0367 loc_0210 loc_0230)
  (road-open road_0367)
  (= (congestion-factor road_0367) 1.29)
  (= (travel-duration road_0367) 3.511)
  (connects road_0368 loc_0211 loc_0293)
  (road-open road_0368)
  (= (congestion-factor road_0368) 1.15)
  (= (travel-duration road_0368) 7.6717)
  (connects road_0369 loc_0211 loc_0248)
  (road-open road_0369)
  (= (congestion-factor road_0369) 1.1)
  (= (travel-duration road_0369) 12.0956)
  (connects road_0370 loc_0211 loc_0212)
  (road-open road_0370)
  (= (congestion-factor road_0370) 1.09)
  (= (travel-duration road_0370) 13.6103)
  (connects road_0371 loc_0212 loc_0192)
  (road-open road_0371)
  (= (congestion-factor road_0371) 1.06)
  (= (travel-duration road_0371) 1.716)
  (connects road_0372 loc_0212 loc_0141)
  (road-open road_0372)
  (= (congestion-factor road_0372) 1.2)
  (= (travel-duration road_0372) 13.8202)
  (connects road_0373 loc_0213 loc_0135)
  (road-open road_0373)
  (= (congestion-factor road_0373) 1.0)
  (= (travel-duration road_0373) 5.2346)
  (connects road_0374 loc_0214 loc_0134)
  (road-open road_0374)
  (= (congestion-factor road_0374) 1.0)
  (= (travel-duration road_0374) 3.0601)
  (connects road_0375 loc_0215 loc_0054)
  (road-open road_0375)
  (= (congestion-factor road_0375) 1.06)
  (= (travel-duration road_0375) 17.7451)
  (connects road_0376 loc_0216 loc_0123)
  (road-open road_0376)
  (= (congestion-factor road_0376) 1.03)
  (= (travel-duration road_0376) 19.6013)
  (connects road_0377 loc_0217 loc_0239)
  (road-open road_0377)
  (= (congestion-factor road_0377) 1.3)
  (= (travel-duration road_0377) 9.5023)
  (connects road_0378 loc_0218 loc_0145)
  (road-open road_0378)
  (= (congestion-factor road_0378) 1.25)
  (= (travel-duration road_0378) 8.5218)
  (connects road_0379 loc_0219 loc_0253)
  (road-open road_0379)
  (= (congestion-factor road_0379) 1.1)
  (= (travel-duration road_0379) 3.6407)
  (connects road_0380 loc_0220 loc_0038)
  (road-open road_0380)
  (= (congestion-factor road_0380) 1.11)
  (= (travel-duration road_0380) 1.1069)
  (connects road_0381 loc_0220 loc_0020)
  (road-open road_0381)
  (= (congestion-factor road_0381) 1.29)
  (= (travel-duration road_0381) 9.4107)
  (connects road_0382 loc_0221 loc_0220)
  (road-open road_0382)
  (= (congestion-factor road_0382) 1.14)
  (= (travel-duration road_0382) 7.5612)
  (connects road_0383 loc_0221 loc_0020)
  (road-open road_0383)
  (= (congestion-factor road_0383) 1.11)
  (= (travel-duration road_0383) 6.3965)
  (connects road_0384 loc_0222 loc_0021)
  (road-open road_0384)
  (= (congestion-factor road_0384) 1.4)
  (= (travel-duration road_0384) 1.3911)
  (connects road_0385 loc_0223 loc_0037)
  (road-open road_0385)
  (= (congestion-factor road_0385) 1.06)
  (= (travel-duration road_0385) 15.4834)
  (connects road_0386 loc_0223 loc_0019)
  (road-open road_0386)
  (= (congestion-factor road_0386) 1.23)
  (= (travel-duration road_0386) 7.3537)
  (connects road_0387 loc_0224 loc_0223)
  (road-open road_0387)
  (= (congestion-factor road_0387) 1.14)
  (= (travel-duration road_0387) 6.7992)
  (connects road_0388 loc_0224 loc_0019)
  (road-open road_0388)
  (= (congestion-factor road_0388) 1.03)
  (= (travel-duration road_0388) 6.1048)
  (connects road_0389 loc_0225 loc_0022)
  (road-open road_0389)
  (= (congestion-factor road_0389) 1.17)
  (= (travel-duration road_0389) 5.9743)
  (connects road_0390 loc_0226 loc_0227)
  (road-open road_0390)
  (= (congestion-factor road_0390) 1.02)
  (= (travel-duration road_0390) 1.8712)
  (connects road_0391 loc_0227 loc_0228)
  (road-open road_0391)
  (= (congestion-factor road_0391) 1.04)
  (= (travel-duration road_0391) 0.9667)
  (connects road_0392 loc_0228 loc_0229)
  (road-open road_0392)
  (= (congestion-factor road_0392) 1.16)
  (= (travel-duration road_0392) 2.3043)
  (connects road_0393 loc_0229 loc_0075)
  (road-open road_0393)
  (= (congestion-factor road_0393) 1.05)
  (= (travel-duration road_0393) 18.1649)
  (connects road_0394 loc_0229 loc_0098)
  (road-open road_0394)
  (= (congestion-factor road_0394) 1.16)
  (= (travel-duration road_0394) 4.4123)
  (connects road_0395 loc_0230 loc_0179)
  (road-open road_0395)
  (= (congestion-factor road_0395) 1.4)
  (= (travel-duration road_0395) 25.1372)
  (connects road_0396 loc_0231 loc_0293)
  (road-open road_0396)
  (= (congestion-factor road_0396) 1.0)
  (= (travel-duration road_0396) 9.7336)
  (connects road_0397 loc_0231 loc_0201)
  (road-open road_0397)
  (= (congestion-factor road_0397) 1.2)
  (= (travel-duration road_0397) 27.0385)
  (connects road_0398 loc_0232 loc_0178)
  (road-open road_0398)
  (= (congestion-factor road_0398) 1.2)
  (= (travel-duration road_0398) 7.5833)
  (connects road_0399 loc_0233 loc_0076)
  (road-open road_0399)
  (= (congestion-factor road_0399) 1.0)
  (= (travel-duration road_0399) 35.7878)
  (connects road_0400 loc_0233 loc_0077)
  (road-open road_0400)
  (= (congestion-factor road_0400) 1.15)
  (= (travel-duration road_0400) 13.33)
  (connects road_0401 loc_0234 loc_0113)
  (road-open road_0401)
  (= (congestion-factor road_0401) 1.0)
  (= (travel-duration road_0401) 2.1997)
  (connects road_0402 loc_0235 loc_0236)
  (road-open road_0402)
  (= (congestion-factor road_0402) 1.05)
  (= (travel-duration road_0402) 19.9794)
  (connects road_0403 loc_0236 loc_0235)
  (road-open road_0403)
  (= (congestion-factor road_0403) 1.05)
  (= (travel-duration road_0403) 19.9794)
  (connects road_0404 loc_0236 loc_0297)
  (road-open road_0404)
  (= (congestion-factor road_0404) 1.08)
  (= (travel-duration road_0404) 3.2006)
  (connects road_0405 loc_0237 loc_0275)
  (road-open road_0405)
  (= (congestion-factor road_0405) 1.0)
  (= (travel-duration road_0405) 91.6019)
  (connects road_0406 loc_0237 loc_0276)
  (road-open road_0406)
  (= (congestion-factor road_0406) 1.02)
  (= (travel-duration road_0406) 0.9591)
  (connects road_0407 loc_0238 loc_0108)
  (road-open road_0407)
  (= (congestion-factor road_0407) 1.15)
  (= (travel-duration road_0407) 3.1355)
  (connects road_0408 loc_0238 loc_0173)
  (road-open road_0408)
  (= (congestion-factor road_0408) 1.1)
  (= (travel-duration road_0408) 9.2549)
  (connects road_0409 loc_0239 loc_0111)
  (road-open road_0409)
  (= (congestion-factor road_0409) 1.05)
  (= (travel-duration road_0409) 3.285)
  (connects road_0410 loc_0239 loc_0238)
  (road-open road_0410)
  (= (congestion-factor road_0410) 1.25)
  (= (travel-duration road_0410) 6.6408)
  (connects road_0411 loc_0240 loc_0241)
  (road-open road_0411)
  (= (congestion-factor road_0411) 1.05)
  (= (travel-duration road_0411) 10.9347)
  (connects road_0412 loc_0240 loc_0249)
  (road-open road_0412)
  (= (congestion-factor road_0412) 1.3)
  (= (travel-duration road_0412) 41.6576)
  (connects road_0413 loc_0241 loc_0007)
  (road-open road_0413)
  (= (congestion-factor road_0413) 1.45)
  (= (travel-duration road_0413) 37.8761)
  (connects road_0414 loc_0241 loc_0240)
  (road-open road_0414)
  (= (congestion-factor road_0414) 1.25)
  (= (travel-duration road_0414) 13.0175)
  (connects road_0415 loc_0242 loc_0102)
  (road-open road_0415)
  (= (congestion-factor road_0415) 1.2)
  (= (travel-duration road_0415) 8.325)
  (connects road_0416 loc_0242 loc_0244)
  (road-open road_0416)
  (= (congestion-factor road_0416) 1.15)
  (= (travel-duration road_0416) 1.9169)
  (connects road_0417 loc_0243 loc_0292)
  (road-open road_0417)
  (= (congestion-factor road_0417) 1.2)
  (= (travel-duration road_0417) 1.3047)
  (connects road_0418 loc_0244 loc_0246)
  (road-open road_0418)
  (= (congestion-factor road_0418) 1.4)
  (= (travel-duration road_0418) 2.0245)
  (connects road_0419 loc_0245 loc_0195)
  (road-open road_0419)
  (= (congestion-factor road_0419) 1.25)
  (= (travel-duration road_0419) 12.704)
  (connects road_0420 loc_0245 loc_0243)
  (road-open road_0420)
  (= (congestion-factor road_0420) 1.2)
  (= (travel-duration road_0420) 2.1572)
  (connects road_0421 loc_0246 loc_0245)
  (road-open road_0421)
  (= (congestion-factor road_0421) 1.3)
  (= (travel-duration road_0421) 0.4493)
  (connects road_0422 loc_0247 loc_0200)
  (road-open road_0422)
  (= (congestion-factor road_0422) 1.17)
  (= (travel-duration road_0422) 17.1786)
  (connects road_0423 loc_0247 loc_0287)
  (road-open road_0423)
  (= (congestion-factor road_0423) 1.35)
  (= (travel-duration road_0423) 2.6623)
  (connects road_0424 loc_0248 loc_0211)
  (road-open road_0424)
  (= (congestion-factor road_0424) 1.0)
  (= (travel-duration road_0424) 10.996)
  (connects road_0425 loc_0249 loc_0187)
  (road-open road_0425)
  (= (congestion-factor road_0425) 1.17)
  (= (travel-duration road_0425) 2.429)
  (connects road_0426 loc_0250 loc_0054)
  (road-open road_0426)
  (= (congestion-factor road_0426) 1.0)
  (= (travel-duration road_0426) 4.3142)
  (connects road_0427 loc_0250 loc_0150)
  (road-open road_0427)
  (= (congestion-factor road_0427) 1.05)
  (= (travel-duration road_0427) 7.8438)
  (connects road_0428 loc_0252 loc_0161)
  (road-open road_0428)
  (= (congestion-factor road_0428) 1.0)
  (= (travel-duration road_0428) 12.6209)
  (connects road_0429 loc_0252 loc_0012)
  (road-open road_0429)
  (= (congestion-factor road_0429) 1.03)
  (= (travel-duration road_0429) 13.6994)
  (connects road_0430 loc_0253 loc_0083)
  (road-open road_0430)
  (= (congestion-factor road_0430) 1.05)
  (= (travel-duration road_0430) 9.6356)
  (connects road_0431 loc_0253 loc_0091)
  (road-open road_0431)
  (= (congestion-factor road_0431) 1.05)
  (= (travel-duration road_0431) 17.1694)
  (connects road_0432 loc_0254 loc_0255)
  (road-open road_0432)
  (= (congestion-factor road_0432) 1.05)
  (= (travel-duration road_0432) 10.9801)
  (connects road_0433 loc_0254 loc_0257)
  (road-open road_0433)
  (= (congestion-factor road_0433) 1.05)
  (= (travel-duration road_0433) 20.2364)
  (connects road_0434 loc_0255 loc_0028)
  (road-open road_0434)
  (= (congestion-factor road_0434) 1.05)
  (= (travel-duration road_0434) 16.6906)
  (connects road_0435 loc_0255 loc_0057)
  (road-open road_0435)
  (= (congestion-factor road_0435) 1.03)
  (= (travel-duration road_0435) 19.5815)
  (connects road_0436 loc_0256 loc_0064)
  (road-open road_0436)
  (= (congestion-factor road_0436) 1.0)
  (= (travel-duration road_0436) 7.1439)
  (connects road_0437 loc_0257 loc_0259)
  (road-open road_0437)
  (= (congestion-factor road_0437) 1.15)
  (= (travel-duration road_0437) 1.3566)
  (connects road_0438 loc_0257 loc_0091)
  (road-open road_0438)
  (= (congestion-factor road_0438) 1.05)
  (= (travel-duration road_0438) 23.9876)
  (connects road_0439 loc_0259 loc_0257)
  (road-open road_0439)
  (= (congestion-factor road_0439) 1.0)
  (= (travel-duration road_0439) 1.1796)
  (connects road_0440 loc_0259 loc_0260)
  (road-open road_0440)
  (= (congestion-factor road_0440) 1.09)
  (= (travel-duration road_0440) 1.1629)
  (connects road_0441 loc_0260 loc_0261)
  (road-open road_0441)
  (= (congestion-factor road_0441) 1.06)
  (= (travel-duration road_0441) 3.2933)
  (connects road_0442 loc_0260 loc_0258)
  (road-open road_0442)
  (= (congestion-factor road_0442) 1.03)
  (= (travel-duration road_0442) 1.0247)
  (connects road_0443 loc_0261 loc_0136)
  (road-open road_0443)
  (= (congestion-factor road_0443) 1.03)
  (= (travel-duration road_0443) 21.244)
  (connects road_0444 loc_0261 loc_0258)
  (road-open road_0444)
  (= (congestion-factor road_0444) 1.06)
  (= (travel-duration road_0444) 3.2933)
  (connects road_0445 loc_0263 loc_0158)
  (road-open road_0445)
  (= (congestion-factor road_0445) 1.06)
  (= (travel-duration road_0445) 5.2332)
  (connects road_0446 loc_0263 loc_0159)
  (road-open road_0446)
  (= (congestion-factor road_0446) 1.17)
  (= (travel-duration road_0446) 3.7292)
  (connects road_0447 loc_0264 loc_0078)
  (road-open road_0447)
  (= (congestion-factor road_0447) 1.1)
  (= (travel-duration road_0447) 7.9164)
  (connects road_0448 loc_0264 loc_0266)
  (road-open road_0448)
  (= (congestion-factor road_0448) 1.06)
  (= (travel-duration road_0448) 2.5721)
  (connects road_0449 loc_0265 loc_0194)
  (road-open road_0449)
  (= (congestion-factor road_0449) 1.2)
  (= (travel-duration road_0449) 9.0983)
  (connects road_0450 loc_0265 loc_0232)
  (road-open road_0450)
  (= (congestion-factor road_0450) 1.14)
  (= (travel-duration road_0450) 5.0864)
  (connects road_0451 loc_0266 loc_0290)
  (road-open road_0451)
  (= (congestion-factor road_0451) 1.14)
  (= (travel-duration road_0451) 12.4643)
  (connects road_0452 loc_0266 loc_0042)
  (road-open road_0452)
  (= (congestion-factor road_0452) 1.06)
  (= (travel-duration road_0452) 7.444)
  (connects road_0453 loc_0267 loc_0052)
  (road-open road_0453)
  (= (congestion-factor road_0453) 1.03)
  (= (travel-duration road_0453) 16.3233)
  (connects road_0454 loc_0267 loc_0094)
  (road-open road_0454)
  (= (congestion-factor road_0454) 1.09)
  (= (travel-duration road_0454) 7.8862)
  (connects road_0455 loc_0268 loc_0116)
  (road-open road_0455)
  (= (congestion-factor road_0455) 1.03)
  (= (travel-duration road_0455) 11.185)
  (connects road_0456 loc_0269 loc_0119)
  (road-open road_0456)
  (= (congestion-factor road_0456) 1.0)
  (= (travel-duration road_0456) 3.8786)
  (connects road_0457 loc_0270 loc_0143)
  (road-open road_0457)
  (= (congestion-factor road_0457) 1.05)
  (= (travel-duration road_0457) 19.2712)
  (connects road_0458 loc_0270 loc_0271)
  (road-open road_0458)
  (= (congestion-factor road_0458) 1.0)
  (= (travel-duration road_0458) 7.6515)
  (connects road_0459 loc_0271 loc_0270)
  (road-open road_0459)
  (= (congestion-factor road_0459) 1.0)
  (= (travel-duration road_0459) 7.6515)
  (connects road_0460 loc_0272 loc_0286)
  (road-open road_0460)
  (= (congestion-factor road_0460) 1.03)
  (= (travel-duration road_0460) 1.6192)
  (connects road_0461 loc_0272 loc_0219)
  (road-open road_0461)
  (= (congestion-factor road_0461) 1.05)
  (= (travel-duration road_0461) 0.8906)
  (connects road_0462 loc_0273 loc_0026)
  (road-open road_0462)
  (= (congestion-factor road_0462) 1.03)
  (= (travel-duration road_0462) 4.7056)
  (connects road_0463 loc_0273 loc_0027)
  (road-open road_0463)
  (= (congestion-factor road_0463) 1.05)
  (= (travel-duration road_0463) 2.3324)
  (connects road_0464 loc_0274 loc_0140)
  (road-open road_0464)
  (= (congestion-factor road_0464) 1.0)
  (= (travel-duration road_0464) 12.1313)
  (connects road_0465 loc_0275 loc_0237)
  (road-open road_0465)
  (= (congestion-factor road_0465) 1.0)
  (= (travel-duration road_0465) 91.6019)
  (connects road_0466 loc_0276 loc_0132)
  (road-open road_0466)
  (= (congestion-factor road_0466) 1.02)
  (= (travel-duration road_0466) 6.6022)
  (connects road_0467 loc_0276 loc_0277)
  (road-open road_0467)
  (= (congestion-factor road_0467) 1.0)
  (= (travel-duration road_0467) 1.1873)
  (connects road_0468 loc_0277 loc_0298)
  (road-open road_0468)
  (= (congestion-factor road_0468) 1.02)
  (= (travel-duration road_0468) 0.9591)
  (connects road_0469 loc_0279 loc_0280)
  (road-open road_0469)
  (= (congestion-factor road_0469) 1.17)
  (= (travel-duration road_0469) 1.4644)
  (connects road_0470 loc_0279 loc_0038)
  (road-open road_0470)
  (= (congestion-factor road_0470) 1.14)
  (= (travel-duration road_0470) 12.3043)
  (connects road_0471 loc_0280 loc_0279)
  (road-open road_0471)
  (= (congestion-factor road_0471) 1.11)
  (= (travel-duration road_0471) 1.3893)
  (connects road_0472 loc_0280 loc_0265)
  (road-open road_0472)
  (= (congestion-factor road_0472) 1.26)
  (= (travel-duration road_0472) 9.777)
  (connects road_0473 loc_0282 loc_0093)
  (road-open road_0473)
  (= (congestion-factor road_0473) 1.0)
  (= (travel-duration road_0473) 3.9278)
  (connects road_0474 loc_0283 loc_0112)
  (road-open road_0474)
  (= (congestion-factor road_0474) 1.0)
  (= (travel-duration road_0474) 0.3276)
  (connects road_0475 loc_0283 loc_0172)
  (road-open road_0475)
  (= (congestion-factor road_0475) 1.05)
  (= (travel-duration road_0475) 25.2174)
  (connects road_0476 loc_0283 loc_0173)
  (road-open road_0476)
  (= (congestion-factor road_0476) 1.05)
  (= (travel-duration road_0476) 3.2661)
  (connects road_0477 loc_0284 loc_0267)
  (road-open road_0477)
  (= (congestion-factor road_0477) 1.11)
  (= (travel-duration road_0477) 2.6654)
  (connects road_0478 loc_0285 loc_0144)
  (road-open road_0478)
  (= (congestion-factor road_0478) 1.0)
  (= (travel-duration road_0478) 29.4852)
  (connects road_0479 loc_0285 loc_0185)
  (road-open road_0479)
  (= (congestion-factor road_0479) 1.1)
  (= (travel-duration road_0479) 1.9854)
  (connects road_0480 loc_0286 loc_0273)
  (road-open road_0480)
  (= (congestion-factor road_0480) 1.03)
  (= (travel-duration road_0480) 1.9282)
  (connects road_0481 loc_0287 loc_0247)
  (road-open road_0481)
  (= (congestion-factor road_0481) 1.05)
  (= (travel-duration road_0481) 2.0707)
  (connects road_0482 loc_0288 loc_0128)
  (road-open road_0482)
  (= (congestion-factor road_0482) 1.1)
  (= (travel-duration road_0482) 3.5166)
  (connects road_0483 loc_0288 loc_0140)
  (road-open road_0483)
  (= (congestion-factor road_0483) 1.0)
  (= (travel-duration road_0483) 2.7985)
  (connects road_0484 loc_0289 loc_0280)
  (road-open road_0484)
  (= (congestion-factor road_0484) 1.23)
  (= (travel-duration road_0484) 15.1709)
  (connects road_0485 loc_0290 loc_0117)
  (road-open road_0485)
  (= (congestion-factor road_0485) 1.06)
  (= (travel-duration road_0485) 0.3218)
  (connects road_0486 loc_0290 loc_0264)
  (road-open road_0486)
  (= (congestion-factor road_0486) 1.14)
  (= (travel-duration road_0486) 9.9307)
  (connects road_0487 loc_0291 loc_0118)
  (road-open road_0487)
  (= (congestion-factor road_0487) 1.3)
  (= (travel-duration road_0487) 21.2012)
  (connects road_0488 loc_0291 loc_0263)
  (road-open road_0488)
  (= (congestion-factor road_0488) 1.06)
  (= (travel-duration road_0488) 12.5144)
  (connects road_0489 loc_0292 loc_0100)
  (road-open road_0489)
  (= (congestion-factor road_0489) 1.15)
  (= (travel-duration road_0489) 14.7445)
  (connects road_0490 loc_0292 loc_0242)
  (road-open road_0490)
  (= (congestion-factor road_0490) 1.25)
  (= (travel-duration road_0490) 1.0695)
  (connects road_0491 loc_0293 loc_0199)
  (road-open road_0491)
  (= (congestion-factor road_0491) 1.1)
  (= (travel-duration road_0491) 0.6561)
  (connects road_0492 loc_0293 loc_0231)
  (road-open road_0492)
  (= (congestion-factor road_0492) 1.2)
  (= (travel-duration road_0492) 11.6803)
  (connects road_0493 loc_0294 loc_0175)
  (road-open road_0493)
  (= (congestion-factor road_0493) 1.0)
  (= (travel-duration road_0493) 4.8518)
  (connects road_0494 loc_0294 loc_0299)
  (road-open road_0494)
  (= (congestion-factor road_0494) 1.0)
  (= (travel-duration road_0494) 2.6905)
  (connects road_0495 loc_0294 loc_0174)
  (road-open road_0495)
  (= (congestion-factor road_0495) 1.1)
  (= (travel-duration road_0495) 6.694)
  (connects road_0496 loc_0295 loc_0251)
  (road-open road_0496)
  (= (congestion-factor road_0496) 1.15)
  (= (travel-duration road_0496) 1.1579)
  (connects road_0497 loc_0295 loc_0206)
  (road-open road_0497)
  (= (congestion-factor road_0497) 1.05)
  (= (travel-duration road_0497) 8.7977)
  (connects road_0498 loc_0296 loc_0045)
  (road-open road_0498)
  (= (congestion-factor road_0498) 1.05)
  (= (travel-duration road_0498) 27.6505)
  (connects road_0499 loc_0297 loc_0139)
  (road-open road_0499)
  (= (congestion-factor road_0499) 1.1)
  (= (travel-duration road_0499) 1.2925)
  (connects road_0500 loc_0297 loc_0105)
  (road-open road_0500)
  (= (congestion-factor road_0500) 1.04)
  (= (travel-duration road_0500) 14.8164)
  (connects road_0501 loc_0298 loc_0017)
  (road-open road_0501)
  (= (congestion-factor road_0501) 1.04)
  (= (travel-duration road_0501) 6.1072)
  (connects road_0502 loc_0298 loc_0237)
  (road-open road_0502)
  (= (congestion-factor road_0502) 1.0)
  (= (travel-duration road_0502) 1.1894)
  (connects road_0503 loc_0299 loc_0294)
  (road-open road_0503)
  (= (congestion-factor road_0503) 1.0)
  (= (travel-duration road_0503) 2.6905)
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
