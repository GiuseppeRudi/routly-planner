;; ============================================================
;;  PROBLEM: rq1_hyb_0500_d_n_c
;;  Features: tl_cong-pddl-hybrid_llm_macro
;;  Start: loc_0173
;;  Goal:  loc_0034
;; ============================================================

(define (problem rq1_hyb_0500_d_n_c_dynamic)
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
    loc_0298 - loc_type_loc_0298
    loc_0299 - loc_type_loc_0299
    loc_0300 - loc_type_loc_0300
    loc_0301 - loc_type_loc_0301
    loc_0302 - loc_type_loc_0302
    loc_0303 - loc_type_loc_0303
    loc_0304 - loc_type_loc_0304
    loc_0305 - loc_type_loc_0305
    loc_0306 - loc_type_loc_0306
    loc_0307 - loc_type_loc_0307
    loc_0308 - loc_type_loc_0308
    loc_0309 - loc_type_loc_0309
    loc_0310 - loc_type_loc_0310
    loc_0312 - loc_type_loc_0312
    loc_0313 - loc_type_loc_0313
    loc_0314 - loc_type_loc_0314
    loc_0315 - loc_type_loc_0315
    loc_0316 - loc_type_loc_0316
    loc_0317 - loc_type_loc_0317
    loc_0318 - loc_type_loc_0318
    loc_0319 - loc_type_loc_0319
    loc_0320 - loc_type_loc_0320
    loc_0321 - loc_type_loc_0321
    loc_0322 - loc_type_loc_0322
    loc_0323 - loc_type_loc_0323
    loc_0324 - loc_type_loc_0324
    loc_0325 - loc_type_loc_0325
    loc_0326 - loc_type_loc_0326
    loc_0327 - loc_type_loc_0327
    loc_0328 - loc_type_loc_0328
    loc_0329 - loc_type_loc_0329
    loc_0330 - loc_type_loc_0330
    loc_0331 - loc_type_loc_0331
    loc_0332 - loc_type_loc_0332
    loc_0333 - loc_type_loc_0333
    loc_0334 - loc_type_loc_0334
    loc_0335 - loc_type_loc_0335
    loc_0336 - loc_type_loc_0336
    loc_0337 - loc_type_loc_0337
    loc_0338 - loc_type_loc_0338
    loc_0339 - loc_type_loc_0339
    loc_0340 - loc_type_loc_0340
    loc_0341 - loc_type_loc_0341
    loc_0342 - loc_type_loc_0342
    loc_0343 - loc_type_loc_0343
    loc_0345 - loc_type_loc_0345
    loc_0346 - loc_type_loc_0346
    loc_0347 - loc_type_loc_0347
    loc_0348 - loc_type_loc_0348
    loc_0349 - loc_type_loc_0349
    loc_0350 - loc_type_loc_0350
    loc_0351 - loc_type_loc_0351
    loc_0352 - loc_type_loc_0352
    loc_0354 - loc_type_loc_0354
    loc_0355 - loc_type_loc_0355
    loc_0356 - loc_type_loc_0356
    loc_0357 - loc_type_loc_0357
    loc_0358 - loc_type_loc_0358
    loc_0359 - loc_type_loc_0359
    loc_0360 - loc_type_loc_0360
    loc_0361 - loc_type_loc_0361
    loc_0362 - loc_type_loc_0362
    loc_0363 - loc_type_loc_0363
    loc_0364 - loc_type_loc_0364
    loc_0365 - loc_type_loc_0365
    loc_0366 - loc_type_loc_0366
    loc_0367 - loc_type_loc_0367
    loc_0368 - loc_type_loc_0368
    loc_0369 - loc_type_loc_0369
    loc_0370 - loc_type_loc_0370
    loc_0371 - loc_type_loc_0371
    loc_0372 - loc_type_loc_0372
    loc_0373 - loc_type_loc_0373
    loc_0374 - loc_type_loc_0374
    loc_0375 - loc_type_loc_0375
    loc_0376 - loc_type_loc_0376
    loc_0377 - loc_type_loc_0377
    loc_0378 - loc_type_loc_0378
    loc_0379 - loc_type_loc_0379
    loc_0380 - loc_type_loc_0380
    loc_0381 - loc_type_loc_0381
    loc_0383 - loc_type_loc_0383
    loc_0384 - loc_type_loc_0384
    loc_0385 - loc_type_loc_0385
    loc_0386 - loc_type_loc_0386
    loc_0387 - loc_type_loc_0387
    loc_0388 - loc_type_loc_0388
    loc_0389 - loc_type_loc_0389
    loc_0390 - loc_type_loc_0390
    loc_0391 - loc_type_loc_0391
    loc_0392 - loc_type_loc_0392
    loc_0393 - loc_type_loc_0393
    loc_0394 - loc_type_loc_0394
    loc_0395 - loc_type_loc_0395
    loc_0396 - loc_type_loc_0396
    loc_0397 - loc_type_loc_0397
    loc_0398 - loc_type_loc_0398
    loc_0399 - loc_type_loc_0399
    loc_0400 - loc_type_loc_0400
    loc_0401 - loc_type_loc_0401
    loc_0402 - loc_type_loc_0402
    loc_0404 - loc_type_loc_0404
    loc_0405 - loc_type_loc_0405
    loc_0406 - loc_type_loc_0406
    loc_0407 - loc_type_loc_0407
    loc_0408 - loc_type_loc_0408
    loc_0409 - loc_type_loc_0409
    loc_0411 - loc_type_loc_0411
    loc_0412 - loc_type_loc_0412
    loc_0413 - loc_type_loc_0413
    loc_0414 - loc_type_loc_0414
    loc_0415 - loc_type_loc_0415
    loc_0416 - loc_type_loc_0416
    loc_0417 - loc_type_loc_0417
    loc_0418 - loc_type_loc_0418
    loc_0419 - loc_type_loc_0419
    loc_0420 - loc_type_loc_0420
    loc_0421 - loc_type_loc_0421
    loc_0422 - loc_type_loc_0422
    loc_0423 - loc_type_loc_0423
    loc_0424 - loc_type_loc_0424
    loc_0425 - loc_type_loc_0425
    loc_0426 - loc_type_loc_0426
    loc_0427 - loc_type_loc_0427
    loc_0428 - loc_type_loc_0428
    loc_0429 - loc_type_loc_0429
    loc_0430 - loc_type_loc_0430
    loc_0431 - loc_type_loc_0431
    loc_0432 - loc_type_loc_0432
    loc_0433 - loc_type_loc_0433
    loc_0434 - loc_type_loc_0434
    loc_0435 - loc_type_loc_0435
    loc_0437 - loc_type_loc_0437
    loc_0438 - loc_type_loc_0438
    loc_0439 - loc_type_loc_0439
    loc_0440 - loc_type_loc_0440
    loc_0441 - loc_type_loc_0441
    loc_0442 - loc_type_loc_0442
    loc_0443 - loc_type_loc_0443
    loc_0444 - loc_type_loc_0444
    loc_0445 - loc_type_loc_0445
    loc_0446 - loc_type_loc_0446
    loc_0447 - loc_type_loc_0447
    loc_0448 - loc_type_loc_0448
    loc_0449 - loc_type_loc_0449
    loc_0450 - loc_type_loc_0450
    loc_0451 - loc_type_loc_0451
    loc_0452 - loc_type_loc_0452
    loc_0453 - loc_type_loc_0453
    loc_0454 - loc_type_loc_0454
    loc_0455 - loc_type_loc_0455
    loc_0456 - loc_type_loc_0456
    loc_0457 - loc_type_loc_0457
    loc_0458 - loc_type_loc_0458
    loc_0459 - loc_type_loc_0459
    loc_0460 - loc_type_loc_0460
    loc_0461 - loc_type_loc_0461
    loc_0462 - loc_type_loc_0462
    loc_0463 - loc_type_loc_0463
    loc_0465 - loc_type_loc_0465
    loc_0466 - loc_type_loc_0466
    loc_0467 - loc_type_loc_0467
    loc_0468 - loc_type_loc_0468
    loc_0469 - loc_type_loc_0469
    loc_0470 - loc_type_loc_0470
    loc_0471 - loc_type_loc_0471
    loc_0472 - loc_type_loc_0472
    loc_0473 - loc_type_loc_0473
    loc_0474 - loc_type_loc_0474
    loc_0475 - loc_type_loc_0475
    loc_0476 - loc_type_loc_0476
    loc_0477 - loc_type_loc_0477
    loc_0478 - loc_type_loc_0478
    loc_0479 - loc_type_loc_0479
    loc_0480 - loc_type_loc_0480
    loc_0482 - loc_type_loc_0482
    loc_0483 - loc_type_loc_0483
    loc_0485 - loc_type_loc_0485
    loc_0486 - loc_type_loc_0486
    loc_0487 - loc_type_loc_0487
    loc_0488 - loc_type_loc_0488
    loc_0489 - loc_type_loc_0489
    loc_0490 - loc_type_loc_0490
    loc_0491 - loc_type_loc_0491
    loc_0492 - loc_type_loc_0492
    loc_0493 - loc_type_loc_0493
    loc_0494 - loc_type_loc_0494
    loc_0495 - loc_type_loc_0495
    loc_0496 - loc_type_loc_0496
    loc_0497 - loc_type_loc_0497
    loc_0498 - loc_type_loc_0498
    loc_0499 - loc_type_loc_0499
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
    macro_0039 - road_type_macro_0039
    macro_0040 - road_type_macro_0040
    macro_0041 - road_type_macro_0041
    macro_0042 - road_type_macro_0042
    macro_0043 - road_type_macro_0043
    macro_0044 - road_type_macro_0044
    macro_0045 - road_type_macro_0045
    macro_0046 - road_type_macro_0046
    macro_0047 - road_type_macro_0047
    macro_0048 - road_type_macro_0048
    macro_0049 - road_type_macro_0049
    macro_0050 - road_type_macro_0050
    macro_0051 - road_type_macro_0051
    macro_0052 - road_type_macro_0052
    macro_0053 - road_type_macro_0053
    macro_0054 - road_type_macro_0054
    macro_0055 - road_type_macro_0055
    macro_0056 - road_type_macro_0056
    macro_0057 - road_type_macro_0057
    macro_0058 - road_type_macro_0058
    road_0000 - road_type_road_0000
    road_0001 - road_type_road_0001
    road_0002 - road_type_road_0002
    road_0003 - road_type_road_0003
    road_0004 - road_type_road_0004
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
    road_0042 - road_type_road_0042
    road_0043 - road_type_road_0043
    road_0044 - road_type_road_0044
    road_0045 - road_type_road_0045
    road_0046 - road_type_road_0046
    road_0047 - road_type_road_0047
    road_0050 - road_type_road_0050
    road_0051 - road_type_road_0051
    road_0052 - road_type_road_0052
    road_0053 - road_type_road_0053
    road_0054 - road_type_road_0054
    road_0056 - road_type_road_0056
    road_0057 - road_type_road_0057
    road_0058 - road_type_road_0058
    road_0061 - road_type_road_0061
    road_0062 - road_type_road_0062
    road_0063 - road_type_road_0063
    road_0064 - road_type_road_0064
    road_0065 - road_type_road_0065
    road_0066 - road_type_road_0066
    road_0067 - road_type_road_0067
    road_0069 - road_type_road_0069
    road_0070 - road_type_road_0070
    road_0071 - road_type_road_0071
    road_0072 - road_type_road_0072
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
    road_0097 - road_type_road_0097
    road_0098 - road_type_road_0098
    road_0099 - road_type_road_0099
    road_0100 - road_type_road_0100
    road_0101 - road_type_road_0101
    road_0102 - road_type_road_0102
    road_0104 - road_type_road_0104
    road_0105 - road_type_road_0105
    road_0106 - road_type_road_0106
    road_0107 - road_type_road_0107
    road_0108 - road_type_road_0108
    road_0109 - road_type_road_0109
    road_0110 - road_type_road_0110
    road_0111 - road_type_road_0111
    road_0112 - road_type_road_0112
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
    road_0159 - road_type_road_0159
    road_0160 - road_type_road_0160
    road_0161 - road_type_road_0161
    road_0162 - road_type_road_0162
    road_0163 - road_type_road_0163
    road_0164 - road_type_road_0164
    road_0165 - road_type_road_0165
    road_0166 - road_type_road_0166
    road_0167 - road_type_road_0167
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
    road_0187 - road_type_road_0187
    road_0188 - road_type_road_0188
    road_0189 - road_type_road_0189
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
    road_0219 - road_type_road_0219
    road_0220 - road_type_road_0220
    road_0221 - road_type_road_0221
    road_0222 - road_type_road_0222
    road_0223 - road_type_road_0223
    road_0224 - road_type_road_0224
    road_0225 - road_type_road_0225
    road_0227 - road_type_road_0227
    road_0228 - road_type_road_0228
    road_0230 - road_type_road_0230
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
    road_0280 - road_type_road_0280
    road_0281 - road_type_road_0281
    road_0282 - road_type_road_0282
    road_0283 - road_type_road_0283
    road_0286 - road_type_road_0286
    road_0287 - road_type_road_0287
    road_0288 - road_type_road_0288
    road_0289 - road_type_road_0289
    road_0290 - road_type_road_0290
    road_0291 - road_type_road_0291
    road_0292 - road_type_road_0292
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
    road_0354 - road_type_road_0354
    road_0355 - road_type_road_0355
    road_0356 - road_type_road_0356
    road_0357 - road_type_road_0357
    road_0358 - road_type_road_0358
    road_0359 - road_type_road_0359
    road_0360 - road_type_road_0360
    road_0361 - road_type_road_0361
    road_0362 - road_type_road_0362
    road_0364 - road_type_road_0364
    road_0365 - road_type_road_0365
    road_0367 - road_type_road_0367
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
    road_0403 - road_type_road_0403
    road_0404 - road_type_road_0404
    road_0405 - road_type_road_0405
    road_0406 - road_type_road_0406
    road_0407 - road_type_road_0407
    road_0408 - road_type_road_0408
    road_0410 - road_type_road_0410
    road_0411 - road_type_road_0411
    road_0412 - road_type_road_0412
    road_0413 - road_type_road_0413
    road_0414 - road_type_road_0414
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
    road_0430 - road_type_road_0430
    road_0433 - road_type_road_0433
    road_0434 - road_type_road_0434
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
    road_0475 - road_type_road_0475
    road_0476 - road_type_road_0476
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
    road_0505 - road_type_road_0505
    road_0506 - road_type_road_0506
    road_0507 - road_type_road_0507
    road_0508 - road_type_road_0508
    road_0511 - road_type_road_0511
    road_0512 - road_type_road_0512
    road_0513 - road_type_road_0513
    road_0514 - road_type_road_0514
    road_0515 - road_type_road_0515
    road_0516 - road_type_road_0516
    road_0517 - road_type_road_0517
    road_0518 - road_type_road_0518
    road_0519 - road_type_road_0519
    road_0520 - road_type_road_0520
    road_0521 - road_type_road_0521
    road_0522 - road_type_road_0522
    road_0523 - road_type_road_0523
    road_0524 - road_type_road_0524
    road_0525 - road_type_road_0525
    road_0526 - road_type_road_0526
    road_0527 - road_type_road_0527
    road_0529 - road_type_road_0529
    road_0530 - road_type_road_0530
    road_0532 - road_type_road_0532
    road_0533 - road_type_road_0533
    road_0534 - road_type_road_0534
    road_0535 - road_type_road_0535
    road_0536 - road_type_road_0536
    road_0537 - road_type_road_0537
    road_0539 - road_type_road_0539
    road_0540 - road_type_road_0540
    road_0541 - road_type_road_0541
    road_0542 - road_type_road_0542
    road_0543 - road_type_road_0543
    road_0544 - road_type_road_0544
    road_0545 - road_type_road_0545
    road_0546 - road_type_road_0546
    road_0547 - road_type_road_0547
    road_0548 - road_type_road_0548
    road_0549 - road_type_road_0549
    road_0550 - road_type_road_0550
    road_0551 - road_type_road_0551
    road_0552 - road_type_road_0552
    road_0553 - road_type_road_0553
    road_0554 - road_type_road_0554
    road_0555 - road_type_road_0555
    road_0556 - road_type_road_0556
    road_0557 - road_type_road_0557
    road_0558 - road_type_road_0558
    road_0559 - road_type_road_0559
    road_0561 - road_type_road_0561
    road_0563 - road_type_road_0563
    road_0564 - road_type_road_0564
    road_0566 - road_type_road_0566
    road_0567 - road_type_road_0567
    road_0568 - road_type_road_0568
    road_0569 - road_type_road_0569
    road_0572 - road_type_road_0572
    road_0573 - road_type_road_0573
    road_0574 - road_type_road_0574
    road_0575 - road_type_road_0575
    road_0576 - road_type_road_0576
    road_0577 - road_type_road_0577
    road_0578 - road_type_road_0578
    road_0579 - road_type_road_0579
    road_0580 - road_type_road_0580
    road_0581 - road_type_road_0581
    road_0582 - road_type_road_0582
    road_0583 - road_type_road_0583
    road_0584 - road_type_road_0584
    road_0586 - road_type_road_0586
    road_0587 - road_type_road_0587
    road_0588 - road_type_road_0588
    road_0589 - road_type_road_0589
    road_0590 - road_type_road_0590
    road_0591 - road_type_road_0591
    road_0592 - road_type_road_0592
    road_0593 - road_type_road_0593
    road_0594 - road_type_road_0594
    road_0595 - road_type_road_0595
    road_0596 - road_type_road_0596
    road_0598 - road_type_road_0598
    road_0599 - road_type_road_0599
    road_0600 - road_type_road_0600
    road_0601 - road_type_road_0601
    road_0602 - road_type_road_0602
    road_0603 - road_type_road_0603
    road_0604 - road_type_road_0604
    road_0606 - road_type_road_0606
    road_0607 - road_type_road_0607
    road_0608 - road_type_road_0608
    road_0609 - road_type_road_0609
    road_0610 - road_type_road_0610
    road_0611 - road_type_road_0611
    road_0612 - road_type_road_0612
    road_0614 - road_type_road_0614
    road_0615 - road_type_road_0615
    road_0616 - road_type_road_0616
    road_0617 - road_type_road_0617
    road_0618 - road_type_road_0618
    road_0619 - road_type_road_0619
    road_0620 - road_type_road_0620
    road_0621 - road_type_road_0621
    road_0622 - road_type_road_0622
    road_0623 - road_type_road_0623
    road_0624 - road_type_road_0624
    road_0625 - road_type_road_0625
    road_0626 - road_type_road_0626
    road_0627 - road_type_road_0627
    road_0628 - road_type_road_0628
    road_0629 - road_type_road_0629
    road_0630 - road_type_road_0630
    road_0632 - road_type_road_0632
    road_0633 - road_type_road_0633
    road_0634 - road_type_road_0634
    road_0635 - road_type_road_0635
    road_0636 - road_type_road_0636
    road_0637 - road_type_road_0637
    road_0639 - road_type_road_0639
    road_0640 - road_type_road_0640
    road_0641 - road_type_road_0641
    road_0642 - road_type_road_0642
    road_0643 - road_type_road_0643
    road_0644 - road_type_road_0644
    road_0645 - road_type_road_0645
    road_0647 - road_type_road_0647
    road_0648 - road_type_road_0648
    road_0649 - road_type_road_0649
    road_0650 - road_type_road_0650
    road_0651 - road_type_road_0651
    road_0652 - road_type_road_0652
    road_0653 - road_type_road_0653
    road_0654 - road_type_road_0654
    road_0655 - road_type_road_0655
    road_0656 - road_type_road_0656
    road_0657 - road_type_road_0657
    road_0658 - road_type_road_0658
    road_0659 - road_type_road_0659
    road_0661 - road_type_road_0661
    road_0662 - road_type_road_0662
    road_0664 - road_type_road_0664
    road_0665 - road_type_road_0665
    road_0666 - road_type_road_0666
    road_0667 - road_type_road_0667
    road_0668 - road_type_road_0668
    road_0669 - road_type_road_0669
    road_0670 - road_type_road_0670
    road_0671 - road_type_road_0671
    road_0672 - road_type_road_0672
    road_0673 - road_type_road_0673
    road_0674 - road_type_road_0674
    road_0675 - road_type_road_0675
    road_0676 - road_type_road_0676
    road_0677 - road_type_road_0677
    road_0678 - road_type_road_0678
    road_0679 - road_type_road_0679
    road_0680 - road_type_road_0680
    road_0681 - road_type_road_0681
    road_0682 - road_type_road_0682
    road_0683 - road_type_road_0683
    road_0684 - road_type_road_0684
    road_0685 - road_type_road_0685
    road_0686 - road_type_road_0686
    road_0687 - road_type_road_0687
    road_0688 - road_type_road_0688
    road_0689 - road_type_road_0689
    road_0690 - road_type_road_0690
    road_0691 - road_type_road_0691
    road_0692 - road_type_road_0692
    road_0693 - road_type_road_0693
    road_0694 - road_type_road_0694
    road_0696 - road_type_road_0696
    road_0697 - road_type_road_0697
    road_0698 - road_type_road_0698
    road_0700 - road_type_road_0700
    road_0701 - road_type_road_0701
    road_0702 - road_type_road_0702
    road_0703 - road_type_road_0703
    road_0704 - road_type_road_0704
    road_0705 - road_type_road_0705
    road_0706 - road_type_road_0706
    road_0707 - road_type_road_0707
    road_0708 - road_type_road_0708
    road_0709 - road_type_road_0709
    road_0711 - road_type_road_0711
    road_0712 - road_type_road_0712
    road_0713 - road_type_road_0713
    road_0714 - road_type_road_0714
    road_0715 - road_type_road_0715
    road_0716 - road_type_road_0716
    road_0717 - road_type_road_0717
    road_0718 - road_type_road_0718
    road_0719 - road_type_road_0719
    road_0720 - road_type_road_0720
    road_0722 - road_type_road_0722
    road_0723 - road_type_road_0723
    road_0724 - road_type_road_0724
    road_0725 - road_type_road_0725
    road_0726 - road_type_road_0726
    road_0727 - road_type_road_0727
    road_0728 - road_type_road_0728
    road_0729 - road_type_road_0729
    road_0730 - road_type_road_0730
    road_0732 - road_type_road_0732
    road_0733 - road_type_road_0733
    road_0734 - road_type_road_0734
    road_0735 - road_type_road_0735
    road_0736 - road_type_road_0736
    road_0738 - road_type_road_0738
    road_0739 - road_type_road_0739
    road_0740 - road_type_road_0740
    road_0741 - road_type_road_0741
    road_0742 - road_type_road_0742
    road_0743 - road_type_road_0743
    road_0744 - road_type_road_0744
    road_0745 - road_type_road_0745
    road_0746 - road_type_road_0746
    road_0747 - road_type_road_0747
    road_0749 - road_type_road_0749
    road_0750 - road_type_road_0750
    road_0751 - road_type_road_0751
    road_0752 - road_type_road_0752
    road_0753 - road_type_road_0753
    road_0754 - road_type_road_0754
    road_0756 - road_type_road_0756
    road_0757 - road_type_road_0757
    road_0758 - road_type_road_0758
    road_0759 - road_type_road_0759
    road_0760 - road_type_road_0760
    road_0761 - road_type_road_0761
    road_0762 - road_type_road_0762
    road_0763 - road_type_road_0763
    road_0765 - road_type_road_0765
    road_0766 - road_type_road_0766
    road_0767 - road_type_road_0767
    road_0768 - road_type_road_0768
    road_0769 - road_type_road_0769
    road_0770 - road_type_road_0770
    road_0771 - road_type_road_0771
    road_0772 - road_type_road_0772
    road_0773 - road_type_road_0773
    road_0774 - road_type_road_0774
    road_0775 - road_type_road_0775
    road_0776 - road_type_road_0776
    road_0777 - road_type_road_0777
    road_0778 - road_type_road_0778
    road_0779 - road_type_road_0779
    road_0780 - road_type_road_0780
    road_0781 - road_type_road_0781
    road_0782 - road_type_road_0782
    road_0783 - road_type_road_0783
    road_0784 - road_type_road_0784
    road_0785 - road_type_road_0785
    road_0786 - road_type_road_0786
    road_0787 - road_type_road_0787
    road_0789 - road_type_road_0789
    road_0790 - road_type_road_0790
    road_0791 - road_type_road_0791
    road_0793 - road_type_road_0793
    road_0794 - road_type_road_0794
    road_0795 - road_type_road_0795
    road_0796 - road_type_road_0796
    road_0797 - road_type_road_0797
    road_0798 - road_type_road_0798
    road_0799 - road_type_road_0799
    road_0801 - road_type_road_0801
    road_0802 - road_type_road_0802
    road_0803 - road_type_road_0803
    road_0804 - road_type_road_0804
    road_0805 - road_type_road_0805
    road_0806 - road_type_road_0806
    road_0807 - road_type_road_0807
    road_0808 - road_type_road_0808
    road_0809 - road_type_road_0809
    road_0810 - road_type_road_0810
    road_0811 - road_type_road_0811
    road_0812 - road_type_road_0812
    road_0813 - road_type_road_0813
    road_0814 - road_type_road_0814
    road_0815 - road_type_road_0815
    road_0816 - road_type_road_0816
    road_0817 - road_type_road_0817
    road_0818 - road_type_road_0818
    road_0819 - road_type_road_0819
    road_0820 - road_type_road_0820
    road_0821 - road_type_road_0821
    road_0822 - road_type_road_0822
    road_0823 - road_type_road_0823
    road_0824 - road_type_road_0824
    road_0825 - road_type_road_0825
    road_0826 - road_type_road_0826
    road_0827 - road_type_road_0827
    road_0828 - road_type_road_0828
    road_0834 - road_type_road_0834
    road_0835 - road_type_road_0835
    road_0836 - road_type_road_0836
    road_0838 - road_type_road_0838
    road_0839 - road_type_road_0839
    road_0843 - road_type_road_0843
    road_0844 - road_type_road_0844
    road_0845 - road_type_road_0845
    road_0846 - road_type_road_0846
    road_0847 - road_type_road_0847
    road_0848 - road_type_road_0848
    road_0849 - road_type_road_0849
    road_0851 - road_type_road_0851
    road_0852 - road_type_road_0852
    road_0853 - road_type_road_0853
    road_0854 - road_type_road_0854
    road_0855 - road_type_road_0855
    road_0856 - road_type_road_0856
    road_0857 - road_type_road_0857
    road_0858 - road_type_road_0858
    road_0859 - road_type_road_0859
    road_0860 - road_type_road_0860
    road_0861 - road_type_road_0861




    ;; BEGIN DYNAMIC CONGESTION WINDOWS
    tw_00000 - window_type_tw_00000
    tw_00030 - window_type_tw_00030
    tw_00060 - window_type_tw_00060
    tw_00090 - window_type_tw_00090
    tw_00120 - window_type_tw_00120
    tw_00150 - window_type_tw_00150
    tw_00180 - window_type_tw_00180
    tw_00210 - window_type_tw_00210
    tw_00240 - window_type_tw_00240
    tw_00270 - window_type_tw_00270
    tw_00300 - window_type_tw_00300
    tw_00330 - window_type_tw_00330
    tw_00360 - window_type_tw_00360
    tw_00390 - window_type_tw_00390
    tw_00420 - window_type_tw_00420
    tw_00450 - window_type_tw_00450
    tw_00480 - window_type_tw_00480
    ;; END DYNAMIC CONGESTION WINDOWS
  )

  (:init
  (at car1 loc_0173)
  (= (travel-time car1) 0)
  (connects macro_0000 loc_0003 loc_0257)
  (road-open macro_0000)
  (= (congestion-factor macro_0000) 1.03)
  (connects macro_0001 loc_0025 loc_0016)
  (road-open macro_0001)
  (= (congestion-factor macro_0001) 1.02)
  (connects macro_0002 loc_0031 loc_0215)
  (road-open macro_0002)
  (= (congestion-factor macro_0002) 1.0)
  (connects macro_0003 loc_0031 loc_0268)
  (road-open macro_0003)
  (= (congestion-factor macro_0003) 1.0)
  (connects macro_0004 loc_0038 loc_0144)
  (road-open macro_0004)
  (= (congestion-factor macro_0004) 1.08)
  (connects macro_0005 loc_0039 loc_0159)
  (road-open macro_0005)
  (= (congestion-factor macro_0005) 1.05)
  (connects macro_0006 loc_0041 loc_0043)
  (road-open macro_0006)
  (= (congestion-factor macro_0006) 1.15)
  (connects macro_0007 loc_0043 loc_0041)
  (road-open macro_0007)
  (= (congestion-factor macro_0007) 1.05)
  (connects macro_0008 loc_0050 loc_0053)
  (road-open macro_0008)
  (= (congestion-factor macro_0008) 1.15)
  (connects macro_0009 loc_0055 loc_0372)
  (road-open macro_0009)
  (= (congestion-factor macro_0009) 1.0)
  (connects macro_0010 loc_0060 loc_0138)
  (road-open macro_0010)
  ;; [DYNAMIC EVENT - location closure] loc_0060 incident road
  (road-blocked macro_0010)
  (= (congestion-factor macro_0010) 1.0)
  (connects macro_0011 loc_0066 loc_0062)
  (road-open macro_0011)
  (= (congestion-factor macro_0011) 1.15)
  (connects macro_0012 loc_0073 loc_0461)
  (road-open macro_0012)
  (= (congestion-factor macro_0012) 1.03)
  (connects macro_0013 loc_0093 loc_0168)
  (road-open macro_0013)
  (= (congestion-factor macro_0013) 1.15)
  (connects macro_0014 loc_0107 loc_0336)
  (road-open macro_0014)
  (= (congestion-factor macro_0014) 1.05)
  (connects macro_0015 loc_0107 loc_0029)
  (road-open macro_0015)
  (= (congestion-factor macro_0015) 1.25)
  (connects macro_0016 loc_0110 loc_0142)
  (road-open macro_0016)
  (= (congestion-factor macro_0016) 1.03)
  (connects macro_0017 loc_0135 loc_0121)
  (road-open macro_0017)
  (= (congestion-factor macro_0017) 1.1)
  (connects macro_0018 loc_0138 loc_0060)
  (road-open macro_0018)
  ;; [DYNAMIC EVENT - location closure] loc_0060 incident road
  (road-blocked macro_0018)
  (= (congestion-factor macro_0018) 1.0)
  (connects macro_0019 loc_0152 loc_0149)
  (road-open macro_0019)
  (= (congestion-factor macro_0019) 1.0)
  (connects macro_0020 loc_0152 loc_0149)
  (road-open macro_0020)
  (= (congestion-factor macro_0020) 1.05)
  (connects macro_0021 loc_0167 loc_0365)
  (road-open macro_0021)
  (= (congestion-factor macro_0021) 1.09)
  (connects macro_0022 loc_0170 loc_0460)
  (road-open macro_0022)
  (= (congestion-factor macro_0022) 1.05)
  (connects macro_0023 loc_0170 loc_0045)
  (road-open macro_0023)
  (= (congestion-factor macro_0023) 1.1)
  (connects macro_0024 loc_0175 loc_0190)
  (road-open macro_0024)
  (= (congestion-factor macro_0024) 1.05)
  (connects macro_0025 loc_0183 loc_0188)
  (road-open macro_0025)
  (= (congestion-factor macro_0025) 1.1)
  (connects macro_0026 loc_0184 loc_0096)
  (road-open macro_0026)
  (= (congestion-factor macro_0026) 1.04)
  (connects macro_0027 loc_0199 loc_0428)
  (road-open macro_0027)
  (= (congestion-factor macro_0027) 1.15)
  (connects macro_0028 loc_0221 loc_0140)
  (road-open macro_0028)
  (= (congestion-factor macro_0028) 1.0)
  (connects macro_0029 loc_0222 loc_0223)
  (road-open macro_0029)
  (= (congestion-factor macro_0029) 1.0)
  (connects macro_0030 loc_0242 loc_0148)
  (road-open macro_0030)
  (= (congestion-factor macro_0030) 1.0)
  (connects macro_0031 loc_0246 loc_0334)
  (road-open macro_0031)
  (= (congestion-factor macro_0031) 1.11)
  (connects macro_0032 loc_0250 loc_0345)
  (road-open macro_0032)
  (= (congestion-factor macro_0032) 1.02)
  (connects macro_0033 loc_0257 loc_0003)
  (road-open macro_0033)
  (= (congestion-factor macro_0033) 1.06)
  (connects macro_0034 loc_0261 loc_0294)
  (road-open macro_0034)
  (= (congestion-factor macro_0034) 1.06)
  (connects macro_0035 loc_0280 loc_0115)
  (road-open macro_0035)
  (= (congestion-factor macro_0035) 1.1)
  (connects macro_0036 loc_0299 loc_0499)
  (road-open macro_0036)
  (= (congestion-factor macro_0036) 1.0)
  (connects macro_0037 loc_0300 loc_0433)
  (road-open macro_0037)
  (= (congestion-factor macro_0037) 1.1)
  (connects macro_0038 loc_0314 loc_0327)
  (road-open macro_0038)
  (= (congestion-factor macro_0038) 1.05)
  (connects macro_0039 loc_0328 loc_0184)
  (road-open macro_0039)
  (= (congestion-factor macro_0039) 1.08)
  (connects macro_0040 loc_0331 loc_0008)
  (road-open macro_0040)
  (= (congestion-factor macro_0040) 1.0)
  (connects macro_0041 loc_0331 loc_0318)
  (road-open macro_0041)
  (= (congestion-factor macro_0041) 1.05)
  (connects macro_0042 loc_0336 loc_0107)
  (road-open macro_0042)
  (= (congestion-factor macro_0042) 1.0)
  (connects macro_0043 loc_0348 loc_0085)
  (road-open macro_0043)
  (= (congestion-factor macro_0043) 1.05)
  (connects macro_0044 loc_0366 loc_0422)
  (road-open macro_0044)
  (= (congestion-factor macro_0044) 1.05)
  (connects macro_0045 loc_0370 loc_0179)
  (road-open macro_0045)
  (= (congestion-factor macro_0045) 1.25)
  (connects macro_0046 loc_0374 loc_0357)
  (road-open macro_0046)
  (= (congestion-factor macro_0046) 1.05)
  (connects macro_0047 loc_0419 loc_0362)
  (road-open macro_0047)
  (= (congestion-factor macro_0047) 1.05)
  (connects macro_0048 loc_0425 loc_0424)
  (road-open macro_0048)
  (= (congestion-factor macro_0048) 1.11)
  (connects macro_0049 loc_0429 loc_0229)
  (road-open macro_0049)
  (= (congestion-factor macro_0049) 1.04)
  (connects macro_0050 loc_0445 loc_0211)
  (road-open macro_0050)
  (= (congestion-factor macro_0050) 1.05)
  (connects macro_0051 loc_0458 loc_0203)
  (road-open macro_0051)
  (= (congestion-factor macro_0051) 1.0)
  (connects macro_0052 loc_0479 loc_0480)
  (road-open macro_0052)
  (= (congestion-factor macro_0052) 1.1)
  (connects macro_0053 loc_0480 loc_0240)
  (road-open macro_0053)
  (= (congestion-factor macro_0053) 1.05)
  (connects macro_0054 loc_0480 loc_0362)
  (road-open macro_0054)
  (= (congestion-factor macro_0054) 1.05)
  (connects macro_0055 loc_0482 loc_0485)
  (road-open macro_0055)
  (= (congestion-factor macro_0055) 1.1)
  (connects macro_0056 loc_0488 loc_0153)
  (road-open macro_0056)
  (= (congestion-factor macro_0056) 1.0)
  (connects macro_0057 loc_0488 loc_0153)
  (road-open macro_0057)
  (= (congestion-factor macro_0057) 1.1)
  (connects macro_0058 loc_0493 loc_0286)
  (road-open macro_0058)
  (= (congestion-factor macro_0058) 1.04)
  (connects road_0000 loc_0001 loc_0434)
  (road-open road_0000)
  (= (congestion-factor road_0000) 1.0)
  (connects road_0001 loc_0001 loc_0012)
  (road-open road_0001)
  (= (congestion-factor road_0001) 1.05)
  (connects road_0002 loc_0002 loc_0037)
  (road-open road_0002)
  (= (congestion-factor road_0002) 1.0)
  (connects road_0003 loc_0003 loc_0238)
  (road-open road_0003)
  (= (congestion-factor road_0003) 1.03)
  (connects road_0004 loc_0003 loc_0347)
  (road-open road_0004)
  (= (congestion-factor road_0004) 1.09)
  (connects road_0006 loc_0004 loc_0108)
  (road-open road_0006)
  (= (congestion-factor road_0006) 1.0)
  (connects road_0007 loc_0004 loc_0002)
  (road-open road_0007)
  (= (congestion-factor road_0007) 1.0)
  (connects road_0008 loc_0005 loc_0007)
  (road-open road_0008)
  (= (congestion-factor road_0008) 1.02)
  (connects road_0009 loc_0005 loc_0004)
  (road-open road_0009)
  (= (congestion-factor road_0009) 1.0)
  (connects road_0010 loc_0006 loc_0125)
  (road-open road_0010)
  (= (congestion-factor road_0010) 1.15)
  (connects road_0011 loc_0007 loc_0320)
  (road-open road_0011)
  (= (congestion-factor road_0011) 1.04)
  (connects road_0012 loc_0009 loc_0111)
  (road-open road_0012)
  (= (congestion-factor road_0012) 1.0)
  (connects road_0013 loc_0009 loc_0007)
  (road-open road_0013)
  (= (congestion-factor road_0013) 1.05)
  (connects road_0014 loc_0010 loc_0374)
  (road-open road_0014)
  (= (congestion-factor road_0014) 1.05)
  (connects road_0015 loc_0011 loc_0223)
  (road-open road_0015)
  (= (congestion-factor road_0015) 1.0)
  (connects road_0016 loc_0012 loc_0495)
  (road-open road_0016)
  (= (congestion-factor road_0016) 1.05)
  (connects road_0017 loc_0012 loc_0001)
  (road-open road_0017)
  (= (congestion-factor road_0017) 1.0)
  (connects road_0018 loc_0013 loc_0470)
  (road-open road_0018)
  (= (congestion-factor road_0018) 1.09)
  (connects road_0019 loc_0014 loc_0184)
  (road-open road_0019)
  (= (congestion-factor road_0019) 1.02)
  (connects road_0020 loc_0015 loc_0323)
  (road-open road_0020)
  (= (congestion-factor road_0020) 1.1)
  (connects road_0021 loc_0015 loc_0373)
  (road-open road_0021)
  (= (congestion-factor road_0021) 1.0)
  (connects road_0022 loc_0016 loc_0147)
  (road-open road_0022)
  (= (congestion-factor road_0022) 1.02)
  (connects road_0023 loc_0016 loc_0019)
  (road-open road_0023)
  (= (congestion-factor road_0023) 1.0)
  (connects road_0024 loc_0017 loc_0018)
  (road-open road_0024)
  (= (congestion-factor road_0024) 1.06)
  (connects road_0025 loc_0017 loc_0261)
  (road-open road_0025)
  (= (congestion-factor road_0025) 1.06)
  (connects road_0026 loc_0017 loc_0076)
  (road-open road_0026)
  (= (congestion-factor road_0026) 1.06)
  (connects road_0027 loc_0018 loc_0105)
  (road-open road_0027)
  (= (congestion-factor road_0027) 1.16)
  (connects road_0028 loc_0019 loc_0016)
  (road-open road_0028)
  (= (congestion-factor road_0028) 1.0)
  (connects road_0029 loc_0020 loc_0455)
  (road-open road_0029)
  (= (congestion-factor road_0029) 1.0)
  (connects road_0030 loc_0020 loc_0013)
  (road-open road_0030)
  (= (congestion-factor road_0030) 1.06)
  (connects road_0031 loc_0021 loc_0257)
  (road-open road_0031)
  (= (congestion-factor road_0031) 1.0)
  (connects road_0032 loc_0021 loc_0255)
  (road-open road_0032)
  (= (congestion-factor road_0032) 1.0)
  (connects road_0033 loc_0021 loc_0379)
  (road-open road_0033)
  (= (congestion-factor road_0033) 1.15)
  (connects road_0034 loc_0022 loc_0266)
  (road-open road_0034)
  (= (congestion-factor road_0034) 1.15)
  (connects road_0035 loc_0022 loc_0075)
  (road-open road_0035)
  (= (congestion-factor road_0035) 1.0)
  (connects road_0036 loc_0022 loc_0317)
  (road-open road_0036)
  (= (congestion-factor road_0036) 1.1)
  (connects road_0037 loc_0023 loc_0424)
  (road-open road_0037)
  (= (congestion-factor road_0037) 1.0)
  (connects road_0038 loc_0024 loc_0227)
  (road-open road_0038)
  (= (congestion-factor road_0038) 1.0)
  (connects road_0039 loc_0025 loc_0446)
  (road-open road_0039)
  (= (congestion-factor road_0039) 1.15)
  (connects road_0042 loc_0027 loc_0426)
  (road-open road_0042)
  (= (congestion-factor road_0042) 1.09)
  (connects road_0043 loc_0028 loc_0425)
  (road-open road_0043)
  (= (congestion-factor road_0043) 1.06)
  (connects road_0044 loc_0028 loc_0392)
  (road-open road_0044)
  (= (congestion-factor road_0044) 1.03)
  (connects road_0045 loc_0029 loc_0041)
  (road-open road_0045)
  (= (congestion-factor road_0045) 1.2)
  (connects road_0046 loc_0029 loc_0171)
  (road-open road_0046)
  (= (congestion-factor road_0046) 1.05)
  (connects road_0047 loc_0030 loc_0062)
  (road-open road_0047)
  (= (congestion-factor road_0047) 1.0)
  (connects road_0050 loc_0032 loc_0043)
  (road-open road_0050)
  (= (congestion-factor road_0050) 1.0)
  (connects road_0051 loc_0032 loc_0041)
  (road-open road_0051)
  (= (congestion-factor road_0051) 1.0)
  (connects road_0052 loc_0033 loc_0496)
  (road-open road_0052)
  (= (congestion-factor road_0052) 1.12)
  (connects road_0053 loc_0034 loc_0044)
  (road-open road_0053)
  (= (congestion-factor road_0053) 1.0)
  (connects road_0054 loc_0035 loc_0487)
  (road-open road_0054)
  (= (congestion-factor road_0054) 1.0)
  (connects road_0056 loc_0037 loc_0261)
  (road-open road_0056)
  (= (congestion-factor road_0056) 1.0)
  (connects road_0057 loc_0037 loc_0309)
  (road-open road_0057)
  (= (congestion-factor road_0057) 1.0)
  (connects road_0058 loc_0038 loc_0048)
  (road-open road_0058)
  (= (congestion-factor road_0058) 1.2)
  (connects road_0061 loc_0039 loc_0119)
  (road-open road_0061)
  (= (congestion-factor road_0061) 1.0)
  (connects road_0062 loc_0040 loc_0145)
  (road-open road_0062)
  (= (congestion-factor road_0062) 1.0)
  (connects road_0063 loc_0040 loc_0136)
  (road-open road_0063)
  (= (congestion-factor road_0063) 1.05)
  (connects road_0064 loc_0040 loc_0279)
  (road-open road_0064)
  (= (congestion-factor road_0064) 1.0)
  (connects road_0065 loc_0040 loc_0175)
  (road-open road_0065)
  (= (congestion-factor road_0065) 1.05)
  (connects road_0066 loc_0041 loc_0450)
  (road-open road_0066)
  (= (congestion-factor road_0066) 1.15)
  (connects road_0067 loc_0041 loc_0029)
  (road-open road_0067)
  (= (congestion-factor road_0067) 1.1)
  (connects road_0069 loc_0042 loc_0093)
  (road-open road_0069)
  (= (congestion-factor road_0069) 1.0)
  (connects road_0070 loc_0042 loc_0043)
  (road-open road_0070)
  (= (congestion-factor road_0070) 1.15)
  (connects road_0071 loc_0042 loc_0171)
  (road-open road_0071)
  (= (congestion-factor road_0071) 1.05)
  (connects road_0072 loc_0043 loc_0000)
  (road-open road_0072)
  (= (congestion-factor road_0072) 1.1)
  (connects road_0074 loc_0043 loc_0042)
  (road-open road_0074)
  (= (congestion-factor road_0074) 1.05)
  (connects road_0075 loc_0044 loc_0027)
  (road-open road_0075)
  (= (congestion-factor road_0075) 1.03)
  (connects road_0076 loc_0044 loc_0034)
  (road-open road_0076)
  (= (congestion-factor road_0076) 1.11)
  (connects road_0077 loc_0045 loc_0168)
  (road-open road_0077)
  (= (congestion-factor road_0077) 1.05)
  (connects road_0078 loc_0045 loc_0163)
  (road-open road_0078)
  (= (congestion-factor road_0078) 1.05)
  (connects road_0079 loc_0046 loc_0355)
  (road-open road_0079)
  (= (congestion-factor road_0079) 1.0)
  (connects road_0080 loc_0047 loc_0050)
  (road-open road_0080)
  (= (congestion-factor road_0080) 1.17)
  (connects road_0081 loc_0047 loc_0496)
  (road-open road_0081)
  (= (congestion-factor road_0081) 1.14)
  (connects road_0082 loc_0048 loc_0047)
  (road-open road_0082)
  (= (congestion-factor road_0082) 1.0)
  (connects road_0083 loc_0049 loc_0053)
  (road-open road_0083)
  (= (congestion-factor road_0083) 1.1)
  (connects road_0084 loc_0049 loc_0033)
  (road-open road_0084)
  (= (congestion-factor road_0084) 1.06)
  (connects road_0086 loc_0050 loc_0069)
  (road-open road_0086)
  (= (congestion-factor road_0086) 1.1)
  (connects road_0087 loc_0050 loc_0491)
  (road-open road_0087)
  (= (congestion-factor road_0087) 1.03)
  (connects road_0088 loc_0050 loc_0047)
  (road-open road_0088)
  (= (congestion-factor road_0088) 1.03)
  (connects road_0089 loc_0051 loc_0235)
  (road-open road_0089)
  (= (congestion-factor road_0089) 1.05)
  (connects road_0090 loc_0051 loc_0270)
  (road-open road_0090)
  (= (congestion-factor road_0090) 1.03)
  (connects road_0091 loc_0051 loc_0214)
  (road-open road_0091)
  (= (congestion-factor road_0091) 1.11)
  (connects road_0092 loc_0052 loc_0097)
  (road-open road_0092)
  (= (congestion-factor road_0092) 1.0)
  (connects road_0093 loc_0053 loc_0057)
  (road-open road_0093)
  (= (congestion-factor road_0093) 1.15)
  (connects road_0094 loc_0053 loc_0086)
  (road-open road_0094)
  (= (congestion-factor road_0094) 2.5)  ;; [DYNAMIC EVENT - slowdown] Minor slowdown on road_0094 connecting loc_0053–loc_0086, a short segment near the axis, reducing speed by factor 2.5.
  (connects road_0095 loc_0055 loc_0374)
  (road-open road_0095)
  (= (congestion-factor road_0095) 1.1)
  (connects road_0097 loc_0056 loc_0186)
  (road-open road_0097)
  (= (congestion-factor road_0097) 1.15)
  (connects road_0098 loc_0057 loc_0486)
  (road-open road_0098)
  (= (congestion-factor road_0098) 1.09)
  (connects road_0099 loc_0057 loc_0387)
  (road-open road_0099)
  (= (congestion-factor road_0099) 1.09)
  (connects road_0100 loc_0058 loc_0013)
  (road-open road_0100)
  (= (congestion-factor road_0100) 1.05)
  (connects road_0101 loc_0059 loc_0286)
  (road-open road_0101)
  (= (congestion-factor road_0101) 1.0)
  (connects road_0102 loc_0060 loc_0475)
  (road-open road_0102)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at hub loc_0060 closing four main links (roads 0102, 0116, 0230, 0104) that lie close to the straight line between start and goal, forcing vehicles to detour around this central node.
  (road-blocked road_0102)
  (= (congestion-factor road_0102) 1.0)
  (connects road_0104 loc_0060 loc_0057)
  (road-open road_0104)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at hub loc_0060 closing four main links (roads 0102, 0116, 0230, 0104) that lie close to the straight line between start and goal, forcing vehicles to detour around this central node.
  (road-blocked road_0104)
  (= (congestion-factor road_0104) 1.0)
  (connects road_0105 loc_0061 loc_0229)
  (road-open road_0105)
  (= (congestion-factor road_0105) 1.0)
  (connects road_0106 loc_0062 loc_0477)
  (road-open road_0106)
  (= (congestion-factor road_0106) 1.05)
  (connects road_0107 loc_0062 loc_0030)
  (road-open road_0107)
  (= (congestion-factor road_0107) 1.05)
  (connects road_0108 loc_0063 loc_0421)
  (road-open road_0108)
  (= (congestion-factor road_0108) 1.08)
  (connects road_0109 loc_0063 loc_0351)
  (road-open road_0109)
  (= (congestion-factor road_0109) 1.09)
  (connects road_0110 loc_0064 loc_0422)
  (road-open road_0110)
  (= (congestion-factor road_0110) 1.1)
  (connects road_0111 loc_0065 loc_0299)
  (road-open road_0111)
  (= (congestion-factor road_0111) 1.0)
  (connects road_0112 loc_0065 loc_0499)
  (road-open road_0112)
  (= (congestion-factor road_0112) 1.0)
  (connects road_0114 loc_0066 loc_0079)
  (road-open road_0114)
  (= (congestion-factor road_0114) 1.0)
  (connects road_0115 loc_0066 loc_0483)
  (road-open road_0115)
  (= (congestion-factor road_0115) 1.0)
  (connects road_0116 loc_0067 loc_0060)
  (road-open road_0116)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at hub loc_0060 closing four main links (roads 0102, 0116, 0230, 0104) that lie close to the straight line between start and goal, forcing vehicles to detour around this central node.
  (road-blocked road_0116)
  (= (congestion-factor road_0116) 1.0)
  (connects road_0117 loc_0068 loc_0097)
  (road-open road_0117)
  (= (congestion-factor road_0117) 1.0)
  (connects road_0118 loc_0068 loc_0176)
  (road-open road_0118)
  (= (congestion-factor road_0118) 1.11)
  (connects road_0119 loc_0068 loc_0125)
  (road-open road_0119)
  (= (congestion-factor road_0119) 1.03)
  (connects road_0120 loc_0069 loc_0431)
  (road-open road_0120)
  (= (congestion-factor road_0120) 1.05)
  (connects road_0121 loc_0069 loc_0431)
  (road-open road_0121)
  (= (congestion-factor road_0121) 1.1)
  (connects road_0122 loc_0070 loc_0451)
  (road-open road_0122)
  (= (congestion-factor road_0122) 1.17)
  (connects road_0123 loc_0071 loc_0074)
  (road-open road_0123)
  ;; [DYNAMIC EVENT - location closure] loc_0074 incident road
  (road-blocked road_0123)
  (= (congestion-factor road_0123) 1.0)
  (connects road_0124 loc_0071 loc_0245)
  (road-open road_0124)
  (= (congestion-factor road_0124) 1.06)
  (connects road_0125 loc_0071 loc_0381)
  (road-open road_0125)
  (= (congestion-factor road_0125) 1.0)
  (connects road_0126 loc_0071 loc_0260)
  (road-open road_0126)
  (= (congestion-factor road_0126) 1.09)
  (connects road_0127 loc_0072 loc_0174)
  (road-open road_0127)
  (= (congestion-factor road_0127) 1.0)
  (connects road_0128 loc_0072 loc_0073)
  (road-open road_0128)
  (= (congestion-factor road_0128) 1.03)
  (connects road_0129 loc_0073 loc_0072)
  (road-open road_0129)
  (= (congestion-factor road_0129) 1.03)
  (connects road_0131 loc_0074 loc_0244)
  (road-open road_0131)
  ;; [DYNAMIC EVENT - location closure] loc_0074 incident road
  (road-blocked road_0131)
  (= (congestion-factor road_0131) 1.0)
  (connects road_0132 loc_0074 loc_0361)
  (road-open road_0132)
  ;; [DYNAMIC EVENT - location closure] loc_0074 incident road
  (road-blocked road_0132)
  (= (congestion-factor road_0132) 1.0)
  (connects road_0133 loc_0074 loc_0080)
  (road-open road_0133)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (road-blocked road_0133)
  (= (congestion-factor road_0133) 1.0)
  (connects road_0134 loc_0074 loc_0071)
  (road-open road_0134)
  ;; [DYNAMIC EVENT - location closure] loc_0074 incident road
  (road-blocked road_0134)
  (= (congestion-factor road_0134) 1.0)
  (connects road_0135 loc_0075 loc_0022)
  (road-open road_0135)
  (= (congestion-factor road_0135) 1.1)
  (connects road_0136 loc_0075 loc_0076)
  (road-open road_0136)
  (= (congestion-factor road_0136) 1.08)
  (connects road_0137 loc_0076 loc_0156)
  (road-open road_0137)
  (= (congestion-factor road_0137) 1.06)
  (connects road_0138 loc_0076 loc_0017)
  (road-open road_0138)
  (= (congestion-factor road_0138) 1.04)
  (connects road_0139 loc_0077 loc_0377)
  (road-open road_0139)
  (= (congestion-factor road_0139) 1.03)
  (connects road_0140 loc_0077 loc_0394)
  (road-open road_0140)
  (= (congestion-factor road_0140) 1.08)
  (connects road_0141 loc_0077 loc_0387)
  (road-open road_0141)
  (= (congestion-factor road_0141) 1.09)
  (connects road_0142 loc_0078 loc_0038)
  (road-open road_0142)
  (= (congestion-factor road_0142) 1.12)
  (connects road_0143 loc_0078 loc_0047)
  (road-open road_0143)
  (= (congestion-factor road_0143) 1.09)
  (connects road_0144 loc_0079 loc_0067)
  (road-open road_0144)
  (= (congestion-factor road_0144) 1.0)
  (connects road_0145 loc_0080 loc_0479)
  (road-open road_0145)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (road-blocked road_0145)
  (= (congestion-factor road_0145) 1.0)
  (connects road_0146 loc_0080 loc_0079)
  (road-open road_0146)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (road-blocked road_0146)
  (= (congestion-factor road_0146) 1.0)
  (connects road_0147 loc_0080 loc_0074)
  (road-open road_0147)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (road-blocked road_0147)
  (= (congestion-factor road_0147) 1.0)
  (connects road_0148 loc_0081 loc_0087)
  (road-open road_0148)
  (= (congestion-factor road_0148) 1.0)
  (connects road_0149 loc_0082 loc_0395)
  (road-open road_0149)
  (= (congestion-factor road_0149) 1.0)
  (connects road_0150 loc_0083 loc_0227)
  (road-open road_0150)
  (= (congestion-factor road_0150) 1.03)
  (connects road_0151 loc_0083 loc_0103)
  (road-open road_0151)
  (= (congestion-factor road_0151) 1.1)
  (connects road_0152 loc_0084 loc_0307)
  (road-open road_0152)
  (= (congestion-factor road_0152) 1.02)
  (connects road_0153 loc_0084 loc_0312)
  (road-open road_0153)
  (= (congestion-factor road_0153) 1.09)
  (connects road_0154 loc_0084 loc_0377)
  (road-open road_0154)
  (= (congestion-factor road_0154) 1.03)
  (connects road_0155 loc_0084 loc_0389)
  (road-open road_0155)
  (= (congestion-factor road_0155) 1.08)
  (connects road_0156 loc_0085 loc_0252)
  (road-open road_0156)
  (= (congestion-factor road_0156) 1.05)
  (connects road_0157 loc_0085 loc_0208)
  (road-open road_0157)
  (= (congestion-factor road_0157) 1.1)
  (connects road_0159 loc_0087 loc_0081)
  (road-open road_0159)
  (= (congestion-factor road_0159) 1.1)
  (connects road_0160 loc_0087 loc_0412)
  (road-open road_0160)
  (= (congestion-factor road_0160) 1.06)
  (connects road_0161 loc_0088 loc_0476)
  (road-open road_0161)
  ;; [DYNAMIC EVENT - accident] Accident completely blocks road_0161 between loc_0088 and loc_0476, a low‑distance segment near the axis.
  (road-blocked road_0161)
  (= (congestion-factor road_0161) 1.0)
  (connects road_0162 loc_0089 loc_0483)
  (road-open road_0162)
  (= (congestion-factor road_0162) 1.0)
  (connects road_0163 loc_0090 loc_0118)
  (road-open road_0163)
  (= (congestion-factor road_0163) 1.0)
  (connects road_0164 loc_0090 loc_0378)
  (road-open road_0164)
  (= (congestion-factor road_0164) 1.03)
  (connects road_0165 loc_0091 loc_0168)
  (road-open road_0165)
  (= (congestion-factor road_0165) 1.05)
  (connects road_0166 loc_0092 loc_0491)
  (road-open road_0166)
  (= (congestion-factor road_0166) 1.0)
  (connects road_0167 loc_0092 loc_0094)
  (road-open road_0167)
  (= (congestion-factor road_0167) 1.06)
  (connects road_0169 loc_0093 loc_0205)
  (road-open road_0169)
  (= (congestion-factor road_0169) 1.05)
  (connects road_0170 loc_0094 loc_0489)
  (road-open road_0170)
  (= (congestion-factor road_0170) 1.09)
  (connects road_0171 loc_0095 loc_0269)
  (road-open road_0171)
  (= (congestion-factor road_0171) 1.0)
  (connects road_0172 loc_0097 loc_0052)
  (road-open road_0172)
  (= (congestion-factor road_0172) 1.0)
  (connects road_0173 loc_0097 loc_0182)
  (road-open road_0173)
  (= (congestion-factor road_0173) 1.0)
  (connects road_0174 loc_0098 loc_0096)
  (road-open road_0174)
  (= (congestion-factor road_0174) 1.0)
  (connects road_0175 loc_0099 loc_0179)
  (road-open road_0175)
  (= (congestion-factor road_0175) 1.0)
  (connects road_0176 loc_0100 loc_0497)
  (road-open road_0176)
  (= (congestion-factor road_0176) 1.0)
  (connects road_0177 loc_0101 loc_0428)
  (road-open road_0177)
  (= (congestion-factor road_0177) 1.05)
  (connects road_0178 loc_0102 loc_0100)
  (road-open road_0178)
  (= (congestion-factor road_0178) 1.05)
  (connects road_0179 loc_0102 loc_0181)
  (road-open road_0179)
  (= (congestion-factor road_0179) 1.05)
  (connects road_0180 loc_0103 loc_0370)
  (road-open road_0180)
  (= (congestion-factor road_0180) 1.0)
  (connects road_0181 loc_0104 loc_0349)
  (road-open road_0181)
  (= (congestion-factor road_0181) 1.11)
  (connects road_0182 loc_0105 loc_0022)
  (road-open road_0182)
  (= (congestion-factor road_0182) 1.04)
  (connects road_0183 loc_0105 loc_0106)
  (road-open road_0183)
  (= (congestion-factor road_0183) 1.0)
  (connects road_0184 loc_0106 loc_0105)
  (road-open road_0184)
  (= (congestion-factor road_0184) 1.0)
  (connects road_0187 loc_0108 loc_0009)
  (road-open road_0187)
  (= (congestion-factor road_0187) 1.05)
  (connects road_0188 loc_0108 loc_0109)
  (road-open road_0188)
  (= (congestion-factor road_0188) 1.1)
  (connects road_0189 loc_0109 loc_0108)
  (road-open road_0189)
  (= (congestion-factor road_0189) 1.0)
  (connects road_0191 loc_0110 loc_0444)
  (road-open road_0191)
  (= (congestion-factor road_0191) 1.05)
  (connects road_0192 loc_0111 loc_0009)
  (road-open road_0192)
  (= (congestion-factor road_0192) 1.0)
  (connects road_0193 loc_0113 loc_0039)
  (road-open road_0193)
  (= (congestion-factor road_0193) 1.03)
  (connects road_0194 loc_0114 loc_0492)
  (road-open road_0194)
  (= (congestion-factor road_0194) 1.1)
  (connects road_0195 loc_0114 loc_0194)
  (road-open road_0195)
  (= (congestion-factor road_0195) 1.03)
  (connects road_0196 loc_0115 loc_0216)
  (road-open road_0196)
  (= (congestion-factor road_0196) 1.29)
  (connects road_0197 loc_0116 loc_0146)
  (road-open road_0197)
  (= (congestion-factor road_0197) 1.06)
  (connects road_0198 loc_0116 loc_0239)
  (road-open road_0198)
  (= (congestion-factor road_0198) 1.03)
  (connects road_0199 loc_0116 loc_0267)
  (road-open road_0199)
  (= (congestion-factor road_0199) 1.03)
  (connects road_0200 loc_0117 loc_0393)
  (road-open road_0200)
  (= (congestion-factor road_0200) 1.08)
  (connects road_0201 loc_0118 loc_0119)
  (road-open road_0201)
  (= (congestion-factor road_0201) 1.05)
  (connects road_0202 loc_0118 loc_0159)
  (road-open road_0202)
  (= (congestion-factor road_0202) 1.0)
  (connects road_0203 loc_0119 loc_0193)
  (road-open road_0203)
  (= (congestion-factor road_0203) 1.06)
  (connects road_0204 loc_0120 loc_0178)
  (road-open road_0204)
  (= (congestion-factor road_0204) 1.0)
  (connects road_0205 loc_0121 loc_0460)
  (road-open road_0205)
  (= (congestion-factor road_0205) 1.1)
  (connects road_0206 loc_0122 loc_0451)
  (road-open road_0206)
  (= (congestion-factor road_0206) 1.0)
  (connects road_0207 loc_0123 loc_0075)
  (road-open road_0207)
  (= (congestion-factor road_0207) 1.1)
  (connects road_0208 loc_0123 loc_0399)
  (road-open road_0208)
  (= (congestion-factor road_0208) 1.03)
  (connects road_0209 loc_0123 loc_0176)
  (road-open road_0209)
  (= (congestion-factor road_0209) 1.0)
  (connects road_0210 loc_0124 loc_0283)
  (road-open road_0210)
  (= (congestion-factor road_0210) 1.17)
  (connects road_0211 loc_0125 loc_0068)
  (road-open road_0211)
  (= (congestion-factor road_0211) 1.09)
  (connects road_0212 loc_0125 loc_0126)
  (road-open road_0212)
  (= (congestion-factor road_0212) 1.17)
  (connects road_0213 loc_0126 loc_0006)
  (road-open road_0213)
  (= (congestion-factor road_0213) 1.05)
  (connects road_0214 loc_0126 loc_0125)
  (road-open road_0214)
  (= (congestion-factor road_0214) 1.06)
  (connects road_0215 loc_0126 loc_0416)
  (road-open road_0215)
  (= (congestion-factor road_0215) 1.17)
  (connects road_0216 loc_0127 loc_0380)
  (road-open road_0216)
  (= (congestion-factor road_0216) 1.25)
  (connects road_0217 loc_0127 loc_0155)
  (road-open road_0217)
  (= (congestion-factor road_0217) 1.0)
  (connects road_0219 loc_0129 loc_0235)
  (road-open road_0219)
  (= (congestion-factor road_0219) 1.05)
  (connects road_0220 loc_0131 loc_0479)
  (road-open road_0220)
  (= (congestion-factor road_0220) 1.1)
  (connects road_0221 loc_0131 loc_0480)
  (road-open road_0221)
  (= (congestion-factor road_0221) 1.0)
  (connects road_0222 loc_0132 loc_0211)
  (road-open road_0222)
  (= (congestion-factor road_0222) 1.0)
  (connects road_0223 loc_0133 loc_0196)
  (road-open road_0223)
  (= (congestion-factor road_0223) 1.06)
  (connects road_0224 loc_0133 loc_0112)
  (road-open road_0224)
  (= (congestion-factor road_0224) 1.03)
  (connects road_0225 loc_0134 loc_0319)
  (road-open road_0225)
  (= (congestion-factor road_0225) 1.14)
  (connects road_0227 loc_0135 loc_0172)
  (road-open road_0227)
  (= (congestion-factor road_0227) 1.05)
  (connects road_0228 loc_0136 loc_0254)
  (road-open road_0228)
  (= (congestion-factor road_0228) 1.2)
  (connects road_0230 loc_0137 loc_0060)
  (road-open road_0230)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at hub loc_0060 closing four main links (roads 0102, 0116, 0230, 0104) that lie close to the straight line between start and goal, forcing vehicles to detour around this central node.
  (road-blocked road_0230)
  (= (congestion-factor road_0230) 1.0)
  (connects road_0232 loc_0138 loc_0274)
  (road-open road_0232)
  (= (congestion-factor road_0232) 1.09)
  (connects road_0233 loc_0139 loc_0145)
  (road-open road_0233)
  (= (congestion-factor road_0233) 1.06)
  (connects road_0234 loc_0139 loc_0134)
  (road-open road_0234)
  (= (congestion-factor road_0234) 1.09)
  (connects road_0235 loc_0140 loc_0259)
  (road-open road_0235)
  (= (congestion-factor road_0235) 1.2)
  (connects road_0236 loc_0140 loc_0437)
  (road-open road_0236)
  (= (congestion-factor road_0236) 1.0)
  (connects road_0237 loc_0141 loc_0110)
  (road-open road_0237)
  (= (congestion-factor road_0237) 1.03)
  (connects road_0238 loc_0141 loc_0269)
  (road-open road_0238)
  (= (congestion-factor road_0238) 1.03)
  (connects road_0239 loc_0142 loc_0415)
  (road-open road_0239)
  (= (congestion-factor road_0239) 1.14)
  (connects road_0240 loc_0143 loc_0444)
  (road-open road_0240)
  (= (congestion-factor road_0240) 1.0)
  (connects road_0241 loc_0143 loc_0142)
  (road-open road_0241)
  (= (congestion-factor road_0241) 1.15)
  (connects road_0242 loc_0144 loc_0391)
  (road-open road_0242)
  (= (congestion-factor road_0242) 1.04)
  (connects road_0243 loc_0144 loc_0230)
  (road-open road_0243)
  (= (congestion-factor road_0243) 1.09)
  (connects road_0244 loc_0145 loc_0040)
  (road-open road_0244)
  (= (congestion-factor road_0244) 1.03)
  (connects road_0245 loc_0145 loc_0134)
  (road-open road_0245)
  (= (congestion-factor road_0245) 1.06)
  (connects road_0246 loc_0146 loc_0249)
  (road-open road_0246)
  (= (congestion-factor road_0246) 1.14)
  (connects road_0247 loc_0148 loc_0338)
  (road-open road_0247)
  (= (congestion-factor road_0247) 1.0)
  (connects road_0248 loc_0148 loc_0149)
  (road-open road_0248)
  (= (congestion-factor road_0248) 1.05)
  (connects road_0249 loc_0149 loc_0263)
  (road-open road_0249)
  (= (congestion-factor road_0249) 1.05)
  (connects road_0250 loc_0149 loc_0148)
  (road-open road_0250)
  (= (congestion-factor road_0250) 1.0)
  (connects road_0251 loc_0149 loc_0488)
  (road-open road_0251)
  (= (congestion-factor road_0251) 1.1)
  (connects road_0252 loc_0150 loc_0154)
  (road-open road_0252)
  (= (congestion-factor road_0252) 1.0)
  (connects road_0253 loc_0150 loc_0135)
  (road-open road_0253)
  (= (congestion-factor road_0253) 1.05)
  (connects road_0254 loc_0151 loc_0072)
  (road-open road_0254)
  (= (congestion-factor road_0254) 1.03)
  (connects road_0257 loc_0152 loc_0153)
  (road-open road_0257)
  (= (congestion-factor road_0257) 1.0)
  (connects road_0258 loc_0153 loc_0152)
  (road-open road_0258)
  (= (congestion-factor road_0258) 1.05)
  (connects road_0259 loc_0153 loc_0287)
  (road-open road_0259)
  (= (congestion-factor road_0259) 1.04)
  (connects road_0260 loc_0154 loc_0157)
  (road-open road_0260)
  (= (congestion-factor road_0260) 1.02)
  (connects road_0261 loc_0155 loc_0416)
  (road-open road_0261)
  (= (congestion-factor road_0261) 1.09)
  (connects road_0262 loc_0156 loc_0473)
  (road-open road_0262)
  (= (congestion-factor road_0262) 1.1)
  (connects road_0263 loc_0156 loc_0457)
  (road-open road_0263)
  (= (congestion-factor road_0263) 1.1)
  (connects road_0264 loc_0157 loc_0164)
  (road-open road_0264)
  (= (congestion-factor road_0264) 1.08)
  (connects road_0265 loc_0158 loc_0156)
  (road-open road_0265)
  (= (congestion-factor road_0265) 1.2)
  (connects road_0266 loc_0159 loc_0378)
  (road-open road_0266)
  (= (congestion-factor road_0266) 1.0)
  (connects road_0267 loc_0160 loc_0248)
  (road-open road_0267)
  (= (congestion-factor road_0267) 1.06)
  (connects road_0268 loc_0161 loc_0158)
  (road-open road_0268)
  (= (congestion-factor road_0268) 1.05)
  (connects road_0269 loc_0161 loc_0085)
  (road-open road_0269)
  (= (congestion-factor road_0269) 1.0)
  (connects road_0270 loc_0162 loc_0008)
  (road-open road_0270)
  (= (congestion-factor road_0270) 1.0)
  (connects road_0271 loc_0163 loc_0336)
  (road-open road_0271)
  (= (congestion-factor road_0271) 1.2)
  (connects road_0272 loc_0163 loc_0169)
  (road-open road_0272)
  (= (congestion-factor road_0272) 1.0)
  (connects road_0273 loc_0164 loc_0077)
  (road-open road_0273)
  (= (congestion-factor road_0273) 1.04)
  (connects road_0274 loc_0164 loc_0206)
  (road-open road_0274)
  (= (congestion-factor road_0274) 1.0)
  (connects road_0275 loc_0164 loc_0389)
  (road-open road_0275)
  (= (congestion-factor road_0275) 1.06)
  (connects road_0276 loc_0165 loc_0045)
  (road-open road_0276)
  (= (congestion-factor road_0276) 1.0)
  (connects road_0277 loc_0166 loc_0135)
  (road-open road_0277)
  (= (congestion-factor road_0277) 1.05)
  (connects road_0280 loc_0167 loc_0365)
  (road-open road_0280)
  (= (congestion-factor road_0280) 1.06)
  (connects road_0281 loc_0168 loc_0045)
  (road-open road_0281)
  (= (congestion-factor road_0281) 1.05)
  (connects road_0282 loc_0168 loc_0171)
  (road-open road_0282)
  (= (congestion-factor road_0282) 1.1)
  (connects road_0283 loc_0169 loc_0172)
  (road-open road_0283)
  (= (congestion-factor road_0283) 1.0)
  (connects road_0286 loc_0171 loc_0168)
  (road-open road_0286)
  (= (congestion-factor road_0286) 1.15)
  (connects road_0287 loc_0171 loc_0042)
  (road-open road_0287)
  (= (congestion-factor road_0287) 1.0)
  (connects road_0288 loc_0171 loc_0029)
  (road-open road_0288)
  (= (congestion-factor road_0288) 1.05)
  (connects road_0289 loc_0172 loc_0170)
  (road-open road_0289)
  (= (congestion-factor road_0289) 1.05)
  (connects road_0290 loc_0173 loc_0469)
  (road-open road_0290)
  (= (congestion-factor road_0290) 1.05)
  (connects road_0291 loc_0174 loc_0176)
  (road-open road_0291)
  (= (congestion-factor road_0291) 1.15)
  (connects road_0292 loc_0174 loc_0182)
  (road-open road_0292)
  (= (congestion-factor road_0292) 1.1)
  (connects road_0294 loc_0175 loc_0456)
  (road-open road_0294)
  (= (congestion-factor road_0294) 1.0)
  (connects road_0295 loc_0176 loc_0123)
  (road-open road_0295)
  (= (congestion-factor road_0295) 1.2)
  (connects road_0296 loc_0176 loc_0068)
  (road-open road_0296)
  (= (congestion-factor road_0296) 1.0)
  (connects road_0297 loc_0177 loc_0377)
  (road-open road_0297)
  (= (congestion-factor road_0297) 1.08)
  (connects road_0298 loc_0178 loc_0181)
  (road-open road_0298)
  (= (congestion-factor road_0298) 1.05)
  (connects road_0299 loc_0178 loc_0179)
  (road-open road_0299)
  (= (congestion-factor road_0299) 1.05)
  (connects road_0300 loc_0178 loc_0120)
  (road-open road_0300)
  (= (congestion-factor road_0300) 1.15)
  (connects road_0301 loc_0179 loc_0100)
  (road-open road_0301)
  (= (congestion-factor road_0301) 1.0)
  (connects road_0302 loc_0179 loc_0178)
  (road-open road_0302)
  (= (congestion-factor road_0302) 1.15)
  (connects road_0303 loc_0181 loc_0103)
  (road-open road_0303)
  (= (congestion-factor road_0303) 1.1)
  (connects road_0304 loc_0182 loc_0125)
  (road-open road_0304)
  (= (congestion-factor road_0304) 1.1)
  (connects road_0305 loc_0183 loc_0314)
  (road-open road_0305)
  (= (congestion-factor road_0305) 1.0)
  (connects road_0307 loc_0184 loc_0096)
  (road-open road_0307)
  (= (congestion-factor road_0307) 1.04)
  (connects road_0309 loc_0185 loc_0255)
  (road-open road_0309)
  (= (congestion-factor road_0309) 1.05)
  (connects road_0310 loc_0185 loc_0220)
  (road-open road_0310)
  (= (congestion-factor road_0310) 1.15)
  (connects road_0311 loc_0186 loc_0383)
  (road-open road_0311)
  (= (congestion-factor road_0311) 1.05)
  (connects road_0312 loc_0186 loc_0185)
  (road-open road_0312)
  (= (congestion-factor road_0312) 1.0)
  (connects road_0313 loc_0187 loc_0448)
  (road-open road_0313)
  (= (congestion-factor road_0313) 1.04)
  (connects road_0314 loc_0187 loc_0270)
  (road-open road_0314)
  (= (congestion-factor road_0314) 1.12)
  (connects road_0315 loc_0189 loc_0075)
  (road-open road_0315)
  (= (congestion-factor road_0315) 1.02)
  (connects road_0316 loc_0189 loc_0317)
  (road-open road_0316)
  (= (congestion-factor road_0316) 1.02)
  (connects road_0317 loc_0190 loc_0456)
  (road-open road_0317)
  (= (congestion-factor road_0317) 1.08)
  (connects road_0318 loc_0191 loc_0316)
  (road-open road_0318)
  (= (congestion-factor road_0318) 1.04)
  (connects road_0319 loc_0191 loc_0390)
  (road-open road_0319)
  (= (congestion-factor road_0319) 1.02)
  (connects road_0320 loc_0192 loc_0469)
  (road-open road_0320)
  (= (congestion-factor road_0320) 1.03)
  (connects road_0321 loc_0193 loc_0447)
  (road-open road_0321)
  (= (congestion-factor road_0321) 1.1)
  (connects road_0322 loc_0193 loc_0114)
  (road-open road_0322)
  (= (congestion-factor road_0322) 1.06)
  (connects road_0323 loc_0194 loc_0058)
  (road-open road_0323)
  (= (congestion-factor road_0323) 1.0)
  (connects road_0324 loc_0194 loc_0455)
  (road-open road_0324)
  (= (congestion-factor road_0324) 1.03)
  (connects road_0325 loc_0196 loc_0112)
  (road-open road_0325)
  (= (congestion-factor road_0325) 1.1)
  (connects road_0326 loc_0196 loc_0243)
  (road-open road_0326)
  (= (congestion-factor road_0326) 1.04)
  (connects road_0327 loc_0197 loc_0116)
  (road-open road_0327)
  (= (congestion-factor road_0327) 1.0)
  (connects road_0328 loc_0197 loc_0160)
  (road-open road_0328)
  (= (congestion-factor road_0328) 1.1)
  (connects road_0329 loc_0198 loc_0335)
  (road-open road_0329)
  (= (congestion-factor road_0329) 1.2)
  (connects road_0330 loc_0198 loc_0400)
  (road-open road_0330)
  (= (congestion-factor road_0330) 1.0)
  (connects road_0332 loc_0199 loc_0200)
  (road-open road_0332)
  (= (congestion-factor road_0332) 1.0)
  (connects road_0333 loc_0200 loc_0310)
  (road-open road_0333)
  (= (congestion-factor road_0333) 1.1)
  (connects road_0334 loc_0200 loc_0428)
  (road-open road_0334)
  (= (congestion-factor road_0334) 1.0)
  (connects road_0335 loc_0200 loc_0362)
  (road-open road_0335)
  (= (congestion-factor road_0335) 1.05)
  (connects road_0336 loc_0201 loc_0346)
  (road-open road_0336)
  (= (congestion-factor road_0336) 1.05)
  (connects road_0337 loc_0202 loc_0072)
  (road-open road_0337)
  (= (congestion-factor road_0337) 1.11)
  (connects road_0338 loc_0203 loc_0348)
  (road-open road_0338)
  (= (congestion-factor road_0338) 1.0)
  (connects road_0339 loc_0203 loc_0202)
  (road-open road_0339)
  (= (congestion-factor road_0339) 1.03)
  (connects road_0340 loc_0204 loc_0303)
  (road-open road_0340)
  (= (congestion-factor road_0340) 1.03)
  (connects road_0341 loc_0205 loc_0093)
  (road-open road_0341)
  (= (congestion-factor road_0341) 1.05)
  (connects road_0342 loc_0206 loc_0157)
  (road-open road_0342)
  (= (congestion-factor road_0342) 1.09)
  (connects road_0343 loc_0207 loc_0247)
  (road-open road_0343)
  (= (congestion-factor road_0343) 1.11)
  (connects road_0344 loc_0208 loc_0158)
  (road-open road_0344)
  (= (congestion-factor road_0344) 1.2)
  (connects road_0345 loc_0208 loc_0399)
  (road-open road_0345)
  (= (congestion-factor road_0345) 1.03)
  (connects road_0346 loc_0209 loc_0002)
  (road-open road_0346)
  (= (congestion-factor road_0346) 1.0)
  (connects road_0347 loc_0209 loc_0435)
  (road-open road_0347)
  (= (congestion-factor road_0347) 1.1)
  (connects road_0348 loc_0210 loc_0454)
  (road-open road_0348)
  (= (congestion-factor road_0348) 1.05)
  (connects road_0349 loc_0211 loc_0368)
  (road-open road_0349)
  (= (congestion-factor road_0349) 1.09)
  (connects road_0350 loc_0211 loc_0292)
  (road-open road_0350)
  (= (congestion-factor road_0350) 1.11)
  (connects road_0351 loc_0212 loc_0313)
  (road-open road_0351)
  (= (congestion-factor road_0351) 1.04)
  (connects road_0352 loc_0213 loc_0107)
  (road-open road_0352)
  (= (congestion-factor road_0352) 1.0)
  (connects road_0354 loc_0214 loc_0242)
  (road-open road_0354)
  (= (congestion-factor road_0354) 1.1)
  (connects road_0355 loc_0214 loc_0469)
  (road-open road_0355)
  (= (congestion-factor road_0355) 1.14)
  (connects road_0356 loc_0214 loc_0051)
  (road-open road_0356)
  (= (congestion-factor road_0356) 1.0)
  (connects road_0357 loc_0215 loc_0385)
  (road-open road_0357)
  (= (congestion-factor road_0357) 1.15)
  (connects road_0358 loc_0215 loc_0035)
  (road-open road_0358)
  (= (congestion-factor road_0358) 1.0)
  (connects road_0359 loc_0216 loc_0407)
  (road-open road_0359)
  (= (congestion-factor road_0359) 1.0)
  (connects road_0360 loc_0216 loc_0447)
  (road-open road_0360)
  (= (congestion-factor road_0360) 1.06)
  (connects road_0361 loc_0217 loc_0333)
  (road-open road_0361)
  (= (congestion-factor road_0361) 1.03)
  (connects road_0362 loc_0218 loc_0245)
  (road-open road_0362)
  (= (congestion-factor road_0362) 1.09)
  (connects road_0364 loc_0220 loc_0357)
  (road-open road_0364)
  (= (congestion-factor road_0364) 1.15)
  (connects road_0365 loc_0220 loc_0056)
  (road-open road_0365)
  (= (congestion-factor road_0365) 1.0)
  (connects road_0367 loc_0221 loc_0260)
  (road-open road_0367)
  (= (congestion-factor road_0367) 1.0)
  (connects road_0369 loc_0222 loc_0223)
  (road-open road_0369)
  (= (congestion-factor road_0369) 1.05)
  (connects road_0370 loc_0224 loc_0375)
  (road-open road_0370)
  (= (congestion-factor road_0370) 1.0)
  (connects road_0371 loc_0225 loc_0224)
  (road-open road_0371)
  (= (congestion-factor road_0371) 1.25)
  (connects road_0372 loc_0225 loc_0232)
  (road-open road_0372)
  (= (congestion-factor road_0372) 1.05)
  (connects road_0373 loc_0226 loc_0225)
  (road-open road_0373)
  (= (congestion-factor road_0373) 1.1)
  (connects road_0374 loc_0226 loc_0407)
  (road-open road_0374)
  (= (congestion-factor road_0374) 1.25)
  (connects road_0375 loc_0227 loc_0113)
  (road-open road_0375)
  (= (congestion-factor road_0375) 1.0)
  (connects road_0376 loc_0227 loc_0024)
  (road-open road_0376)
  (= (congestion-factor road_0376) 1.03)
  (connects road_0377 loc_0227 loc_0083)
  (road-open road_0377)
  (= (congestion-factor road_0377) 1.03)
  (connects road_0378 loc_0228 loc_0114)
  (road-open road_0378)
  (= (congestion-factor road_0378) 1.0)
  (connects road_0379 loc_0229 loc_0350)
  (road-open road_0379)
  (= (congestion-factor road_0379) 1.02)
  (connects road_0380 loc_0229 loc_0272)
  (road-open road_0380)
  (= (congestion-factor road_0380) 1.04)
  (connects road_0381 loc_0231 loc_0261)
  (road-open road_0381)
  (= (congestion-factor road_0381) 1.04)
  (connects road_0382 loc_0231 loc_0294)
  (road-open road_0382)
  (= (congestion-factor road_0382) 1.04)
  (connects road_0383 loc_0232 loc_0463)
  (road-open road_0383)
  (= (congestion-factor road_0383) 1.11)
  (connects road_0384 loc_0232 loc_0225)
  (road-open road_0384)
  (= (congestion-factor road_0384) 1.2)
  (connects road_0385 loc_0233 loc_0212)
  (road-open road_0385)
  (= (congestion-factor road_0385) 1.1)
  (connects road_0386 loc_0233 loc_0234)
  (road-open road_0386)
  (= (congestion-factor road_0386) 1.0)
  (connects road_0387 loc_0234 loc_0233)
  (road-open road_0387)
  (= (congestion-factor road_0387) 1.0)
  (connects road_0388 loc_0235 loc_0241)
  (road-open road_0388)
  (= (congestion-factor road_0388) 1.1)
  (connects road_0389 loc_0235 loc_0129)
  (road-open road_0389)
  (= (congestion-factor road_0389) 1.05)
  (connects road_0390 loc_0235 loc_0051)
  (road-open road_0390)
  (= (congestion-factor road_0390) 1.05)
  (connects road_0391 loc_0236 loc_0368)
  (road-open road_0391)
  (= (congestion-factor road_0391) 1.0)
  (connects road_0392 loc_0236 loc_0246)
  (road-open road_0392)
  (= (congestion-factor road_0392) 1.03)
  (connects road_0393 loc_0237 loc_0117)
  (road-open road_0393)
  (= (congestion-factor road_0393) 1.1)
  (connects road_0394 loc_0237 loc_0305)
  (road-open road_0394)
  (= (congestion-factor road_0394) 1.0)
  (connects road_0395 loc_0238 loc_0003)
  (road-open road_0395)
  (= (congestion-factor road_0395) 1.0)
  (connects road_0396 loc_0238 loc_0494)
  (road-open road_0396)
  (= (congestion-factor road_0396) 1.06)
  (connects road_0397 loc_0239 loc_0238)
  (road-open road_0397)
  (= (congestion-factor road_0397) 1.0)
  (connects road_0398 loc_0239 loc_0146)
  (road-open road_0398)
  (= (congestion-factor road_0398) 1.06)
  (connects road_0399 loc_0240 loc_0080)
  (road-open road_0399)
  ;; [DYNAMIC EVENT - location closure] loc_0080 incident road
  (road-blocked road_0399)
  (= (congestion-factor road_0399) 1.0)
  (connects road_0400 loc_0241 loc_0235)
  (road-open road_0400)
  (= (congestion-factor road_0400) 1.05)
  (connects road_0401 loc_0242 loc_0214)
  (road-open road_0401)
  (= (congestion-factor road_0401) 1.05)
  (connects road_0403 loc_0242 loc_0406)
  (road-open road_0403)
  (= (congestion-factor road_0403) 1.1)
  (connects road_0404 loc_0243 loc_0289)
  (road-open road_0404)
  (= (congestion-factor road_0404) 1.04)
  (connects road_0405 loc_0244 loc_0356)
  (road-open road_0405)
  (= (congestion-factor road_0405) 1.05)
  (connects road_0406 loc_0244 loc_0067)
  (road-open road_0406)
  (= (congestion-factor road_0406) 1.0)
  (connects road_0407 loc_0245 loc_0356)
  (road-open road_0407)
  (= (congestion-factor road_0407) 1.09)
  (connects road_0408 loc_0245 loc_0071)
  (road-open road_0408)
  (= (congestion-factor road_0408) 1.06)
  (connects road_0410 loc_0247 loc_0260)
  (road-open road_0410)
  (= (congestion-factor road_0410) 1.05)
  (connects road_0411 loc_0247 loc_0071)
  (road-open road_0411)
  (= (congestion-factor road_0411) 1.11)
  (connects road_0412 loc_0248 loc_0360)
  (road-open road_0412)
  (= (congestion-factor road_0412) 1.09)
  (connects road_0413 loc_0248 loc_0359)
  (road-open road_0413)
  (= (congestion-factor road_0413) 1.03)
  (connects road_0414 loc_0249 loc_0450)
  (road-open road_0414)
  (= (congestion-factor road_0414) 1.11)
  (connects road_0416 loc_0250 loc_0104)
  (road-open road_0416)
  (= (congestion-factor road_0416) 1.09)
  (connects road_0417 loc_0250 loc_0307)
  (road-open road_0417)
  (= (congestion-factor road_0417) 1.04)
  (connects road_0418 loc_0251 loc_0255)
  (road-open road_0418)
  (= (congestion-factor road_0418) 1.15)
  (connects road_0419 loc_0252 loc_0085)
  (road-open road_0419)
  (= (congestion-factor road_0419) 1.1)
  (connects road_0420 loc_0253 loc_0376)
  (road-open road_0420)
  (= (congestion-factor road_0420) 1.1)
  (connects road_0421 loc_0253 loc_0449)
  (road-open road_0421)
  (= (congestion-factor road_0421) 1.09)
  (connects road_0422 loc_0253 loc_0371)
  (road-open road_0422)
  (= (congestion-factor road_0422) 1.0)
  (connects road_0423 loc_0254 loc_0448)
  (road-open road_0423)
  (= (congestion-factor road_0423) 1.06)
  (connects road_0424 loc_0255 loc_0185)
  (road-open road_0424)
  (= (congestion-factor road_0424) 1.0)
  (connects road_0425 loc_0255 loc_0021)
  (road-open road_0425)
  (= (congestion-factor road_0425) 1.0)
  (connects road_0426 loc_0256 loc_0063)
  (road-open road_0426)
  (= (congestion-factor road_0426) 1.06)
  (connects road_0427 loc_0256 loc_0167)
  (road-open road_0427)
  (= (congestion-factor road_0427) 1.12)
  (connects road_0428 loc_0257 loc_0402)
  (road-open road_0428)
  (= (congestion-factor road_0428) 1.0)
  (connects road_0430 loc_0257 loc_0371)
  (road-open road_0430)
  (= (congestion-factor road_0430) 1.09)
  (connects road_0433 loc_0260 loc_0432)
  (road-open road_0433)
  (= (congestion-factor road_0433) 1.11)
  (connects road_0434 loc_0261 loc_0309)
  (road-open road_0434)
  (= (congestion-factor road_0434) 1.15)
  (connects road_0436 loc_0261 loc_0017)
  (road-open road_0436)
  (= (congestion-factor road_0436) 1.06)
  (connects road_0437 loc_0262 loc_0303)
  (road-open road_0437)
  (= (congestion-factor road_0437) 1.0)
  (connects road_0438 loc_0263 loc_0266)
  (road-open road_0438)
  (= (congestion-factor road_0438) 1.0)
  (connects road_0439 loc_0263 loc_0275)
  (road-open road_0439)
  (= (congestion-factor road_0439) 1.1)
  (connects road_0440 loc_0263 loc_0149)
  (road-open road_0440)
  (= (congestion-factor road_0440) 1.05)
  (connects road_0441 loc_0264 loc_0153)
  (road-open road_0441)
  (= (congestion-factor road_0441) 1.02)
  (connects road_0442 loc_0264 loc_0265)
  (road-open road_0442)
  (= (congestion-factor road_0442) 1.0)
  (connects road_0443 loc_0265 loc_0189)
  (road-open road_0443)
  (= (congestion-factor road_0443) 1.04)
  (connects road_0444 loc_0266 loc_0022)
  (road-open road_0444)
  (= (congestion-factor road_0444) 1.2)
  (connects road_0445 loc_0266 loc_0263)
  (road-open road_0445)
  (= (congestion-factor road_0445) 1.1)
  (connects road_0446 loc_0266 loc_0430)
  (road-open road_0446)
  (= (congestion-factor road_0446) 1.0)
  (connects road_0447 loc_0267 loc_0160)
  (road-open road_0447)
  (= (congestion-factor road_0447) 1.06)
  (connects road_0448 loc_0267 loc_0116)
  (road-open road_0448)
  (= (congestion-factor road_0448) 1.06)
  (connects road_0449 loc_0268 loc_0280)
  (road-open road_0449)
  (= (congestion-factor road_0449) 1.25)
  (connects road_0450 loc_0268 loc_0465)
  (road-open road_0450)
  (= (congestion-factor road_0450) 1.0)
  (connects road_0451 loc_0269 loc_0283)
  (road-open road_0451)
  (= (congestion-factor road_0451) 1.06)
  (connects road_0452 loc_0269 loc_0095)
  (road-open road_0452)
  (= (congestion-factor road_0452) 1.0)
  (connects road_0453 loc_0270 loc_0051)
  (road-open road_0453)
  (= (congestion-factor road_0453) 1.17)
  (connects road_0454 loc_0270 loc_0279)
  (road-open road_0454)
  (= (congestion-factor road_0454) 1.06)
  (connects road_0455 loc_0270 loc_0025)
  (road-open road_0455)
  (= (congestion-factor road_0455) 1.06)
  (connects road_0456 loc_0271 loc_0354)
  (road-open road_0456)
  (= (congestion-factor road_0456) 1.0)
  (connects road_0457 loc_0271 loc_0420)
  (road-open road_0457)
  (= (congestion-factor road_0457) 1.05)
  (connects road_0458 loc_0271 loc_0330)
  (road-open road_0458)
  (= (congestion-factor road_0458) 1.05)
  (connects road_0459 loc_0272 loc_0049)
  (road-open road_0459)
  (= (congestion-factor road_0459) 1.1)
  (connects road_0460 loc_0272 loc_0229)
  (road-open road_0460)
  (= (congestion-factor road_0460) 1.02)
  (connects road_0461 loc_0273 loc_0361)
  (road-open road_0461)
  (= (congestion-factor road_0461) 1.1)
  (connects road_0462 loc_0273 loc_0381)
  (road-open road_0462)
  (= (congestion-factor road_0462) 1.0)
  (connects road_0463 loc_0274 loc_0276)
  (road-open road_0463)
  (= (congestion-factor road_0463) 1.1)
  (connects road_0464 loc_0274 loc_0218)
  (road-open road_0464)
  (= (congestion-factor road_0464) 1.06)
  (connects road_0465 loc_0275 loc_0263)
  (road-open road_0465)
  (= (congestion-factor road_0465) 1.0)
  (connects road_0466 loc_0276 loc_0218)
  (road-open road_0466)
  (= (congestion-factor road_0466) 1.1)
  (connects road_0467 loc_0276 loc_0221)
  (road-open road_0467)
  (= (congestion-factor road_0467) 1.0)
  (connects road_0468 loc_0277 loc_0419)
  (road-open road_0468)
  (= (congestion-factor road_0468) 1.0)
  (connects road_0469 loc_0277 loc_0362)
  (road-open road_0469)
  (= (congestion-factor road_0469) 1.1)
  (connects road_0470 loc_0278 loc_0385)
  (road-open road_0470)
  (= (congestion-factor road_0470) 1.0)
  (connects road_0471 loc_0279 loc_0040)
  (road-open road_0471)
  (= (congestion-factor road_0471) 1.06)
  (connects road_0472 loc_0279 loc_0270)
  (road-open road_0472)
  (= (congestion-factor road_0472) 1.09)
  (connects road_0473 loc_0279 loc_0254)
  (road-open road_0473)
  (= (congestion-factor road_0473) 1.06)
  (connects road_0475 loc_0280 loc_0180)
  (road-open road_0475)
  (= (congestion-factor road_0475) 1.15)
  (connects road_0476 loc_0281 loc_0404)
  (road-open road_0476)
  (= (congestion-factor road_0476) 1.0)
  (connects road_0479 loc_0283 loc_0292)
  (road-open road_0479)
  (= (congestion-factor road_0479) 1.14)
  (connects road_0480 loc_0284 loc_0291)
  (road-open road_0480)
  (= (congestion-factor road_0480) 1.0)
  (connects road_0481 loc_0284 loc_0339)
  (road-open road_0481)
  (= (congestion-factor road_0481) 1.03)
  (connects road_0482 loc_0285 loc_0287)
  (road-open road_0482)
  (= (congestion-factor road_0482) 1.0)
  (connects road_0483 loc_0287 loc_0285)
  (road-open road_0483)
  (= (congestion-factor road_0483) 1.0)
  (connects road_0484 loc_0287 loc_0187)
  (road-open road_0484)
  (= (congestion-factor road_0484) 1.02)
  (connects road_0485 loc_0288 loc_0289)
  (road-open road_0485)
  (= (congestion-factor road_0485) 1.03)
  (connects road_0486 loc_0288 loc_0196)
  (road-open road_0486)
  (= (congestion-factor road_0486) 1.08)
  (connects road_0487 loc_0289 loc_0256)
  (road-open road_0487)
  (= (congestion-factor road_0487) 1.08)
  (connects road_0488 loc_0290 loc_0183)
  (road-open road_0488)
  (= (congestion-factor road_0488) 1.0)
  (connects road_0490 loc_0291 loc_0284)
  (road-open road_0490)
  (= (congestion-factor road_0490) 1.05)
  (connects road_0491 loc_0291 loc_0340)
  (road-open road_0491)
  (= (congestion-factor road_0491) 1.06)
  (connects road_0492 loc_0291 loc_0331)
  (road-open road_0492)
  (= (congestion-factor road_0492) 1.03)
  (connects road_0493 loc_0292 loc_0211)
  (road-open road_0493)
  (= (congestion-factor road_0493) 1.09)
  (connects road_0494 loc_0292 loc_0293)
  (road-open road_0494)
  (= (congestion-factor road_0494) 1.1)
  (connects road_0495 loc_0293 loc_0395)
  (road-open road_0495)
  (= (congestion-factor road_0495) 1.1)
  (connects road_0496 loc_0293 loc_0124)
  (road-open road_0496)
  (= (congestion-factor road_0496) 1.15)
  (connects road_0497 loc_0294 loc_0005)
  (road-open road_0497)
  (= (congestion-factor road_0497) 1.04)
  (connects road_0498 loc_0294 loc_0295)
  (road-open road_0498)
  (= (congestion-factor road_0498) 1.2)
  (connects road_0499 loc_0295 loc_0388)
  (road-open road_0499)
  (= (congestion-factor road_0499) 1.05)
  (connects road_0500 loc_0295 loc_0318)
  (road-open road_0500)
  (= (congestion-factor road_0500) 1.25)
  (connects road_0501 loc_0295 loc_0291)
  (road-open road_0501)
  (= (congestion-factor road_0501) 1.05)
  (connects road_0502 loc_0296 loc_0242)
  (road-open road_0502)
  (= (congestion-factor road_0502) 1.05)
  (connects road_0505 loc_0298 loc_0303)
  (road-open road_0505)
  (= (congestion-factor road_0505) 1.15)
  (connects road_0506 loc_0298 loc_0302)
  (road-open road_0506)
  (= (congestion-factor road_0506) 1.1)
  (connects road_0507 loc_0299 loc_0322)
  (road-open road_0507)
  (= (congestion-factor road_0507) 1.0)
  (connects road_0508 loc_0299 loc_0298)
  (road-open road_0508)
  (= (congestion-factor road_0508) 1.15)
  (connects road_0511 loc_0301 loc_0322)
  (road-open road_0511)
  (= (congestion-factor road_0511) 1.17)
  (connects road_0512 loc_0301 loc_0312)
  (road-open road_0512)
  (= (congestion-factor road_0512) 1.03)
  (connects road_0513 loc_0302 loc_0306)
  (road-open road_0513)
  (= (congestion-factor road_0513) 1.15)
  (connects road_0514 loc_0302 loc_0301)
  (road-open road_0514)
  (= (congestion-factor road_0514) 1.05)
  (connects road_0515 loc_0302 loc_0298)
  (road-open road_0515)
  (= (congestion-factor road_0515) 1.1)
  (connects road_0516 loc_0303 loc_0262)
  (road-open road_0516)
  (= (congestion-factor road_0516) 1.09)
  (connects road_0517 loc_0303 loc_0204)
  (road-open road_0517)
  (= (congestion-factor road_0517) 1.03)
  (connects road_0518 loc_0304 loc_0429)
  (road-open road_0518)
  (= (congestion-factor road_0518) 1.06)
  (connects road_0519 loc_0304 loc_0424)
  (road-open road_0519)
  (= (congestion-factor road_0519) 1.06)
  (connects road_0520 loc_0305 loc_0237)
  (road-open road_0520)
  (= (congestion-factor road_0520) 1.05)
  (connects road_0521 loc_0306 loc_0302)
  (road-open road_0521)
  (= (congestion-factor road_0521) 1.1)
  (connects road_0522 loc_0306 loc_0312)
  (road-open road_0522)
  (= (congestion-factor road_0522) 1.25)
  (connects road_0523 loc_0307 loc_0084)
  (road-open road_0523)
  (= (congestion-factor road_0523) 1.02)
  (connects road_0524 loc_0307 loc_0306)
  (road-open road_0524)
  (= (congestion-factor road_0524) 1.15)
  (connects road_0525 loc_0307 loc_0397)
  (road-open road_0525)
  (= (congestion-factor road_0525) 1.05)
  (connects road_0526 loc_0307 loc_0250)
  (road-open road_0526)
  (= (congestion-factor road_0526) 1.06)
  (connects road_0527 loc_0308 loc_0107)
  (road-open road_0527)
  (= (congestion-factor road_0527) 1.0)
  (connects road_0529 loc_0309 loc_0018)
  (road-open road_0529)
  (= (congestion-factor road_0529) 1.0)
  (connects road_0530 loc_0310 loc_0200)
  (road-open road_0530)
  (= (congestion-factor road_0530) 1.05)
  (connects road_0532 loc_0312 loc_0084)
  (road-open road_0532)
  (= (congestion-factor road_0532) 1.09)
  (connects road_0533 loc_0312 loc_0301)
  (road-open road_0533)
  (= (congestion-factor road_0533) 1.11)
  (connects road_0534 loc_0312 loc_0315)
  (road-open road_0534)
  (= (congestion-factor road_0534) 1.15)
  (connects road_0535 loc_0313 loc_0351)
  (road-open road_0535)
  (= (congestion-factor road_0535) 1.03)
  (connects road_0536 loc_0313 loc_0063)
  (road-open road_0536)
  (= (congestion-factor road_0536) 1.02)
  (connects road_0537 loc_0314 loc_0195)
  (road-open road_0537)
  (= (congestion-factor road_0537) 1.2)
  (connects road_0539 loc_0315 loc_0324)
  (road-open road_0539)
  (= (congestion-factor road_0539) 1.3)
  (connects road_0540 loc_0315 loc_0327)
  (road-open road_0540)
  (= (congestion-factor road_0540) 1.1)
  (connects road_0541 loc_0315 loc_0312)
  (road-open road_0541)
  (= (congestion-factor road_0541) 1.05)
  (connects road_0542 loc_0316 loc_0328)
  (road-open road_0542)
  (= (congestion-factor road_0542) 1.0)
  (connects road_0543 loc_0316 loc_0315)
  (road-open road_0543)
  (= (congestion-factor road_0543) 1.15)
  (connects road_0544 loc_0317 loc_0418)
  (road-open road_0544)
  (= (congestion-factor road_0544) 1.3)
  (connects road_0545 loc_0317 loc_0264)
  (road-open road_0545)
  (= (congestion-factor road_0545) 1.0)
  (connects road_0546 loc_0318 loc_0295)
  (road-open road_0546)
  (= (congestion-factor road_0546) 1.0)
  (connects road_0547 loc_0318 loc_0320)
  (road-open road_0547)
  (= (congestion-factor road_0547) 1.05)
  (connects road_0548 loc_0320 loc_0209)
  (road-open road_0548)
  (= (congestion-factor road_0548) 1.0)
  (connects road_0549 loc_0320 loc_0087)
  (road-open road_0549)
  (= (congestion-factor road_0549) 1.1)
  (connects road_0550 loc_0321 loc_0478)
  (road-open road_0550)
  (= (congestion-factor road_0550) 1.06)
  (connects road_0551 loc_0321 loc_0144)
  (road-open road_0551)
  (= (congestion-factor road_0551) 1.03)
  (connects road_0552 loc_0321 loc_0417)
  (road-open road_0552)
  (= (congestion-factor road_0552) 1.03)
  (connects road_0553 loc_0322 loc_0299)
  (road-open road_0553)
  (= (congestion-factor road_0553) 1.03)
  (connects road_0554 loc_0322 loc_0324)
  (road-open road_0554)
  (= (congestion-factor road_0554) 1.2)
  (connects road_0555 loc_0322 loc_0301)
  (road-open road_0555)
  (= (congestion-factor road_0555) 1.03)
  (connects road_0556 loc_0323 loc_0388)
  (road-open road_0556)
  (= (congestion-factor road_0556) 1.04)
  (connects road_0557 loc_0323 loc_0340)
  (road-open road_0557)
  (= (congestion-factor road_0557) 1.09)
  (connects road_0558 loc_0324 loc_0183)
  (road-open road_0558)
  (= (congestion-factor road_0558) 1.1)
  (connects road_0559 loc_0325 loc_0314)
  (road-open road_0559)
  (= (congestion-factor road_0559) 1.0)
  (connects road_0561 loc_0326 loc_0250)
  (road-open road_0561)
  (= (congestion-factor road_0561) 1.02)
  (connects road_0563 loc_0327 loc_0315)
  (road-open road_0563)
  (= (congestion-factor road_0563) 1.1)
  (connects road_0564 loc_0327 loc_0328)
  (road-open road_0564)
  (= (congestion-factor road_0564) 1.0)
  (connects road_0566 loc_0328 loc_0327)
  (road-open road_0566)
  (= (congestion-factor road_0566) 1.0)
  (connects road_0567 loc_0329 loc_0202)
  (road-open road_0567)
  (= (congestion-factor road_0567) 1.1)
  (connects road_0568 loc_0330 loc_0371)
  (road-open road_0568)
  (= (congestion-factor road_0568) 1.05)
  (connects road_0569 loc_0330 loc_0271)
  (road-open road_0569)
  (= (congestion-factor road_0569) 1.05)
  (connects road_0572 loc_0331 loc_0332)
  (road-open road_0572)
  (= (congestion-factor road_0572) 1.0)
  (connects road_0573 loc_0331 loc_0291)
  (road-open road_0573)
  (= (congestion-factor road_0573) 1.06)
  (connects road_0574 loc_0332 loc_0490)
  (road-open road_0574)
  (= (congestion-factor road_0574) 1.0)
  (connects road_0575 loc_0332 loc_0331)
  (road-open road_0575)
  (= (congestion-factor road_0575) 1.0)
  (connects road_0576 loc_0332 loc_0411)
  (road-open road_0576)
  (= (congestion-factor road_0576) 1.0)
  (connects road_0577 loc_0333 loc_0341)
  (road-open road_0577)
  (= (congestion-factor road_0577) 1.0)
  (connects road_0578 loc_0333 loc_0090)
  (road-open road_0578)
  (= (congestion-factor road_0578) 1.03)
  (connects road_0579 loc_0334 loc_0337)
  (road-open road_0579)
  (= (congestion-factor road_0579) 1.06)
  (connects road_0580 loc_0334 loc_0236)
  (road-open road_0580)
  (= (congestion-factor road_0580) 1.09)
  (connects road_0581 loc_0335 loc_0321)
  (road-open road_0581)
  (= (congestion-factor road_0581) 1.0)
  (connects road_0582 loc_0335 loc_0417)
  (road-open road_0582)
  (= (congestion-factor road_0582) 1.2)
  (connects road_0583 loc_0336 loc_0498)
  (road-open road_0583)
  (= (congestion-factor road_0583) 1.0)
  (connects road_0584 loc_0336 loc_0452)
  (road-open road_0584)
  (= (congestion-factor road_0584) 1.05)
  (connects road_0586 loc_0337 loc_0334)
  (road-open road_0586)
  (= (congestion-factor road_0586) 1.03)
  (connects road_0587 loc_0337 loc_0035)
  (road-open road_0587)
  (= (congestion-factor road_0587) 1.0)
  (connects road_0588 loc_0337 loc_0409)
  (road-open road_0588)
  (= (congestion-factor road_0588) 1.06)
  (connects road_0589 loc_0338 loc_0148)
  (road-open road_0589)
  (= (congestion-factor road_0589) 1.0)
  (connects road_0590 loc_0339 loc_0015)
  (road-open road_0590)
  (= (congestion-factor road_0590) 1.06)
  (connects road_0591 loc_0340 loc_0339)
  (road-open road_0591)
  (= (congestion-factor road_0591) 1.15)
  (connects road_0592 loc_0340 loc_0291)
  (road-open road_0592)
  (= (congestion-factor road_0592) 1.0)
  (connects road_0593 loc_0340 loc_0323)
  (road-open road_0593)
  (= (congestion-factor road_0593) 1.03)
  (connects road_0594 loc_0341 loc_0228)
  (road-open road_0594)
  (= (congestion-factor road_0594) 1.0)
  (connects road_0595 loc_0341 loc_0467)
  (road-open road_0595)
  (= (congestion-factor road_0595) 1.0)
  (connects road_0596 loc_0342 loc_0343)
  (road-open road_0596)
  (= (congestion-factor road_0596) 1.08)
  (connects road_0598 loc_0345 loc_0104)
  (road-open road_0598)
  (= (congestion-factor road_0598) 1.03)
  (connects road_0599 loc_0345 loc_0342)
  (road-open road_0599)
  (= (congestion-factor road_0599) 1.02)
  (connects road_0600 loc_0346 loc_0201)
  (road-open road_0600)
  (= (congestion-factor road_0600) 1.0)
  (connects road_0601 loc_0346 loc_0329)
  (road-open road_0601)
  (= (congestion-factor road_0601) 1.15)
  (connects road_0602 loc_0347 loc_0003)
  (road-open road_0602)
  (= (congestion-factor road_0602) 1.03)
  (connects road_0603 loc_0347 loc_0461)
  (road-open road_0603)
  (= (congestion-factor road_0603) 1.06)
  (connects road_0604 loc_0347 loc_0346)
  (road-open road_0604)
  (= (congestion-factor road_0604) 1.1)
  (connects road_0606 loc_0349 loc_0342)
  (road-open road_0606)
  (= (congestion-factor road_0606) 1.09)
  (connects road_0607 loc_0349 loc_0392)
  (road-open road_0607)
  (= (congestion-factor road_0607) 1.06)
  (connects road_0608 loc_0350 loc_0177)
  (road-open road_0608)
  (= (congestion-factor road_0608) 1.0)
  (connects road_0609 loc_0350 loc_0398)
  (road-open road_0609)
  (= (congestion-factor road_0609) 1.0)
  (connects road_0610 loc_0351 loc_0453)
  (road-open road_0610)
  (= (congestion-factor road_0610) 1.09)
  (connects road_0611 loc_0352 loc_0370)
  (road-open road_0611)
  (= (congestion-factor road_0611) 1.0)
  (connects road_0612 loc_0352 loc_0217)
  (road-open road_0612)
  (= (congestion-factor road_0612) 1.05)
  (connects road_0614 loc_0354 loc_0271)
  (road-open road_0614)
  (= (congestion-factor road_0614) 1.0)
  (connects road_0615 loc_0355 loc_0046)
  (road-open road_0615)
  (= (congestion-factor road_0615) 1.0)
  (connects road_0616 loc_0355 loc_0348)
  (road-open road_0616)
  (= (congestion-factor road_0616) 1.0)
  (connects road_0617 loc_0356 loc_0138)
  (road-open road_0617)
  (= (congestion-factor road_0617) 1.11)
  (connects road_0618 loc_0357 loc_0384)
  (road-open road_0618)
  (= (congestion-factor road_0618) 1.0)
  (connects road_0619 loc_0357 loc_0251)
  (road-open road_0619)
  (= (congestion-factor road_0619) 1.0)
  (connects road_0620 loc_0357 loc_0220)
  (road-open road_0620)
  (= (congestion-factor road_0620) 1.0)
  (connects road_0621 loc_0358 loc_0031)
  (road-open road_0621)
  (= (congestion-factor road_0621) 1.0)
  (connects road_0622 loc_0359 loc_0248)
  (road-open road_0622)
  (= (congestion-factor road_0622) 1.0)
  (connects road_0623 loc_0359 loc_0273)
  (road-open road_0623)
  (= (congestion-factor road_0623) 1.06)
  (connects road_0624 loc_0360 loc_0249)
  (road-open road_0624)
  (= (congestion-factor road_0624) 1.05)
  (connects road_0625 loc_0360 loc_0267)
  (road-open road_0625)
  (= (congestion-factor road_0625) 1.06)
  (connects road_0626 loc_0361 loc_0197)
  (road-open road_0626)
  (= (congestion-factor road_0626) 1.1)
  (connects road_0627 loc_0362 loc_0433)
  (road-open road_0627)
  (= (congestion-factor road_0627) 1.05)
  (connects road_0628 loc_0363 loc_0473)
  (road-open road_0628)
  (= (congestion-factor road_0628) 1.04)
  (connects road_0629 loc_0363 loc_0457)
  (road-open road_0629)
  (= (congestion-factor road_0629) 1.06)
  (connects road_0630 loc_0364 loc_0115)
  (road-open road_0630)
  (= (congestion-factor road_0630) 1.11)
  (connects road_0632 loc_0366 loc_0367)
  (road-open road_0632)
  (= (congestion-factor road_0632) 1.05)
  (connects road_0633 loc_0367 loc_0364)
  (road-open road_0633)
  (= (congestion-factor road_0633) 1.2)
  (connects road_0634 loc_0368 loc_0246)
  (road-open road_0634)
  (= (congestion-factor road_0634) 1.11)
  (connects road_0635 loc_0368 loc_0211)
  (road-open road_0635)
  (= (congestion-factor road_0635) 1.06)
  (connects road_0636 loc_0369 loc_0442)
  (road-open road_0636)
  (= (congestion-factor road_0636) 1.0)
  (connects road_0637 loc_0369 loc_0366)
  (road-open road_0637)
  (= (congestion-factor road_0637) 1.05)
  (connects road_0639 loc_0370 loc_0352)
  (road-open road_0639)
  (= (congestion-factor road_0639) 1.05)
  (connects road_0640 loc_0371 loc_0257)
  (road-open road_0640)
  (= (congestion-factor road_0640) 1.03)
  (connects road_0641 loc_0371 loc_0253)
  (road-open road_0641)
  (= (congestion-factor road_0641) 1.09)
  (connects road_0642 loc_0372 loc_0408)
  (road-open road_0642)
  (= (congestion-factor road_0642) 1.1)
  (connects road_0643 loc_0373 loc_0458)
  (road-open road_0643)
  (= (congestion-factor road_0643) 1.03)
  (connects road_0644 loc_0373 loc_0117)
  (road-open road_0644)
  (= (congestion-factor road_0644) 1.04)
  (connects road_0645 loc_0373 loc_0015)
  (road-open road_0645)
  (= (congestion-factor road_0645) 1.03)
  (connects road_0647 loc_0374 loc_0010)
  (road-open road_0647)
  (= (congestion-factor road_0647) 1.1)
  (connects road_0648 loc_0375 loc_0278)
  (road-open road_0648)
  (= (congestion-factor road_0648) 1.35)
  (connects road_0649 loc_0375 loc_0226)
  (road-open road_0649)
  (= (congestion-factor road_0649) 1.25)
  (connects road_0650 loc_0376 loc_0056)
  (road-open road_0650)
  (= (congestion-factor road_0650) 1.1)
  (connects road_0651 loc_0377 loc_0084)
  (road-open road_0651)
  (= (congestion-factor road_0651) 1.09)
  (connects road_0652 loc_0377 loc_0077)
  (road-open road_0652)
  (= (congestion-factor road_0652) 1.06)
  (connects road_0653 loc_0377 loc_0389)
  (road-open road_0653)
  (= (congestion-factor road_0653) 1.02)
  (connects road_0654 loc_0378 loc_0083)
  (road-open road_0654)
  (= (congestion-factor road_0654) 1.06)
  (connects road_0655 loc_0379 loc_0372)
  (road-open road_0655)
  (= (congestion-factor road_0655) 1.1)
  (connects road_0656 loc_0379 loc_0151)
  (road-open road_0656)
  (= (congestion-factor road_0656) 1.05)
  (connects road_0657 loc_0380 loc_0443)
  (road-open road_0657)
  (= (congestion-factor road_0657) 1.0)
  (connects road_0658 loc_0381 loc_0359)
  (road-open road_0658)
  (= (congestion-factor road_0658) 1.0)
  (connects road_0659 loc_0381 loc_0071)
  (road-open road_0659)
  (= (congestion-factor road_0659) 1.0)
  (connects road_0661 loc_0383 loc_0330)
  (road-open road_0661)
  (= (congestion-factor road_0661) 1.05)
  (connects road_0662 loc_0383 loc_0376)
  (road-open road_0662)
  (= (congestion-factor road_0662) 1.0)
  (connects road_0664 loc_0385 loc_0358)
  (road-open road_0664)
  (= (congestion-factor road_0664) 1.0)
  (connects road_0665 loc_0386 loc_0474)
  (road-open road_0665)
  (= (congestion-factor road_0665) 1.02)
  (connects road_0666 loc_0386 loc_0388)
  (road-open road_0666)
  (= (congestion-factor road_0666) 1.06)
  (connects road_0667 loc_0387 loc_0394)
  (road-open road_0667)
  (= (congestion-factor road_0667) 1.06)
  (connects road_0668 loc_0387 loc_0077)
  (road-open road_0668)
  (= (congestion-factor road_0668) 1.06)
  (connects road_0669 loc_0387 loc_0057)
  (road-open road_0669)
  (= (congestion-factor road_0669) 1.06)
  (connects road_0670 loc_0388 loc_0295)
  (road-open road_0670)
  (= (congestion-factor road_0670) 1.1)
  (connects road_0671 loc_0388 loc_0386)
  (road-open road_0671)
  (= (congestion-factor road_0671) 1.02)
  (connects road_0672 loc_0388 loc_0363)
  (road-open road_0672)
  (= (congestion-factor road_0672) 1.06)
  (connects road_0673 loc_0389 loc_0191)
  (road-open road_0673)
  (= (congestion-factor road_0673) 1.06)
  (connects road_0674 loc_0389 loc_0084)
  (road-open road_0674)
  (= (congestion-factor road_0674) 1.04)
  (connects road_0675 loc_0390 loc_0150)
  (road-open road_0675)
  (= (congestion-factor road_0675) 1.0)
  (connects road_0676 loc_0390 loc_0154)
  (road-open road_0676)
  (= (congestion-factor road_0676) 1.02)
  (connects road_0677 loc_0392 loc_0397)
  (road-open road_0677)
  (= (congestion-factor road_0677) 1.15)
  (connects road_0678 loc_0392 loc_0349)
  (road-open road_0678)
  (= (congestion-factor road_0678) 1.03)
  (connects road_0679 loc_0392 loc_0028)
  (road-open road_0679)
  (= (congestion-factor road_0679) 1.06)
  (connects road_0680 loc_0393 loc_0493)
  (road-open road_0680)
  (= (congestion-factor road_0680) 1.04)
  (connects road_0681 loc_0393 loc_0482)
  (road-open road_0681)
  (= (congestion-factor road_0681) 1.08)
  (connects road_0682 loc_0394 loc_0272)
  (road-open road_0682)
  (= (congestion-factor road_0682) 1.12)
  (connects road_0683 loc_0395 loc_0278)
  (road-open road_0683)
  (= (congestion-factor road_0683) 1.1)
  (connects road_0684 loc_0395 loc_0082)
  (road-open road_0684)
  (= (congestion-factor road_0684) 1.1)
  (connects road_0685 loc_0396 loc_0477)
  (road-open road_0685)
  (= (congestion-factor road_0685) 1.0)
  (connects road_0686 loc_0397 loc_0392)
  (road-open road_0686)
  (= (congestion-factor road_0686) 1.05)
  (connects road_0687 loc_0397 loc_0307)
  (road-open road_0687)
  (= (congestion-factor road_0687) 1.05)
  (connects road_0688 loc_0397 loc_0398)
  (road-open road_0688)
  (= (congestion-factor road_0688) 1.2)
  (connects road_0689 loc_0398 loc_0397)
  (road-open road_0689)
  (= (congestion-factor road_0689) 1.05)
  (connects road_0690 loc_0398 loc_0177)
  (road-open road_0690)
  (= (congestion-factor road_0690) 1.2)
  (connects road_0691 loc_0399 loc_0355)
  (road-open road_0691)
  (= (congestion-factor road_0691) 1.0)
  (connects road_0692 loc_0399 loc_0208)
  (road-open road_0692)
  (= (congestion-factor road_0692) 1.06)
  (connects road_0693 loc_0399 loc_0123)
  (road-open road_0693)
  (= (congestion-factor road_0693) 1.03)
  (connects road_0694 loc_0400 loc_0198)
  (road-open road_0694)
  (= (congestion-factor road_0694) 1.0)
  (connects road_0696 loc_0402 loc_0257)
  (road-open road_0696)
  (= (congestion-factor road_0696) 1.0)
  (connects road_0697 loc_0402 loc_0414)
  (road-open road_0697)
  (= (congestion-factor road_0697) 1.0)
  (connects road_0698 loc_0402 loc_0240)
  (road-open road_0698)
  (= (congestion-factor road_0698) 1.05)
  (connects road_0700 loc_0404 loc_0300)
  (road-open road_0700)
  (= (congestion-factor road_0700) 1.0)
  (connects road_0701 loc_0404 loc_0281)
  (road-open road_0701)
  (= (congestion-factor road_0701) 1.0)
  (connects road_0702 loc_0404 loc_0468)
  (road-open road_0702)
  (= (congestion-factor road_0702) 1.0)
  (connects road_0703 loc_0405 loc_0288)
  (road-open road_0703)
  (= (congestion-factor road_0703) 1.0)
  (connects road_0704 loc_0405 loc_0133)
  (road-open road_0704)
  (= (congestion-factor road_0704) 1.03)
  (connects road_0705 loc_0406 loc_0242)
  (road-open road_0705)
  (= (congestion-factor road_0705) 1.0)
  (connects road_0706 loc_0407 loc_0358)
  (road-open road_0706)
  (= (congestion-factor road_0706) 1.0)
  (connects road_0707 loc_0408 loc_0251)
  (road-open road_0707)
  (= (congestion-factor road_0707) 1.0)
  (connects road_0708 loc_0408 loc_0055)
  (road-open road_0708)
  (= (congestion-factor road_0708) 1.05)
  (connects road_0709 loc_0409 loc_0337)
  (road-open road_0709)
  (= (congestion-factor road_0709) 1.0)
  (connects road_0711 loc_0413 loc_0207)
  (road-open road_0711)
  (= (congestion-factor road_0711) 1.0)
  (connects road_0712 loc_0413 loc_0070)
  (road-open road_0712)
  (= (congestion-factor road_0712) 1.06)
  (connects road_0713 loc_0414 loc_0402)
  (road-open road_0713)
  (= (congestion-factor road_0713) 1.05)
  (connects road_0714 loc_0415 loc_0155)
  (road-open road_0714)
  (= (congestion-factor road_0714) 1.14)
  (connects road_0715 loc_0415 loc_0380)
  (road-open road_0715)
  (= (congestion-factor road_0715) 1.05)
  (connects road_0716 loc_0416 loc_0126)
  (road-open road_0716)
  (= (congestion-factor road_0716) 1.03)
  (connects road_0717 loc_0416 loc_0127)
  (road-open road_0717)
  (= (congestion-factor road_0717) 1.0)
  (connects road_0718 loc_0417 loc_0335)
  (road-open road_0718)
  (= (congestion-factor road_0718) 1.05)
  (connects road_0719 loc_0417 loc_0321)
  (road-open road_0719)
  (= (congestion-factor road_0719) 1.11)
  (connects road_0720 loc_0418 loc_0317)
  (road-open road_0720)
  (= (congestion-factor road_0720) 1.0)
  (connects road_0722 loc_0420 loc_0271)
  (road-open road_0722)
  (= (congestion-factor road_0722) 1.0)
  (connects road_0723 loc_0421 loc_0256)
  (road-open road_0723)
  (= (congestion-factor road_0723) 1.08)
  (connects road_0724 loc_0421 loc_0288)
  (road-open road_0724)
  (= (congestion-factor road_0724) 1.1)
  (connects road_0725 loc_0422 loc_0442)
  (road-open road_0725)
  (= (congestion-factor road_0725) 1.0)
  (connects road_0726 loc_0422 loc_0064)
  (road-open road_0726)
  (= (congestion-factor road_0726) 1.05)
  (connects road_0727 loc_0422 loc_0401)
  (road-open road_0727)
  (= (congestion-factor road_0727) 1.1)
  (connects road_0728 loc_0423 loc_0044)
  (road-open road_0728)
  (= (congestion-factor road_0728) 1.14)
  (connects road_0729 loc_0423 loc_0027)
  (road-open road_0729)
  (= (congestion-factor road_0729) 1.03)
  (connects road_0730 loc_0424 loc_0423)
  (road-open road_0730)
  (= (congestion-factor road_0730) 1.2)
  (connects road_0732 loc_0426 loc_0425)
  (road-open road_0732)
  (= (congestion-factor road_0732) 1.09)
  (connects road_0733 loc_0426 loc_0028)
  (road-open road_0733)
  (= (congestion-factor road_0733) 1.0)
  (connects road_0734 loc_0427 loc_0458)
  (road-open road_0734)
  (= (congestion-factor road_0734) 1.03)
  (connects road_0735 loc_0427 loc_0203)
  (road-open road_0735)
  (= (congestion-factor road_0735) 1.0)
  (connects road_0736 loc_0428 loc_0198)
  (road-open road_0736)
  (= (congestion-factor road_0736) 1.05)
  (connects road_0738 loc_0429 loc_0033)
  (road-open road_0738)
  (= (congestion-factor road_0738) 1.03)
  (connects road_0739 loc_0430 loc_0266)
  (road-open road_0739)
  (= (congestion-factor road_0739) 1.1)
  (connects road_0740 loc_0431 loc_0048)
  (road-open road_0740)
  (= (congestion-factor road_0740) 1.05)
  (connects road_0741 loc_0431 loc_0062)
  (road-open road_0741)
  (= (congestion-factor road_0741) 1.05)
  (connects road_0742 loc_0432 loc_0413)
  (road-open road_0742)
  (= (congestion-factor road_0742) 1.06)
  (connects road_0743 loc_0432 loc_0441)
  (road-open road_0743)
  (= (congestion-factor road_0743) 1.05)
  (connects road_0744 loc_0433 loc_0471)
  (road-open road_0744)
  (= (congestion-factor road_0744) 1.0)
  (connects road_0745 loc_0434 loc_0001)
  (road-open road_0745)
  (= (congestion-factor road_0745) 1.05)
  (connects road_0746 loc_0434 loc_0139)
  (road-open road_0746)
  (= (congestion-factor road_0746) 1.14)
  (connects road_0747 loc_0435 loc_0209)
  (road-open road_0747)
  (= (congestion-factor road_0747) 1.05)
  (connects road_0749 loc_0437 loc_0452)
  (road-open road_0749)
  (= (congestion-factor road_0749) 1.0)
  (connects road_0750 loc_0437 loc_0498)
  (road-open road_0750)
  (= (congestion-factor road_0750) 1.0)
  (connects road_0751 loc_0437 loc_0206)
  (road-open road_0751)
  (= (congestion-factor road_0751) 1.09)
  (connects road_0752 loc_0438 loc_0449)
  (road-open road_0752)
  (= (congestion-factor road_0752) 1.0)
  (connects road_0753 loc_0438 loc_0454)
  (road-open road_0753)
  (= (congestion-factor road_0753) 1.11)
  (connects road_0754 loc_0439 loc_0039)
  (road-open road_0754)
  (= (congestion-factor road_0754) 1.0)
  (connects road_0756 loc_0440 loc_0453)
  (road-open road_0756)
  (= (congestion-factor road_0756) 1.0)
  (connects road_0757 loc_0440 loc_0369)
  (road-open road_0757)
  (= (congestion-factor road_0757) 1.03)
  (connects road_0758 loc_0441 loc_0432)
  (road-open road_0758)
  (= (congestion-factor road_0758) 1.0)
  (connects road_0759 loc_0442 loc_0405)
  (road-open road_0759)
  (= (congestion-factor road_0759) 1.0)
  (connects road_0760 loc_0443 loc_0143)
  (road-open road_0760)
  (= (congestion-factor road_0760) 1.05)
  (connects road_0761 loc_0443 loc_0012)
  (road-open road_0761)
  (= (congestion-factor road_0761) 1.1)
  (connects road_0762 loc_0444 loc_0445)
  (road-open road_0762)
  (= (congestion-factor road_0762) 1.05)
  (connects road_0763 loc_0444 loc_0001)
  (road-open road_0763)
  (= (congestion-factor road_0763) 1.05)
  (connects road_0765 loc_0445 loc_0141)
  (road-open road_0765)
  (= (congestion-factor road_0765) 1.03)
  (connects road_0766 loc_0446 loc_0190)
  (road-open road_0766)
  (= (congestion-factor road_0766) 1.04)
  (connects road_0767 loc_0446 loc_0222)
  (road-open road_0767)
  (= (congestion-factor road_0767) 1.1)
  (connects road_0768 loc_0447 loc_0232)
  (road-open road_0768)
  (= (congestion-factor road_0768) 1.11)
  (connects road_0769 loc_0448 loc_0136)
  (road-open road_0769)
  (= (congestion-factor road_0769) 1.15)
  (connects road_0770 loc_0448 loc_0187)
  (road-open road_0770)
  (= (congestion-factor road_0770) 1.08)
  (connects road_0771 loc_0448 loc_0265)
  (road-open road_0771)
  (= (congestion-factor road_0771) 1.02)
  (connects road_0772 loc_0449 loc_0253)
  (road-open road_0772)
  (= (congestion-factor road_0772) 1.03)
  (connects road_0773 loc_0449 loc_0462)
  (road-open road_0773)
  (= (congestion-factor road_0773) 1.09)
  (connects road_0774 loc_0450 loc_0207)
  (road-open road_0774)
  (= (congestion-factor road_0774) 1.09)
  (connects road_0775 loc_0450 loc_0070)
  (road-open road_0775)
  (= (congestion-factor road_0775) 1.11)
  (connects road_0776 loc_0451 loc_0107)
  (road-open road_0776)
  (= (congestion-factor road_0776) 1.15)
  (connects road_0777 loc_0451 loc_0122)
  (road-open road_0777)
  (= (congestion-factor road_0777) 1.15)
  (connects road_0778 loc_0451 loc_0452)
  (road-open road_0778)
  (= (congestion-factor road_0778) 1.06)
  (connects road_0779 loc_0452 loc_0437)
  (road-open road_0779)
  (= (congestion-factor road_0779) 1.03)
  (connects road_0780 loc_0452 loc_0140)
  (road-open road_0780)
  (= (congestion-factor road_0780) 1.2)
  (connects road_0781 loc_0453 loc_0421)
  (road-open road_0781)
  (= (congestion-factor road_0781) 1.14)
  (connects road_0782 loc_0453 loc_0020)
  (road-open road_0782)
  (= (congestion-factor road_0782) 1.09)
  (connects road_0783 loc_0454 loc_0463)
  (road-open road_0783)
  (= (congestion-factor road_0783) 1.06)
  (connects road_0784 loc_0454 loc_0210)
  (road-open road_0784)
  (= (congestion-factor road_0784) 1.0)
  (connects road_0785 loc_0455 loc_0440)
  (road-open road_0785)
  (= (congestion-factor road_0785) 1.14)
  (connects road_0786 loc_0456 loc_0279)
  (road-open road_0786)
  (= (congestion-factor road_0786) 1.12)
  (connects road_0787 loc_0457 loc_0017)
  (road-open road_0787)
  (= (congestion-factor road_0787) 1.1)
  (connects road_0789 loc_0458 loc_0373)
  (road-open road_0789)
  (= (congestion-factor road_0789) 1.03)
  (connects road_0790 loc_0458 loc_0459)
  (road-open road_0790)
  (= (congestion-factor road_0790) 1.0)
  (connects road_0791 loc_0459 loc_0458)
  (road-open road_0791)
  (= (congestion-factor road_0791) 1.0)
  (connects road_0793 loc_0461 loc_0073)
  (road-open road_0793)
  (= (congestion-factor road_0793) 1.06)
  (connects road_0794 loc_0461 loc_0347)
  (road-open road_0794)
  (= (congestion-factor road_0794) 1.0)
  (connects road_0795 loc_0462 loc_0113)
  (road-open road_0795)
  (= (congestion-factor road_0795) 1.03)
  (connects road_0796 loc_0462 loc_0438)
  (road-open road_0796)
  (= (congestion-factor road_0796) 1.09)
  (connects road_0797 loc_0462 loc_0449)
  (road-open road_0797)
  (= (congestion-factor road_0797) 1.03)
  (connects road_0798 loc_0463 loc_0224)
  (road-open road_0798)
  (= (congestion-factor road_0798) 1.25)
  (connects road_0799 loc_0463 loc_0124)
  (road-open road_0799)
  (= (congestion-factor road_0799) 1.03)
  (connects road_0801 loc_0465 loc_0130)
  (road-open road_0801)
  (= (congestion-factor road_0801) 1.0)
  (connects road_0802 loc_0465 loc_0466)
  (road-open road_0802)
  (= (congestion-factor road_0802) 1.05)
  (connects road_0803 loc_0467 loc_0228)
  (road-open road_0803)
  (= (congestion-factor road_0803) 1.0)
  (connects road_0804 loc_0467 loc_0217)
  (road-open road_0804)
  (= (congestion-factor road_0804) 1.0)
  (connects road_0805 loc_0468 loc_0102)
  (road-open road_0805)
  (= (congestion-factor road_0805) 1.1)
  (connects road_0806 loc_0468 loc_0404)
  (road-open road_0806)
  (= (congestion-factor road_0806) 1.0)
  (connects road_0807 loc_0469 loc_0192)
  (road-open road_0807)
  (= (congestion-factor road_0807) 1.09)
  (connects road_0808 loc_0469 loc_0173)
  (road-open road_0808)
  (= (congestion-factor road_0808) 1.1)
  (connects road_0809 loc_0469 loc_0214)
  (road-open road_0809)
  (= (congestion-factor road_0809) 1.03)
  (connects road_0810 loc_0470 loc_0217)
  (road-open road_0810)
  (= (congestion-factor road_0810) 1.0)
  (connects road_0811 loc_0470 loc_0233)
  (road-open road_0811)
  (= (congestion-factor road_0811) 1.15)
  (connects road_0812 loc_0471 loc_0199)
  (road-open road_0812)
  (= (congestion-factor road_0812) 1.0)
  (connects road_0813 loc_0471 loc_0472)
  (road-open road_0813)
  (= (congestion-factor road_0813) 1.15)
  (connects road_0814 loc_0472 loc_0300)
  (road-open road_0814)
  (= (congestion-factor road_0814) 1.05)
  (connects road_0815 loc_0472 loc_0468)
  (road-open road_0815)
  (= (congestion-factor road_0815) 1.1)
  (connects road_0816 loc_0473 loc_0386)
  (road-open road_0816)
  (= (congestion-factor road_0816) 1.04)
  (connects road_0817 loc_0473 loc_0363)
  (road-open road_0817)
  (= (congestion-factor road_0817) 1.08)
  (connects road_0818 loc_0473 loc_0161)
  (road-open road_0818)
  (= (congestion-factor road_0818) 1.05)
  (connects road_0819 loc_0474 loc_0323)
  (road-open road_0819)
  (= (congestion-factor road_0819) 1.0)
  (connects road_0820 loc_0474 loc_0373)
  (road-open road_0820)
  (= (congestion-factor road_0820) 1.04)
  (connects road_0821 loc_0475 loc_0060)
  (road-open road_0821)
  ;; [DYNAMIC EVENT - location closure] loc_0060 incident road
  (road-blocked road_0821)
  (= (congestion-factor road_0821) 1.0)
  (connects road_0822 loc_0475 loc_0089)
  (road-open road_0822)
  (= (congestion-factor road_0822) 1.0)
  (connects road_0823 loc_0476 loc_0475)
  (road-open road_0823)
  (= (congestion-factor road_0823) 1.0)
  (connects road_0824 loc_0476 loc_0089)
  (road-open road_0824)
  (= (congestion-factor road_0824) 1.0)
  (connects road_0825 loc_0477 loc_0478)
  (road-open road_0825)
  (= (congestion-factor road_0825) 1.0)
  (connects road_0826 loc_0477 loc_0396)
  (road-open road_0826)
  (= (congestion-factor road_0826) 1.0)
  (connects road_0827 loc_0478 loc_0066)
  (road-open road_0827)
  (= (congestion-factor road_0827) 1.11)
  (connects road_0828 loc_0479 loc_0478)
  (road-open road_0828)
  (= (congestion-factor road_0828) 1.1)
  (connects road_0834 loc_0482 loc_0015)
  (road-open road_0834)
  (= (congestion-factor road_0834) 1.04)
  (connects road_0835 loc_0482 loc_0393)
  (road-open road_0835)
  (= (congestion-factor road_0835) 1.02)
  (connects road_0836 loc_0483 loc_0092)
  (road-open road_0836)
  (= (congestion-factor road_0836) 1.0)
  (connects road_0838 loc_0486 loc_0057)
  (road-open road_0838)
  (= (congestion-factor road_0838) 1.03)
  (connects road_0839 loc_0486 loc_0088)
  (road-open road_0839)
  (= (congestion-factor road_0839) 1.17)
  (connects road_0843 loc_0489 loc_0088)
  (road-open road_0843)
  (= (congestion-factor road_0843) 1.06)
  (connects road_0844 loc_0489 loc_0486)
  (road-open road_0844)
  (= (congestion-factor road_0844) 1.09)
  (connects road_0845 loc_0490 loc_0332)
  (road-open road_0845)
  (= (congestion-factor road_0845) 1.0)
  (connects road_0846 loc_0491 loc_0094)
  (road-open road_0846)
  (= (congestion-factor road_0846) 1.03)
  (connects road_0847 loc_0491 loc_0050)
  (road-open road_0847)
  (= (congestion-factor road_0847) 1.0)
  (connects road_0848 loc_0492 loc_0115)
  (road-open road_0848)
  (= (congestion-factor road_0848) 1.1)
  (connects road_0849 loc_0492 loc_0367)
  (road-open road_0849)
  (= (congestion-factor road_0849) 1.05)
  (connects road_0851 loc_0493 loc_0237)
  (road-open road_0851)
  (= (congestion-factor road_0851) 1.05)
  (connects road_0852 loc_0494 loc_0116)
  (road-open road_0852)
  (= (congestion-factor road_0852) 1.03)
  (connects road_0853 loc_0494 loc_0239)
  (road-open road_0853)
  (= (congestion-factor road_0853) 1.03)
  (connects road_0854 loc_0495 loc_0127)
  (road-open road_0854)
  (= (congestion-factor road_0854) 1.05)
  (connects road_0855 loc_0495 loc_0006)
  (road-open road_0855)
  (= (congestion-factor road_0855) 1.15)
  (connects road_0856 loc_0496 loc_0078)
  (road-open road_0856)
  (= (congestion-factor road_0856) 1.16)
  (connects road_0857 loc_0496 loc_0304)
  (road-open road_0857)
  (= (congestion-factor road_0857) 1.11)
  (connects road_0858 loc_0497 loc_0054)
  (road-open road_0858)
  (= (congestion-factor road_0858) 1.0)
  (connects road_0859 loc_0497 loc_0179)
  (road-open road_0859)
  (= (congestion-factor road_0859) 1.0)
  (connects road_0860 loc_0498 loc_0336)
  (road-open road_0860)
  (= (congestion-factor road_0860) 1.0)
  (connects road_0861 loc_0498 loc_0169)
  (road-open road_0861)
  (= (congestion-factor road_0861) 1.0)
  ;; BEGIN DYNAMIC CONGESTION PROFILE
  (= (sim-time) 0)
  (current-window tw_00000)
  (= (window-start tw_00000) 0)
  (= (window-start tw_00030) 30)
  (= (window-start tw_00060) 60)
  (= (window-start tw_00090) 90)
  (= (window-start tw_00120) 120)
  (= (window-start tw_00150) 150)
  (= (window-start tw_00180) 180)
  (= (window-start tw_00210) 210)
  (= (window-start tw_00240) 240)
  (= (window-start tw_00270) 270)
  (= (window-start tw_00300) 300)
  (= (window-start tw_00330) 330)
  (= (window-start tw_00360) 360)
  (= (window-start tw_00390) 390)
  (= (window-start tw_00420) 420)
  (= (window-start tw_00450) 450)
  (= (window-start tw_00480) 480)
  (next-window tw_00000 tw_00030)
  (next-window tw_00030 tw_00060)
  (next-window tw_00060 tw_00090)
  (next-window tw_00090 tw_00120)
  (next-window tw_00120 tw_00150)
  (next-window tw_00150 tw_00180)
  (next-window tw_00180 tw_00210)
  (next-window tw_00210 tw_00240)
  (next-window tw_00240 tw_00270)
  (next-window tw_00270 tw_00300)
  (next-window tw_00300 tw_00330)
  (next-window tw_00330 tw_00360)
  (next-window tw_00360 tw_00390)
  (next-window tw_00390 tw_00420)
  (next-window tw_00420 tw_00450)
  (next-window tw_00450 tw_00480)
  (static-road macro_0000)
  (= (travel-duration macro_0000) 20.0289)
  (static-road macro_0001)
  (= (travel-duration macro_0001) 20.8201)
  (static-road macro_0004)
  (= (travel-duration macro_0004) 13.7667)
  (static-road macro_0005)
  (= (travel-duration macro_0005) 12.3737)
  (static-road macro_0006)
  (= (travel-duration macro_0006) 4.0505)
  (static-road macro_0007)
  (= (travel-duration macro_0007) 3.6982)
  (static-road macro_0008)
  (= (travel-duration macro_0008) 26.5964)
  (static-road macro_0009)
  (= (travel-duration macro_0009) 34.0682)
  (static-road macro_0010)
  (= (travel-duration macro_0010) 11.9933)
  (static-road macro_0011)
  (= (travel-duration macro_0011) 22.586)
  (static-road macro_0012)
  (= (travel-duration macro_0012) 16.5136)
  (static-road macro_0013)
  (= (travel-duration macro_0013) 20.5311)
  (static-road macro_0014)
  (= (travel-duration macro_0014) 14.5889)
  (static-road macro_0015)
  (= (travel-duration macro_0015) 40.3321)
  (static-road macro_0016)
  (= (travel-duration macro_0016) 10.7042)
  (static-road macro_0017)
  (= (travel-duration macro_0017) 26.6875)
  (static-road macro_0018)
  (= (travel-duration macro_0018) 12.0449)
  (static-road macro_0019)
  (= (travel-duration macro_0019) 37.2543)
  (static-road macro_0020)
  (= (travel-duration macro_0020) 39.0893)
  (static-road macro_0021)
  (= (travel-duration macro_0021) 8.2577)
  (static-road macro_0023)
  (= (travel-duration macro_0023) 3.1734)
  (static-road macro_0024)
  (= (travel-duration macro_0024) 15.7002)
  (static-road macro_0026)
  (= (travel-duration macro_0026) 0.7031)
  (static-road macro_0027)
  (= (travel-duration macro_0027) 23.8446)
  (static-road macro_0028)
  (= (travel-duration macro_0028) 47.7019)
  (static-road macro_0029)
  (= (travel-duration macro_0029) 4.1498)
  (static-road macro_0030)
  (= (travel-duration macro_0030) 23.0805)
  (static-road macro_0031)
  (= (travel-duration macro_0031) 10.5352)
  (static-road macro_0032)
  (= (travel-duration macro_0032) 4.7897)
  (static-road macro_0033)
  (= (travel-duration macro_0033) 26.5123)
  (static-road macro_0034)
  (= (travel-duration macro_0034) 12.1048)
  (static-road macro_0035)
  (= (travel-duration macro_0035) 48.0064)
  (static-road macro_0036)
  (= (travel-duration macro_0036) 6.0134)
  (static-road macro_0037)
  (= (travel-duration macro_0037) 16.6115)
  (static-road macro_0038)
  (= (travel-duration macro_0038) 44.5176)
  (static-road macro_0039)
  (= (travel-duration macro_0039) 28.4304)
  (static-road macro_0040)
  (= (travel-duration macro_0040) 26.8067)
  (static-road macro_0041)
  (= (travel-duration macro_0041) 21.0025)
  (static-road macro_0043)
  (= (travel-duration macro_0043) 16.261)
  (static-road macro_0044)
  (= (travel-duration macro_0044) 26.1838)
  (static-road macro_0045)
  (= (travel-duration macro_0045) 37.9425)
  (static-road macro_0046)
  (= (travel-duration macro_0046) 25.0926)
  (static-road macro_0047)
  (= (travel-duration macro_0047) 11.8357)
  (static-road macro_0048)
  (= (travel-duration macro_0048) 5.9223)
  (static-road macro_0049)
  (= (travel-duration macro_0049) 10.6254)
  (static-road macro_0050)
  (= (travel-duration macro_0050) 23.6637)
  (static-road macro_0051)
  (= (travel-duration macro_0051) 41.2781)
  (static-road macro_0052)
  (= (travel-duration macro_0052) 16.2815)
  (static-road macro_0053)
  (= (travel-duration macro_0053) 40.0822)
  (static-road macro_0054)
  (= (travel-duration macro_0054) 17.5361)
  (static-road macro_0055)
  (= (travel-duration macro_0055) 20.9162)
  (static-road macro_0056)
  (= (travel-duration macro_0056) 43.5785)
  (static-road macro_0057)
  (= (travel-duration macro_0057) 47.9074)
  (static-road macro_0058)
  (= (travel-duration macro_0058) 4.1655)
  (static-road road_0001)
  (= (travel-duration road_0001) 23.9876)
  (static-road road_0003)
  (= (travel-duration road_0003) 1.2521)
  (static-road road_0004)
  (= (travel-duration road_0004) 11.1433)
  (static-road road_0007)
  (= (travel-duration road_0007) 22.5837)
  (static-road road_0008)
  (= (travel-duration road_0008) 8.2281)
  (static-road road_0010)
  (= (travel-duration road_0010) 66.45)
  (static-road road_0011)
  (= (travel-duration road_0011) 6.219)
  (static-road road_0012)
  (= (travel-duration road_0012) 1.5037)
  (static-road road_0013)
  (= (travel-duration road_0013) 5.892)
  (static-road road_0014)
  (= (travel-duration road_0014) 4.6874)
  (static-road road_0015)
  (= (travel-duration road_0015) 1.6825)
  (static-road road_0016)
  (= (travel-duration road_0016) 23.1582)
  (static-road road_0018)
  (= (travel-duration road_0018) 12.607)
  (static-road road_0019)
  (= (travel-duration road_0019) 22.6884)
  (static-road road_0020)
  (= (travel-duration road_0020) 8.769)
  (static-road road_0021)
  (= (travel-duration road_0021) 2.4121)
  (static-road road_0022)
  (= (travel-duration road_0022) 7.341)
  (static-road road_0023)
  (= (travel-duration road_0023) 1.1318)
  (static-road road_0024)
  (= (travel-duration road_0024) 3.0429)
  (static-road road_0025)
  (= (travel-duration road_0025) 6.9212)
  (static-road road_0026)
  (= (travel-duration road_0026) 1.8076)
  (static-road road_0027)
  (= (travel-duration road_0027) 19.0775)
  (static-road road_0028)
  (= (travel-duration road_0028) 1.1318)
  (static-road road_0030)
  (= (travel-duration road_0030) 13.7114)
  (static-road road_0031)
  (= (travel-duration road_0031) 18.3199)
  (static-road road_0032)
  (= (travel-duration road_0032) 9.3448)
  (static-road road_0033)
  (= (travel-duration road_0033) 19.1897)
  (static-road road_0034)
  (= (travel-duration road_0034) 24.3469)
  (static-road road_0035)
  (= (travel-duration road_0035) 1.9345)
  (static-road road_0036)
  (= (travel-duration road_0036) 6.4833)
  (static-road road_0037)
  (= (travel-duration road_0037) 2.3821)
  (static-road road_0038)
  (= (travel-duration road_0038) 10.8592)
  (static-road road_0039)
  (= (travel-duration road_0039) 2.4027)
  (static-road road_0042)
  (= (travel-duration road_0042) 2.7168)
  (static-road road_0043)
  (= (travel-duration road_0043) 9.66)
  (static-road road_0044)
  (= (travel-duration road_0044) 10.4014)
  (static-road road_0045)
  (= (travel-duration road_0045) 3.603)
  (static-road road_0047)
  (= (travel-duration road_0047) 4.3898)
  (static-road road_0050)
  (= (travel-duration road_0050) 2.4841)
  (static-road road_0051)
  (= (travel-duration road_0051) 1.038)
  (static-road road_0052)
  (= (travel-duration road_0052) 3.5925)
  (static-road road_0053)
  (= (travel-duration road_0053) 27.7651)
  (static-road road_0058)
  (= (travel-duration road_0058) 19.5027)
  (static-road road_0061)
  (= (travel-duration road_0061) 8.5071)
  (static-road road_0062)
  (= (travel-duration road_0062) 20.6252)
  (static-road road_0063)
  (= (travel-duration road_0063) 14.7741)
  (static-road road_0064)
  (= (travel-duration road_0064) 2.8801)
  (static-road road_0065)
  (= (travel-duration road_0065) 7.9408)
  (static-road road_0066)
  (= (travel-duration road_0066) 42.6465)
  (static-road road_0067)
  (= (travel-duration road_0067) 3.3028)
  (static-road road_0070)
  (= (travel-duration road_0070) 2.1267)
  (static-road road_0071)
  (= (travel-duration road_0071) 1.6809)
  (static-road road_0072)
  (= (travel-duration road_0072) 23.9581)
  (static-road road_0074)
  (= (travel-duration road_0074) 1.9417)
  (static-road road_0075)
  (= (travel-duration road_0075) 2.2248)
  (static-road road_0076)
  (= (travel-duration road_0076) 30.8193)
  (static-road road_0077)
  (= (travel-duration road_0077) 13.4624)
  (static-road road_0079)
  (= (travel-duration road_0079) 47.5774)
  (static-road road_0080)
  (= (travel-duration road_0080) 17.4665)
  (static-road road_0081)
  (= (travel-duration road_0081) 30.4146)
  (static-road road_0083)
  (= (travel-duration road_0083) 18.1956)
  (static-road road_0084)
  (= (travel-duration road_0084) 10.7107)
  (static-road road_0086)
  (= (travel-duration road_0086) 14.9245)
  (static-road road_0087)
  (= (travel-duration road_0087) 10.7734)
  (static-road road_0088)
  (= (travel-duration road_0088) 15.3765)
  (static-road road_0089)
  (= (travel-duration road_0089) 12.7378)
  (static-road road_0090)
  (= (travel-duration road_0090) 12.9031)
  (static-road road_0091)
  (= (travel-duration road_0091) 3.1063)
  (static-road road_0092)
  (= (travel-duration road_0092) 6.1346)
  (static-road road_0093)
  (= (travel-duration road_0093) 18.9909)
  (static-road road_0094)
  (= (travel-duration road_0094) 13.5515)
  (static-road road_0095)
  (= (travel-duration road_0095) 8.3005)
  (static-road road_0097)
  (= (travel-duration road_0097) 8.4059)
  (static-road road_0098)
  (= (travel-duration road_0098) 15.9216)
  (static-road road_0099)
  (= (travel-duration road_0099) 25.7098)
  (static-road road_0100)
  (= (travel-duration road_0100) 102.6604)
  (static-road road_0101)
  (= (travel-duration road_0101) 1.9512)
  (static-road road_0102)
  (= (travel-duration road_0102) 0.9972)
  (static-road road_0104)
  (= (travel-duration road_0104) 29.7396)
  (static-road road_0105)
  (= (travel-duration road_0105) 8.8703)
  (static-road road_0106)
  (= (travel-duration road_0106) 12.5488)
  (static-road road_0107)
  (= (travel-duration road_0107) 4.6093)
  (static-road road_0108)
  (= (travel-duration road_0108) 1.4362)
  (static-road road_0109)
  (= (travel-duration road_0109) 3.3264)
  (static-road road_0110)
  (= (travel-duration road_0110) 5.8901)
  (static-road road_0111)
  (= (travel-duration road_0111) 1.8997)
  (static-road road_0112)
  (= (travel-duration road_0112) 4.1138)
  (static-road road_0114)
  (= (travel-duration road_0114) 22.9305)
  (static-road road_0115)
  (= (travel-duration road_0115) 19.8344)
  (static-road road_0116)
  (= (travel-duration road_0116) 8.6631)
  (static-road road_0117)
  (= (travel-duration road_0117) 22.0989)
  (static-road road_0118)
  (= (travel-duration road_0118) 11.6328)
  (static-road road_0119)
  (= (travel-duration road_0119) 6.1963)
  (static-road road_0120)
  (= (travel-duration road_0120) 2.733)
  (static-road road_0121)
  (= (travel-duration road_0121) 36.3358)
  (static-road road_0122)
  (= (travel-duration road_0122) 15.9164)
  (static-road road_0123)
  (= (travel-duration road_0123) 8.2899)
  (static-road road_0124)
  (= (travel-duration road_0124) 4.5272)
  (static-road road_0125)
  (= (travel-duration road_0125) 7.0227)
  (static-road road_0126)
  (= (travel-duration road_0126) 6.1792)
  (static-road road_0128)
  (= (travel-duration road_0128) 3.6711)
  (static-road road_0129)
  (= (travel-duration road_0129) 9.8511)
  (static-road road_0131)
  (= (travel-duration road_0131) 8.5287)
  (static-road road_0132)
  (= (travel-duration road_0132) 11.3285)
  (static-road road_0133)
  (= (travel-duration road_0133) 4.6646)
  (static-road road_0134)
  (= (travel-duration road_0134) 8.2899)
  (static-road road_0135)
  (= (travel-duration road_0135) 2.1279)
  (static-road road_0136)
  (= (travel-duration road_0136) 28.6434)
  (static-road road_0137)
  (= (travel-duration road_0137) 4.1052)
  (static-road road_0138)
  (= (travel-duration road_0138) 1.7735)
  (static-road road_0139)
  (= (travel-duration road_0139) 2.9801)
  (static-road road_0140)
  (= (travel-duration road_0140) 2.5132)
  (static-road road_0141)
  (= (travel-duration road_0141) 4.9353)
  (static-road road_0142)
  (= (travel-duration road_0142) 30.209)
  (static-road road_0143)
  (= (travel-duration road_0143) 13.1158)
  (static-road road_0144)
  (= (travel-duration road_0144) 5.1554)
  (static-road road_0145)
  (= (travel-duration road_0145) 23.1777)
  (static-road road_0146)
  (= (travel-duration road_0146) 29.796)
  (static-road road_0147)
  (= (travel-duration road_0147) 4.6646)
  (static-road road_0148)
  (= (travel-duration road_0148) 112.9518)
  (static-road road_0149)
  (= (travel-duration road_0149) 7.6515)
  (static-road road_0150)
  (= (travel-duration road_0150) 10.1294)
  (static-road road_0151)
  (= (travel-duration road_0151) 26.4037)
  (static-road road_0152)
  (= (travel-duration road_0152) 18.0364)
  (static-road road_0153)
  (= (travel-duration road_0153) 16.7666)
  (static-road road_0154)
  (= (travel-duration road_0154) 19.8942)
  (static-road road_0155)
  (= (travel-duration road_0155) 15.9155)
  (static-road road_0156)
  (= (travel-duration road_0156) 6.2952)
  (static-road road_0157)
  (= (travel-duration road_0157) 14.5509)
  (static-road road_0159)
  (= (travel-duration road_0159) 124.2469)
  (static-road road_0160)
  (= (travel-duration road_0160) 13.2242)
  (static-road road_0161)
  (= (travel-duration road_0161) 0.7056)
  (static-road road_0162)
  (= (travel-duration road_0162) 5.8934)
  (static-road road_0163)
  (= (travel-duration road_0163) 6.9291)
  (static-road road_0164)
  (= (travel-duration road_0164) 8.5807)
  (static-road road_0165)
  (= (travel-duration road_0165) 11.5912)
  (static-road road_0166)
  (= (travel-duration road_0166) 5.3078)
  (static-road road_0167)
  (= (travel-duration road_0167) 5.6097)
  (static-road road_0169)
  (= (travel-duration road_0169) 9.1669)
  (static-road road_0170)
  (= (travel-duration road_0170) 1.0451)
  (static-road road_0171)
  (= (travel-duration road_0171) 9.3557)
  (static-road road_0172)
  (= (travel-duration road_0172) 6.1346)
  (static-road road_0173)
  (= (travel-duration road_0173) 3.2533)
  (static-road road_0174)
  (= (travel-duration road_0174) 0.3751)
  (static-road road_0175)
  (= (travel-duration road_0175) 4.2326)
  (static-road road_0177)
  (= (travel-duration road_0177) 12.6874)
  (static-road road_0178)
  (= (travel-duration road_0178) 8.5998)
  (static-road road_0179)
  (= (travel-duration road_0179) 14.8069)
  (static-road road_0181)
  (= (travel-duration road_0181) 1.9288)
  (static-road road_0182)
  (= (travel-duration road_0182) 8.8747)
  (static-road road_0184)
  (= (travel-duration road_0184) 9.5884)
  (static-road road_0187)
  (= (travel-duration road_0187) 1.5398)
  (static-road road_0188)
  (= (travel-duration road_0188) 6.9118)
  (static-road road_0189)
  (= (travel-duration road_0189) 6.2835)
  (static-road road_0191)
  (= (travel-duration road_0191) 17.7453)
  (static-road road_0192)
  (= (travel-duration road_0192) 1.5037)
  (static-road road_0193)
  (= (travel-duration road_0193) 17.2429)
  (static-road road_0194)
  (= (travel-duration road_0194) 24.8342)
  (static-road road_0195)
  (= (travel-duration road_0195) 4.6834)
  (static-road road_0196)
  (= (travel-duration road_0196) 6.5297)
  (static-road road_0197)
  (= (travel-duration road_0197) 2.9652)
  (static-road road_0198)
  (= (travel-duration road_0198) 2.749)
  (static-road road_0199)
  (= (travel-duration road_0199) 5.0851)
  (static-road road_0200)
  (= (travel-duration road_0200) 5.1718)
  (static-road road_0201)
  (= (travel-duration road_0201) 14.4528)
  (static-road road_0202)
  (= (travel-duration road_0202) 6.9735)
  (static-road road_0203)
  (= (travel-duration road_0203) 14.7342)
  (static-road road_0204)
  (= (travel-duration road_0204) 2.1997)
  (static-road road_0205)
  (= (travel-duration road_0205) 11.6719)
  (static-road road_0208)
  (= (travel-duration road_0208) 17.6903)
  (static-road road_0209)
  (= (travel-duration road_0209) 3.5269)
  (static-road road_0210)
  (= (travel-duration road_0210) 5.1023)
  (static-road road_0211)
  (= (travel-duration road_0211) 6.5573)
  (static-road road_0212)
  (= (travel-duration road_0212) 9.6108)
  (static-road road_0213)
  (= (travel-duration road_0213) 45.9989)
  (static-road road_0214)
  (= (travel-duration road_0214) 8.7072)
  (static-road road_0215)
  (= (travel-duration road_0215) 5.3452)
  (static-road road_0216)
  (= (travel-duration road_0216) 1.3591)
  (static-road road_0219)
  (= (travel-duration road_0219) 10.7306)
  (static-road road_0220)
  (= (travel-duration road_0220) 4.0407)
  (static-road road_0221)
  (= (travel-duration road_0221) 11.128)
  (static-road road_0222)
  (= (travel-duration road_0222) 6.6411)
  (static-road road_0223)
  (= (travel-duration road_0223) 3.0771)
  (static-road road_0224)
  (= (travel-duration road_0224) 4.4065)
  (static-road road_0225)
  (= (travel-duration road_0225) 0.3803)
  (static-road road_0227)
  (= (travel-duration road_0227) 21.8795)
  (static-road road_0228)
  (= (travel-duration road_0228) 3.6822)
  (static-road road_0230)
  (= (travel-duration road_0230) 10.7932)
  (static-road road_0232)
  (= (travel-duration road_0232) 8.4579)
  (static-road road_0233)
  (= (travel-duration road_0233) 3.2933)
  (static-road road_0234)
  (= (travel-duration road_0234) 1.0844)
  (static-road road_0235)
  (= (travel-duration road_0235) 14.2969)
  (static-road road_0236)
  (= (travel-duration road_0236) 11.2805)
  (static-road road_0237)
  (= (travel-duration road_0237) 15.7708)
  (static-road road_0238)
  (= (travel-duration road_0238) 11.6683)
  (static-road road_0239)
  (= (travel-duration road_0239) 19.6535)
  (static-road road_0241)
  (= (travel-duration road_0241) 12.0313)
  (static-road road_0242)
  (= (travel-duration road_0242) 9.4535)
  (static-road road_0243)
  (= (travel-duration road_0243) 1.779)
  (static-road road_0244)
  (= (travel-duration road_0244) 21.244)
  (static-road road_0245)
  (= (travel-duration road_0245) 3.2933)
  (static-road road_0246)
  (= (travel-duration road_0246) 22.7699)
  (static-road road_0247)
  (= (travel-duration road_0247) 26.3543)
  (static-road road_0248)
  (= (travel-duration road_0248) 14.173)
  (static-road road_0249)
  (= (travel-duration road_0249) 54.0524)
  (static-road road_0250)
  (= (travel-duration road_0250) 13.4981)
  (static-road road_0251)
  (= (travel-duration road_0251) 13.223)
  (static-road road_0252)
  (= (travel-duration road_0252) 1.8345)
  (static-road road_0253)
  (= (travel-duration road_0253) 2.3639)
  (static-road road_0254)
  (= (travel-duration road_0254) 30.8713)
  (static-road road_0257)
  (= (travel-duration road_0257) 18.3451)
  (static-road road_0258)
  (= (travel-duration road_0258) 19.2624)
  (static-road road_0259)
  (= (travel-duration road_0259) 9.6677)
  (static-road road_0260)
  (= (travel-duration road_0260) 0.9481)
  (static-road road_0261)
  (= (travel-duration road_0261) 2.0406)
  (static-road road_0262)
  (= (travel-duration road_0262) 9.0208)
  (static-road road_0263)
  (= (travel-duration road_0263) 2.256)
  (static-road road_0264)
  (= (travel-duration road_0264) 2.1454)
  (static-road road_0265)
  (= (travel-duration road_0265) 9.0277)
  (static-road road_0266)
  (= (travel-duration road_0266) 7.7487)
  (static-road road_0267)
  (= (travel-duration road_0267) 9.0506)
  (static-road road_0268)
  (= (travel-duration road_0268) 11.9087)
  (static-road road_0269)
  (= (travel-duration road_0269) 9.22)
  (static-road road_0270)
  (= (travel-duration road_0270) 16.9891)
  (static-road road_0271)
  (= (travel-duration road_0271) 8.325)
  (static-road road_0273)
  (= (travel-duration road_0273) 10.6291)
  (static-road road_0274)
  (= (travel-duration road_0274) 17.3503)
  (static-road road_0275)
  (= (travel-duration road_0275) 3.8618)
  (static-road road_0276)
  (= (travel-duration road_0276) 1.0872)
  (static-road road_0277)
  (= (travel-duration road_0277) 0.7094)
  (static-road road_0280)
  (= (travel-duration road_0280) 2.3949)
  (static-road road_0282)
  (= (travel-duration road_0282) 8.4219)
  (static-road road_0286)
  (= (travel-duration road_0286) 8.8048)
  (static-road road_0288)
  (= (travel-duration road_0288) 0.9362)
  (static-road road_0290)
  (= (travel-duration road_0290) 81.0452)
  (static-road road_0291)
  (= (travel-duration road_0291) 43.9175)
  (static-road road_0292)
  (= (travel-duration road_0292) 15.3113)
  (static-road road_0294)
  (= (travel-duration road_0294) 2.4337)
  (static-road road_0295)
  (= (travel-duration road_0295) 4.2323)
  (static-road road_0296)
  (= (travel-duration road_0296) 10.48)
  (static-road road_0297)
  (= (travel-duration road_0297) 10.0737)
  (static-road road_0298)
  (= (travel-duration road_0298) 7.0941)
  (static-road road_0299)
  (= (travel-duration road_0299) 10.4105)
  (static-road road_0300)
  (= (travel-duration road_0300) 2.5296)
  (static-road road_0302)
  (= (travel-duration road_0302) 11.402)
  (static-road road_0303)
  (= (travel-duration road_0303) 13.8289)
  (static-road road_0304)
  (= (travel-duration road_0304) 24.0949)
  (static-road road_0307)
  (= (travel-duration road_0307) 0.8612)
  (static-road road_0309)
  (= (travel-duration road_0309) 2.8628)
  (static-road road_0310)
  (= (travel-duration road_0310) 9.6756)
  (static-road road_0311)
  (= (travel-duration road_0311) 3.285)
  (static-road road_0313)
  (= (travel-duration road_0313) 1.222)
  (static-road road_0314)
  (= (travel-duration road_0314) 15.9561)
  (static-road road_0315)
  (= (travel-duration road_0315) 5.9897)
  (static-road road_0316)
  (= (travel-duration road_0316) 1.2132)
  (static-road road_0317)
  (= (travel-duration road_0317) 8.1445)
  (static-road road_0318)
  (= (travel-duration road_0318) 3.1704)
  (static-road road_0319)
  (= (travel-duration road_0319) 0.813)
  (static-road road_0320)
  (= (travel-duration road_0320) 7.7748)
  (static-road road_0321)
  (= (travel-duration road_0321) 100.2513)
  (static-road road_0322)
  (= (travel-duration road_0322) 3.2501)
  (static-road road_0323)
  (= (travel-duration road_0323) 14.1402)
  (static-road road_0324)
  (= (travel-duration road_0324) 23.3317)
  (static-road road_0325)
  (= (travel-duration road_0325) 1.7566)
  (static-road road_0326)
  (= (travel-duration road_0326) 1.7872)
  (static-road road_0327)
  (= (travel-duration road_0327) 14.3874)
  (static-road road_0328)
  (= (travel-duration road_0328) 6.591)
  (static-road road_0329)
  (= (travel-duration road_0329) 1.2082)
  (static-road road_0333)
  (= (travel-duration road_0333) 1.6883)
  (static-road road_0335)
  (= (travel-duration road_0335) 12.9029)
  (static-road road_0336)
  (= (travel-duration road_0336) 4.1241)
  (static-road road_0337)
  (= (travel-duration road_0337) 24.4105)
  (static-road road_0338)
  (= (travel-duration road_0338) 16.6135)
  (static-road road_0339)
  (= (travel-duration road_0339) 12.3753)
  (static-road road_0340)
  (= (travel-duration road_0340) 11.0429)
  (static-road road_0341)
  (= (travel-duration road_0341) 9.1669)
  (static-road road_0342)
  (= (travel-duration road_0342) 4.8084)
  (static-road road_0343)
  (= (travel-duration road_0343) 19.9302)
  (static-road road_0344)
  (= (travel-duration road_0344) 6.9166)
  (static-road road_0345)
  (= (travel-duration road_0345) 20.6581)
  (static-road road_0347)
  (= (travel-duration road_0347) 25.6658)
  (static-road road_0348)
  (= (travel-duration road_0348) 4.0725)
  (static-road road_0349)
  (= (travel-duration road_0349) 13.7764)
  (static-road road_0350)
  (= (travel-duration road_0350) 14.3635)
  (static-road road_0351)
  (= (travel-duration road_0351) 4.0435)
  (static-road road_0352)
  (= (travel-duration road_0352) 9.7336)
  (static-road road_0354)
  (= (travel-duration road_0354) 3.5166)
  (static-road road_0355)
  (= (travel-duration road_0355) 8.1714)
  (static-road road_0356)
  (= (travel-duration road_0356) 2.7985)
  (static-road road_0357)
  (= (travel-duration road_0357) 33.908)
  (static-road road_0360)
  (= (travel-duration road_0360) 1.585)
  (static-road road_0361)
  (= (travel-duration road_0361) 2.1384)
  (static-road road_0362)
  (= (travel-duration road_0362) 6.8882)
  (static-road road_0364)
  (= (travel-duration road_0364) 3.5771)
  (static-road road_0365)
  (= (travel-duration road_0365) 5.5286)
  (static-road road_0367)
  (= (travel-duration road_0367) 11.5913)
  (static-road road_0369)
  (= (travel-duration road_0369) 3.2056)
  (static-road road_0371)
  (= (travel-duration road_0371) 12.1055)
  (static-road road_0372)
  (= (travel-duration road_0372) 15.0778)
  (static-road road_0373)
  (= (travel-duration road_0373) 5.4399)
  (static-road road_0374)
  (= (travel-duration road_0374) 25.8415)
  (static-road road_0375)
  (= (travel-duration road_0375) 34.3916)
  (static-road road_0376)
  (= (travel-duration road_0376) 11.185)
  (static-road road_0377)
  (= (travel-duration road_0377) 10.1294)
  (static-road road_0378)
  (= (travel-duration road_0378) 10.438)
  (static-road road_0379)
  (= (travel-duration road_0379) 0.2952)
  (static-road road_0380)
  (= (travel-duration road_0380) 1.2782)
  (static-road road_0381)
  (= (travel-duration road_0381) 1.3991)
  (static-road road_0382)
  (= (travel-duration road_0382) 10.4774)
  (static-road road_0383)
  (= (travel-duration road_0383) 21.6259)
  (static-road road_0384)
  (= (travel-duration road_0384) 17.2317)
  (static-road road_0385)
  (= (travel-duration road_0385) 34.2818)
  (static-road road_0386)
  (= (travel-duration road_0386) 9.3208)
  (static-road road_0387)
  (= (travel-duration road_0387) 9.3208)
  (static-road road_0388)
  (= (travel-duration road_0388) 8.1922)
  (static-road road_0389)
  (= (travel-duration road_0389) 10.7306)
  (static-road road_0390)
  (= (travel-duration road_0390) 12.7378)
  (static-road road_0391)
  (= (travel-duration road_0391) 2.0953)
  (static-road road_0392)
  (= (travel-duration road_0392) 1.2398)
  (static-road road_0393)
  (= (travel-duration road_0393) 4.0407)
  (static-road road_0394)
  (= (travel-duration road_0394) 2.0341)
  (static-road road_0395)
  (= (travel-duration road_0395) 7.1156)
  (static-road road_0396)
  (= (travel-duration road_0396) 5.4482)
  (static-road road_0397)
  (= (travel-duration road_0397) 6.233)
  (static-road road_0398)
  (= (travel-duration road_0398) 3.1789)
  (static-road road_0399)
  (= (travel-duration road_0399) 26.3339)
  (static-road road_0400)
  (= (travel-duration road_0400) 7.8199)
  (static-road road_0401)
  (= (travel-duration road_0401) 3.3568)
  (static-road road_0403)
  (= (travel-duration road_0403) 20.2839)
  (static-road road_0404)
  (= (travel-duration road_0404) 1.9895)
  (static-road road_0405)
  (= (travel-duration road_0405) 7.6208)
  (static-road road_0406)
  (= (travel-duration road_0406) 23.0445)
  (static-road road_0407)
  (= (travel-duration road_0407) 6.8686)
  (static-road road_0408)
  (= (travel-duration road_0408) 4.5272)
  (static-road road_0410)
  (= (travel-duration road_0410) 2.4218)
  (static-road road_0411)
  (= (travel-duration road_0411) 7.0865)
  (static-road road_0412)
  (= (travel-duration road_0412) 0.17)
  (static-road road_0413)
  (= (travel-duration road_0413) 0.3127)
  (static-road road_0414)
  (= (travel-duration road_0414) 16.3091)
  (static-road road_0416)
  (= (travel-duration road_0416) 6.3349)
  (static-road road_0417)
  (= (travel-duration road_0417) 13.5301)
  (static-road road_0418)
  (= (travel-duration road_0418) 13.3327)
  (static-road road_0419)
  (= (travel-duration road_0419) 6.595)
  (static-road road_0420)
  (= (travel-duration road_0420) 8.6239)
  (static-road road_0421)
  (= (travel-duration road_0421) 46.8139)
  (static-road road_0422)
  (= (travel-duration road_0422) 11.5187)
  (static-road road_0423)
  (= (travel-duration road_0423) 4.7165)
  (static-road road_0424)
  (= (travel-duration road_0424) 2.7265)
  (static-road road_0426)
  (= (travel-duration road_0426) 1.521)
  (static-road road_0427)
  (= (travel-duration road_0427) 2.145)
  (static-road road_0428)
  (= (travel-duration road_0428) 4.757)
  (static-road road_0430)
  (= (travel-duration road_0430) 19.3962)
  (static-road road_0433)
  (= (travel-duration road_0433) 4.7594)
  (static-road road_0434)
  (= (travel-duration road_0434) 3.348)
  (static-road road_0436)
  (= (travel-duration road_0436) 6.9212)
  (static-road road_0437)
  (= (travel-duration road_0437) 9.5128)
  (static-road road_0438)
  (= (travel-duration road_0438) 17.2987)
  (static-road road_0439)
  (= (travel-duration road_0439) 3.3661)
  (static-road road_0440)
  (= (travel-duration road_0440) 54.0524)
  (static-road road_0441)
  (= (travel-duration road_0441) 6.6022)
  (static-road road_0442)
  (= (travel-duration road_0442) 1.1873)
  (static-road road_0443)
  (= (travel-duration road_0443) 0.9779)
  (static-road road_0444)
  (= (travel-duration road_0444) 25.4055)
  (static-road road_0445)
  (= (travel-duration road_0445) 19.0286)
  (static-road road_0446)
  (= (travel-duration road_0446) 5.2346)
  (static-road road_0447)
  (= (travel-duration road_0447) 3.3786)
  (static-road road_0448)
  (= (travel-duration road_0448) 5.2332)
  (static-road road_0449)
  (= (travel-duration road_0449) 2.7466)
  (static-road road_0451)
  (= (travel-duration road_0451) 7.5725)
  (static-road road_0452)
  (= (travel-duration road_0452) 9.3557)
  (static-road road_0453)
  (= (travel-duration road_0453) 14.6569)
  (static-road road_0454)
  (= (travel-duration road_0454) 2.305)
  (static-road road_0455)
  (= (travel-duration road_0455) 18.8288)
  (static-road road_0456)
  (= (travel-duration road_0456) 4.8518)
  (static-road road_0457)
  (= (travel-duration road_0457) 2.825)
  (static-road road_0458)
  (= (travel-duration road_0458) 6.3897)
  (static-road road_0459)
  (= (travel-duration road_0459) 0.7888)
  (static-road road_0460)
  (= (travel-duration road_0460) 1.2536)
  (static-road road_0461)
  (= (travel-duration road_0461) 7.9164)
  (static-road road_0462)
  (= (travel-duration road_0462) 2.4265)
  (static-road road_0463)
  (= (travel-duration road_0463) 8.3401)
  (static-road road_0464)
  (= (travel-duration road_0464) 4.7295)
  (static-road road_0465)
  (= (travel-duration road_0465) 3.0601)
  (static-road road_0466)
  (= (travel-duration road_0466) 6.1303)
  (static-road road_0467)
  (= (travel-duration road_0467) 5.1614)
  (static-road road_0468)
  (= (travel-duration road_0468) 1.6873)
  (static-road road_0469)
  (= (travel-duration road_0469) 10.5433)
  (static-road road_0471)
  (= (travel-duration road_0471) 3.0529)
  (static-road road_0472)
  (= (travel-duration road_0472) 2.3702)
  (static-road road_0473)
  (= (travel-duration road_0473) 9.8009)
  (static-road road_0475)
  (= (travel-duration road_0475) 15.8955)
  (static-road road_0476)
  (= (travel-duration road_0476) 7.9167)
  (static-road road_0479)
  (= (travel-duration road_0479) 10.0265)
  (static-road road_0480)
  (= (travel-duration road_0480) 21.3249)
  (static-road road_0481)
  (= (travel-duration road_0481) 13.9414)
  (static-road road_0482)
  (= (travel-duration road_0482) 19.028)
  (static-road road_0483)
  (= (travel-duration road_0483) 19.028)
  (static-road road_0484)
  (= (travel-duration road_0484) 3.0228)
  (static-road road_0485)
  (= (travel-duration road_0485) 1.8664)
  (static-road road_0486)
  (= (travel-duration road_0486) 2.1026)
  (static-road road_0487)
  (= (travel-duration road_0487) 33.0812)
  (static-road road_0488)
  (= (travel-duration road_0488) 13.2941)
  (static-road road_0490)
  (= (travel-duration road_0490) 22.3911)
  (static-road road_0491)
  (= (travel-duration road_0491) 5.396)
  (static-road road_0492)
  (= (travel-duration road_0492) 13.8376)
  (static-road road_0493)
  (= (travel-duration road_0493) 14.1047)
  (static-road road_0496)
  (= (travel-duration road_0496) 11.0253)
  (static-road road_0497)
  (= (travel-duration road_0497) 0.8287)
  (static-road road_0498)
  (= (travel-duration road_0498) 25.7209)
  (static-road road_0499)
  (= (travel-duration road_0499) 18.214)
  (static-road road_0500)
  (= (travel-duration road_0500) 17.2567)
  (static-road road_0501)
  (= (travel-duration road_0501) 21.034)
  (static-road road_0502)
  (= (travel-duration road_0502) 3.1085)
  (static-road road_0505)
  (= (travel-duration road_0505) 7.8028)
  (static-road road_0506)
  (= (travel-duration road_0506) 7.9784)
  (static-road road_0507)
  (= (travel-duration road_0507) 3.4477)
  (static-road road_0508)
  (= (travel-duration road_0508) 15.9659)
  (static-road road_0511)
  (= (travel-duration road_0511) 4.4144)
  (static-road road_0512)
  (= (travel-duration road_0512) 6.9849)
  (static-road road_0513)
  (= (travel-duration road_0513) 7.7407)
  (static-road road_0514)
  (= (travel-duration road_0514) 14.6506)
  (static-road road_0515)
  (= (travel-duration road_0515) 7.9784)
  (static-road road_0516)
  (= (travel-duration road_0516) 10.3689)
  (static-road road_0517)
  (= (travel-duration road_0517) 11.0429)
  (static-road road_0518)
  (= (travel-duration road_0518) 4.0213)
  (static-road road_0519)
  (= (travel-duration road_0519) 17.4144)
  (static-road road_0520)
  (= (travel-duration road_0520) 2.1358)
  (static-road road_0521)
  (= (travel-duration road_0521) 7.4042)
  (static-road road_0522)
  (= (travel-duration road_0522) 17.5402)
  (static-road road_0523)
  (= (travel-duration road_0523) 18.0364)
  (static-road road_0524)
  (= (travel-duration road_0524) 5.6265)
  (static-road road_0525)
  (= (travel-duration road_0525) 21.9009)
  (static-road road_0526)
  (= (travel-duration road_0526) 13.7903)
  (static-road road_0527)
  (= (travel-duration road_0527) 0.5964)
  (static-road road_0530)
  (= (travel-duration road_0530) 1.6116)
  (static-road road_0532)
  (= (travel-duration road_0532) 16.7666)
  (static-road road_0533)
  (= (travel-duration road_0533) 7.5274)
  (static-road road_0534)
  (= (travel-duration road_0534) 19.1579)
  (static-road road_0535)
  (= (travel-duration road_0535) 4.5684)
  (static-road road_0536)
  (= (travel-duration road_0536) 1.883)
  (static-road road_0537)
  (= (travel-duration road_0537) 19.3472)
  (static-road road_0539)
  (= (travel-duration road_0539) 13.6911)
  (static-road road_0540)
  (= (travel-duration road_0540) 18.5362)
  (static-road road_0541)
  (= (travel-duration road_0541) 17.492)
  (static-road road_0542)
  (= (travel-duration road_0542) 13.4056)
  (static-road road_0543)
  (= (travel-duration road_0543) 22.7212)
  (static-road road_0544)
  (= (travel-duration road_0544) 119.0824)
  (static-road road_0545)
  (= (travel-duration road_0545) 0.9403)
  (static-road road_0546)
  (= (travel-duration road_0546) 13.8054)
  (static-road road_0549)
  (= (travel-duration road_0549) 41.2939)
  (static-road road_0550)
  (= (travel-duration road_0550) 10.2235)
  (static-road road_0551)
  (= (travel-duration road_0551) 49.3147)
  (static-road road_0552)
  (= (travel-duration road_0552) 5.8675)
  (static-road road_0553)
  (= (travel-duration road_0553) 3.5512)
  (static-road road_0554)
  (= (travel-duration road_0554) 20.0226)
  (static-road road_0555)
  (= (travel-duration road_0555) 3.8861)
  (static-road road_0556)
  (= (travel-duration road_0556) 12.5123)
  (static-road road_0557)
  (= (travel-duration road_0557) 13.6691)
  (static-road road_0559)
  (= (travel-duration road_0559) 17.0227)
  (static-road road_0561)
  (= (travel-duration road_0561) 0.426)
  (static-road road_0563)
  (= (travel-duration road_0563) 18.5362)
  (static-road road_0566)
  (= (travel-duration road_0566) 4.841)
  (static-road road_0567)
  (= (travel-duration road_0567) 23.4837)
  (static-road road_0568)
  (= (travel-duration road_0568) 12.6768)
  (static-road road_0569)
  (= (travel-duration road_0569) 6.3897)
  (static-road road_0572)
  (= (travel-duration road_0572) 7.6263)
  (static-road road_0573)
  (= (travel-duration road_0573) 14.2406)
  (static-road road_0574)
  (= (travel-duration road_0574) 13.9494)
  (static-road road_0575)
  (= (travel-duration road_0575) 7.6263)
  (static-road road_0576)
  (= (travel-duration road_0576) 16.6951)
  (static-road road_0577)
  (= (travel-duration road_0577) 5.273)
  (static-road road_0578)
  (= (travel-duration road_0578) 9.9564)
  (static-road road_0579)
  (= (travel-duration road_0579) 5.209)
  (static-road road_0580)
  (= (travel-duration road_0580) 7.7437)
  (static-road road_0581)
  (= (travel-duration road_0581) 16.2018)
  (static-road road_0582)
  (= (travel-duration road_0582) 23.0841)
  (static-road road_0584)
  (= (travel-duration road_0584) 7.2491)
  (static-road road_0586)
  (= (travel-duration road_0586) 5.0616)
  (static-road road_0587)
  (= (travel-duration road_0587) 10.078)
  (static-road road_0588)
  (= (travel-duration road_0588) 7.3194)
  (static-road road_0589)
  (= (travel-duration road_0589) 26.3543)
  (static-road road_0590)
  (= (travel-duration road_0590) 6.0346)
  (static-road road_0591)
  (= (travel-duration road_0591) 20.3117)
  (static-road road_0592)
  (= (travel-duration road_0592) 5.0906)
  (static-road road_0593)
  (= (travel-duration road_0593) 12.9167)
  (static-road road_0594)
  (= (travel-duration road_0594) 11.158)
  (static-road road_0595)
  (= (travel-duration road_0595) 1.3549)
  (static-road road_0596)
  (= (travel-duration road_0596) 4.0359)
  (static-road road_0598)
  (= (travel-duration road_0598) 3.7724)
  (static-road road_0599)
  (= (travel-duration road_0599) 1.7994)
  (static-road road_0600)
  (= (travel-duration road_0600) 3.9278)
  (static-road road_0601)
  (= (travel-duration road_0601) 32.2936)
  (static-road road_0602)
  (= (travel-duration road_0602) 16.4299)
  (static-road road_0603)
  (= (travel-duration road_0603) 7.6692)
  (static-road road_0604)
  (= (travel-duration road_0604) 11.4488)
  (static-road road_0606)
  (= (travel-duration road_0606) 5.7018)
  (static-road road_0607)
  (= (travel-duration road_0607) 25.932)
  (static-road road_0608)
  (= (travel-duration road_0608) 2.4235)
  (static-road road_0609)
  (= (travel-duration road_0609) 3.9386)
  (static-road road_0610)
  (= (travel-duration road_0610) 0.7129)
  (static-road road_0611)
  (= (travel-duration road_0611) 10.414)
  (static-road road_0612)
  (= (travel-duration road_0612) 35.5615)
  (static-road road_0614)
  (= (travel-duration road_0614) 4.8518)
  (static-road road_0615)
  (= (travel-duration road_0615) 47.5774)
  (static-road road_0616)
  (= (travel-duration road_0616) 11.104)
  (static-road road_0617)
  (= (travel-duration road_0617) 13.6908)
  (static-road road_0620)
  (= (travel-duration road_0620) 3.1105)
  (static-road road_0622)
  (= (travel-duration road_0622) 0.3036)
  (static-road road_0623)
  (= (travel-duration road_0623) 9.2338)
  (static-road road_0624)
  (= (travel-duration road_0624) 17.1241)
  (static-road road_0625)
  (= (travel-duration road_0625) 12.5144)
  (static-road road_0626)
  (= (travel-duration road_0626) 19.7823)
  (static-road road_0628)
  (= (travel-duration road_0628) 1.3621)
  (static-road road_0629)
  (= (travel-duration road_0629) 8.6531)
  (static-road road_0630)
  (= (travel-duration road_0630) 53.6218)
  (static-road road_0632)
  (= (travel-duration road_0632) 0.8858)
  (static-road road_0633)
  (= (travel-duration road_0633) 34.7111)
  (static-road road_0634)
  (= (travel-duration road_0634) 2.4683)
  (static-road road_0635)
  (= (travel-duration road_0635) 13.3972)
  (static-road road_0636)
  (= (travel-duration road_0636) 11.164)
  (static-road road_0637)
  (= (travel-duration road_0637) 25.5538)
  (static-road road_0639)
  (= (travel-duration road_0639) 10.9347)
  (static-road road_0640)
  (= (travel-duration road_0640) 13.5187)
  (static-road road_0641)
  (= (travel-duration road_0641) 7.0072)
  (static-road road_0642)
  (= (travel-duration road_0642) 1.4059)
  (static-road road_0643)
  (= (travel-duration road_0643) 3.7551)
  (static-road road_0644)
  (= (travel-duration road_0644) 8.1409)
  (static-road road_0645)
  (= (travel-duration road_0645) 2.4845)
  (static-road road_0647)
  (= (travel-duration road_0647) 4.9106)
  (static-road road_0648)
  (= (travel-duration road_0648) 3.1559)
  (static-road road_0649)
  (= (travel-duration road_0649) 9.2749)
  (static-road road_0650)
  (= (travel-duration road_0650) 3.4665)
  (static-road road_0651)
  (= (travel-duration road_0651) 21.0531)
  (static-road road_0652)
  (= (travel-duration road_0652) 3.0669)
  (static-road road_0653)
  (= (travel-duration road_0653) 9.5339)
  (static-road road_0654)
  (= (travel-duration road_0654) 7.3792)
  (static-road road_0655)
  (= (travel-duration road_0655) 9.2734)
  (static-road road_0656)
  (= (travel-duration road_0656) 11.9478)
  (static-road road_0658)
  (= (travel-duration road_0658) 10.9336)
  (static-road road_0659)
  (= (travel-duration road_0659) 7.0227)
  (static-road road_0661)
  (= (travel-duration road_0661) 0.8959)
  (static-road road_0662)
  (= (travel-duration road_0662) 7.0947)
  (static-road road_0665)
  (= (travel-duration road_0665) 12.1513)
  (static-road road_0666)
  (= (travel-duration road_0666) 1.3898)
  (static-road road_0667)
  (= (travel-duration road_0667) 3.9001)
  (static-road road_0668)
  (= (travel-duration road_0668) 4.7994)
  (static-road road_0669)
  (= (travel-duration road_0669) 25.0022)
  (static-road road_0670)
  (= (travel-duration road_0670) 19.0814)
  (static-road road_0671)
  (= (travel-duration road_0671) 1.3373)
  (static-road road_0672)
  (= (travel-duration road_0672) 3.2642)
  (static-road road_0673)
  (= (travel-duration road_0673) 1.1784)
  (static-road road_0674)
  (= (travel-duration road_0674) 15.3261)
  (static-road road_0675)
  (= (travel-duration road_0675) 3.857)
  (static-road road_0676)
  (= (travel-duration road_0676) 2.754)
  (static-road road_0677)
  (= (travel-duration road_0677) 16.7097)
  (static-road road_0678)
  (= (travel-duration road_0678) 25.1981)
  (static-road road_0679)
  (= (travel-duration road_0679) 10.7043)
  (static-road road_0680)
  (= (travel-duration road_0680) 6.2682)
  (static-road road_0681)
  (= (travel-duration road_0681) 1.3958)
  (static-road road_0682)
  (= (travel-duration road_0682) 9.584)
  (static-road road_0683)
  (= (travel-duration road_0683) 20.1889)
  (static-road road_0684)
  (= (travel-duration road_0684) 8.4167)
  (static-road road_0685)
  (= (travel-duration road_0685) 5.357)
  (static-road road_0686)
  (= (travel-duration road_0686) 15.2567)
  (static-road road_0687)
  (= (travel-duration road_0687) 21.9009)
  (static-road road_0688)
  (= (travel-duration road_0688) 21.7679)
  (static-road road_0689)
  (= (travel-duration road_0689) 19.0469)
  (static-road road_0690)
  (= (travel-duration road_0690) 4.2064)
  (static-road road_0691)
  (= (travel-duration road_0691) 32.3977)
  (static-road road_0692)
  (= (travel-duration road_0692) 21.2598)
  (static-road road_0693)
  (= (travel-duration road_0693) 17.6903)
  (static-road road_0694)
  (= (travel-duration road_0694) 8.3787)
  (static-road road_0696)
  (= (travel-duration road_0696) 4.757)
  (static-road road_0697)
  (= (travel-duration road_0697) 15.6318)
  (static-road road_0698)
  (= (travel-duration road_0698) 16.1765)
  (static-road road_0700)
  (= (travel-duration road_0700) 8.6895)
  (static-road road_0701)
  (= (travel-duration road_0701) 7.9167)
  (static-road road_0702)
  (= (travel-duration road_0702) 8.3463)
  (static-road road_0703)
  (= (travel-duration road_0703) 4.2182)
  (static-road road_0704)
  (= (travel-duration road_0704) 3.0481)
  (static-road road_0705)
  (= (travel-duration road_0705) 18.4399)
  (static-road road_0707)
  (= (travel-duration road_0707) 5.7182)
  (static-road road_0708)
  (= (travel-duration road_0708) 12.0776)
  (static-road road_0709)
  (= (travel-duration road_0709) 6.9051)
  (static-road road_0711)
  (= (travel-duration road_0711) 2.1889)
  (static-road road_0712)
  (= (travel-duration road_0712) 10.3639)
  (static-road road_0713)
  (= (travel-duration road_0713) 16.4134)
  (static-road road_0714)
  (= (travel-duration road_0714) 1.7922)
  (static-road road_0715)
  (= (travel-duration road_0715) 0.8906)
  (static-road road_0716)
  (= (travel-duration road_0716) 4.7056)
  (static-road road_0718)
  (= (travel-duration road_0718) 20.1986)
  (static-road road_0719)
  (= (travel-duration road_0719) 6.3233)
  (static-road road_0720)
  (= (travel-duration road_0720) 91.6019)
  (static-road road_0722)
  (= (travel-duration road_0722) 2.6905)
  (static-road road_0723)
  (= (travel-duration road_0723) 1.5062)
  (static-road road_0724)
  (= (travel-duration road_0724) 32.9406)
  (static-road road_0725)
  (= (travel-duration road_0725) 24.229)
  (static-road road_0726)
  (= (travel-duration road_0726) 5.6223)
  (static-road road_0727)
  (= (travel-duration road_0727) 4.636)
  (static-road road_0728)
  (= (travel-duration road_0728) 2.4714)
  (static-road road_0729)
  (= (travel-duration road_0729) 2.461)
  (static-road road_0730)
  (= (travel-duration road_0730) 1.1463)
  (static-road road_0732)
  (= (travel-duration road_0732) 2.4225)
  (static-road road_0733)
  (= (travel-duration road_0733) 8.8348)
  (static-road road_0734)
  (= (travel-duration road_0734) 0.7367)
  (static-road road_0735)
  (= (travel-duration road_0735) 40.5628)
  (static-road road_0738)
  (= (travel-duration road_0738) 2.4004)
  (static-road road_0739)
  (= (travel-duration road_0739) 5.7581)
  (static-road road_0740)
  (= (travel-duration road_0740) 21.785)
  (static-road road_0741)
  (= (travel-duration road_0741) 7.5464)
  (static-road road_0742)
  (= (travel-duration road_0742) 15.5635)
  (static-road road_0743)
  (= (travel-duration road_0743) 2.0707)
  (static-road road_0745)
  (= (travel-duration road_0745) 1.2386)
  (static-road road_0746)
  (= (travel-duration road_0746) 1.2162)
  (static-road road_0747)
  (= (travel-duration road_0747) 24.4992)
  (static-road road_0749)
  (= (travel-duration road_0749) 1.6189)
  (static-road road_0750)
  (= (travel-duration road_0750) 7.0359)
  (static-road road_0751)
  (= (travel-duration road_0751) 21.8719)
  (static-road road_0752)
  (= (travel-duration road_0752) 18.8516)
  (static-road road_0753)
  (= (travel-duration road_0753) 23.7265)
  (static-road road_0754)
  (= (travel-duration road_0754) 4.3142)
  (static-road road_0757)
  (= (travel-duration road_0757) 9.2963)
  (static-road road_0758)
  (= (travel-duration road_0758) 1.9721)
  (static-road road_0759)
  (= (travel-duration road_0759) 0.1992)
  (static-road road_0761)
  (= (travel-duration road_0761) 17.987)
  (static-road road_0762)
  (= (travel-duration road_0762) 10.9801)
  (static-road road_0763)
  (= (travel-duration road_0763) 20.2364)
  (static-road road_0765)
  (= (travel-duration road_0765) 19.5815)
  (static-road road_0766)
  (= (travel-duration road_0766) 6.671)
  (static-road road_0767)
  (= (travel-duration road_0767) 20.6298)
  (static-road road_0768)
  (= (travel-duration road_0768) 21.1237)
  (static-road road_0769)
  (= (travel-duration road_0769) 12.6496)
  (static-road road_0770)
  (= (travel-duration road_0770) 1.269)
  (static-road road_0771)
  (= (travel-duration road_0771) 19.0957)
  (static-road road_0772)
  (= (travel-duration road_0772) 44.237)
  (static-road road_0773)
  (= (travel-duration road_0773) 11.503)
  (static-road road_0774)
  (= (travel-duration road_0774) 2.9667)
  (static-road road_0775)
  (= (travel-duration road_0775) 9.9656)
  (static-road road_0776)
  (= (travel-duration road_0776) 7.6717)
  (static-road road_0777)
  (= (travel-duration road_0777) 12.6454)
  (static-road road_0778)
  (= (travel-duration road_0778) 13.2357)
  (static-road road_0779)
  (= (travel-duration road_0779) 1.6674)
  (static-road road_0780)
  (= (travel-duration road_0780) 13.8202)
  (static-road road_0781)
  (= (travel-duration road_0781) 4.9141)
  (static-road road_0782)
  (= (travel-duration road_0782) 8.467)
  (static-road road_0783)
  (= (travel-duration road_0783) 9.2186)
  (static-road road_0785)
  (= (travel-duration road_0785) 12.1059)
  (static-road road_0786)
  (= (travel-duration road_0786) 4.7642)
  (static-road road_0787)
  (= (travel-duration road_0787) 4.1889)
  (static-road road_0789)
  (= (travel-duration road_0789) 3.7551)
  (static-road road_0790)
  (= (travel-duration road_0790) 6.0158)
  (static-road road_0791)
  (= (travel-duration road_0791) 6.0158)
  (static-road road_0793)
  (= (travel-duration road_0793) 16.7987)
  (static-road road_0794)
  (= (travel-duration road_0794) 7.2351)
  (static-road road_0795)
  (= (travel-duration road_0795) 14.1664)
  (static-road road_0796)
  (= (travel-duration road_0796) 7.3643)
  (static-road road_0797)
  (= (travel-duration road_0797) 10.8698)
  (static-road road_0798)
  (= (travel-duration road_0798) 9.2674)
  (static-road road_0799)
  (= (travel-duration road_0799) 22.8892)
  (static-road road_0802)
  (= (travel-duration road_0802) 6.0268)
  (static-road road_0803)
  (= (travel-duration road_0803) 10.6072)
  (static-road road_0804)
  (= (travel-duration road_0804) 11.6646)
  (static-road road_0805)
  (= (travel-duration road_0805) 12.4349)
  (static-road road_0806)
  (= (travel-duration road_0806) 8.3463)
  (static-road road_0807)
  (= (travel-duration road_0807) 8.2276)
  (static-road road_0808)
  (= (travel-duration road_0808) 84.9045)
  (static-road road_0809)
  (= (travel-duration road_0809) 7.3829)
  (static-road road_0810)
  (= (travel-duration road_0810) 17.7309)
  (static-road road_0811)
  (= (travel-duration road_0811) 22.9683)
  (static-road road_0813)
  (= (travel-duration road_0813) 4.7819)
  (static-road road_0814)
  (= (travel-duration road_0814) 9.0283)
  (static-road road_0815)
  (= (travel-duration road_0815) 9.045)
  (static-road road_0816)
  (= (travel-duration road_0816) 3.2318)
  (static-road road_0817)
  (= (travel-duration road_0817) 1.4144)
  (static-road road_0818)
  (= (travel-duration road_0818) 14.4629)
  (static-road road_0819)
  (= (travel-duration road_0819) 2.1949)
  (static-road road_0820)
  (= (travel-duration road_0820) 7.7478)
  (static-road road_0821)
  (= (travel-duration road_0821) 0.9972)
  (static-road road_0822)
  (= (travel-duration road_0822) 7.2951)
  (static-road road_0823)
  (= (travel-duration road_0823) 6.6327)
  (static-road road_0824)
  (= (travel-duration road_0824) 5.7626)
  (static-road road_0825)
  (= (travel-duration road_0825) 20.4116)
  (static-road road_0826)
  (= (travel-duration road_0826) 5.357)
  (static-road road_0827)
  (= (travel-duration road_0827) 13.8387)
  (static-road road_0828)
  (= (travel-duration road_0828) 40.5137)
  (static-road road_0834)
  (= (travel-duration road_0834) 12.4884)
  (static-road road_0835)
  (= (travel-duration road_0835) 1.3182)
  (static-road road_0836)
  (= (travel-duration road_0836) 0.9936)
  (static-road road_0838)
  (= (travel-duration road_0838) 15.0452)
  (static-road road_0839)
  (= (travel-duration road_0839) 6.995)
  (static-road road_0843)
  (= (travel-duration road_0843) 6.2827)
  (static-road road_0844)
  (= (travel-duration road_0844) 6.4879)
  (static-road road_0845)
  (= (travel-duration road_0845) 13.9494)
  (static-road road_0846)
  (= (travel-duration road_0846) 5.2594)
  (static-road road_0847)
  (= (travel-duration road_0847) 10.4596)
  (static-road road_0848)
  (= (travel-duration road_0848) 11.9689)
  (static-road road_0849)
  (= (travel-duration road_0849) 46.0309)
  (static-road road_0851)
  (= (travel-duration road_0851) 23.0778)
  (static-road road_0852)
  (= (travel-duration road_0852) 3.8787)
  (static-road road_0853)
  (= (travel-duration road_0853) 1.2941)
  (static-road road_0854)
  (= (travel-duration road_0854) 52.3639)
  (static-road road_0855)
  (= (travel-duration road_0855) 16.5877)
  (static-road road_0856)
  (= (travel-duration road_0856) 22.227)
  (static-road road_0857)
  (= (travel-duration road_0857) 1.2443)
  (static-road road_0859)
  (= (travel-duration road_0859) 5.0618)
  (static-road road_0860)
  (= (travel-duration road_0860) 1.0181)
  (dynamic-road macro_0002)
  (= (travel-duration-window macro_0002 tw_00000) 26.6651)
  (= (travel-duration-window macro_0002 tw_00030) 26.6651)
  (= (travel-duration-window macro_0002 tw_00060) 27.9983)
  (= (travel-duration-window macro_0002 tw_00090) 29.3316)
  (= (travel-duration-window macro_0002 tw_00120) 27.9983)
  (= (travel-duration-window macro_0002 tw_00150) 26.6651)
  (= (travel-duration-window macro_0002 tw_00180) 26.6651)
  (= (travel-duration-window macro_0002 tw_00210) 27.9983)
  (= (travel-duration-window macro_0002 tw_00240) 27.9983)
  (= (travel-duration-window macro_0002 tw_00270) 27.9983)
  (= (travel-duration-window macro_0002 tw_00300) 26.6651)
  (= (travel-duration-window macro_0002 tw_00330) 26.6651)
  (= (travel-duration-window macro_0002 tw_00360) 26.6651)
  (= (travel-duration-window macro_0002 tw_00390) 26.6651)
  (= (travel-duration-window macro_0002 tw_00420) 26.6651)
  (= (travel-duration-window macro_0002 tw_00450) 27.9983)
  (= (travel-duration-window macro_0002 tw_00480) 26.6651)
  (dynamic-road macro_0003)
  (= (travel-duration-window macro_0003 tw_00000) 13.4393)
  (= (travel-duration-window macro_0003 tw_00030) 14.1113)
  (= (travel-duration-window macro_0003 tw_00060) 14.1113)
  (= (travel-duration-window macro_0003 tw_00090) 14.1113)
  (= (travel-duration-window macro_0003 tw_00120) 13.4393)
  (= (travel-duration-window macro_0003 tw_00150) 14.7833)
  (= (travel-duration-window macro_0003 tw_00180) 14.1113)
  (= (travel-duration-window macro_0003 tw_00210) 13.4393)
  (= (travel-duration-window macro_0003 tw_00240) 14.7833)
  (= (travel-duration-window macro_0003 tw_00270) 14.1113)
  (= (travel-duration-window macro_0003 tw_00300) 14.1113)
  (= (travel-duration-window macro_0003 tw_00330) 13.4393)
  (= (travel-duration-window macro_0003 tw_00360) 14.7833)
  (= (travel-duration-window macro_0003 tw_00390) 13.4393)
  (= (travel-duration-window macro_0003 tw_00420) 13.4393)
  (= (travel-duration-window macro_0003 tw_00450) 13.4393)
  (= (travel-duration-window macro_0003 tw_00480) 13.4393)
  (dynamic-road macro_0022)
  (= (travel-duration-window macro_0022 tw_00000) 21.8127)
  (= (travel-duration-window macro_0022 tw_00030) 20.774)
  (= (travel-duration-window macro_0022 tw_00060) 20.774)
  (= (travel-duration-window macro_0022 tw_00090) 20.774)
  (= (travel-duration-window macro_0022 tw_00120) 21.8127)
  (= (travel-duration-window macro_0022 tw_00150) 23.8901)
  (= (travel-duration-window macro_0022 tw_00180) 20.774)
  (= (travel-duration-window macro_0022 tw_00210) 20.774)
  (= (travel-duration-window macro_0022 tw_00240) 20.774)
  (= (travel-duration-window macro_0022 tw_00270) 20.774)
  (= (travel-duration-window macro_0022 tw_00300) 20.774)
  (= (travel-duration-window macro_0022 tw_00330) 20.774)
  (= (travel-duration-window macro_0022 tw_00360) 20.774)
  (= (travel-duration-window macro_0022 tw_00390) 20.774)
  (= (travel-duration-window macro_0022 tw_00420) 20.774)
  (= (travel-duration-window macro_0022 tw_00450) 20.774)
  (= (travel-duration-window macro_0022 tw_00480) 20.774)
  (dynamic-road macro_0025)
  (= (travel-duration-window macro_0025 tw_00000) 17.1422)
  (= (travel-duration-window macro_0025 tw_00030) 15.5838)
  (= (travel-duration-window macro_0025 tw_00060) 15.5838)
  (= (travel-duration-window macro_0025 tw_00090) 16.363)
  (= (travel-duration-window macro_0025 tw_00120) 16.363)
  (= (travel-duration-window macro_0025 tw_00150) 15.5838)
  (= (travel-duration-window macro_0025 tw_00180) 15.5838)
  (= (travel-duration-window macro_0025 tw_00210) 16.363)
  (= (travel-duration-window macro_0025 tw_00240) 15.5838)
  (= (travel-duration-window macro_0025 tw_00270) 15.5838)
  (= (travel-duration-window macro_0025 tw_00300) 15.5838)
  (= (travel-duration-window macro_0025 tw_00330) 16.363)
  (= (travel-duration-window macro_0025 tw_00360) 15.5838)
  (= (travel-duration-window macro_0025 tw_00390) 15.5838)
  (= (travel-duration-window macro_0025 tw_00420) 15.5838)
  (= (travel-duration-window macro_0025 tw_00450) 15.5838)
  (= (travel-duration-window macro_0025 tw_00480) 15.5838)
  (dynamic-road macro_0042)
  (= (travel-duration-window macro_0042 tw_00000) 13.8942)
  (= (travel-duration-window macro_0042 tw_00030) 15.2836)
  (= (travel-duration-window macro_0042 tw_00060) 13.8942)
  (= (travel-duration-window macro_0042 tw_00090) 13.8942)
  (= (travel-duration-window macro_0042 tw_00120) 13.8942)
  (= (travel-duration-window macro_0042 tw_00150) 13.8942)
  (= (travel-duration-window macro_0042 tw_00180) 13.8942)
  (= (travel-duration-window macro_0042 tw_00210) 13.8942)
  (= (travel-duration-window macro_0042 tw_00240) 13.8942)
  (= (travel-duration-window macro_0042 tw_00270) 13.8942)
  (= (travel-duration-window macro_0042 tw_00300) 14.5889)
  (= (travel-duration-window macro_0042 tw_00330) 13.8942)
  (= (travel-duration-window macro_0042 tw_00360) 13.8942)
  (= (travel-duration-window macro_0042 tw_00390) 13.8942)
  (= (travel-duration-window macro_0042 tw_00420) 13.8942)
  (= (travel-duration-window macro_0042 tw_00450) 13.8942)
  (= (travel-duration-window macro_0042 tw_00480) 13.8942)
  (dynamic-road road_0000)
  (= (travel-duration-window road_0000 tw_00000) 1.1796)
  (= (travel-duration-window road_0000 tw_00030) 1.1796)
  (= (travel-duration-window road_0000 tw_00060) 1.1796)
  (= (travel-duration-window road_0000 tw_00090) 1.1796)
  (= (travel-duration-window road_0000 tw_00120) 1.1796)
  (= (travel-duration-window road_0000 tw_00150) 1.1796)
  (= (travel-duration-window road_0000 tw_00180) 1.1796)
  (= (travel-duration-window road_0000 tw_00210) 1.2386)
  (= (travel-duration-window road_0000 tw_00240) 1.2976)
  (= (travel-duration-window road_0000 tw_00270) 1.2976)
  (= (travel-duration-window road_0000 tw_00300) 1.1796)
  (= (travel-duration-window road_0000 tw_00330) 1.1796)
  (= (travel-duration-window road_0000 tw_00360) 1.1796)
  (= (travel-duration-window road_0000 tw_00390) 1.1796)
  (= (travel-duration-window road_0000 tw_00420) 1.1796)
  (= (travel-duration-window road_0000 tw_00450) 1.1796)
  (= (travel-duration-window road_0000 tw_00480) 1.1796)
  (dynamic-road road_0002)
  (= (travel-duration-window road_0002 tw_00000) 33.3841)
  (= (travel-duration-window road_0002 tw_00030) 33.3841)
  (= (travel-duration-window road_0002 tw_00060) 33.3841)
  (= (travel-duration-window road_0002 tw_00090) 36.7225)
  (= (travel-duration-window road_0002 tw_00120) 33.3841)
  (= (travel-duration-window road_0002 tw_00150) 35.0533)
  (= (travel-duration-window road_0002 tw_00180) 33.3841)
  (= (travel-duration-window road_0002 tw_00210) 36.7225)
  (= (travel-duration-window road_0002 tw_00240) 35.0533)
  (= (travel-duration-window road_0002 tw_00270) 35.0533)
  (= (travel-duration-window road_0002 tw_00300) 33.3841)
  (= (travel-duration-window road_0002 tw_00330) 33.3841)
  (= (travel-duration-window road_0002 tw_00360) 33.3841)
  (= (travel-duration-window road_0002 tw_00390) 33.3841)
  (= (travel-duration-window road_0002 tw_00420) 33.3841)
  (= (travel-duration-window road_0002 tw_00450) 33.3841)
  (= (travel-duration-window road_0002 tw_00480) 33.3841)
  (dynamic-road road_0006)
  (= (travel-duration-window road_0006 tw_00000) 6.8787)
  (= (travel-duration-window road_0006 tw_00030) 6.8787)
  (= (travel-duration-window road_0006 tw_00060) 7.2226)
  (= (travel-duration-window road_0006 tw_00090) 6.8787)
  (= (travel-duration-window road_0006 tw_00120) 6.8787)
  (= (travel-duration-window road_0006 tw_00150) 6.8787)
  (= (travel-duration-window road_0006 tw_00180) 6.8787)
  (= (travel-duration-window road_0006 tw_00210) 6.8787)
  (= (travel-duration-window road_0006 tw_00240) 6.8787)
  (= (travel-duration-window road_0006 tw_00270) 7.5665)
  (= (travel-duration-window road_0006 tw_00300) 6.8787)
  (= (travel-duration-window road_0006 tw_00330) 6.8787)
  (= (travel-duration-window road_0006 tw_00360) 6.8787)
  (= (travel-duration-window road_0006 tw_00390) 6.8787)
  (= (travel-duration-window road_0006 tw_00420) 6.8787)
  (= (travel-duration-window road_0006 tw_00450) 6.8787)
  (= (travel-duration-window road_0006 tw_00480) 6.8787)
  (dynamic-road road_0009)
  (= (travel-duration-window road_0009 tw_00000) 6.221)
  (= (travel-duration-window road_0009 tw_00030) 6.221)
  (= (travel-duration-window road_0009 tw_00060) 6.221)
  (= (travel-duration-window road_0009 tw_00090) 6.221)
  (= (travel-duration-window road_0009 tw_00120) 6.221)
  (= (travel-duration-window road_0009 tw_00150) 6.221)
  (= (travel-duration-window road_0009 tw_00180) 6.221)
  (= (travel-duration-window road_0009 tw_00210) 6.221)
  (= (travel-duration-window road_0009 tw_00240) 6.221)
  (= (travel-duration-window road_0009 tw_00270) 6.8432)
  (= (travel-duration-window road_0009 tw_00300) 6.221)
  (= (travel-duration-window road_0009 tw_00330) 6.221)
  (= (travel-duration-window road_0009 tw_00360) 6.221)
  (= (travel-duration-window road_0009 tw_00390) 6.221)
  (= (travel-duration-window road_0009 tw_00420) 6.221)
  (= (travel-duration-window road_0009 tw_00450) 6.221)
  (= (travel-duration-window road_0009 tw_00480) 6.221)
  (dynamic-road road_0017)
  (= (travel-duration-window road_0017 tw_00000) 22.8453)
  (= (travel-duration-window road_0017 tw_00030) 22.8453)
  (= (travel-duration-window road_0017 tw_00060) 22.8453)
  (= (travel-duration-window road_0017 tw_00090) 22.8453)
  (= (travel-duration-window road_0017 tw_00120) 22.8453)
  (= (travel-duration-window road_0017 tw_00150) 22.8453)
  (= (travel-duration-window road_0017 tw_00180) 22.8453)
  (= (travel-duration-window road_0017 tw_00210) 23.9876)
  (= (travel-duration-window road_0017 tw_00240) 25.1298)
  (= (travel-duration-window road_0017 tw_00270) 22.8453)
  (= (travel-duration-window road_0017 tw_00300) 22.8453)
  (= (travel-duration-window road_0017 tw_00330) 22.8453)
  (= (travel-duration-window road_0017 tw_00360) 22.8453)
  (= (travel-duration-window road_0017 tw_00390) 22.8453)
  (= (travel-duration-window road_0017 tw_00420) 22.8453)
  (= (travel-duration-window road_0017 tw_00450) 22.8453)
  (= (travel-duration-window road_0017 tw_00480) 22.8453)
  (dynamic-road road_0029)
  (= (travel-duration-window road_0029 tw_00000) 40.7632)
  (= (travel-duration-window road_0029 tw_00030) 40.7632)
  (= (travel-duration-window road_0029 tw_00060) 40.7632)
  (= (travel-duration-window road_0029 tw_00090) 40.7632)
  (= (travel-duration-window road_0029 tw_00120) 44.8396)
  (= (travel-duration-window road_0029 tw_00150) 40.7632)
  (= (travel-duration-window road_0029 tw_00180) 40.7632)
  (= (travel-duration-window road_0029 tw_00210) 40.7632)
  (= (travel-duration-window road_0029 tw_00240) 40.7632)
  (= (travel-duration-window road_0029 tw_00270) 40.7632)
  (= (travel-duration-window road_0029 tw_00300) 40.7632)
  (= (travel-duration-window road_0029 tw_00330) 40.7632)
  (= (travel-duration-window road_0029 tw_00360) 40.7632)
  (= (travel-duration-window road_0029 tw_00390) 40.7632)
  (= (travel-duration-window road_0029 tw_00420) 40.7632)
  (= (travel-duration-window road_0029 tw_00450) 40.7632)
  (= (travel-duration-window road_0029 tw_00480) 40.7632)
  (dynamic-road road_0046)
  (= (travel-duration-window road_0046 tw_00000) 0.9362)
  (= (travel-duration-window road_0046 tw_00030) 0.9808)
  (= (travel-duration-window road_0046 tw_00060) 0.8916)
  (= (travel-duration-window road_0046 tw_00090) 0.8916)
  (= (travel-duration-window road_0046 tw_00120) 0.8916)
  (= (travel-duration-window road_0046 tw_00150) 0.8916)
  (= (travel-duration-window road_0046 tw_00180) 0.8916)
  (= (travel-duration-window road_0046 tw_00210) 0.8916)
  (= (travel-duration-window road_0046 tw_00240) 0.8916)
  (= (travel-duration-window road_0046 tw_00270) 0.9362)
  (= (travel-duration-window road_0046 tw_00300) 0.9362)
  (= (travel-duration-window road_0046 tw_00330) 0.8916)
  (= (travel-duration-window road_0046 tw_00360) 0.8916)
  (= (travel-duration-window road_0046 tw_00390) 0.8916)
  (= (travel-duration-window road_0046 tw_00420) 0.8916)
  (= (travel-duration-window road_0046 tw_00450) 0.8916)
  (= (travel-duration-window road_0046 tw_00480) 0.8916)
  (dynamic-road road_0054)
  (= (travel-duration-window road_0054 tw_00000) 1.3357)
  (= (travel-duration-window road_0054 tw_00030) 1.3357)
  (= (travel-duration-window road_0054 tw_00060) 1.3357)
  (= (travel-duration-window road_0054 tw_00090) 1.4024)
  (= (travel-duration-window road_0054 tw_00120) 1.4692)
  (= (travel-duration-window road_0054 tw_00150) 1.3357)
  (= (travel-duration-window road_0054 tw_00180) 1.3357)
  (= (travel-duration-window road_0054 tw_00210) 1.3357)
  (= (travel-duration-window road_0054 tw_00240) 1.3357)
  (= (travel-duration-window road_0054 tw_00270) 1.3357)
  (= (travel-duration-window road_0054 tw_00300) 1.3357)
  (= (travel-duration-window road_0054 tw_00330) 1.3357)
  (= (travel-duration-window road_0054 tw_00360) 1.3357)
  (= (travel-duration-window road_0054 tw_00390) 1.3357)
  (= (travel-duration-window road_0054 tw_00420) 1.3357)
  (= (travel-duration-window road_0054 tw_00450) 1.3357)
  (= (travel-duration-window road_0054 tw_00480) 1.3357)
  (dynamic-road road_0056)
  (= (travel-duration-window road_0056 tw_00000) 2.1769)
  (= (travel-duration-window road_0056 tw_00030) 2.1769)
  (= (travel-duration-window road_0056 tw_00060) 2.1769)
  (= (travel-duration-window road_0056 tw_00090) 2.1769)
  (= (travel-duration-window road_0056 tw_00120) 2.1769)
  (= (travel-duration-window road_0056 tw_00150) 2.1769)
  (= (travel-duration-window road_0056 tw_00180) 2.1769)
  (= (travel-duration-window road_0056 tw_00210) 2.1769)
  (= (travel-duration-window road_0056 tw_00240) 2.2857)
  (= (travel-duration-window road_0056 tw_00270) 2.3946)
  (= (travel-duration-window road_0056 tw_00300) 2.2857)
  (= (travel-duration-window road_0056 tw_00330) 2.1769)
  (= (travel-duration-window road_0056 tw_00360) 2.1769)
  (= (travel-duration-window road_0056 tw_00390) 2.1769)
  (= (travel-duration-window road_0056 tw_00420) 2.1769)
  (= (travel-duration-window road_0056 tw_00450) 2.1769)
  (= (travel-duration-window road_0056 tw_00480) 2.1769)
  (dynamic-road road_0057)
  (= (travel-duration-window road_0057 tw_00000) 2.1277)
  (= (travel-duration-window road_0057 tw_00030) 2.1277)
  (= (travel-duration-window road_0057 tw_00060) 2.1277)
  (= (travel-duration-window road_0057 tw_00090) 2.1277)
  (= (travel-duration-window road_0057 tw_00120) 2.3405)
  (= (travel-duration-window road_0057 tw_00150) 2.1277)
  (= (travel-duration-window road_0057 tw_00180) 2.2341)
  (= (travel-duration-window road_0057 tw_00210) 2.1277)
  (= (travel-duration-window road_0057 tw_00240) 2.2341)
  (= (travel-duration-window road_0057 tw_00270) 2.1277)
  (= (travel-duration-window road_0057 tw_00300) 2.1277)
  (= (travel-duration-window road_0057 tw_00330) 2.1277)
  (= (travel-duration-window road_0057 tw_00360) 2.1277)
  (= (travel-duration-window road_0057 tw_00390) 2.1277)
  (= (travel-duration-window road_0057 tw_00420) 2.1277)
  (= (travel-duration-window road_0057 tw_00450) 2.1277)
  (= (travel-duration-window road_0057 tw_00480) 2.1277)
  (dynamic-road road_0069)
  (= (travel-duration-window road_0069 tw_00000) 9.5632)
  (= (travel-duration-window road_0069 tw_00030) 10.5195)
  (= (travel-duration-window road_0069 tw_00060) 9.5632)
  (= (travel-duration-window road_0069 tw_00090) 9.5632)
  (= (travel-duration-window road_0069 tw_00120) 9.5632)
  (= (travel-duration-window road_0069 tw_00150) 9.5632)
  (= (travel-duration-window road_0069 tw_00180) 9.5632)
  (= (travel-duration-window road_0069 tw_00210) 9.5632)
  (= (travel-duration-window road_0069 tw_00240) 10.0413)
  (= (travel-duration-window road_0069 tw_00270) 9.5632)
  (= (travel-duration-window road_0069 tw_00300) 9.5632)
  (= (travel-duration-window road_0069 tw_00330) 9.5632)
  (= (travel-duration-window road_0069 tw_00360) 9.5632)
  (= (travel-duration-window road_0069 tw_00390) 9.5632)
  (= (travel-duration-window road_0069 tw_00420) 9.5632)
  (= (travel-duration-window road_0069 tw_00450) 9.5632)
  (= (travel-duration-window road_0069 tw_00480) 9.5632)
  (dynamic-road road_0078)
  (= (travel-duration-window road_0078 tw_00000) 0.8984)
  (= (travel-duration-window road_0078 tw_00030) 0.8556)
  (= (travel-duration-window road_0078 tw_00060) 0.8556)
  (= (travel-duration-window road_0078 tw_00090) 0.8984)
  (= (travel-duration-window road_0078 tw_00120) 0.8984)
  (= (travel-duration-window road_0078 tw_00150) 0.9412)
  (= (travel-duration-window road_0078 tw_00180) 0.8556)
  (= (travel-duration-window road_0078 tw_00210) 0.8984)
  (= (travel-duration-window road_0078 tw_00240) 0.8556)
  (= (travel-duration-window road_0078 tw_00270) 0.8984)
  (= (travel-duration-window road_0078 tw_00300) 0.8556)
  (= (travel-duration-window road_0078 tw_00330) 0.8556)
  (= (travel-duration-window road_0078 tw_00360) 0.8556)
  (= (travel-duration-window road_0078 tw_00390) 0.8556)
  (= (travel-duration-window road_0078 tw_00420) 0.8556)
  (= (travel-duration-window road_0078 tw_00450) 0.8556)
  (= (travel-duration-window road_0078 tw_00480) 0.8556)
  (dynamic-road road_0082)
  (= (travel-duration-window road_0082 tw_00000) 25.0846)
  (= (travel-duration-window road_0082 tw_00030) 25.0846)
  (= (travel-duration-window road_0082 tw_00060) 27.5931)
  (= (travel-duration-window road_0082 tw_00090) 26.3388)
  (= (travel-duration-window road_0082 tw_00120) 26.3388)
  (= (travel-duration-window road_0082 tw_00150) 25.0846)
  (= (travel-duration-window road_0082 tw_00180) 25.0846)
  (= (travel-duration-window road_0082 tw_00210) 25.0846)
  (= (travel-duration-window road_0082 tw_00240) 25.0846)
  (= (travel-duration-window road_0082 tw_00270) 26.3388)
  (= (travel-duration-window road_0082 tw_00300) 25.0846)
  (= (travel-duration-window road_0082 tw_00330) 26.3388)
  (= (travel-duration-window road_0082 tw_00360) 25.0846)
  (= (travel-duration-window road_0082 tw_00390) 25.0846)
  (= (travel-duration-window road_0082 tw_00420) 25.0846)
  (= (travel-duration-window road_0082 tw_00450) 25.0846)
  (= (travel-duration-window road_0082 tw_00480) 25.0846)
  (dynamic-road road_0127)
  (= (travel-duration-window road_0127 tw_00000) 6.4647)
  (= (travel-duration-window road_0127 tw_00030) 6.7879)
  (= (travel-duration-window road_0127 tw_00060) 6.4647)
  (= (travel-duration-window road_0127 tw_00090) 6.4647)
  (= (travel-duration-window road_0127 tw_00120) 6.4647)
  (= (travel-duration-window road_0127 tw_00150) 6.7879)
  (= (travel-duration-window road_0127 tw_00180) 6.4647)
  (= (travel-duration-window road_0127 tw_00210) 7.1111)
  (= (travel-duration-window road_0127 tw_00240) 6.7879)
  (= (travel-duration-window road_0127 tw_00270) 6.4647)
  (= (travel-duration-window road_0127 tw_00300) 6.4647)
  (= (travel-duration-window road_0127 tw_00330) 6.7879)
  (= (travel-duration-window road_0127 tw_00360) 6.4647)
  (= (travel-duration-window road_0127 tw_00390) 6.4647)
  (= (travel-duration-window road_0127 tw_00420) 6.4647)
  (= (travel-duration-window road_0127 tw_00450) 6.4647)
  (= (travel-duration-window road_0127 tw_00480) 6.4647)
  (dynamic-road road_0176)
  (= (travel-duration-window road_0176 tw_00000) 3.1081)
  (= (travel-duration-window road_0176 tw_00030) 3.1081)
  (= (travel-duration-window road_0176 tw_00060) 3.1081)
  (= (travel-duration-window road_0176 tw_00090) 3.4189)
  (= (travel-duration-window road_0176 tw_00120) 3.1081)
  (= (travel-duration-window road_0176 tw_00150) 3.2635)
  (= (travel-duration-window road_0176 tw_00180) 3.4189)
  (= (travel-duration-window road_0176 tw_00210) 3.2635)
  (= (travel-duration-window road_0176 tw_00240) 3.2635)
  (= (travel-duration-window road_0176 tw_00270) 3.1081)
  (= (travel-duration-window road_0176 tw_00300) 3.1081)
  (= (travel-duration-window road_0176 tw_00330) 3.1081)
  (= (travel-duration-window road_0176 tw_00360) 3.1081)
  (= (travel-duration-window road_0176 tw_00390) 3.1081)
  (= (travel-duration-window road_0176 tw_00420) 3.1081)
  (= (travel-duration-window road_0176 tw_00450) 3.1081)
  (= (travel-duration-window road_0176 tw_00480) 3.1081)
  (dynamic-road road_0180)
  (= (travel-duration-window road_0180 tw_00000) 8.794)
  (= (travel-duration-window road_0180 tw_00030) 8.794)
  (= (travel-duration-window road_0180 tw_00060) 8.794)
  (= (travel-duration-window road_0180 tw_00090) 8.794)
  (= (travel-duration-window road_0180 tw_00120) 8.794)
  (= (travel-duration-window road_0180 tw_00150) 8.794)
  (= (travel-duration-window road_0180 tw_00180) 9.6733)
  (= (travel-duration-window road_0180 tw_00210) 8.794)
  (= (travel-duration-window road_0180 tw_00240) 9.2336)
  (= (travel-duration-window road_0180 tw_00270) 8.794)
  (= (travel-duration-window road_0180 tw_00300) 9.2336)
  (= (travel-duration-window road_0180 tw_00330) 8.794)
  (= (travel-duration-window road_0180 tw_00360) 8.794)
  (= (travel-duration-window road_0180 tw_00390) 8.794)
  (= (travel-duration-window road_0180 tw_00420) 8.794)
  (= (travel-duration-window road_0180 tw_00450) 8.794)
  (= (travel-duration-window road_0180 tw_00480) 8.794)
  (dynamic-road road_0183)
  (= (travel-duration-window road_0183 tw_00000) 9.5884)
  (= (travel-duration-window road_0183 tw_00030) 9.5884)
  (= (travel-duration-window road_0183 tw_00060) 9.5884)
  (= (travel-duration-window road_0183 tw_00090) 9.5884)
  (= (travel-duration-window road_0183 tw_00120) 9.5884)
  (= (travel-duration-window road_0183 tw_00150) 10.0678)
  (= (travel-duration-window road_0183 tw_00180) 9.5884)
  (= (travel-duration-window road_0183 tw_00210) 10.0678)
  (= (travel-duration-window road_0183 tw_00240) 9.5884)
  (= (travel-duration-window road_0183 tw_00270) 10.5472)
  (= (travel-duration-window road_0183 tw_00300) 10.0678)
  (= (travel-duration-window road_0183 tw_00330) 9.5884)
  (= (travel-duration-window road_0183 tw_00360) 9.5884)
  (= (travel-duration-window road_0183 tw_00390) 9.5884)
  (= (travel-duration-window road_0183 tw_00420) 9.5884)
  (= (travel-duration-window road_0183 tw_00450) 9.5884)
  (= (travel-duration-window road_0183 tw_00480) 9.5884)
  (dynamic-road road_0206)
  (= (travel-duration-window road_0206 tw_00000) 10.996)
  (= (travel-duration-window road_0206 tw_00030) 10.996)
  (= (travel-duration-window road_0206 tw_00060) 10.996)
  (= (travel-duration-window road_0206 tw_00090) 10.996)
  (= (travel-duration-window road_0206 tw_00120) 10.996)
  (= (travel-duration-window road_0206 tw_00150) 10.996)
  (= (travel-duration-window road_0206 tw_00180) 10.996)
  (= (travel-duration-window road_0206 tw_00210) 11.5458)
  (= (travel-duration-window road_0206 tw_00240) 10.996)
  (= (travel-duration-window road_0206 tw_00270) 12.0956)
  (= (travel-duration-window road_0206 tw_00300) 10.996)
  (= (travel-duration-window road_0206 tw_00330) 10.996)
  (= (travel-duration-window road_0206 tw_00360) 10.996)
  (= (travel-duration-window road_0206 tw_00390) 10.996)
  (= (travel-duration-window road_0206 tw_00420) 10.996)
  (= (travel-duration-window road_0206 tw_00450) 10.996)
  (= (travel-duration-window road_0206 tw_00480) 10.996)
  (dynamic-road road_0207)
  (= (travel-duration-window road_0207 tw_00000) 18.4477)
  (= (travel-duration-window road_0207 tw_00030) 16.7707)
  (= (travel-duration-window road_0207 tw_00060) 17.6092)
  (= (travel-duration-window road_0207 tw_00090) 16.7707)
  (= (travel-duration-window road_0207 tw_00120) 16.7707)
  (= (travel-duration-window road_0207 tw_00150) 16.7707)
  (= (travel-duration-window road_0207 tw_00180) 16.7707)
  (= (travel-duration-window road_0207 tw_00210) 16.7707)
  (= (travel-duration-window road_0207 tw_00240) 17.6092)
  (= (travel-duration-window road_0207 tw_00270) 17.6092)
  (= (travel-duration-window road_0207 tw_00300) 17.6092)
  (= (travel-duration-window road_0207 tw_00330) 16.7707)
  (= (travel-duration-window road_0207 tw_00360) 16.7707)
  (= (travel-duration-window road_0207 tw_00390) 16.7707)
  (= (travel-duration-window road_0207 tw_00420) 16.7707)
  (= (travel-duration-window road_0207 tw_00450) 16.7707)
  (= (travel-duration-window road_0207 tw_00480) 16.7707)
  (dynamic-road road_0217)
  (= (travel-duration-window road_0217 tw_00000) 0.4896)
  (= (travel-duration-window road_0217 tw_00030) 0.4896)
  (= (travel-duration-window road_0217 tw_00060) 0.4896)
  (= (travel-duration-window road_0217 tw_00090) 0.5386)
  (= (travel-duration-window road_0217 tw_00120) 0.4896)
  (= (travel-duration-window road_0217 tw_00150) 0.5141)
  (= (travel-duration-window road_0217 tw_00180) 0.4896)
  (= (travel-duration-window road_0217 tw_00210) 0.4896)
  (= (travel-duration-window road_0217 tw_00240) 0.4896)
  (= (travel-duration-window road_0217 tw_00270) 0.4896)
  (= (travel-duration-window road_0217 tw_00300) 0.5141)
  (= (travel-duration-window road_0217 tw_00330) 0.4896)
  (= (travel-duration-window road_0217 tw_00360) 0.4896)
  (= (travel-duration-window road_0217 tw_00390) 0.4896)
  (= (travel-duration-window road_0217 tw_00420) 0.4896)
  (= (travel-duration-window road_0217 tw_00450) 0.4896)
  (= (travel-duration-window road_0217 tw_00480) 0.4896)
  (dynamic-road road_0240)
  (= (travel-duration-window road_0240 tw_00000) 8.1339)
  (= (travel-duration-window road_0240 tw_00030) 8.1339)
  (= (travel-duration-window road_0240 tw_00060) 8.1339)
  (= (travel-duration-window road_0240 tw_00090) 8.1339)
  (= (travel-duration-window road_0240 tw_00120) 8.1339)
  (= (travel-duration-window road_0240 tw_00150) 8.1339)
  (= (travel-duration-window road_0240 tw_00180) 8.9473)
  (= (travel-duration-window road_0240 tw_00210) 8.1339)
  (= (travel-duration-window road_0240 tw_00240) 8.1339)
  (= (travel-duration-window road_0240 tw_00270) 8.1339)
  (= (travel-duration-window road_0240 tw_00300) 8.1339)
  (= (travel-duration-window road_0240 tw_00330) 8.1339)
  (= (travel-duration-window road_0240 tw_00360) 8.1339)
  (= (travel-duration-window road_0240 tw_00390) 8.1339)
  (= (travel-duration-window road_0240 tw_00420) 8.5406)
  (= (travel-duration-window road_0240 tw_00450) 8.1339)
  (= (travel-duration-window road_0240 tw_00480) 8.1339)
  (dynamic-road road_0272)
  (= (travel-duration-window road_0272 tw_00000) 1.6669)
  (= (travel-duration-window road_0272 tw_00030) 1.6669)
  (= (travel-duration-window road_0272 tw_00060) 1.6669)
  (= (travel-duration-window road_0272 tw_00090) 1.7502)
  (= (travel-duration-window road_0272 tw_00120) 1.6669)
  (= (travel-duration-window road_0272 tw_00150) 1.8336)
  (= (travel-duration-window road_0272 tw_00180) 1.6669)
  (= (travel-duration-window road_0272 tw_00210) 1.6669)
  (= (travel-duration-window road_0272 tw_00240) 1.6669)
  (= (travel-duration-window road_0272 tw_00270) 1.6669)
  (= (travel-duration-window road_0272 tw_00300) 1.6669)
  (= (travel-duration-window road_0272 tw_00330) 1.6669)
  (= (travel-duration-window road_0272 tw_00360) 1.6669)
  (= (travel-duration-window road_0272 tw_00390) 1.6669)
  (= (travel-duration-window road_0272 tw_00420) 1.6669)
  (= (travel-duration-window road_0272 tw_00450) 1.6669)
  (= (travel-duration-window road_0272 tw_00480) 1.6669)
  (dynamic-road road_0281)
  (= (travel-duration-window road_0281 tw_00000) 13.4624)
  (= (travel-duration-window road_0281 tw_00030) 12.8213)
  (= (travel-duration-window road_0281 tw_00060) 13.4624)
  (= (travel-duration-window road_0281 tw_00090) 12.8213)
  (= (travel-duration-window road_0281 tw_00120) 14.1034)
  (= (travel-duration-window road_0281 tw_00150) 13.4624)
  (= (travel-duration-window road_0281 tw_00180) 12.8213)
  (= (travel-duration-window road_0281 tw_00210) 12.8213)
  (= (travel-duration-window road_0281 tw_00240) 12.8213)
  (= (travel-duration-window road_0281 tw_00270) 13.4624)
  (= (travel-duration-window road_0281 tw_00300) 12.8213)
  (= (travel-duration-window road_0281 tw_00330) 12.8213)
  (= (travel-duration-window road_0281 tw_00360) 12.8213)
  (= (travel-duration-window road_0281 tw_00390) 12.8213)
  (= (travel-duration-window road_0281 tw_00420) 12.8213)
  (= (travel-duration-window road_0281 tw_00450) 12.8213)
  (= (travel-duration-window road_0281 tw_00480) 12.8213)
  (dynamic-road road_0283)
  (= (travel-duration-window road_0283 tw_00000) 1.4461)
  (= (travel-duration-window road_0283 tw_00030) 1.4461)
  (= (travel-duration-window road_0283 tw_00060) 1.4461)
  (= (travel-duration-window road_0283 tw_00090) 1.4461)
  (= (travel-duration-window road_0283 tw_00120) 1.5184)
  (= (travel-duration-window road_0283 tw_00150) 1.7353)
  (= (travel-duration-window road_0283 tw_00180) 1.4461)
  (= (travel-duration-window road_0283 tw_00210) 1.4461)
  (= (travel-duration-window road_0283 tw_00240) 1.4461)
  (= (travel-duration-window road_0283 tw_00270) 1.4461)
  (= (travel-duration-window road_0283 tw_00300) 1.4461)
  (= (travel-duration-window road_0283 tw_00330) 1.4461)
  (= (travel-duration-window road_0283 tw_00360) 1.4461)
  (= (travel-duration-window road_0283 tw_00390) 1.4461)
  (= (travel-duration-window road_0283 tw_00420) 1.4461)
  (= (travel-duration-window road_0283 tw_00450) 1.4461)
  (= (travel-duration-window road_0283 tw_00480) 1.4461)
  (dynamic-road road_0287)
  (= (travel-duration-window road_0287 tw_00000) 1.6009)
  (= (travel-duration-window road_0287 tw_00030) 1.761)
  (= (travel-duration-window road_0287 tw_00060) 1.6009)
  (= (travel-duration-window road_0287 tw_00090) 1.6009)
  (= (travel-duration-window road_0287 tw_00120) 1.6009)
  (= (travel-duration-window road_0287 tw_00150) 1.6009)
  (= (travel-duration-window road_0287 tw_00180) 1.6809)
  (= (travel-duration-window road_0287 tw_00210) 1.6009)
  (= (travel-duration-window road_0287 tw_00240) 1.6809)
  (= (travel-duration-window road_0287 tw_00270) 1.6809)
  (= (travel-duration-window road_0287 tw_00300) 1.6809)
  (= (travel-duration-window road_0287 tw_00330) 1.6009)
  (= (travel-duration-window road_0287 tw_00360) 1.6009)
  (= (travel-duration-window road_0287 tw_00390) 1.6009)
  (= (travel-duration-window road_0287 tw_00420) 1.6009)
  (= (travel-duration-window road_0287 tw_00450) 1.6009)
  (= (travel-duration-window road_0287 tw_00480) 1.6009)
  (dynamic-road road_0289)
  (= (travel-duration-window road_0289 tw_00000) 0.3629)
  (= (travel-duration-window road_0289 tw_00030) 0.3456)
  (= (travel-duration-window road_0289 tw_00060) 0.3456)
  (= (travel-duration-window road_0289 tw_00090) 0.3456)
  (= (travel-duration-window road_0289 tw_00120) 0.3629)
  (= (travel-duration-window road_0289 tw_00150) 0.4147)
  (= (travel-duration-window road_0289 tw_00180) 0.3456)
  (= (travel-duration-window road_0289 tw_00210) 0.3629)
  (= (travel-duration-window road_0289 tw_00240) 0.3456)
  (= (travel-duration-window road_0289 tw_00270) 0.3456)
  (= (travel-duration-window road_0289 tw_00300) 0.3456)
  (= (travel-duration-window road_0289 tw_00330) 0.3456)
  (= (travel-duration-window road_0289 tw_00360) 0.3456)
  (= (travel-duration-window road_0289 tw_00390) 0.3456)
  (= (travel-duration-window road_0289 tw_00420) 0.3456)
  (= (travel-duration-window road_0289 tw_00450) 0.3456)
  (= (travel-duration-window road_0289 tw_00480) 0.3456)
  (dynamic-road road_0301)
  (= (travel-duration-window road_0301 tw_00000) 4.4318)
  (= (travel-duration-window road_0301 tw_00030) 4.4318)
  (= (travel-duration-window road_0301 tw_00060) 4.4318)
  (= (travel-duration-window road_0301 tw_00090) 4.6534)
  (= (travel-duration-window road_0301 tw_00120) 4.4318)
  (= (travel-duration-window road_0301 tw_00150) 4.6534)
  (= (travel-duration-window road_0301 tw_00180) 4.875)
  (= (travel-duration-window road_0301 tw_00210) 4.6534)
  (= (travel-duration-window road_0301 tw_00240) 4.6534)
  (= (travel-duration-window road_0301 tw_00270) 4.4318)
  (= (travel-duration-window road_0301 tw_00300) 4.4318)
  (= (travel-duration-window road_0301 tw_00330) 4.4318)
  (= (travel-duration-window road_0301 tw_00360) 4.4318)
  (= (travel-duration-window road_0301 tw_00390) 4.4318)
  (= (travel-duration-window road_0301 tw_00420) 4.4318)
  (= (travel-duration-window road_0301 tw_00450) 4.4318)
  (= (travel-duration-window road_0301 tw_00480) 4.4318)
  (dynamic-road road_0305)
  (= (travel-duration-window road_0305 tw_00000) 4.6994)
  (= (travel-duration-window road_0305 tw_00030) 4.9344)
  (= (travel-duration-window road_0305 tw_00060) 4.6994)
  (= (travel-duration-window road_0305 tw_00090) 4.6994)
  (= (travel-duration-window road_0305 tw_00120) 4.6994)
  (= (travel-duration-window road_0305 tw_00150) 4.9344)
  (= (travel-duration-window road_0305 tw_00180) 5.1693)
  (= (travel-duration-window road_0305 tw_00210) 4.6994)
  (= (travel-duration-window road_0305 tw_00240) 4.6994)
  (= (travel-duration-window road_0305 tw_00270) 4.6994)
  (= (travel-duration-window road_0305 tw_00300) 4.9344)
  (= (travel-duration-window road_0305 tw_00330) 4.6994)
  (= (travel-duration-window road_0305 tw_00360) 4.6994)
  (= (travel-duration-window road_0305 tw_00390) 4.6994)
  (= (travel-duration-window road_0305 tw_00420) 4.6994)
  (= (travel-duration-window road_0305 tw_00450) 4.6994)
  (= (travel-duration-window road_0305 tw_00480) 4.6994)
  (dynamic-road road_0312)
  (= (travel-duration-window road_0312 tw_00000) 5.3126)
  (= (travel-duration-window road_0312 tw_00030) 5.3126)
  (= (travel-duration-window road_0312 tw_00060) 5.3126)
  (= (travel-duration-window road_0312 tw_00090) 5.3126)
  (= (travel-duration-window road_0312 tw_00120) 5.3126)
  (= (travel-duration-window road_0312 tw_00150) 5.3126)
  (= (travel-duration-window road_0312 tw_00180) 5.8439)
  (= (travel-duration-window road_0312 tw_00210) 5.3126)
  (= (travel-duration-window road_0312 tw_00240) 5.3126)
  (= (travel-duration-window road_0312 tw_00270) 5.3126)
  (= (travel-duration-window road_0312 tw_00300) 5.3126)
  (= (travel-duration-window road_0312 tw_00330) 5.5782)
  (= (travel-duration-window road_0312 tw_00360) 5.3126)
  (= (travel-duration-window road_0312 tw_00390) 5.3126)
  (= (travel-duration-window road_0312 tw_00420) 5.3126)
  (= (travel-duration-window road_0312 tw_00450) 5.3126)
  (= (travel-duration-window road_0312 tw_00480) 5.3126)
  (dynamic-road road_0330)
  (= (travel-duration-window road_0330 tw_00000) 8.3787)
  (= (travel-duration-window road_0330 tw_00030) 8.7977)
  (= (travel-duration-window road_0330 tw_00060) 8.3787)
  (= (travel-duration-window road_0330 tw_00090) 8.3787)
  (= (travel-duration-window road_0330 tw_00120) 8.3787)
  (= (travel-duration-window road_0330 tw_00150) 8.3787)
  (= (travel-duration-window road_0330 tw_00180) 8.3787)
  (= (travel-duration-window road_0330 tw_00210) 8.3787)
  (= (travel-duration-window road_0330 tw_00240) 8.3787)
  (= (travel-duration-window road_0330 tw_00270) 9.2166)
  (= (travel-duration-window road_0330 tw_00300) 8.3787)
  (= (travel-duration-window road_0330 tw_00330) 8.3787)
  (= (travel-duration-window road_0330 tw_00360) 8.3787)
  (= (travel-duration-window road_0330 tw_00390) 8.3787)
  (= (travel-duration-window road_0330 tw_00420) 8.3787)
  (= (travel-duration-window road_0330 tw_00450) 8.3787)
  (= (travel-duration-window road_0330 tw_00480) 8.3787)
  (dynamic-road road_0332)
  (= (travel-duration-window road_0332 tw_00000) 11.6789)
  (= (travel-duration-window road_0332 tw_00030) 11.6789)
  (= (travel-duration-window road_0332 tw_00060) 12.2628)
  (= (travel-duration-window road_0332 tw_00090) 11.6789)
  (= (travel-duration-window road_0332 tw_00120) 11.6789)
  (= (travel-duration-window road_0332 tw_00150) 11.6789)
  (= (travel-duration-window road_0332 tw_00180) 11.6789)
  (= (travel-duration-window road_0332 tw_00210) 12.8468)
  (= (travel-duration-window road_0332 tw_00240) 11.6789)
  (= (travel-duration-window road_0332 tw_00270) 11.6789)
  (= (travel-duration-window road_0332 tw_00300) 11.6789)
  (= (travel-duration-window road_0332 tw_00330) 11.6789)
  (= (travel-duration-window road_0332 tw_00360) 11.6789)
  (= (travel-duration-window road_0332 tw_00390) 11.6789)
  (= (travel-duration-window road_0332 tw_00420) 11.6789)
  (= (travel-duration-window road_0332 tw_00450) 11.6789)
  (= (travel-duration-window road_0332 tw_00480) 11.6789)
  (dynamic-road road_0334)
  (= (travel-duration-window road_0334 tw_00000) 8.4687)
  (= (travel-duration-window road_0334 tw_00030) 8.4687)
  (= (travel-duration-window road_0334 tw_00060) 8.4687)
  (= (travel-duration-window road_0334 tw_00090) 8.4687)
  (= (travel-duration-window road_0334 tw_00120) 8.4687)
  (= (travel-duration-window road_0334 tw_00150) 8.4687)
  (= (travel-duration-window road_0334 tw_00180) 8.4687)
  (= (travel-duration-window road_0334 tw_00210) 8.8922)
  (= (travel-duration-window road_0334 tw_00240) 9.3156)
  (= (travel-duration-window road_0334 tw_00270) 8.4687)
  (= (travel-duration-window road_0334 tw_00300) 8.4687)
  (= (travel-duration-window road_0334 tw_00330) 8.4687)
  (= (travel-duration-window road_0334 tw_00360) 8.4687)
  (= (travel-duration-window road_0334 tw_00390) 8.4687)
  (= (travel-duration-window road_0334 tw_00420) 8.4687)
  (= (travel-duration-window road_0334 tw_00450) 8.4687)
  (= (travel-duration-window road_0334 tw_00480) 8.4687)
  (dynamic-road road_0346)
  (= (travel-duration-window road_0346 tw_00000) 31.9213)
  (= (travel-duration-window road_0346 tw_00030) 31.9213)
  (= (travel-duration-window road_0346 tw_00060) 33.5173)
  (= (travel-duration-window road_0346 tw_00090) 31.9213)
  (= (travel-duration-window road_0346 tw_00120) 33.5173)
  (= (travel-duration-window road_0346 tw_00150) 31.9213)
  (= (travel-duration-window road_0346 tw_00180) 35.1134)
  (= (travel-duration-window road_0346 tw_00210) 33.5173)
  (= (travel-duration-window road_0346 tw_00240) 33.5173)
  (= (travel-duration-window road_0346 tw_00270) 31.9213)
  (= (travel-duration-window road_0346 tw_00300) 31.9213)
  (= (travel-duration-window road_0346 tw_00330) 31.9213)
  (= (travel-duration-window road_0346 tw_00360) 31.9213)
  (= (travel-duration-window road_0346 tw_00390) 31.9213)
  (= (travel-duration-window road_0346 tw_00420) 31.9213)
  (= (travel-duration-window road_0346 tw_00450) 31.9213)
  (= (travel-duration-window road_0346 tw_00480) 31.9213)
  (dynamic-road road_0358)
  (= (travel-duration-window road_0358 tw_00000) 1.8049)
  (= (travel-duration-window road_0358 tw_00030) 1.8049)
  (= (travel-duration-window road_0358 tw_00060) 1.8049)
  (= (travel-duration-window road_0358 tw_00090) 1.8951)
  (= (travel-duration-window road_0358 tw_00120) 1.9854)
  (= (travel-duration-window road_0358 tw_00150) 1.8049)
  (= (travel-duration-window road_0358 tw_00180) 1.8049)
  (= (travel-duration-window road_0358 tw_00210) 1.8049)
  (= (travel-duration-window road_0358 tw_00240) 1.8049)
  (= (travel-duration-window road_0358 tw_00270) 1.8049)
  (= (travel-duration-window road_0358 tw_00300) 1.8049)
  (= (travel-duration-window road_0358 tw_00330) 1.8049)
  (= (travel-duration-window road_0358 tw_00360) 1.8049)
  (= (travel-duration-window road_0358 tw_00390) 1.8049)
  (= (travel-duration-window road_0358 tw_00420) 1.8049)
  (= (travel-duration-window road_0358 tw_00450) 1.8049)
  (= (travel-duration-window road_0358 tw_00480) 1.8049)
  (dynamic-road road_0359)
  (= (travel-duration-window road_0359 tw_00000) 8.0787)
  (= (travel-duration-window road_0359 tw_00030) 8.0787)
  (= (travel-duration-window road_0359 tw_00060) 8.8866)
  (= (travel-duration-window road_0359 tw_00090) 8.0787)
  (= (travel-duration-window road_0359 tw_00120) 8.0787)
  (= (travel-duration-window road_0359 tw_00150) 8.4827)
  (= (travel-duration-window road_0359 tw_00180) 8.8866)
  (= (travel-duration-window road_0359 tw_00210) 8.0787)
  (= (travel-duration-window road_0359 tw_00240) 8.4827)
  (= (travel-duration-window road_0359 tw_00270) 8.4827)
  (= (travel-duration-window road_0359 tw_00300) 8.4827)
  (= (travel-duration-window road_0359 tw_00330) 8.4827)
  (= (travel-duration-window road_0359 tw_00360) 8.0787)
  (= (travel-duration-window road_0359 tw_00390) 8.4827)
  (= (travel-duration-window road_0359 tw_00420) 8.0787)
  (= (travel-duration-window road_0359 tw_00450) 8.0787)
  (= (travel-duration-window road_0359 tw_00480) 8.0787)
  (dynamic-road road_0370)
  (= (travel-duration-window road_0370 tw_00000) 5.1458)
  (= (travel-duration-window road_0370 tw_00030) 5.1458)
  (= (travel-duration-window road_0370 tw_00060) 5.1458)
  (= (travel-duration-window road_0370 tw_00090) 5.9177)
  (= (travel-duration-window road_0370 tw_00120) 5.4031)
  (= (travel-duration-window road_0370 tw_00150) 5.1458)
  (= (travel-duration-window road_0370 tw_00180) 5.1458)
  (= (travel-duration-window road_0370 tw_00210) 5.4031)
  (= (travel-duration-window road_0370 tw_00240) 5.9177)
  (= (travel-duration-window road_0370 tw_00270) 5.4031)
  (= (travel-duration-window road_0370 tw_00300) 5.1458)
  (= (travel-duration-window road_0370 tw_00330) 5.4031)
  (= (travel-duration-window road_0370 tw_00360) 5.4031)
  (= (travel-duration-window road_0370 tw_00390) 5.1458)
  (= (travel-duration-window road_0370 tw_00420) 5.1458)
  (= (travel-duration-window road_0370 tw_00450) 5.1458)
  (= (travel-duration-window road_0370 tw_00480) 5.1458)
  (dynamic-road road_0425)
  (= (travel-duration-window road_0425 tw_00000) 9.3448)
  (= (travel-duration-window road_0425 tw_00030) 9.3448)
  (= (travel-duration-window road_0425 tw_00060) 9.3448)
  (= (travel-duration-window road_0425 tw_00090) 10.2793)
  (= (travel-duration-window road_0425 tw_00120) 9.3448)
  (= (travel-duration-window road_0425 tw_00150) 9.3448)
  (= (travel-duration-window road_0425 tw_00180) 9.3448)
  (= (travel-duration-window road_0425 tw_00210) 9.812)
  (= (travel-duration-window road_0425 tw_00240) 9.3448)
  (= (travel-duration-window road_0425 tw_00270) 9.3448)
  (= (travel-duration-window road_0425 tw_00300) 9.3448)
  (= (travel-duration-window road_0425 tw_00330) 9.3448)
  (= (travel-duration-window road_0425 tw_00360) 9.3448)
  (= (travel-duration-window road_0425 tw_00390) 9.3448)
  (= (travel-duration-window road_0425 tw_00420) 9.3448)
  (= (travel-duration-window road_0425 tw_00450) 9.3448)
  (= (travel-duration-window road_0425 tw_00480) 9.3448)
  (dynamic-road road_0450)
  (= (travel-duration-window road_0450 tw_00000) 12.9137)
  (= (travel-duration-window road_0450 tw_00030) 12.9137)
  (= (travel-duration-window road_0450 tw_00060) 12.9137)
  (= (travel-duration-window road_0450 tw_00090) 13.5594)
  (= (travel-duration-window road_0450 tw_00120) 12.9137)
  (= (travel-duration-window road_0450 tw_00150) 13.5594)
  (= (travel-duration-window road_0450 tw_00180) 14.2051)
  (= (travel-duration-window road_0450 tw_00210) 12.9137)
  (= (travel-duration-window road_0450 tw_00240) 13.5594)
  (= (travel-duration-window road_0450 tw_00270) 14.2051)
  (= (travel-duration-window road_0450 tw_00300) 12.9137)
  (= (travel-duration-window road_0450 tw_00330) 13.5594)
  (= (travel-duration-window road_0450 tw_00360) 13.5594)
  (= (travel-duration-window road_0450 tw_00390) 12.9137)
  (= (travel-duration-window road_0450 tw_00420) 12.9137)
  (= (travel-duration-window road_0450 tw_00450) 12.9137)
  (= (travel-duration-window road_0450 tw_00480) 12.9137)
  (dynamic-road road_0470)
  (= (travel-duration-window road_0470 tw_00000) 19.9772)
  (= (travel-duration-window road_0470 tw_00030) 20.9761)
  (= (travel-duration-window road_0470 tw_00060) 21.9749)
  (= (travel-duration-window road_0470 tw_00090) 21.9749)
  (= (travel-duration-window road_0470 tw_00120) 20.9761)
  (= (travel-duration-window road_0470 tw_00150) 19.9772)
  (= (travel-duration-window road_0470 tw_00180) 19.9772)
  (= (travel-duration-window road_0470 tw_00210) 20.9761)
  (= (travel-duration-window road_0470 tw_00240) 20.9761)
  (= (travel-duration-window road_0470 tw_00270) 20.9761)
  (= (travel-duration-window road_0470 tw_00300) 19.9772)
  (= (travel-duration-window road_0470 tw_00330) 19.9772)
  (= (travel-duration-window road_0470 tw_00360) 19.9772)
  (= (travel-duration-window road_0470 tw_00390) 20.9761)
  (= (travel-duration-window road_0470 tw_00420) 19.9772)
  (= (travel-duration-window road_0470 tw_00450) 19.9772)
  (= (travel-duration-window road_0470 tw_00480) 19.9772)
  (dynamic-road road_0494)
  (= (travel-duration-window road_0494 tw_00000) 4.2387)
  (= (travel-duration-window road_0494 tw_00030) 3.8534)
  (= (travel-duration-window road_0494 tw_00060) 4.046)
  (= (travel-duration-window road_0494 tw_00090) 4.046)
  (= (travel-duration-window road_0494 tw_00120) 4.046)
  (= (travel-duration-window road_0494 tw_00150) 4.046)
  (= (travel-duration-window road_0494 tw_00180) 4.046)
  (= (travel-duration-window road_0494 tw_00210) 3.8534)
  (= (travel-duration-window road_0494 tw_00240) 3.8534)
  (= (travel-duration-window road_0494 tw_00270) 3.8534)
  (= (travel-duration-window road_0494 tw_00300) 3.8534)
  (= (travel-duration-window road_0494 tw_00330) 3.8534)
  (= (travel-duration-window road_0494 tw_00360) 3.8534)
  (= (travel-duration-window road_0494 tw_00390) 3.8534)
  (= (travel-duration-window road_0494 tw_00420) 3.8534)
  (= (travel-duration-window road_0494 tw_00450) 3.8534)
  (= (travel-duration-window road_0494 tw_00480) 3.8534)
  (dynamic-road road_0495)
  (= (travel-duration-window road_0495 tw_00000) 6.7996)
  (= (travel-duration-window road_0495 tw_00030) 6.1814)
  (= (travel-duration-window road_0495 tw_00060) 6.4905)
  (= (travel-duration-window road_0495 tw_00090) 6.1814)
  (= (travel-duration-window road_0495 tw_00120) 6.1814)
  (= (travel-duration-window road_0495 tw_00150) 6.4905)
  (= (travel-duration-window road_0495 tw_00180) 6.1814)
  (= (travel-duration-window road_0495 tw_00210) 6.1814)
  (= (travel-duration-window road_0495 tw_00240) 6.1814)
  (= (travel-duration-window road_0495 tw_00270) 6.1814)
  (= (travel-duration-window road_0495 tw_00300) 6.1814)
  (= (travel-duration-window road_0495 tw_00330) 6.1814)
  (= (travel-duration-window road_0495 tw_00360) 6.1814)
  (= (travel-duration-window road_0495 tw_00390) 6.1814)
  (= (travel-duration-window road_0495 tw_00420) 6.1814)
  (= (travel-duration-window road_0495 tw_00450) 6.1814)
  (= (travel-duration-window road_0495 tw_00480) 6.1814)
  (dynamic-road road_0529)
  (= (travel-duration-window road_0529 tw_00000) 5.5046)
  (= (travel-duration-window road_0529 tw_00030) 5.5046)
  (= (travel-duration-window road_0529 tw_00060) 5.5046)
  (= (travel-duration-window road_0529 tw_00090) 5.7799)
  (= (travel-duration-window road_0529 tw_00120) 6.0551)
  (= (travel-duration-window road_0529 tw_00150) 5.5046)
  (= (travel-duration-window road_0529 tw_00180) 5.7799)
  (= (travel-duration-window road_0529 tw_00210) 5.5046)
  (= (travel-duration-window road_0529 tw_00240) 5.7799)
  (= (travel-duration-window road_0529 tw_00270) 5.7799)
  (= (travel-duration-window road_0529 tw_00300) 5.5046)
  (= (travel-duration-window road_0529 tw_00330) 5.5046)
  (= (travel-duration-window road_0529 tw_00360) 5.5046)
  (= (travel-duration-window road_0529 tw_00390) 5.5046)
  (= (travel-duration-window road_0529 tw_00420) 5.5046)
  (= (travel-duration-window road_0529 tw_00450) 5.5046)
  (= (travel-duration-window road_0529 tw_00480) 5.5046)
  (dynamic-road road_0547)
  (= (travel-duration-window road_0547 tw_00000) 19.7752)
  (= (travel-duration-window road_0547 tw_00030) 18.8336)
  (= (travel-duration-window road_0547 tw_00060) 20.7169)
  (= (travel-duration-window road_0547 tw_00090) 19.7752)
  (= (travel-duration-window road_0547 tw_00120) 18.8336)
  (= (travel-duration-window road_0547 tw_00150) 18.8336)
  (= (travel-duration-window road_0547 tw_00180) 19.7752)
  (= (travel-duration-window road_0547 tw_00210) 18.8336)
  (= (travel-duration-window road_0547 tw_00240) 18.8336)
  (= (travel-duration-window road_0547 tw_00270) 19.7752)
  (= (travel-duration-window road_0547 tw_00300) 18.8336)
  (= (travel-duration-window road_0547 tw_00330) 19.7752)
  (= (travel-duration-window road_0547 tw_00360) 18.8336)
  (= (travel-duration-window road_0547 tw_00390) 18.8336)
  (= (travel-duration-window road_0547 tw_00420) 18.8336)
  (= (travel-duration-window road_0547 tw_00450) 18.8336)
  (= (travel-duration-window road_0547 tw_00480) 18.8336)
  (dynamic-road road_0548)
  (= (travel-duration-window road_0548 tw_00000) 32.4481)
  (= (travel-duration-window road_0548 tw_00030) 35.6929)
  (= (travel-duration-window road_0548 tw_00060) 32.4481)
  (= (travel-duration-window road_0548 tw_00090) 34.0705)
  (= (travel-duration-window road_0548 tw_00120) 32.4481)
  (= (travel-duration-window road_0548 tw_00150) 32.4481)
  (= (travel-duration-window road_0548 tw_00180) 32.4481)
  (= (travel-duration-window road_0548 tw_00210) 34.0705)
  (= (travel-duration-window road_0548 tw_00240) 32.4481)
  (= (travel-duration-window road_0548 tw_00270) 32.4481)
  (= (travel-duration-window road_0548 tw_00300) 32.4481)
  (= (travel-duration-window road_0548 tw_00330) 32.4481)
  (= (travel-duration-window road_0548 tw_00360) 32.4481)
  (= (travel-duration-window road_0548 tw_00390) 32.4481)
  (= (travel-duration-window road_0548 tw_00420) 32.4481)
  (= (travel-duration-window road_0548 tw_00450) 32.4481)
  (= (travel-duration-window road_0548 tw_00480) 32.4481)
  (dynamic-road road_0558)
  (= (travel-duration-window road_0558 tw_00000) 11.2521)
  (= (travel-duration-window road_0558 tw_00030) 10.7407)
  (= (travel-duration-window road_0558 tw_00060) 10.2292)
  (= (travel-duration-window road_0558 tw_00090) 10.7407)
  (= (travel-duration-window road_0558 tw_00120) 11.2521)
  (= (travel-duration-window road_0558 tw_00150) 10.7407)
  (= (travel-duration-window road_0558 tw_00180) 10.7407)
  (= (travel-duration-window road_0558 tw_00210) 10.2292)
  (= (travel-duration-window road_0558 tw_00240) 10.2292)
  (= (travel-duration-window road_0558 tw_00270) 10.2292)
  (= (travel-duration-window road_0558 tw_00300) 10.7407)
  (= (travel-duration-window road_0558 tw_00330) 10.7407)
  (= (travel-duration-window road_0558 tw_00360) 10.2292)
  (= (travel-duration-window road_0558 tw_00390) 10.2292)
  (= (travel-duration-window road_0558 tw_00420) 10.2292)
  (= (travel-duration-window road_0558 tw_00450) 10.2292)
  (= (travel-duration-window road_0558 tw_00480) 10.2292)
  (dynamic-road road_0564)
  (= (travel-duration-window road_0564 tw_00000) 4.841)
  (= (travel-duration-window road_0564 tw_00030) 4.841)
  (= (travel-duration-window road_0564 tw_00060) 4.841)
  (= (travel-duration-window road_0564 tw_00090) 4.841)
  (= (travel-duration-window road_0564 tw_00120) 5.083)
  (= (travel-duration-window road_0564 tw_00150) 4.841)
  (= (travel-duration-window road_0564 tw_00180) 4.841)
  (= (travel-duration-window road_0564 tw_00210) 5.3251)
  (= (travel-duration-window road_0564 tw_00240) 4.841)
  (= (travel-duration-window road_0564 tw_00270) 4.841)
  (= (travel-duration-window road_0564 tw_00300) 4.841)
  (= (travel-duration-window road_0564 tw_00330) 4.841)
  (= (travel-duration-window road_0564 tw_00360) 4.841)
  (= (travel-duration-window road_0564 tw_00390) 4.841)
  (= (travel-duration-window road_0564 tw_00420) 4.841)
  (= (travel-duration-window road_0564 tw_00450) 4.841)
  (= (travel-duration-window road_0564 tw_00480) 4.841)
  (dynamic-road road_0583)
  (= (travel-duration-window road_0583 tw_00000) 1.0181)
  (= (travel-duration-window road_0583 tw_00030) 1.0181)
  (= (travel-duration-window road_0583 tw_00060) 1.0181)
  (= (travel-duration-window road_0583 tw_00090) 1.0181)
  (= (travel-duration-window road_0583 tw_00120) 1.1199)
  (= (travel-duration-window road_0583 tw_00150) 1.069)
  (= (travel-duration-window road_0583 tw_00180) 1.0181)
  (= (travel-duration-window road_0583 tw_00210) 1.0181)
  (= (travel-duration-window road_0583 tw_00240) 1.0181)
  (= (travel-duration-window road_0583 tw_00270) 1.0181)
  (= (travel-duration-window road_0583 tw_00300) 1.0181)
  (= (travel-duration-window road_0583 tw_00330) 1.0181)
  (= (travel-duration-window road_0583 tw_00360) 1.0181)
  (= (travel-duration-window road_0583 tw_00390) 1.0181)
  (= (travel-duration-window road_0583 tw_00420) 1.0181)
  (= (travel-duration-window road_0583 tw_00450) 1.0181)
  (= (travel-duration-window road_0583 tw_00480) 1.0181)
  (dynamic-road road_0618)
  (= (travel-duration-window road_0618 tw_00000) 0.3276)
  (= (travel-duration-window road_0618 tw_00030) 0.3276)
  (= (travel-duration-window road_0618 tw_00060) 0.3276)
  (= (travel-duration-window road_0618 tw_00090) 0.344)
  (= (travel-duration-window road_0618 tw_00120) 0.3604)
  (= (travel-duration-window road_0618 tw_00150) 0.3276)
  (= (travel-duration-window road_0618 tw_00180) 0.3276)
  (= (travel-duration-window road_0618 tw_00210) 0.3276)
  (= (travel-duration-window road_0618 tw_00240) 0.3276)
  (= (travel-duration-window road_0618 tw_00270) 0.3276)
  (= (travel-duration-window road_0618 tw_00300) 0.3276)
  (= (travel-duration-window road_0618 tw_00330) 0.3276)
  (= (travel-duration-window road_0618 tw_00360) 0.3276)
  (= (travel-duration-window road_0618 tw_00390) 0.3276)
  (= (travel-duration-window road_0618 tw_00420) 0.3276)
  (= (travel-duration-window road_0618 tw_00450) 0.3276)
  (= (travel-duration-window road_0618 tw_00480) 0.3276)
  (dynamic-road road_0619)
  (= (travel-duration-window road_0619 tw_00000) 24.0166)
  (= (travel-duration-window road_0619 tw_00030) 24.0166)
  (= (travel-duration-window road_0619 tw_00060) 26.4182)
  (= (travel-duration-window road_0619 tw_00090) 24.0166)
  (= (travel-duration-window road_0619 tw_00120) 24.0166)
  (= (travel-duration-window road_0619 tw_00150) 24.0166)
  (= (travel-duration-window road_0619 tw_00180) 25.2174)
  (= (travel-duration-window road_0619 tw_00210) 24.0166)
  (= (travel-duration-window road_0619 tw_00240) 24.0166)
  (= (travel-duration-window road_0619 tw_00270) 24.0166)
  (= (travel-duration-window road_0619 tw_00300) 24.0166)
  (= (travel-duration-window road_0619 tw_00330) 24.0166)
  (= (travel-duration-window road_0619 tw_00360) 24.0166)
  (= (travel-duration-window road_0619 tw_00390) 24.0166)
  (= (travel-duration-window road_0619 tw_00420) 24.0166)
  (= (travel-duration-window road_0619 tw_00450) 24.0166)
  (= (travel-duration-window road_0619 tw_00480) 24.0166)
  (dynamic-road road_0621)
  (= (travel-duration-window road_0621 tw_00000) 5.9774)
  (= (travel-duration-window road_0621 tw_00030) 6.2763)
  (= (travel-duration-window road_0621 tw_00060) 6.2763)
  (= (travel-duration-window road_0621 tw_00090) 6.8741)
  (= (travel-duration-window road_0621 tw_00120) 6.5752)
  (= (travel-duration-window road_0621 tw_00150) 6.8741)
  (= (travel-duration-window road_0621 tw_00180) 5.9774)
  (= (travel-duration-window road_0621 tw_00210) 6.5752)
  (= (travel-duration-window road_0621 tw_00240) 6.5752)
  (= (travel-duration-window road_0621 tw_00270) 6.5752)
  (= (travel-duration-window road_0621 tw_00300) 6.2763)
  (= (travel-duration-window road_0621 tw_00330) 5.9774)
  (= (travel-duration-window road_0621 tw_00360) 6.5752)
  (= (travel-duration-window road_0621 tw_00390) 5.9774)
  (= (travel-duration-window road_0621 tw_00420) 6.2763)
  (= (travel-duration-window road_0621 tw_00450) 5.9774)
  (= (travel-duration-window road_0621 tw_00480) 5.9774)
  (dynamic-road road_0627)
  (= (travel-duration-window road_0627 tw_00000) 9.3445)
  (= (travel-duration-window road_0627 tw_00030) 8.8996)
  (= (travel-duration-window road_0627 tw_00060) 8.8996)
  (= (travel-duration-window road_0627 tw_00090) 8.8996)
  (= (travel-duration-window road_0627 tw_00120) 9.3445)
  (= (travel-duration-window road_0627 tw_00150) 8.8996)
  (= (travel-duration-window road_0627 tw_00180) 9.7895)
  (= (travel-duration-window road_0627 tw_00210) 8.8996)
  (= (travel-duration-window road_0627 tw_00240) 8.8996)
  (= (travel-duration-window road_0627 tw_00270) 9.3445)
  (= (travel-duration-window road_0627 tw_00300) 8.8996)
  (= (travel-duration-window road_0627 tw_00330) 8.8996)
  (= (travel-duration-window road_0627 tw_00360) 8.8996)
  (= (travel-duration-window road_0627 tw_00390) 8.8996)
  (= (travel-duration-window road_0627 tw_00420) 8.8996)
  (= (travel-duration-window road_0627 tw_00450) 8.8996)
  (= (travel-duration-window road_0627 tw_00480) 8.8996)
  (dynamic-road road_0657)
  (= (travel-duration-window road_0657 tw_00000) 3.3097)
  (= (travel-duration-window road_0657 tw_00030) 3.4752)
  (= (travel-duration-window road_0657 tw_00060) 3.3097)
  (= (travel-duration-window road_0657 tw_00090) 3.3097)
  (= (travel-duration-window road_0657 tw_00120) 3.3097)
  (= (travel-duration-window road_0657 tw_00150) 3.3097)
  (= (travel-duration-window road_0657 tw_00180) 3.6407)
  (= (travel-duration-window road_0657 tw_00210) 3.3097)
  (= (travel-duration-window road_0657 tw_00240) 3.4752)
  (= (travel-duration-window road_0657 tw_00270) 3.4752)
  (= (travel-duration-window road_0657 tw_00300) 3.3097)
  (= (travel-duration-window road_0657 tw_00330) 3.3097)
  (= (travel-duration-window road_0657 tw_00360) 3.3097)
  (= (travel-duration-window road_0657 tw_00390) 3.3097)
  (= (travel-duration-window road_0657 tw_00420) 3.4752)
  (= (travel-duration-window road_0657 tw_00450) 3.3097)
  (= (travel-duration-window road_0657 tw_00480) 3.3097)
  (dynamic-road road_0664)
  (= (travel-duration-window road_0664 tw_00000) 7.5627)
  (= (travel-duration-window road_0664 tw_00030) 7.9408)
  (= (travel-duration-window road_0664 tw_00060) 7.5627)
  (= (travel-duration-window road_0664 tw_00090) 8.319)
  (= (travel-duration-window road_0664 tw_00120) 8.319)
  (= (travel-duration-window road_0664 tw_00150) 7.9408)
  (= (travel-duration-window road_0664 tw_00180) 7.5627)
  (= (travel-duration-window road_0664 tw_00210) 7.5627)
  (= (travel-duration-window road_0664 tw_00240) 7.9408)
  (= (travel-duration-window road_0664 tw_00270) 7.5627)
  (= (travel-duration-window road_0664 tw_00300) 7.9408)
  (= (travel-duration-window road_0664 tw_00330) 7.5627)
  (= (travel-duration-window road_0664 tw_00360) 7.5627)
  (= (travel-duration-window road_0664 tw_00390) 7.5627)
  (= (travel-duration-window road_0664 tw_00420) 7.5627)
  (= (travel-duration-window road_0664 tw_00450) 7.5627)
  (= (travel-duration-window road_0664 tw_00480) 7.5627)
  (dynamic-road road_0706)
  (= (travel-duration-window road_0706 tw_00000) 24.5002)
  (= (travel-duration-window road_0706 tw_00030) 25.7252)
  (= (travel-duration-window road_0706 tw_00060) 25.7252)
  (= (travel-duration-window road_0706 tw_00090) 25.7252)
  (= (travel-duration-window road_0706 tw_00120) 26.9502)
  (= (travel-duration-window road_0706 tw_00150) 24.5002)
  (= (travel-duration-window road_0706 tw_00180) 25.7252)
  (= (travel-duration-window road_0706 tw_00210) 26.9502)
  (= (travel-duration-window road_0706 tw_00240) 25.7252)
  (= (travel-duration-window road_0706 tw_00270) 24.5002)
  (= (travel-duration-window road_0706 tw_00300) 24.5002)
  (= (travel-duration-window road_0706 tw_00330) 26.9502)
  (= (travel-duration-window road_0706 tw_00360) 25.7252)
  (= (travel-duration-window road_0706 tw_00390) 24.5002)
  (= (travel-duration-window road_0706 tw_00420) 25.7252)
  (= (travel-duration-window road_0706 tw_00450) 24.5002)
  (= (travel-duration-window road_0706 tw_00480) 24.5002)
  (dynamic-road road_0717)
  (= (travel-duration-window road_0717 tw_00000) 2.2213)
  (= (travel-duration-window road_0717 tw_00030) 2.2213)
  (= (travel-duration-window road_0717 tw_00060) 2.2213)
  (= (travel-duration-window road_0717 tw_00090) 2.4434)
  (= (travel-duration-window road_0717 tw_00120) 2.2213)
  (= (travel-duration-window road_0717 tw_00150) 2.3324)
  (= (travel-duration-window road_0717 tw_00180) 2.3324)
  (= (travel-duration-window road_0717 tw_00210) 2.3324)
  (= (travel-duration-window road_0717 tw_00240) 2.2213)
  (= (travel-duration-window road_0717 tw_00270) 2.3324)
  (= (travel-duration-window road_0717 tw_00300) 2.3324)
  (= (travel-duration-window road_0717 tw_00330) 2.2213)
  (= (travel-duration-window road_0717 tw_00360) 2.2213)
  (= (travel-duration-window road_0717 tw_00390) 2.2213)
  (= (travel-duration-window road_0717 tw_00420) 2.3324)
  (= (travel-duration-window road_0717 tw_00450) 2.2213)
  (= (travel-duration-window road_0717 tw_00480) 2.2213)
  (dynamic-road road_0736)
  (= (travel-duration-window road_0736 tw_00000) 14.5574)
  (= (travel-duration-window road_0736 tw_00030) 13.8642)
  (= (travel-duration-window road_0736 tw_00060) 13.8642)
  (= (travel-duration-window road_0736 tw_00090) 14.5574)
  (= (travel-duration-window road_0736 tw_00120) 13.8642)
  (= (travel-duration-window road_0736 tw_00150) 14.5574)
  (= (travel-duration-window road_0736 tw_00180) 13.8642)
  (= (travel-duration-window road_0736 tw_00210) 13.8642)
  (= (travel-duration-window road_0736 tw_00240) 15.2506)
  (= (travel-duration-window road_0736 tw_00270) 15.2506)
  (= (travel-duration-window road_0736 tw_00300) 13.8642)
  (= (travel-duration-window road_0736 tw_00330) 13.8642)
  (= (travel-duration-window road_0736 tw_00360) 13.8642)
  (= (travel-duration-window road_0736 tw_00390) 13.8642)
  (= (travel-duration-window road_0736 tw_00420) 13.8642)
  (= (travel-duration-window road_0736 tw_00450) 13.8642)
  (= (travel-duration-window road_0736 tw_00480) 13.8642)
  (dynamic-road road_0744)
  (= (travel-duration-window road_0744 tw_00000) 2.1169)
  (= (travel-duration-window road_0744 tw_00030) 2.3286)
  (= (travel-duration-window road_0744 tw_00060) 2.3286)
  (= (travel-duration-window road_0744 tw_00090) 2.1169)
  (= (travel-duration-window road_0744 tw_00120) 2.2227)
  (= (travel-duration-window road_0744 tw_00150) 2.1169)
  (= (travel-duration-window road_0744 tw_00180) 2.1169)
  (= (travel-duration-window road_0744 tw_00210) 2.3286)
  (= (travel-duration-window road_0744 tw_00240) 2.1169)
  (= (travel-duration-window road_0744 tw_00270) 2.1169)
  (= (travel-duration-window road_0744 tw_00300) 2.2227)
  (= (travel-duration-window road_0744 tw_00330) 2.1169)
  (= (travel-duration-window road_0744 tw_00360) 2.1169)
  (= (travel-duration-window road_0744 tw_00390) 2.1169)
  (= (travel-duration-window road_0744 tw_00420) 2.1169)
  (= (travel-duration-window road_0744 tw_00450) 2.1169)
  (= (travel-duration-window road_0744 tw_00480) 2.1169)
  (dynamic-road road_0756)
  (= (travel-duration-window road_0756 tw_00000) 44.5926)
  (= (travel-duration-window road_0756 tw_00030) 44.5926)
  (= (travel-duration-window road_0756 tw_00060) 44.5926)
  (= (travel-duration-window road_0756 tw_00090) 44.5926)
  (= (travel-duration-window road_0756 tw_00120) 46.8222)
  (= (travel-duration-window road_0756 tw_00150) 49.0518)
  (= (travel-duration-window road_0756 tw_00180) 46.8222)
  (= (travel-duration-window road_0756 tw_00210) 44.5926)
  (= (travel-duration-window road_0756 tw_00240) 46.8222)
  (= (travel-duration-window road_0756 tw_00270) 44.5926)
  (= (travel-duration-window road_0756 tw_00300) 44.5926)
  (= (travel-duration-window road_0756 tw_00330) 44.5926)
  (= (travel-duration-window road_0756 tw_00360) 44.5926)
  (= (travel-duration-window road_0756 tw_00390) 44.5926)
  (= (travel-duration-window road_0756 tw_00420) 44.5926)
  (= (travel-duration-window road_0756 tw_00450) 44.5926)
  (= (travel-duration-window road_0756 tw_00480) 44.5926)
  (dynamic-road road_0760)
  (= (travel-duration-window road_0760 tw_00000) 9.6356)
  (= (travel-duration-window road_0760 tw_00030) 9.1768)
  (= (travel-duration-window road_0760 tw_00060) 9.6356)
  (= (travel-duration-window road_0760 tw_00090) 9.1768)
  (= (travel-duration-window road_0760 tw_00120) 9.1768)
  (= (travel-duration-window road_0760 tw_00150) 9.1768)
  (= (travel-duration-window road_0760 tw_00180) 10.0944)
  (= (travel-duration-window road_0760 tw_00210) 9.1768)
  (= (travel-duration-window road_0760 tw_00240) 9.1768)
  (= (travel-duration-window road_0760 tw_00270) 9.6356)
  (= (travel-duration-window road_0760 tw_00300) 9.1768)
  (= (travel-duration-window road_0760 tw_00330) 9.1768)
  (= (travel-duration-window road_0760 tw_00360) 9.1768)
  (= (travel-duration-window road_0760 tw_00390) 9.1768)
  (= (travel-duration-window road_0760 tw_00420) 9.6356)
  (= (travel-duration-window road_0760 tw_00450) 9.1768)
  (= (travel-duration-window road_0760 tw_00480) 9.1768)
  (dynamic-road road_0784)
  (= (travel-duration-window road_0784 tw_00000) 3.8786)
  (= (travel-duration-window road_0784 tw_00030) 4.0725)
  (= (travel-duration-window road_0784 tw_00060) 3.8786)
  (= (travel-duration-window road_0784 tw_00090) 3.8786)
  (= (travel-duration-window road_0784 tw_00120) 3.8786)
  (= (travel-duration-window road_0784 tw_00150) 3.8786)
  (= (travel-duration-window road_0784 tw_00180) 3.8786)
  (= (travel-duration-window road_0784 tw_00210) 3.8786)
  (= (travel-duration-window road_0784 tw_00240) 3.8786)
  (= (travel-duration-window road_0784 tw_00270) 3.8786)
  (= (travel-duration-window road_0784 tw_00300) 4.2664)
  (= (travel-duration-window road_0784 tw_00330) 3.8786)
  (= (travel-duration-window road_0784 tw_00360) 3.8786)
  (= (travel-duration-window road_0784 tw_00390) 3.8786)
  (= (travel-duration-window road_0784 tw_00420) 3.8786)
  (= (travel-duration-window road_0784 tw_00450) 3.8786)
  (= (travel-duration-window road_0784 tw_00480) 3.8786)
  (dynamic-road road_0801)
  (= (travel-duration-window road_0801 tw_00000) 18.0475)
  (= (travel-duration-window road_0801 tw_00030) 18.0475)
  (= (travel-duration-window road_0801 tw_00060) 18.0475)
  (= (travel-duration-window road_0801 tw_00090) 18.9499)
  (= (travel-duration-window road_0801 tw_00120) 18.0475)
  (= (travel-duration-window road_0801 tw_00150) 18.0475)
  (= (travel-duration-window road_0801 tw_00180) 19.8523)
  (= (travel-duration-window road_0801 tw_00210) 18.0475)
  (= (travel-duration-window road_0801 tw_00240) 18.9499)
  (= (travel-duration-window road_0801 tw_00270) 18.0475)
  (= (travel-duration-window road_0801 tw_00300) 18.9499)
  (= (travel-duration-window road_0801 tw_00330) 18.9499)
  (= (travel-duration-window road_0801 tw_00360) 18.0475)
  (= (travel-duration-window road_0801 tw_00390) 18.9499)
  (= (travel-duration-window road_0801 tw_00420) 18.0475)
  (= (travel-duration-window road_0801 tw_00450) 18.0475)
  (= (travel-duration-window road_0801 tw_00480) 18.0475)
  (dynamic-road road_0812)
  (= (travel-duration-window road_0812 tw_00000) 11.6693)
  (= (travel-duration-window road_0812 tw_00030) 12.2527)
  (= (travel-duration-window road_0812 tw_00060) 12.2527)
  (= (travel-duration-window road_0812 tw_00090) 11.6693)
  (= (travel-duration-window road_0812 tw_00120) 12.2527)
  (= (travel-duration-window road_0812 tw_00150) 11.6693)
  (= (travel-duration-window road_0812 tw_00180) 11.6693)
  (= (travel-duration-window road_0812 tw_00210) 12.8362)
  (= (travel-duration-window road_0812 tw_00240) 11.6693)
  (= (travel-duration-window road_0812 tw_00270) 11.6693)
  (= (travel-duration-window road_0812 tw_00300) 11.6693)
  (= (travel-duration-window road_0812 tw_00330) 11.6693)
  (= (travel-duration-window road_0812 tw_00360) 11.6693)
  (= (travel-duration-window road_0812 tw_00390) 11.6693)
  (= (travel-duration-window road_0812 tw_00420) 11.6693)
  (= (travel-duration-window road_0812 tw_00450) 11.6693)
  (= (travel-duration-window road_0812 tw_00480) 11.6693)
  (dynamic-road road_0858)
  (= (travel-duration-window road_0858 tw_00000) 35.4782)
  (= (travel-duration-window road_0858 tw_00030) 35.4782)
  (= (travel-duration-window road_0858 tw_00060) 35.4782)
  (= (travel-duration-window road_0858 tw_00090) 37.2521)
  (= (travel-duration-window road_0858 tw_00120) 37.2521)
  (= (travel-duration-window road_0858 tw_00150) 37.2521)
  (= (travel-duration-window road_0858 tw_00180) 39.026)
  (= (travel-duration-window road_0858 tw_00210) 35.4782)
  (= (travel-duration-window road_0858 tw_00240) 39.026)
  (= (travel-duration-window road_0858 tw_00270) 35.4782)
  (= (travel-duration-window road_0858 tw_00300) 35.4782)
  (= (travel-duration-window road_0858 tw_00330) 35.4782)
  (= (travel-duration-window road_0858 tw_00360) 35.4782)
  (= (travel-duration-window road_0858 tw_00390) 35.4782)
  (= (travel-duration-window road_0858 tw_00420) 35.4782)
  (= (travel-duration-window road_0858 tw_00450) 35.4782)
  (= (travel-duration-window road_0858 tw_00480) 35.4782)
  (dynamic-road road_0861)
  (= (travel-duration-window road_0861 tw_00000) 6.0674)
  (= (travel-duration-window road_0861 tw_00030) 6.0674)
  (= (travel-duration-window road_0861 tw_00060) 6.0674)
  (= (travel-duration-window road_0861 tw_00090) 6.0674)
  (= (travel-duration-window road_0861 tw_00120) 6.6742)
  (= (travel-duration-window road_0861 tw_00150) 6.3708)
  (= (travel-duration-window road_0861 tw_00180) 6.0674)
  (= (travel-duration-window road_0861 tw_00210) 6.0674)
  (= (travel-duration-window road_0861 tw_00240) 6.0674)
  (= (travel-duration-window road_0861 tw_00270) 6.0674)
  (= (travel-duration-window road_0861 tw_00300) 6.0674)
  (= (travel-duration-window road_0861 tw_00330) 6.0674)
  (= (travel-duration-window road_0861 tw_00360) 6.0674)
  (= (travel-duration-window road_0861 tw_00390) 6.0674)
  (= (travel-duration-window road_0861 tw_00420) 6.0674)
  (= (travel-duration-window road_0861 tw_00450) 6.0674)
  (= (travel-duration-window road_0861 tw_00480) 6.0674)
  ;; END DYNAMIC CONGESTION PROFILE
  (has-traffic-light loc_0000)
  (has-traffic-light loc_0003)
  (has-traffic-light loc_0070)
  (has-traffic-light loc_0072)
  (has-traffic-light loc_0217)
  (has-traffic-light loc_0371)
  (has-traffic-light loc_0450)
  ;; [DYNAMIC EVENT - roadworks] Roadworks at hub loc_0060 closing four main links (roads 0102, 0116, 0230, 0104) that lie close to the straight line between start and goal, forcing vehicles to detour around this central node.
  (location-blocked loc_0060)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (location-blocked loc_0074)
  ;; [DYNAMIC EVENT - robbery] Robbery blocking four connected roads at intersection loc_0080 (roads 0147, 0146, 0133, 0145), which are among the closest routes to the direct path, creating a significant bottleneck.
  (location-blocked loc_0080)
  )

  (:goal (at car1 loc_0034))

  (:metric minimize (travel-time car1))
)
