;; ============================================================
;;  PROBLEM: exp_200_nodes_06_roadabs_comp_node_comp_20260715_182234
;;  Features: tl_cong-pddl-static_llm
;;  Start: loc_0071
;;  Goal:  loc_0120
;; ============================================================

(define (problem exp_200_nodes_06_roadabs_comp_node_comp_20260715_182234_dynamic)
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
  )

  (:init
  (at car1 loc_0071)
  (= (travel-time car1) 0)
  (connects road_0000 loc_0000 loc_0146)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.11)
  (= (travel-duration road_0000) 15.2667)
  (connects road_0001 loc_0000 loc_0035)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.09)
  (= (travel-duration road_0001) 7.3643)
  (connects road_0002 loc_0000 loc_0016)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.0)
  (= (travel-duration road_0002) 10.5532)
  (connects road_0003 loc_0001 loc_0084)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.1)
  (= (travel-duration road_0003) 8.1553)
  (connects road_0004 loc_0001 loc_0041)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.09)
  (= (travel-duration road_0004) 24.2225)
  (connects road_0005 loc_0002 loc_0147)
  (road-open road_0005)
  (= (congestion-factor road_0005) 1.2)
  (= (travel-duration road_0005) 109.365)
  (connects road_0006 loc_0002 loc_0032)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.06)
  (= (travel-duration road_0006) 3.2501)
  (connects road_0007 loc_0003 loc_0060)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.05)
  (= (travel-duration road_0007) 14.8472)
  (connects road_0008 loc_0004 loc_0166)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.05)
  (= (travel-duration road_0008) 9.2336)
  (connects road_0009 loc_0005 loc_0113)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.17)
  (= (travel-duration road_0009) 10.7172)
  (connects road_0010 loc_0005 loc_0067)
  (road-open road_0010)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0010)
  (= (congestion-factor road_0010) 1.0)
  (= (travel-duration road_0010) 10.2232)
  (connects road_0011 loc_0005 loc_0172)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.11)
  (= (travel-duration road_0011) 7.5754)
  (connects road_0012 loc_0006 loc_0098)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.3)
  (= (travel-duration road_0012) 27.5226)
  (connects road_0013 loc_0006 loc_0007)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.1)
  (= (travel-duration road_0013) 2.1279)
  (connects road_0014 loc_0006 loc_0163)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.08)
  (= (travel-duration road_0014) 6.3654)
  (connects road_0015 loc_0007 loc_0006)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.35)
  (= (travel-duration road_0015) 2.6115)
  (connects road_0016 loc_0008 loc_0151)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.26)
  (= (travel-duration road_0016) 0.8891)
  (connects road_0017 loc_0009 loc_0152)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.34)
  (= (travel-duration road_0017) 7.8972)
  (connects road_0018 loc_0010 loc_0155)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.14)
  (= (travel-duration road_0018) 6.0509)
  (connects road_0019 loc_0010 loc_0011)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.2)
  (= (travel-duration road_0019) 6.3507)
  (connects road_0020 loc_0011 loc_0154)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.34)
  (= (travel-duration road_0020) 1.2848)
  (connects road_0021 loc_0012 loc_0007)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.3)
  (= (travel-duration road_0021) 21.8019)
  (connects road_0022 loc_0012 loc_0070)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.29)
  (= (travel-duration road_0022) 22.1559)
  (connects road_0023 loc_0012 loc_0044)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.06)
  (= (travel-duration road_0023) 3.7386)
  (connects road_0024 loc_0013 loc_0102)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.2)
  (= (travel-duration road_0024) 7.219)
  (connects road_0025 loc_0013 loc_0014)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.11)
  (= (travel-duration road_0025) 9.1179)
  (connects road_0026 loc_0014 loc_0063)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.1)
  (= (travel-duration road_0026) 48.1893)
  (connects road_0027 loc_0014 loc_0013)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.09)
  (= (travel-duration road_0027) 8.9536)
  (connects road_0028 loc_0014 loc_0181)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.11)
  (= (travel-duration road_0028) 5.0711)
  (connects road_0029 loc_0015 loc_0149)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.1)
  (= (travel-duration road_0029) 1.196)
  (connects road_0030 loc_0015 loc_0190)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.15)
  (= (travel-duration road_0030) 0.563)
  (connects road_0031 loc_0016 loc_0074)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.03)
  (= (travel-duration road_0031) 44.237)
  (connects road_0032 loc_0016 loc_0000)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.17)
  (= (travel-duration road_0032) 12.3473)
  (connects road_0033 loc_0017 loc_0107)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.05)
  (= (travel-duration road_0033) 12.2527)
  (connects road_0034 loc_0017 loc_0018)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.25)
  (= (travel-duration road_0034) 5.1977)
  (connects road_0035 loc_0019 loc_0025)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.09)
  (= (travel-duration road_0035) 13.5423)
  (connects road_0036 loc_0020 loc_0019)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.2)
  (= (travel-duration road_0036) 44.1968)
  (connects road_0037 loc_0020 loc_0138)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.05)
  (= (travel-duration road_0037) 3.857)
  (connects road_0038 loc_0021 loc_0022)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.1)
  (= (travel-duration road_0038) 16.9059)
  (connects road_0039 loc_0021 loc_0139)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.15)
  (= (travel-duration road_0039) 6.2434)
  (connects road_0040 loc_0022 loc_0197)
  (road-open road_0040)
  (= (congestion-factor road_0040) 1.15)
  (= (travel-duration road_0040) 26.2252)
  (connects road_0041 loc_0023 loc_0153)
  (road-open road_0041)
  (= (congestion-factor road_0041) 1.09)
  (= (travel-duration road_0041) 15.9216)
  (connects road_0042 loc_0024 loc_0150)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.17)
  (= (travel-duration road_0042) 1.1668)
  (connects road_0043 loc_0024 loc_0185)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.06)
  (= (travel-duration road_0043) 11.3861)
  (connects road_0044 loc_0024 loc_0023)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.15)
  (= (travel-duration road_0044) 34.2005)
  (connects road_0045 loc_0025 loc_0030)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.05)
  (= (travel-duration road_0045) 24.0808)
  (connects road_0046 loc_0025 loc_0152)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.06)
  (= (travel-duration road_0046) 21.0703)
  (connects road_0047 loc_0026 loc_0024)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.3)
  (= (travel-duration road_0047) 11.2621)
  (connects road_0048 loc_0027 loc_0142)
  (road-open road_0048)
  (= (congestion-factor road_0048) 1.14)
  (= (travel-duration road_0048) 15.5083)
  (connects road_0049 loc_0028 loc_0029)
  (road-open road_0049)
  (= (congestion-factor road_0049) 1.2)
  (= (travel-duration road_0049) 9.9479)
  (connects road_0050 loc_0028 loc_0127)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.11)
  (= (travel-duration road_0050) 4.7408)
  (connects road_0051 loc_0028 loc_0177)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.2)
  (= (travel-duration road_0051) 8.4272)
  (connects road_0052 loc_0028 loc_0054)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.14)
  (= (travel-duration road_0052) 6.4627)
  (connects road_0053 loc_0029 loc_0126)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.1)
  (= (travel-duration road_0053) 9.3816)
  (connects road_0054 loc_0029 loc_0055)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.2)
  (= (travel-duration road_0054) 13.5941)
  (connects road_0055 loc_0029 loc_0031)
  (road-open road_0055)
  (= (congestion-factor road_0055) 1.05)
  (= (travel-duration road_0055) 4.8978)
  (connects road_0056 loc_0029 loc_0028)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.1)
  (= (travel-duration road_0056) 9.1189)
  (connects road_0057 loc_0030 loc_0026)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.2)
  (= (travel-duration road_0057) 6.1865)
  (connects road_0058 loc_0031 loc_0020)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.2)
  (= (travel-duration road_0058) 27.8133)
  (connects road_0059 loc_0031 loc_0030)
  (road-open road_0059)
  (= (congestion-factor road_0059) 1.1)
  (= (travel-duration road_0059) 32.7756)
  (connects road_0060 loc_0031 loc_0029)
  (road-open road_0060)
  (= (congestion-factor road_0060) 1.2)
  (= (travel-duration road_0060) 5.5975)
  (connects road_0061 loc_0032 loc_0038)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.05)
  (= (travel-duration road_0061) 23.7053)
  (connects road_0062 loc_0032 loc_0003)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.03)
  (= (travel-duration road_0062) 4.6834)
  (connects road_0063 loc_0034 loc_0002)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.17)
  (= (travel-duration road_0063) 16.2632)
  (connects road_0064 loc_0035 loc_0016)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.0)
  (= (travel-duration road_0064) 18.8516)
  (connects road_0065 loc_0035 loc_0083)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.11)
  (= (travel-duration road_0065) 23.7265)
  (connects road_0066 loc_0036 loc_0043)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.2)
  (= (travel-duration road_0066) 7.7576)
  (connects road_0067 loc_0036 loc_0037)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.14)
  (= (travel-duration road_0067) 4.0631)
  (connects road_0068 loc_0037 loc_0036)
  (road-open road_0068)
  (= (congestion-factor road_0068) 1.0)
  (= (travel-duration road_0068) 9.7441)
  (connects road_0069 loc_0037 loc_0189)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.14)
  (= (travel-duration road_0069) 15.5397)
  (connects road_0070 loc_0038 loc_0033)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.0)
  (= (travel-duration road_0070) 10.8808)
  (connects road_0071 loc_0038 loc_0051)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.0)
  (= (travel-duration road_0071) 43.839)
  (connects road_0072 loc_0039 loc_0171)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.35)
  (= (travel-duration road_0072) 5.8241)
  (connects road_0073 loc_0039 loc_0034)
  (road-open road_0073)
  (= (congestion-factor road_0073) 1.14)
  (= (travel-duration road_0073) 9.6981)
  (connects road_0074 loc_0040 loc_0080)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.14)
  (= (travel-duration road_0074) 11.2112)
  (connects road_0075 loc_0040 loc_0004)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.1)
  (= (travel-duration road_0075) 26.4037)
  (connects road_0076 loc_0041 loc_0048)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.11)
  (= (travel-duration road_0076) 4.8407)
  (connects road_0077 loc_0042 loc_0036)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.09)
  (= (travel-duration road_0077) 32.3097)
  (connects road_0078 loc_0043 loc_0044)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.15)
  (= (travel-duration road_0078) 43.9175)
  (connects road_0079 loc_0043 loc_0045)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.15)
  (= (travel-duration road_0079) 16.0073)
  (connects road_0080 loc_0044 loc_0012)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.34)
  (= (travel-duration road_0080) 4.7261)
  (connects road_0081 loc_0044 loc_0102)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.11)
  (= (travel-duration road_0081) 11.6328)
  (connects road_0082 loc_0045 loc_0013)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.25)
  (= (travel-duration road_0082) 27.3806)
  (connects road_0083 loc_0046 loc_0036)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.11)
  (= (travel-duration road_0083) 24.4105)
  (connects road_0084 loc_0047 loc_0117)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.3)
  (= (travel-duration road_0084) 7.7941)
  (connects road_0085 loc_0048 loc_0049)
  (road-open road_0085)
  (= (congestion-factor road_0085) 1.14)
  (= (travel-duration road_0085) 10.0265)
  (connects road_0086 loc_0049 loc_0114)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.09)
  (= (travel-duration road_0086) 14.1047)
  (connects road_0087 loc_0049 loc_0050)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.05)
  (= (travel-duration road_0087) 4.0448)
  (connects road_0088 loc_0050 loc_0041)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.0)
  (= (travel-duration road_0088) 9.5872)
  (connects road_0089 loc_0052 loc_0156)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.17)
  (= (travel-duration road_0089) 5.1613)
  (connects road_0090 loc_0053 loc_0099)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.15)
  (= (travel-duration road_0090) 13.7012)
  (connects road_0091 loc_0054 loc_0169)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.23)
  (= (travel-duration road_0091) 5.274)
  (connects road_0092 loc_0055 loc_0111)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.4)
  (= (travel-duration road_0092) 25.1775)
  (connects road_0093 loc_0056 loc_0112)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.05)
  (= (travel-duration road_0093) 4.9948)
  (connects road_0094 loc_0056 loc_0057)
  (road-open road_0094)
  (= (congestion-factor road_0094) 1.1)
  (= (travel-duration road_0094) 17.195)
  (connects road_0095 loc_0056 loc_0197)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.2)
  (= (travel-duration road_0095) 18.4875)
  (connects road_0096 loc_0057 loc_0056)
  (road-open road_0096)
  (= (congestion-factor road_0096) 1.05)
  (= (travel-duration road_0096) 16.4134)
  (connects road_0097 loc_0058 loc_0112)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.05)
  (= (travel-duration road_0097) 19.2359)
  (connects road_0098 loc_0058 loc_0075)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.0)
  (= (travel-duration road_0098) 9.3448)
  (connects road_0099 loc_0058 loc_0090)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.25)
  (= (travel-duration road_0099) 20.8583)
  (connects road_0100 loc_0061 loc_0100)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.3)
  (= (travel-duration road_0100) 3.039)
  (connects road_0101 loc_0061 loc_0086)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.15)
  (= (travel-duration road_0101) 8.5329)
  (connects road_0102 loc_0063 loc_0013)
  (road-open road_0102)
  (= (congestion-factor road_0102) 1.05)
  (= (travel-duration road_0102) 60.6717)
  (connects road_0103 loc_0065 loc_0046)
  (road-open road_0103)
  (= (congestion-factor road_0103) 1.1)
  (= (travel-duration road_0103) 23.4837)
  (connects road_0104 loc_0066 loc_0187)
  (road-open road_0104)
  (= (congestion-factor road_0104) 1.0)
  (= (travel-duration road_0104) 3.9278)
  (connects road_0105 loc_0066 loc_0065)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.05)
  (= (travel-duration road_0105) 29.4854)
  (connects road_0106 loc_0067 loc_0005)
  (road-open road_0106)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0106)
  (= (congestion-factor road_0106) 1.0)
  (= (travel-duration road_0106) 16.0132)
  (connects road_0107 loc_0067 loc_0178)
  (road-open road_0107)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close the bidirectional link between 0067 and 0178 via roads 0107 and 0297. These roads have the lowest distance to axis (5.9) and are part of the main corridor from the start area to the goal. Closing them requires detours through 0067-0108-0066-0187-0104-0204-0120, adding significant delay.
  (road-blocked road_0107)
  (= (congestion-factor road_0107) 1.0)
  (= (travel-duration road_0107) 7.2351)
  (connects road_0108 loc_0067 loc_0066)
  (road-open road_0108)
  ;; [DYNAMIC EVENT - location closure] loc_0067 incident road
  (road-blocked road_0108)
  (= (congestion-factor road_0108) 1.0)
  (= (travel-duration road_0108) 10.408)
  (connects road_0109 loc_0068 loc_0047)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.3)
  (= (travel-duration road_0109) 12.3385)
  (connects road_0110 loc_0069 loc_0118)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.3)
  (= (travel-duration road_0110) 61.8506)
  (connects road_0111 loc_0069 loc_0068)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.25)
  (= (travel-duration road_0111) 13.8801)
  (connects road_0112 loc_0070 loc_0069)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.55)
  (= (travel-duration road_0112) 50.2164)
  (connects road_0113 loc_0070 loc_0116)
  (road-open road_0113)
  (= (congestion-factor road_0113) 1.06)
  (= (travel-duration road_0113) 21.2598)
  (connects road_0114 loc_0070 loc_0012)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.11)
  (= (travel-duration road_0114) 19.0643)
  (connects road_0115 loc_0071 loc_0072)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.0)
  (= (travel-duration road_0115) 7.6563)
  (connects road_0116 loc_0072 loc_0071)
  (road-open road_0116)
  (= (congestion-factor road_0116) 1.1)
  (= (travel-duration road_0116) 8.4219)
  (connects road_0117 loc_0072 loc_0137)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.1)
  (= (travel-duration road_0117) 1.761)
  (connects road_0118 loc_0072 loc_0134)
  (road-open road_0118)
  (= (congestion-factor road_0118) 2.5)  ;; [DYNAMIC EVENT - slowdown] Roads 0118 and 0230, both connecting 0072 to 0134, experience a slowdown (severity 2.5). Although not closed, the reduced speed simulates maintenance congestion on this secondary route, affecting traffic heading toward 0134 and downstream nodes.
  (= (travel-duration road_0118) 2.3405)  ;; [DYNAMIC EVENT - slowdown] Roads 0118 and 0230, both connecting 0072 to 0134, experience a slowdown (severity 2.5). Although not closed, the reduced speed simulates maintenance congestion on this secondary route, affecting traffic heading toward 0134 and downstream nodes.
  (connects road_0119 loc_0073 loc_0130)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.1)
  (= (travel-duration road_0119) 1.1199)
  (connects road_0120 loc_0073 loc_0143)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.1)
  (= (travel-duration road_0120) 7.5943)
  (connects road_0121 loc_0073 loc_0132)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.15)
  (= (travel-duration road_0121) 15.2924)
  (connects road_0122 loc_0074 loc_0077)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.3)
  (= (travel-duration road_0122) 10.1919)
  (connects road_0123 loc_0074 loc_0016)
  (road-open road_0123)
  (= (congestion-factor road_0123) 1.14)
  (= (travel-duration road_0123) 48.9613)
  (connects road_0124 loc_0074 loc_0076)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.0)
  (= (travel-duration road_0124) 12.7087)
  (connects road_0125 loc_0075 loc_0164)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.3)
  (= (travel-duration road_0125) 3.5445)
  (connects road_0126 loc_0075 loc_0058)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.4)
  (= (travel-duration road_0126) 13.0827)
  (connects road_0127 loc_0076 loc_0112)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.14)
  (= (travel-duration road_0127) 14.9624)
  (connects road_0128 loc_0076 loc_0074)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.14)
  (= (travel-duration road_0128) 7.3287)
  (connects road_0129 loc_0077 loc_0148)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.3)
  (= (travel-duration road_0129) 4.0967)
  (connects road_0130 loc_0078 loc_0124)
  (road-open road_0130)
  (= (congestion-factor road_0130) 1.2)
  (= (travel-duration road_0130) 1.0239)
  (connects road_0131 loc_0078 loc_0077)
  (road-open road_0131)
  (= (congestion-factor road_0131) 1.05)
  (= (travel-duration road_0131) 7.4494)
  (connects road_0132 loc_0079 loc_0188)
  (road-open road_0132)
  (= (congestion-factor road_0132) 1.0)
  (= (travel-duration road_0132) 0.3276)
  (connects road_0133 loc_0080 loc_0146)
  (road-open road_0133)
  (= (congestion-factor road_0133) 1.25)
  (= (travel-duration road_0133) 42.9896)
  (connects road_0134 loc_0080 loc_0179)
  (road-open road_0134)
  (= (congestion-factor road_0134) 1.06)
  (= (travel-duration road_0134) 11.5108)
  (connects road_0135 loc_0080 loc_0040)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.0)
  (= (travel-duration road_0135) 9.8344)
  (connects road_0136 loc_0081 loc_0194)
  (road-open road_0136)
  (= (congestion-factor road_0136) 1.23)
  (= (travel-duration road_0136) 0.1919)
  (connects road_0137 loc_0081 loc_0193)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.2)
  (= (travel-duration road_0137) 0.3643)
  (connects road_0138 loc_0082 loc_0141)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.29)
  (= (travel-duration road_0138) 17.9238)
  (connects road_0139 loc_0083 loc_0001)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.03)
  (= (travel-duration road_0139) 8.9577)
  (connects road_0140 loc_0083 loc_0180)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.15)
  (= (travel-duration road_0140) 4.4603)
  (connects road_0141 loc_0084 loc_0061)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.45)
  (= (travel-duration road_0141) 7.4614)
  (connects road_0142 loc_0085 loc_0084)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.35)
  (= (travel-duration road_0142) 13.0739)
  (connects road_0143 loc_0085 loc_0087)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.0)
  (= (travel-duration road_0143) 14.3598)
  (connects road_0144 loc_0086 loc_0085)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.1)
  (= (travel-duration road_0144) 5.4399)
  (connects road_0145 loc_0086 loc_0062)
  (road-open road_0145)
  (= (congestion-factor road_0145) 1.1)
  (= (travel-duration road_0145) 22.7405)
  (connects road_0146 loc_0087 loc_0001)
  (road-open road_0146)
  (= (congestion-factor road_0146) 1.11)
  (= (travel-duration road_0146) 21.6259)
  (connects road_0147 loc_0087 loc_0085)
  (road-open road_0147)
  (= (congestion-factor road_0147) 1.2)
  (= (travel-duration road_0147) 17.2317)
  (connects road_0148 loc_0088 loc_0104)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.4)
  (= (travel-duration road_0148) 1.7893)
  (connects road_0149 loc_0089 loc_0079)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.0)
  (= (travel-duration road_0149) 23.5701)
  (connects road_0150 loc_0089 loc_0121)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.0)
  (= (travel-duration road_0150) 4.4642)
  (connects road_0151 loc_0090 loc_0088)
  (road-open road_0151)
  (= (congestion-factor road_0151) 5.0)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (= (travel-duration road_0151) 42.1515)  ;; [DYNAMIC EVENT - slowdown] Auto-fallback (debug): avoided closure for not making A->B unsolvable.
  (connects road_0152 loc_0090 loc_0042)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.15)
  (= (travel-duration road_0152) 13.0857)
  (connects road_0153 loc_0091 loc_0040)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.17)
  (= (travel-duration road_0153) 8.1449)
  (connects road_0154 loc_0092 loc_0093)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.1)
  (= (travel-duration road_0154) 14.848)
  (connects road_0155 loc_0093 loc_0097)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.15)
  (= (travel-duration road_0155) 59.2002)
  (connects road_0156 loc_0093 loc_0092)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.1)
  (= (travel-duration road_0156) 14.848)
  (connects road_0157 loc_0093 loc_0096)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.25)
  (= (travel-duration road_0157) 15.0261)
  (connects road_0158 loc_0094 loc_0096)
  (road-open road_0158)
  (= (congestion-factor road_0158) 1.0)
  (= (travel-duration road_0158) 25.2334)
  (connects road_0159 loc_0094 loc_0096)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.1)
  (= (travel-duration road_0159) 27.7277)
  (connects road_0160 loc_0094 loc_0095)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.4)
  (= (travel-duration road_0160) 25.6832)
  (connects road_0161 loc_0095 loc_0094)
  (road-open road_0161)
  (= (congestion-factor road_0161) 1.0)
  (= (travel-duration road_0161) 18.3451)
  (connects road_0162 loc_0095 loc_0162)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.2)
  (= (travel-duration road_0162) 11.155)
  (connects road_0163 loc_0096 loc_0094)
  (road-open road_0163)
  (= (congestion-factor road_0163) 1.15)
  (= (travel-duration road_0163) 29.0184)
  (connects road_0164 loc_0096 loc_0094)
  (road-open road_0164)
  (= (congestion-factor road_0164) 1.15)
  (= (travel-duration road_0164) 28.9881)
  (connects road_0165 loc_0096 loc_0093)
  (road-open road_0165)
  (= (congestion-factor road_0165) 1.1)
  (= (travel-duration road_0165) 13.223)
  (connects road_0166 loc_0097 loc_0098)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.15)
  (= (travel-duration road_0166) 19.8935)
  (connects road_0167 loc_0097 loc_0145)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.1)
  (= (travel-duration road_0167) 3.3661)
  (connects road_0168 loc_0097 loc_0093)
  (road-open road_0168)
  (= (congestion-factor road_0168) 1.3)
  (= (travel-duration road_0168) 66.922)
  (connects road_0169 loc_0098 loc_0006)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.15)
  (= (travel-duration road_0169) 24.3469)
  (connects road_0170 loc_0098 loc_0097)
  (road-open road_0170)
  (= (congestion-factor road_0170) 1.35)
  (= (travel-duration road_0170) 23.3532)
  (connects road_0171 loc_0098 loc_0144)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.25)
  (= (travel-duration road_0171) 6.5433)
  (connects road_0172 loc_0099 loc_0053)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.1)
  (= (travel-duration road_0172) 13.1055)
  (connects road_0173 loc_0099 loc_0129)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.3)
  (= (travel-duration road_0173) 14.6646)
  (connects road_0174 loc_0100 loc_0101)
  (road-open road_0174)
  (= (congestion-factor road_0174) 1.25)
  (= (travel-duration road_0174) 24.9715)
  (connects road_0175 loc_0102 loc_0103)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.3)
  (= (travel-duration road_0175) 28.7285)
  (connects road_0176 loc_0102 loc_0044)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.29)
  (= (travel-duration road_0176) 13.5192)
  (connects road_0177 loc_0102 loc_0013)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.03)
  (= (travel-duration road_0177) 6.1963)
  (connects road_0178 loc_0103 loc_0119)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.15)
  (= (travel-duration road_0178) 7.0548)
  (connects road_0179 loc_0103 loc_0045)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.15)
  (= (travel-duration road_0179) 3.7413)
  (connects road_0180 loc_0104 loc_0122)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.3)
  (= (travel-duration road_0180) 7.4337)
  (connects road_0181 loc_0104 loc_0115)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.05)
  (= (travel-duration road_0181) 12.0776)
  (connects road_0182 loc_0105 loc_0091)
  (road-open road_0182)
  (= (congestion-factor road_0182) 1.35)
  (= (travel-duration road_0182) 10.4608)
  (connects road_0183 loc_0106 loc_0017)
  (road-open road_0183)
  (= (congestion-factor road_0183) 1.35)
  (= (travel-duration road_0183) 2.8578)
  (connects road_0184 loc_0108 loc_0106)
  (road-open road_0184)
  (= (congestion-factor road_0184) 1.25)
  (= (travel-duration road_0184) 11.1244)
  (connects road_0185 loc_0109 loc_0174)
  (road-open road_0185)
  (= (congestion-factor road_0185) 1.06)
  (= (travel-duration road_0185) 5.2332)
  (connects road_0186 loc_0109 loc_0113)
  (road-open road_0186)
  (= (congestion-factor road_0186) 1.14)
  (= (travel-duration road_0186) 0.9946)
  (connects road_0187 loc_0110 loc_0081)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.23)
  (= (travel-duration road_0187) 10.5022)
  (connects road_0188 loc_0111 loc_0109)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.25)
  (= (travel-duration road_0188) 17.9842)
  (connects road_0189 loc_0111 loc_0110)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.25)
  (= (travel-duration road_0189) 7.4898)
  (connects road_0190 loc_0112 loc_0056)
  (road-open road_0190)
  (= (congestion-factor road_0190) 1.25)
  (= (travel-duration road_0190) 5.9462)
  (connects road_0191 loc_0112 loc_0172)
  (road-open road_0191)
  (= (congestion-factor road_0191) 1.09)
  (= (travel-duration road_0191) 13.7568)
  (connects road_0192 loc_0112 loc_0076)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.09)
  (= (travel-duration road_0192) 20.5862)
  (connects road_0193 loc_0113 loc_0005)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.11)
  (= (travel-duration road_0193) 15.9576)
  (connects road_0194 loc_0113 loc_0109)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.0)
  (= (travel-duration road_0194) 0.8724)
  (connects road_0195 loc_0113 loc_0082)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.2)
  (= (travel-duration road_0195) 27.1292)
  (connects road_0196 loc_0114 loc_0049)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.0)
  (= (travel-duration road_0196) 12.9401)
  (connects road_0197 loc_0115 loc_0089)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.05)
  (= (travel-duration road_0197) 7.9232)
  (connects road_0198 loc_0115 loc_0120)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.05)
  (= (travel-duration road_0198) 22.2109)
  (connects road_0199 loc_0116 loc_0070)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.14)
  (= (travel-duration road_0199) 22.8643)
  (connects road_0200 loc_0117 loc_0047)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.0)
  (= (travel-duration road_0200) 5.9954)
  (connects road_0201 loc_0117 loc_0116)
  (road-open road_0201)
  (= (congestion-factor road_0201) 1.25)
  (= (travel-duration road_0201) 16.5352)
  (connects road_0202 loc_0118 loc_0069)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.0)
  (= (travel-duration road_0202) 47.5774)
  (connects road_0203 loc_0119 loc_0103)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.0)
  (= (travel-duration road_0203) 6.1346)
  (connects road_0204 loc_0120 loc_0088)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.2)
  (= (travel-duration road_0204) 15.4979)
  (connects road_0205 loc_0121 loc_0089)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.0)
  (= (travel-duration road_0205) 4.4642)
  (connects road_0206 loc_0122 loc_0075)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.6)
  (= (travel-duration road_0206) 18.5499)
  (connects road_0207 loc_0123 loc_0188)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.4)
  (= (travel-duration road_0207) 4.3547)
  (connects road_0208 loc_0123 loc_0148)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.3)
  (= (travel-duration road_0208) 7.1872)
  (connects road_0209 loc_0124 loc_0076)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.25)
  (= (travel-duration road_0209) 15.3119)
  (connects road_0210 loc_0124 loc_0196)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.0)
  (= (travel-duration road_0210) 6.0854)
  (connects road_0211 loc_0125 loc_0196)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.0)
  (= (travel-duration road_0211) 4.8518)
  (connects road_0212 loc_0126 loc_0192)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.05)
  (= (travel-duration road_0212) 7.6208)
  (connects road_0213 loc_0126 loc_0026)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.05)
  (= (travel-duration road_0213) 24.1967)
  (connects road_0214 loc_0127 loc_0192)
  (road-open road_0214)
  (= (congestion-factor road_0214) 1.14)
  (= (travel-duration road_0214) 7.1837)
  (connects road_0215 loc_0127 loc_0028)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.14)
  (= (travel-duration road_0215) 4.8689)
  (connects road_0216 loc_0128 loc_0054)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.2)
  (= (travel-duration road_0216) 2.7678)
  (connects road_0217 loc_0128 loc_0028)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.23)
  (= (travel-duration road_0217) 7.8526)
  (connects road_0218 loc_0129 loc_0143)
  (road-open road_0218)
  (= (congestion-factor road_0218) 1.03)
  (= (travel-duration road_0218) 1.6674)
  (connects road_0219 loc_0129 loc_0130)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.25)
  (= (travel-duration road_0219) 8.7949)
  (connects road_0220 loc_0129 loc_0052)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.14)
  (= (travel-duration road_0220) 22.8752)
  (connects road_0221 loc_0130 loc_0073)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.15)
  (= (travel-duration road_0221) 1.1708)
  (connects road_0222 loc_0130 loc_0167)
  (road-open road_0222)
  (= (congestion-factor road_0222) 1.2)
  (= (travel-duration road_0222) 7.2809)
  (connects road_0223 loc_0131 loc_0160)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.2)
  (= (travel-duration road_0223) 6.6876)
  (connects road_0224 loc_0131 loc_0161)
  (road-open road_0224)
  (= (congestion-factor road_0224) 1.05)
  (= (travel-duration road_0224) 5.4195)
  (connects road_0225 loc_0132 loc_0195)
  (road-open road_0225)
  (= (congestion-factor road_0225) 1.15)
  (= (travel-duration road_0225) 0.6859)
  (connects road_0226 loc_0132 loc_0073)
  (road-open road_0226)
  (= (congestion-factor road_0226) 1.0)
  (= (travel-duration road_0226) 13.2977)
  (connects road_0227 loc_0133 loc_0158)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.2)
  (= (travel-duration road_0227) 2.6267)
  (connects road_0228 loc_0133 loc_0027)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.03)
  (= (travel-duration road_0228) 9.398)
  (connects road_0229 loc_0134 loc_0136)
  (road-open road_0229)
  (= (congestion-factor road_0229) 1.05)
  (= (travel-duration road_0229) 3.1526)
  (connects road_0230 loc_0134 loc_0072)
  (road-open road_0230)
  (= (congestion-factor road_0230) 2.5)  ;; [DYNAMIC EVENT - slowdown] Roads 0118 and 0230, both connecting 0072 to 0134, experience a slowdown (severity 2.5). Although not closed, the reduced speed simulates maintenance congestion on this secondary route, affecting traffic heading toward 0134 and downstream nodes.
  (= (travel-duration road_0230) 2.452)  ;; [DYNAMIC EVENT - slowdown] Roads 0118 and 0230, both connecting 0072 to 0134, experience a slowdown (severity 2.5). Although not closed, the reduced speed simulates maintenance congestion on this secondary route, affecting traffic heading toward 0134 and downstream nodes.
  (connects road_0231 loc_0135 loc_0136)
  (road-open road_0231)
  (= (congestion-factor road_0231) 1.0)
  (= (travel-duration road_0231) 1.038)
  (connects road_0232 loc_0136 loc_0141)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.15)
  (= (travel-duration road_0232) 42.7565)
  (connects road_0233 loc_0136 loc_0134)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.05)
  (= (travel-duration road_0233) 3.1526)
  (connects road_0234 loc_0136 loc_0135)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.0)
  (= (travel-duration road_0234) 1.038)
  (connects road_0235 loc_0137 loc_0072)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.0)
  (= (travel-duration road_0235) 1.6009)
  (connects road_0236 loc_0138 loc_0020)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.0)
  (= (travel-duration road_0236) 3.6733)
  (connects road_0237 loc_0138 loc_0021)
  (road-open road_0237)
  (= (congestion-factor road_0237) 1.1)
  (= (travel-duration road_0237) 12.2408)
  (connects road_0238 loc_0139 loc_0140)
  (road-open road_0238)
  (= (congestion-factor road_0238) 1.15)
  (= (travel-duration road_0238) 1.9404)
  (connects road_0239 loc_0140 loc_0139)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.0)
  (= (travel-duration road_0239) 1.6873)
  (connects road_0240 loc_0140 loc_0108)
  (road-open road_0240)
  (= (congestion-factor road_0240) 1.2)
  (= (travel-duration road_0240) 11.5017)
  (connects road_0241 loc_0141 loc_0027)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.17)
  (= (travel-duration road_0241) 9.288)
  (connects road_0242 loc_0141 loc_0158)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.17)
  (= (travel-duration road_0242) 3.1844)
  (connects road_0243 loc_0142 loc_0195)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.0)
  (= (travel-duration road_0243) 6.6711)
  (connects road_0244 loc_0142 loc_0170)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.2)
  (= (travel-duration road_0244) 13.1952)
  (connects road_0245 loc_0142 loc_0143)
  (road-open road_0245)
  (= (congestion-factor road_0245) 1.09)
  (= (travel-duration road_0245) 13.6103)
  (connects road_0246 loc_0143 loc_0129)
  (road-open road_0246)
  (= (congestion-factor road_0246) 1.09)
  (= (travel-duration road_0246) 1.7646)
  (connects road_0247 loc_0143 loc_0099)
  (road-open road_0247)
  (= (congestion-factor road_0247) 1.25)
  (= (travel-duration road_0247) 14.3961)
  (connects road_0248 loc_0144 loc_0098)
  (road-open road_0248)
  (= (congestion-factor road_0248) 1.1)
  (= (travel-duration road_0248) 5.7581)
  (connects road_0249 loc_0145 loc_0097)
  (road-open road_0249)
  (= (congestion-factor road_0249) 1.0)
  (= (travel-duration road_0249) 3.0601)
  (connects road_0250 loc_0146 loc_0039)
  (road-open road_0250)
  (= (congestion-factor road_0250) 1.23)
  (= (travel-duration road_0250) 20.591)
  (connects road_0251 loc_0147 loc_0087)
  (road-open road_0251)
  (= (congestion-factor road_0251) 1.11)
  (= (travel-duration road_0251) 21.1237)
  (connects road_0252 loc_0148 loc_0165)
  (road-open road_0252)
  (= (congestion-factor road_0252) 1.55)
  (= (travel-duration road_0252) 11.3297)
  (connects road_0253 loc_0149 loc_0173)
  (road-open road_0253)
  (= (congestion-factor road_0253) 1.1)
  (= (travel-duration road_0253) 3.6407)
  (connects road_0254 loc_0150 loc_0024)
  (road-open road_0254)
  (= (congestion-factor road_0254) 1.09)
  (= (travel-duration road_0254) 1.087)
  (connects road_0255 loc_0150 loc_0009)
  (road-open road_0255)
  (= (congestion-factor road_0255) 1.29)
  (= (travel-duration road_0255) 9.4107)
  (connects road_0256 loc_0151 loc_0150)
  (road-open road_0256)
  (= (congestion-factor road_0256) 1.17)
  (= (travel-duration road_0256) 7.7602)
  (connects road_0257 loc_0151 loc_0009)
  (road-open road_0257)
  (= (congestion-factor road_0257) 1.09)
  (= (travel-duration road_0257) 6.2813)
  (connects road_0258 loc_0152 loc_0010)
  (road-open road_0258)
  (= (congestion-factor road_0258) 1.34)
  (= (travel-duration road_0258) 1.3315)
  (connects road_0259 loc_0153 loc_0023)
  (road-open road_0259)
  (= (congestion-factor road_0259) 1.09)
  (= (travel-duration road_0259) 15.9216)
  (connects road_0260 loc_0153 loc_0008)
  (road-open road_0260)
  (= (congestion-factor road_0260) 1.14)
  (= (travel-duration road_0260) 6.8156)
  (connects road_0261 loc_0154 loc_0153)
  (road-open road_0261)
  (= (congestion-factor road_0261) 1.2)
  (= (travel-duration road_0261) 7.1571)
  (connects road_0262 loc_0154 loc_0008)
  (road-open road_0262)
  (= (congestion-factor road_0262) 1.14)
  (= (travel-duration road_0262) 6.7568)
  (connects road_0263 loc_0155 loc_0011)
  (road-open road_0263)
  (= (congestion-factor road_0263) 1.14)
  (= (travel-duration road_0263) 5.8211)
  (connects road_0264 loc_0156 loc_0157)
  (road-open road_0264)
  (= (congestion-factor road_0264) 1.12)
  (= (travel-duration road_0264) 2.2248)
  (connects road_0265 loc_0157 loc_0052)
  (road-open road_0265)
  (= (congestion-factor road_0265) 1.05)
  (= (travel-duration road_0265) 18.1649)
  (connects road_0266 loc_0158 loc_0128)
  (road-open road_0266)
  (= (congestion-factor road_0266) 1.31)
  (= (travel-duration road_0266) 23.5212)
  (connects road_0267 loc_0159 loc_0195)
  (road-open road_0267)
  (= (congestion-factor road_0267) 1.0)
  (= (travel-duration road_0267) 9.7336)
  (connects road_0268 loc_0159 loc_0134)
  (road-open road_0268)
  (= (congestion-factor road_0268) 1.25)
  (= (travel-duration road_0268) 28.1651)
  (connects road_0269 loc_0160 loc_0127)
  (road-open road_0269)
  (= (congestion-factor road_0269) 1.17)
  (= (travel-duration road_0269) 7.3938)
  (connects road_0270 loc_0161 loc_0053)
  (road-open road_0270)
  (= (congestion-factor road_0270) 1.1)
  (= (travel-duration road_0270) 39.3666)
  (connects road_0271 loc_0161 loc_0054)
  (road-open road_0271)
  (= (congestion-factor road_0271) 1.05)
  (= (travel-duration road_0271) 12.1708)
  (connects road_0272 loc_0163 loc_0182)
  (road-open road_0272)
  (= (congestion-factor road_0272) 1.2)
  (= (travel-duration road_0272) 109.9222)
  (connects road_0273 loc_0163 loc_0183)
  (road-open road_0273)
  (= (congestion-factor road_0273) 1.02)
  (= (travel-duration road_0273) 0.9591)
  (connects road_0274 loc_0164 loc_0075)
  (road-open road_0274)
  (= (congestion-factor road_0274) 1.15)
  (= (travel-duration road_0274) 3.1355)
  (connects road_0275 loc_0164 loc_0123)
  (road-open road_0275)
  (= (congestion-factor road_0275) 1.4)
  (= (travel-duration road_0275) 11.779)
  (connects road_0276 loc_0165 loc_0078)
  (road-open road_0276)
  (= (congestion-factor road_0276) 1.25)
  (= (travel-duration road_0276) 3.9107)
  (connects road_0277 loc_0165 loc_0164)
  (road-open road_0277)
  (= (congestion-factor road_0277) 1.25)
  (= (travel-duration road_0277) 6.6408)
  (connects road_0278 loc_0167 loc_0168)
  (road-open road_0278)
  (= (congestion-factor road_0278) 1.2)
  (= (travel-duration road_0278) 1.7353)
  (connects road_0279 loc_0169 loc_0133)
  (road-open road_0279)
  (= (congestion-factor road_0279) 1.09)
  (= (travel-duration road_0279) 16.004)
  (connects road_0280 loc_0169 loc_0191)
  (road-open road_0280)
  (= (congestion-factor road_0280) 1.2)
  (= (travel-duration road_0280) 2.3665)
  (connects road_0281 loc_0170 loc_0142)
  (road-open road_0281)
  (= (congestion-factor road_0281) 1.05)
  (= (travel-duration road_0281) 11.5458)
  (connects road_0282 loc_0171 loc_0039)
  (road-open road_0282)
  (= (congestion-factor road_0282) 1.0)
  (= (travel-duration road_0282) 4.3142)
  (connects road_0283 loc_0171 loc_0105)
  (road-open road_0283)
  (= (congestion-factor road_0283) 1.35)
  (= (travel-duration road_0283) 10.0849)
  (connects road_0284 loc_0172 loc_0112)
  (road-open road_0284)
  (= (congestion-factor road_0284) 1.11)
  (= (travel-duration road_0284) 14.0092)
  (connects road_0285 loc_0172 loc_0005)
  (road-open road_0285)
  (= (congestion-factor road_0285) 1.14)
  (= (travel-duration road_0285) 13.5701)
  (connects road_0286 loc_0173 loc_0059)
  (road-open road_0286)
  (= (congestion-factor road_0286) 1.05)
  (= (travel-duration road_0286) 9.6356)
  (connects road_0287 loc_0173 loc_0064)
  (road-open road_0287)
  (= (congestion-factor road_0287) 1.0)
  (= (travel-duration road_0287) 16.3519)
  (connects road_0288 loc_0174 loc_0109)
  (road-open road_0288)
  (= (congestion-factor road_0288) 1.06)
  (= (travel-duration road_0288) 5.2332)
  (connects road_0289 loc_0174 loc_0110)
  (road-open road_0289)
  (= (congestion-factor road_0289) 1.11)
  (= (travel-duration road_0289) 3.5379)
  (connects road_0290 loc_0175 loc_0055)
  (road-open road_0290)
  (= (congestion-factor road_0290) 1.25)
  (= (travel-duration road_0290) 8.9959)
  (connects road_0291 loc_0175 loc_0177)
  (road-open road_0291)
  (= (congestion-factor road_0291) 1.09)
  (= (travel-duration road_0291) 2.6449)
  (connects road_0292 loc_0176 loc_0131)
  (road-open road_0292)
  (= (congestion-factor road_0292) 1.25)
  (= (travel-duration road_0292) 9.4774)
  (connects road_0293 loc_0176 loc_0160)
  (road-open road_0293)
  (= (congestion-factor road_0293) 1.11)
  (= (travel-duration road_0293) 4.9526)
  (connects road_0294 loc_0177 loc_0193)
  (road-open road_0294)
  (= (congestion-factor road_0294) 1.26)
  (= (travel-duration road_0294) 13.7764)
  (connects road_0295 loc_0177 loc_0028)
  (road-open road_0295)
  (= (congestion-factor road_0295) 1.11)
  (= (travel-duration road_0295) 7.7952)
  (connects road_0296 loc_0178 loc_0037)
  (road-open road_0296)
  ;; [DYNAMIC EVENT - location closure] loc_0178 incident road
  (road-blocked road_0296)
  (= (congestion-factor road_0296) 1.0)
  (= (travel-duration road_0296) 15.8478)
  (connects road_0297 loc_0178 loc_0067)
  (road-open road_0297)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close the bidirectional link between 0067 and 0178 via roads 0107 and 0297. These roads have the lowest distance to axis (5.9) and are part of the main corridor from the start area to the goal. Closing them requires detours through 0067-0108-0066-0187-0104-0204-0120, adding significant delay.
  (road-blocked road_0297)
  (= (congestion-factor road_0297) 1.0)
  (= (travel-duration road_0297) 7.2351)
  (connects road_0298 loc_0179 loc_0080)
  (road-open road_0298)
  (= (congestion-factor road_0298) 1.06)
  (= (travel-duration road_0298) 11.5108)
  (connects road_0299 loc_0180 loc_0083)
  (road-open road_0299)
  (= (congestion-factor road_0299) 1.0)
  (= (travel-duration road_0299) 3.8786)
  (connects road_0300 loc_0181 loc_0014)
  (road-open road_0300)
  (= (congestion-factor road_0300) 1.09)
  (= (travel-duration road_0300) 4.9798)
  (connects road_0301 loc_0181 loc_0015)
  (road-open road_0301)
  (= (congestion-factor road_0301) 1.2)
  (= (travel-duration road_0301) 2.6655)
  (connects road_0302 loc_0182 loc_0163)
  (road-open road_0302)
  (= (congestion-factor road_0302) 1.0)
  (= (travel-duration road_0302) 91.6019)
  (connects road_0303 loc_0183 loc_0095)
  (road-open road_0303)
  (= (congestion-factor road_0303) 1.04)
  (= (travel-duration road_0303) 6.7317)
  (connects road_0304 loc_0183 loc_0184)
  (road-open road_0304)
  (= (congestion-factor road_0304) 1.0)
  (= (travel-duration road_0304) 1.1873)
  (connects road_0305 loc_0184 loc_0198)
  (road-open road_0305)
  (= (congestion-factor road_0305) 1.0)
  (= (travel-duration road_0305) 0.9403)
  (connects road_0306 loc_0185 loc_0186)
  (road-open road_0306)
  (= (congestion-factor road_0306) 1.06)
  (= (travel-duration road_0306) 1.3267)
  (connects road_0307 loc_0185 loc_0024)
  (road-open road_0307)
  (= (congestion-factor road_0307) 1.09)
  (= (travel-duration road_0307) 11.7646)
  (connects road_0308 loc_0186 loc_0185)
  (road-open road_0308)
  (= (congestion-factor road_0308) 1.11)
  (= (travel-duration road_0308) 1.3893)
  (connects road_0309 loc_0186 loc_0176)
  (road-open road_0309)
  (= (congestion-factor road_0309) 1.17)
  (= (travel-duration road_0309) 9.0786)
  (connects road_0310 loc_0187 loc_0066)
  (road-open road_0310)
  (= (congestion-factor road_0310) 1.05)
  (= (travel-duration road_0310) 4.1241)
  (connects road_0311 loc_0188 loc_0079)
  (road-open road_0311)
  (= (congestion-factor road_0311) 1.3)
  (= (travel-duration road_0311) 0.4259)
  (connects road_0312 loc_0188 loc_0122)
  (road-open road_0312)
  (= (congestion-factor road_0312) 1.2)
  (= (travel-duration road_0312) 28.8199)
  (connects road_0313 loc_0188 loc_0123)
  (road-open road_0313)
  (= (congestion-factor road_0313) 1.15)
  (= (travel-duration road_0313) 3.5771)
  (connects road_0314 loc_0189 loc_0178)
  (road-open road_0314)
  ;; [DYNAMIC EVENT - location closure] loc_0178 incident road
  (road-blocked road_0314)
  (= (congestion-factor road_0314) 1.0)
  (= (travel-duration road_0314) 2.4013)
  (connects road_0315 loc_0190 loc_0181)
  (road-open road_0315)
  (= (congestion-factor road_0315) 1.03)
  (= (travel-duration road_0315) 1.9282)
  (connects road_0316 loc_0191 loc_0169)
  (road-open road_0316)
  (= (congestion-factor road_0316) 1.0)
  (= (travel-duration road_0316) 1.9721)
  (connects road_0317 loc_0192 loc_0186)
  (road-open road_0317)
  (= (congestion-factor road_0317) 1.2)
  (= (travel-duration road_0317) 14.8009)
  (connects road_0318 loc_0193 loc_0081)
  (road-open road_0318)
  (= (congestion-factor road_0318) 1.17)
  (= (travel-duration road_0318) 0.3552)
  (connects road_0319 loc_0193 loc_0175)
  (road-open road_0319)
  (= (congestion-factor road_0319) 1.26)
  (= (travel-duration road_0319) 10.976)
  (connects road_0320 loc_0194 loc_0082)
  (road-open road_0320)
  (= (congestion-factor road_0320) 1.2)
  (= (travel-duration road_0320) 19.5704)
  (connects road_0321 loc_0194 loc_0174)
  (road-open road_0321)
  (= (congestion-factor road_0321) 1.14)
  (= (travel-duration road_0321) 13.4589)
  (connects road_0322 loc_0195 loc_0132)
  (road-open road_0322)
  (= (congestion-factor road_0322) 1.0)
  (= (travel-duration road_0322) 0.5964)
  (connects road_0323 loc_0195 loc_0159)
  (road-open road_0323)
  (= (congestion-factor road_0323) 1.15)
  (= (travel-duration road_0323) 11.1936)
  (connects road_0324 loc_0196 loc_0125)
  (road-open road_0324)
  (= (congestion-factor road_0324) 1.0)
  (= (travel-duration road_0324) 4.8518)
  (connects road_0325 loc_0196 loc_0199)
  (road-open road_0325)
  (= (congestion-factor road_0325) 1.0)
  (= (travel-duration road_0325) 2.6905)
  (connects road_0326 loc_0196 loc_0124)
  (road-open road_0326)
  (= (congestion-factor road_0326) 1.15)
  (= (travel-duration road_0326) 6.9983)
  (connects road_0327 loc_0197 loc_0031)
  (road-open road_0327)
  (= (congestion-factor road_0327) 1.35)
  (= (travel-duration road_0327) 35.5507)
  (connects road_0328 loc_0198 loc_0007)
  (road-open road_0328)
  (= (congestion-factor road_0328) 1.02)
  (= (travel-duration road_0328) 5.9897)
  (connects road_0329 loc_0198 loc_0163)
  (road-open road_0329)
  (= (congestion-factor road_0329) 1.02)
  (= (travel-duration road_0329) 1.2132)
  (connects road_0330 loc_0199 loc_0196)
  (road-open road_0330)
  (= (congestion-factor road_0330) 1.05)
  (= (travel-duration road_0330) 2.825)
  (has-traffic-light loc_0005)
  (has-traffic-light loc_0027)
  (has-traffic-light loc_0036)
  (has-traffic-light loc_0076)
  (has-traffic-light loc_0141)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close the bidirectional link between 0067 and 0178 via roads 0107 and 0297. These roads have the lowest distance to axis (5.9) and are part of the main corridor from the start area to the goal. Closing them requires detours through 0067-0108-0066-0187-0104-0204-0120, adding significant delay.
  (location-blocked loc_0067)
  ;; [DYNAMIC EVENT - roadworks] Roadworks close the bidirectional link between 0067 and 0178 via roads 0107 and 0297. These roads have the lowest distance to axis (5.9) and are part of the main corridor from the start area to the goal. Closing them requires detours through 0067-0108-0066-0187-0104-0204-0120, adding significant delay.
  (location-blocked loc_0178)
  )

  (:goal (at car1 loc_0120))

  (:metric minimize (travel-time car1))
)
