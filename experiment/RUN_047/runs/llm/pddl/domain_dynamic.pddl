;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-hybrid_llm_macro
;;    traversal             : compiled_duration
;;    state representation  : node_based
;;    action generation     : compiled
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=hybrid
;;    llm_events      : True
;;    fuel            : enabled=False, replanning=False, consumption=continuous
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents :time)
  (:types
    vehicle location road time-window - object
    loc_type_loc_0000 loc_type_loc_0001 loc_type_loc_0002 loc_type_loc_0003 loc_type_loc_0004 loc_type_loc_0005 loc_type_loc_0006 loc_type_loc_0007 loc_type_loc_0008 loc_type_loc_0009 loc_type_loc_0010 loc_type_loc_0011 loc_type_loc_0012 loc_type_loc_0013 loc_type_loc_0014 loc_type_loc_0015 loc_type_loc_0016 loc_type_loc_0017 loc_type_loc_0018 loc_type_loc_0019 loc_type_loc_0020 loc_type_loc_0021 loc_type_loc_0022 loc_type_loc_0023 loc_type_loc_0024 loc_type_loc_0025 loc_type_loc_0026 loc_type_loc_0027 loc_type_loc_0028 loc_type_loc_0029 loc_type_loc_0030 loc_type_loc_0031 loc_type_loc_0032 loc_type_loc_0033 loc_type_loc_0034 loc_type_loc_0035 loc_type_loc_0037 loc_type_loc_0038 loc_type_loc_0039 loc_type_loc_0040 loc_type_loc_0041 loc_type_loc_0042 loc_type_loc_0043 loc_type_loc_0044 loc_type_loc_0045 loc_type_loc_0046 loc_type_loc_0047 loc_type_loc_0048 loc_type_loc_0049 loc_type_loc_0050 loc_type_loc_0051 loc_type_loc_0052 loc_type_loc_0053 loc_type_loc_0054 loc_type_loc_0055 loc_type_loc_0056 loc_type_loc_0057 loc_type_loc_0058 loc_type_loc_0059 loc_type_loc_0060 loc_type_loc_0061 loc_type_loc_0062 loc_type_loc_0063 loc_type_loc_0064 loc_type_loc_0065 loc_type_loc_0066 loc_type_loc_0067 loc_type_loc_0068 loc_type_loc_0069 loc_type_loc_0070 loc_type_loc_0071 loc_type_loc_0073 loc_type_loc_0074 loc_type_loc_0075 loc_type_loc_0076 loc_type_loc_0077 loc_type_loc_0078 loc_type_loc_0079 loc_type_loc_0080 loc_type_loc_0081 loc_type_loc_0082 loc_type_loc_0083 loc_type_loc_0084 loc_type_loc_0085 loc_type_loc_0086 loc_type_loc_0087 loc_type_loc_0088 loc_type_loc_0089 loc_type_loc_0090 loc_type_loc_0091 loc_type_loc_0092 loc_type_loc_0093 loc_type_loc_0094 loc_type_loc_0095 loc_type_loc_0096 loc_type_loc_0097 loc_type_loc_0098 loc_type_loc_0099 loc_type_loc_0100 loc_type_loc_0101 loc_type_loc_0102 loc_type_loc_0103 loc_type_loc_0104 loc_type_loc_0105 loc_type_loc_0106 loc_type_loc_0107 loc_type_loc_0108 loc_type_loc_0109 loc_type_loc_0110 loc_type_loc_0111 loc_type_loc_0112 loc_type_loc_0113 loc_type_loc_0114 loc_type_loc_0115 loc_type_loc_0116 loc_type_loc_0117 loc_type_loc_0118 loc_type_loc_0119 loc_type_loc_0120 loc_type_loc_0121 loc_type_loc_0122 loc_type_loc_0123 loc_type_loc_0124 loc_type_loc_0125 loc_type_loc_0126 loc_type_loc_0127 loc_type_loc_0128 loc_type_loc_0129 loc_type_loc_0130 loc_type_loc_0131 loc_type_loc_0132 loc_type_loc_0133 loc_type_loc_0134 loc_type_loc_0135 loc_type_loc_0136 loc_type_loc_0137 loc_type_loc_0138 loc_type_loc_0139 loc_type_loc_0140 loc_type_loc_0141 loc_type_loc_0142 loc_type_loc_0143 loc_type_loc_0144 loc_type_loc_0145 loc_type_loc_0146 loc_type_loc_0147 loc_type_loc_0148 loc_type_loc_0149 loc_type_loc_0152 loc_type_loc_0153 loc_type_loc_0154 loc_type_loc_0155 loc_type_loc_0156 loc_type_loc_0157 loc_type_loc_0158 loc_type_loc_0159 loc_type_loc_0160 loc_type_loc_0161 loc_type_loc_0162 loc_type_loc_0163 loc_type_loc_0164 loc_type_loc_0165 loc_type_loc_0166 loc_type_loc_0167 loc_type_loc_0168 loc_type_loc_0169 loc_type_loc_0170 loc_type_loc_0171 loc_type_loc_0172 loc_type_loc_0173 loc_type_loc_0174 loc_type_loc_0175 loc_type_loc_0176 loc_type_loc_0177 loc_type_loc_0178 loc_type_loc_0179 loc_type_loc_0180 loc_type_loc_0181 loc_type_loc_0182 loc_type_loc_0183 loc_type_loc_0184 loc_type_loc_0185 loc_type_loc_0187 loc_type_loc_0188 loc_type_loc_0189 loc_type_loc_0191 loc_type_loc_0192 loc_type_loc_0193 loc_type_loc_0194 loc_type_loc_0195 loc_type_loc_0196 loc_type_loc_0197 loc_type_loc_0198 loc_type_loc_0199 loc_type_loc_0200 loc_type_loc_0201 loc_type_loc_0202 loc_type_loc_0203 loc_type_loc_0204 loc_type_loc_0205 loc_type_loc_0206 loc_type_loc_0207 loc_type_loc_0208 loc_type_loc_0209 loc_type_loc_0210 loc_type_loc_0211 loc_type_loc_0212 loc_type_loc_0213 loc_type_loc_0214 loc_type_loc_0215 loc_type_loc_0216 loc_type_loc_0217 loc_type_loc_0218 loc_type_loc_0219 loc_type_loc_0220 loc_type_loc_0221 loc_type_loc_0222 loc_type_loc_0223 loc_type_loc_0224 loc_type_loc_0226 loc_type_loc_0227 loc_type_loc_0228 loc_type_loc_0229 loc_type_loc_0230 loc_type_loc_0231 loc_type_loc_0232 loc_type_loc_0233 loc_type_loc_0234 loc_type_loc_0235 loc_type_loc_0236 loc_type_loc_0237 loc_type_loc_0238 loc_type_loc_0239 loc_type_loc_0240 loc_type_loc_0241 loc_type_loc_0242 loc_type_loc_0243 loc_type_loc_0244 loc_type_loc_0245 loc_type_loc_0247 loc_type_loc_0248 loc_type_loc_0249 loc_type_loc_0250 loc_type_loc_0251 loc_type_loc_0253 loc_type_loc_0254 loc_type_loc_0255 loc_type_loc_0257 loc_type_loc_0258 loc_type_loc_0259 loc_type_loc_0260 loc_type_loc_0261 loc_type_loc_0262 loc_type_loc_0263 loc_type_loc_0264 loc_type_loc_0265 loc_type_loc_0266 loc_type_loc_0267 loc_type_loc_0268 loc_type_loc_0269 loc_type_loc_0270 loc_type_loc_0271 loc_type_loc_0272 loc_type_loc_0273 loc_type_loc_0274 loc_type_loc_0275 loc_type_loc_0276 loc_type_loc_0277 loc_type_loc_0278 loc_type_loc_0279 loc_type_loc_0280 loc_type_loc_0281 loc_type_loc_0282 loc_type_loc_0283 loc_type_loc_0285 loc_type_loc_0286 loc_type_loc_0287 loc_type_loc_0288 loc_type_loc_0289 loc_type_loc_0290 loc_type_loc_0291 loc_type_loc_0292 loc_type_loc_0293 loc_type_loc_0294 loc_type_loc_0295 loc_type_loc_0296 loc_type_loc_0297 loc_type_loc_0298 loc_type_loc_0299
    - location
    road_type_macro_0000 road_type_macro_0001 road_type_macro_0002 road_type_macro_0003 road_type_macro_0004 road_type_macro_0005 road_type_macro_0006 road_type_macro_0007 road_type_macro_0008 road_type_macro_0009 road_type_macro_0010 road_type_macro_0011 road_type_macro_0012 road_type_macro_0013 road_type_macro_0014 road_type_macro_0015 road_type_macro_0016 road_type_macro_0017 road_type_macro_0018 road_type_macro_0019 road_type_macro_0020 road_type_macro_0021 road_type_macro_0022 road_type_macro_0023 road_type_macro_0024 road_type_macro_0025 road_type_macro_0026 road_type_macro_0027 road_type_macro_0028 road_type_macro_0029 road_type_macro_0030 road_type_macro_0031 road_type_macro_0032 road_type_macro_0033 road_type_macro_0034 road_type_macro_0035 road_type_macro_0036 road_type_macro_0037 road_type_macro_0038 road_type_road_0000 road_type_road_0001 road_type_road_0002 road_type_road_0003 road_type_road_0004 road_type_road_0005 road_type_road_0006 road_type_road_0007 road_type_road_0008 road_type_road_0009 road_type_road_0010 road_type_road_0012 road_type_road_0013 road_type_road_0014 road_type_road_0015 road_type_road_0016 road_type_road_0017 road_type_road_0019 road_type_road_0020 road_type_road_0021 road_type_road_0022 road_type_road_0023 road_type_road_0026 road_type_road_0027 road_type_road_0028 road_type_road_0030 road_type_road_0031 road_type_road_0032 road_type_road_0033 road_type_road_0034 road_type_road_0035 road_type_road_0036 road_type_road_0037 road_type_road_0038 road_type_road_0039 road_type_road_0040 road_type_road_0041 road_type_road_0042 road_type_road_0043 road_type_road_0044 road_type_road_0045 road_type_road_0046 road_type_road_0047 road_type_road_0048 road_type_road_0049 road_type_road_0050 road_type_road_0051 road_type_road_0052 road_type_road_0053 road_type_road_0058 road_type_road_0059 road_type_road_0061 road_type_road_0062 road_type_road_0063 road_type_road_0064 road_type_road_0065 road_type_road_0066 road_type_road_0067 road_type_road_0068 road_type_road_0069 road_type_road_0070 road_type_road_0071 road_type_road_0072 road_type_road_0073 road_type_road_0074 road_type_road_0075 road_type_road_0076 road_type_road_0077 road_type_road_0078 road_type_road_0079 road_type_road_0080 road_type_road_0081 road_type_road_0082 road_type_road_0083 road_type_road_0084 road_type_road_0085 road_type_road_0086 road_type_road_0087 road_type_road_0088 road_type_road_0090 road_type_road_0094 road_type_road_0095 road_type_road_0096 road_type_road_0097 road_type_road_0099 road_type_road_0100 road_type_road_0101 road_type_road_0102 road_type_road_0103 road_type_road_0104 road_type_road_0105 road_type_road_0107 road_type_road_0108 road_type_road_0109 road_type_road_0110 road_type_road_0111 road_type_road_0112 road_type_road_0113 road_type_road_0114 road_type_road_0115 road_type_road_0116 road_type_road_0117 road_type_road_0118 road_type_road_0120 road_type_road_0121 road_type_road_0122 road_type_road_0123 road_type_road_0124 road_type_road_0125 road_type_road_0126 road_type_road_0127 road_type_road_0128 road_type_road_0129 road_type_road_0130 road_type_road_0131 road_type_road_0132 road_type_road_0133 road_type_road_0134 road_type_road_0135 road_type_road_0137 road_type_road_0138 road_type_road_0139 road_type_road_0140 road_type_road_0141 road_type_road_0142 road_type_road_0143 road_type_road_0144 road_type_road_0145 road_type_road_0146 road_type_road_0147 road_type_road_0148 road_type_road_0149 road_type_road_0150 road_type_road_0151 road_type_road_0152 road_type_road_0153 road_type_road_0155 road_type_road_0157 road_type_road_0158 road_type_road_0159 road_type_road_0161 road_type_road_0162 road_type_road_0163 road_type_road_0164 road_type_road_0165 road_type_road_0166 road_type_road_0167 road_type_road_0168 road_type_road_0169 road_type_road_0171 road_type_road_0172 road_type_road_0173 road_type_road_0174 road_type_road_0175 road_type_road_0176 road_type_road_0177 road_type_road_0178 road_type_road_0179 road_type_road_0180 road_type_road_0181 road_type_road_0182 road_type_road_0183 road_type_road_0184 road_type_road_0185 road_type_road_0186 road_type_road_0187 road_type_road_0188 road_type_road_0189 road_type_road_0190 road_type_road_0191 road_type_road_0192 road_type_road_0193 road_type_road_0194 road_type_road_0195 road_type_road_0196 road_type_road_0197 road_type_road_0198 road_type_road_0199 road_type_road_0200 road_type_road_0201 road_type_road_0202 road_type_road_0203 road_type_road_0204 road_type_road_0205 road_type_road_0206 road_type_road_0207 road_type_road_0208 road_type_road_0209 road_type_road_0210 road_type_road_0211 road_type_road_0212 road_type_road_0213 road_type_road_0215 road_type_road_0216 road_type_road_0217 road_type_road_0218 road_type_road_0219 road_type_road_0220 road_type_road_0221 road_type_road_0222 road_type_road_0223 road_type_road_0226 road_type_road_0227 road_type_road_0228 road_type_road_0232 road_type_road_0233 road_type_road_0234 road_type_road_0235 road_type_road_0236 road_type_road_0237 road_type_road_0238 road_type_road_0239 road_type_road_0240 road_type_road_0241 road_type_road_0242 road_type_road_0243 road_type_road_0244 road_type_road_0245 road_type_road_0246 road_type_road_0247 road_type_road_0248 road_type_road_0249 road_type_road_0250 road_type_road_0251 road_type_road_0252 road_type_road_0253 road_type_road_0254 road_type_road_0255 road_type_road_0256 road_type_road_0257 road_type_road_0258 road_type_road_0259 road_type_road_0260 road_type_road_0261 road_type_road_0262 road_type_road_0263 road_type_road_0264 road_type_road_0265 road_type_road_0266 road_type_road_0269 road_type_road_0270 road_type_road_0272 road_type_road_0273 road_type_road_0274 road_type_road_0275 road_type_road_0276 road_type_road_0277 road_type_road_0278 road_type_road_0279 road_type_road_0280 road_type_road_0281 road_type_road_0282 road_type_road_0283 road_type_road_0285 road_type_road_0286 road_type_road_0287 road_type_road_0288 road_type_road_0289 road_type_road_0290 road_type_road_0291 road_type_road_0292 road_type_road_0293 road_type_road_0294 road_type_road_0295 road_type_road_0297 road_type_road_0298 road_type_road_0299 road_type_road_0300 road_type_road_0301 road_type_road_0302 road_type_road_0303 road_type_road_0304 road_type_road_0305 road_type_road_0306 road_type_road_0307 road_type_road_0309 road_type_road_0310 road_type_road_0311 road_type_road_0312 road_type_road_0313 road_type_road_0314 road_type_road_0315 road_type_road_0316 road_type_road_0317 road_type_road_0318 road_type_road_0321 road_type_road_0323 road_type_road_0324 road_type_road_0325 road_type_road_0327 road_type_road_0328 road_type_road_0329 road_type_road_0330 road_type_road_0331 road_type_road_0332 road_type_road_0333 road_type_road_0334 road_type_road_0335 road_type_road_0336 road_type_road_0337 road_type_road_0338 road_type_road_0339 road_type_road_0340 road_type_road_0341 road_type_road_0342 road_type_road_0344 road_type_road_0345 road_type_road_0346 road_type_road_0347 road_type_road_0348 road_type_road_0349 road_type_road_0350 road_type_road_0351 road_type_road_0352 road_type_road_0353 road_type_road_0354 road_type_road_0355 road_type_road_0356 road_type_road_0357 road_type_road_0358 road_type_road_0359 road_type_road_0360 road_type_road_0361 road_type_road_0364 road_type_road_0366 road_type_road_0367 road_type_road_0368 road_type_road_0369 road_type_road_0370 road_type_road_0371 road_type_road_0372 road_type_road_0373 road_type_road_0374 road_type_road_0375 road_type_road_0376 road_type_road_0377 road_type_road_0379 road_type_road_0380 road_type_road_0381 road_type_road_0382 road_type_road_0383 road_type_road_0384 road_type_road_0385 road_type_road_0386 road_type_road_0387 road_type_road_0388 road_type_road_0390 road_type_road_0391 road_type_road_0392 road_type_road_0393 road_type_road_0395 road_type_road_0396 road_type_road_0397 road_type_road_0398 road_type_road_0400 road_type_road_0401 road_type_road_0402 road_type_road_0403 road_type_road_0404 road_type_road_0405 road_type_road_0406 road_type_road_0407 road_type_road_0408 road_type_road_0409 road_type_road_0410 road_type_road_0411 road_type_road_0412 road_type_road_0414 road_type_road_0415 road_type_road_0416 road_type_road_0417 road_type_road_0419 road_type_road_0420 road_type_road_0422 road_type_road_0423 road_type_road_0424 road_type_road_0425 road_type_road_0426 road_type_road_0430 road_type_road_0431 road_type_road_0432 road_type_road_0433 road_type_road_0435 road_type_road_0437 road_type_road_0438 road_type_road_0439 road_type_road_0440 road_type_road_0441 road_type_road_0442 road_type_road_0443 road_type_road_0444 road_type_road_0445 road_type_road_0446 road_type_road_0447 road_type_road_0448 road_type_road_0449 road_type_road_0450 road_type_road_0451 road_type_road_0452 road_type_road_0453 road_type_road_0454 road_type_road_0455 road_type_road_0456 road_type_road_0457 road_type_road_0458 road_type_road_0459 road_type_road_0460 road_type_road_0461 road_type_road_0462 road_type_road_0463 road_type_road_0464 road_type_road_0465 road_type_road_0466 road_type_road_0467 road_type_road_0468 road_type_road_0470 road_type_road_0472 road_type_road_0473 road_type_road_0474 road_type_road_0475 road_type_road_0476 road_type_road_0478 road_type_road_0479 road_type_road_0480 road_type_road_0481 road_type_road_0482 road_type_road_0483 road_type_road_0484 road_type_road_0485 road_type_road_0486 road_type_road_0487 road_type_road_0488 road_type_road_0489 road_type_road_0490 road_type_road_0493 road_type_road_0494 road_type_road_0495 road_type_road_0496 road_type_road_0497 road_type_road_0498 road_type_road_0499 road_type_road_0500 road_type_road_0501 road_type_road_0502 road_type_road_0503
    - road
    window_type_tw_00000 window_type_tw_00030 window_type_tw_00060 window_type_tw_00090 window_type_tw_00120 window_type_tw_00150 window_type_tw_00180 window_type_tw_00210 window_type_tw_00240 window_type_tw_00270 window_type_tw_00300 window_type_tw_00330 window_type_tw_00360 window_type_tw_00390 window_type_tw_00420
    - time-window
  )

  (:predicates
    (connects  ?r - road  ?from - location  ?to - location)
    (road-open ?r - road)
    (has-traffic-light ?l - location)
    (static-road  ?r - road)
    (dynamic-road ?r - road)
    (current-window ?w - time-window)
    (next-window ?from - time-window ?to - time-window)
    (road-blocked ?r - road)   ;; set by LLM event generator
    (location-blocked ?l - location)   ;; derived from blocked roads
    (at       ?v - vehicle  ?l - location)
  )

  (:functions
    (travel-duration      ?r - road)  ;; precomputed seconds to traverse
    (travel-time          ?v - vehicle)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
    (sim-time)
    (window-start         ?w - time-window)
    (travel-duration-window ?r - road ?w - time-window)
  )

  (:action traverse-road-static-macro_0000
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?from - loc_type_loc_0008 ?to - loc_type_loc_0114)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?from - loc_type_loc_0012 ?to - loc_type_loc_0161)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0002-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?from - loc_type_loc_0016 ?to - loc_type_loc_0285 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0003
    :parameters (?v - vehicle ?r - road_type_macro_0003 ?from - loc_type_loc_0016 ?to - loc_type_loc_0188)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0004
    :parameters (?v - vehicle ?r - road_type_macro_0004 ?from - loc_type_loc_0021 ?to - loc_type_loc_0022)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0005
    :parameters (?v - vehicle ?r - road_type_macro_0005 ?from - loc_type_loc_0034 ?to - loc_type_loc_0035)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0006
    :parameters (?v - vehicle ?r - road_type_macro_0006 ?from - loc_type_loc_0035 ?to - loc_type_loc_0296)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0007
    :parameters (?v - vehicle ?r - road_type_macro_0007 ?from - loc_type_loc_0035 ?to - loc_type_loc_0156)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0008-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?from - loc_type_loc_0038 ?to - loc_type_loc_0280 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0009
    :parameters (?v - vehicle ?r - road_type_macro_0009 ?from - loc_type_loc_0052 ?to - loc_type_loc_0267)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0010
    :parameters (?v - vehicle ?r - road_type_macro_0010 ?from - loc_type_loc_0053 ?to - loc_type_loc_0071)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0011
    :parameters (?v - vehicle ?r - road_type_macro_0011 ?from - loc_type_loc_0054 ?to - loc_type_loc_0127)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0012
    :parameters (?v - vehicle ?r - road_type_macro_0012 ?from - loc_type_loc_0054 ?to - loc_type_loc_0004)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0013
    :parameters (?v - vehicle ?r - road_type_macro_0013 ?from - loc_type_loc_0057 ?to - loc_type_loc_0064)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0014-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?from - loc_type_loc_0063 ?to - loc_type_loc_0166 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0015
    :parameters (?v - vehicle ?r - road_type_macro_0015 ?from - loc_type_loc_0084 ?to - loc_type_loc_0249)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0016
    :parameters (?v - vehicle ?r - road_type_macro_0016 ?from - loc_type_loc_0095 ?to - loc_type_loc_0166)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0017-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?from - loc_type_loc_0096 ?to - loc_type_loc_0166 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0018
    :parameters (?v - vehicle ?r - road_type_macro_0018 ?from - loc_type_loc_0098 ?to - loc_type_loc_0099)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0019
    :parameters (?v - vehicle ?r - road_type_macro_0019 ?from - loc_type_loc_0102 ?to - loc_type_loc_0293)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0020
    :parameters (?v - vehicle ?r - road_type_macro_0020 ?from - loc_type_loc_0125 ?to - loc_type_loc_0283)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0021
    :parameters (?v - vehicle ?r - road_type_macro_0021 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0022-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?from - loc_type_loc_0131 ?to - loc_type_loc_0130 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0023
    :parameters (?v - vehicle ?r - road_type_macro_0023 ?from - loc_type_loc_0133 ?to - loc_type_loc_0132)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0024
    :parameters (?v - vehicle ?r - road_type_macro_0024 ?from - loc_type_loc_0133 ?to - loc_type_loc_0132)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0025
    :parameters (?v - vehicle ?r - road_type_macro_0025 ?from - loc_type_loc_0154 ?to - loc_type_loc_0157)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0026
    :parameters (?v - vehicle ?r - road_type_macro_0026 ?from - loc_type_loc_0161 ?to - loc_type_loc_0012)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0027
    :parameters (?v - vehicle ?r - road_type_macro_0027 ?from - loc_type_loc_0176 ?to - loc_type_loc_0103)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0028
    :parameters (?v - vehicle ?r - road_type_macro_0028 ?from - loc_type_loc_0184 ?to - loc_type_loc_0068)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0029
    :parameters (?v - vehicle ?r - road_type_macro_0029 ?from - loc_type_loc_0187 ?to - loc_type_loc_0127)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0030
    :parameters (?v - vehicle ?r - road_type_macro_0030 ?from - loc_type_loc_0218 ?to - loc_type_loc_0153)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0031
    :parameters (?v - vehicle ?r - road_type_macro_0031 ?from - loc_type_loc_0229 ?to - loc_type_loc_0099)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0032
    :parameters (?v - vehicle ?r - road_type_macro_0032 ?from - loc_type_loc_0233 ?to - loc_type_loc_0141)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0033
    :parameters (?v - vehicle ?r - road_type_macro_0033 ?from - loc_type_loc_0241 ?to - loc_type_loc_0114)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0034-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?from - loc_type_loc_0244 ?to - loc_type_loc_0245 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-macro_0035
    :parameters (?v - vehicle ?r - road_type_macro_0035 ?from - loc_type_loc_0255 ?to - loc_type_loc_0164)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0036
    :parameters (?v - vehicle ?r - road_type_macro_0036 ?from - loc_type_loc_0280 ?to - loc_type_loc_0038)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0037
    :parameters (?v - vehicle ?r - road_type_macro_0037 ?from - loc_type_loc_0293 ?to - loc_type_loc_0102)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00000
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00030
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00060
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00090
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00120
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00150
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00180
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00210
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00240
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00270
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00300
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00330
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00360
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00390
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-macro_0038-tw_00420
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?from - loc_type_loc_0293 ?to - loc_type_loc_0201 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0000
    :parameters (?v - vehicle ?r - road_type_road_0000 ?from - loc_type_loc_0000 ?to - loc_type_loc_0215)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0001
    :parameters (?v - vehicle ?r - road_type_road_0001 ?from - loc_type_loc_0000 ?to - loc_type_loc_0050)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002
    :parameters (?v - vehicle ?r - road_type_road_0002 ?from - loc_type_loc_0000 ?to - loc_type_loc_0029)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0003 ?from - loc_type_loc_0001 ?to - loc_type_loc_0120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0004 ?from - loc_type_loc_0001 ?to - loc_type_loc_0056)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0005
    :parameters (?v - vehicle ?r - road_type_road_0005 ?from - loc_type_loc_0002 ?to - loc_type_loc_0188)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0006
    :parameters (?v - vehicle ?r - road_type_road_0006 ?from - loc_type_loc_0004 ?to - loc_type_loc_0216)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0007
    :parameters (?v - vehicle ?r - road_type_road_0007 ?from - loc_type_loc_0004 ?to - loc_type_loc_0046)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0008
    :parameters (?v - vehicle ?r - road_type_road_0008 ?from - loc_type_loc_0005 ?to - loc_type_loc_0085)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0009
    :parameters (?v - vehicle ?r - road_type_road_0009 ?from - loc_type_loc_0006 ?to - loc_type_loc_0127)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010
    :parameters (?v - vehicle ?r - road_type_road_0010 ?from - loc_type_loc_0007 ?to - loc_type_loc_0114)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0012
    :parameters (?v - vehicle ?r - road_type_road_0012 ?from - loc_type_loc_0009 ?to - loc_type_loc_0157)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0013
    :parameters (?v - vehicle ?r - road_type_road_0013 ?from - loc_type_loc_0010 ?to - loc_type_loc_0008)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0014-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0010 ?to - loc_type_loc_0115 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0015-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0011 ?to - loc_type_loc_0241 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0016
    :parameters (?v - vehicle ?r - road_type_road_0016 ?from - loc_type_loc_0012 ?to - loc_type_loc_0163)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0017 ?from - loc_type_loc_0012 ?to - loc_type_loc_0094)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0019 ?from - loc_type_loc_0013 ?to - loc_type_loc_0135)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0020 ?from - loc_type_loc_0013 ?to - loc_type_loc_0017)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0021
    :parameters (?v - vehicle ?r - road_type_road_0021 ?from - loc_type_loc_0013 ?to - loc_type_loc_0237)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0022
    :parameters (?v - vehicle ?r - road_type_road_0022 ?from - loc_type_loc_0014 ?to - loc_type_loc_0088)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0023
    :parameters (?v - vehicle ?r - road_type_road_0023 ?from - loc_type_loc_0014 ?to - loc_type_loc_0015)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0026 ?from - loc_type_loc_0017 ?to - loc_type_loc_0013)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0027
    :parameters (?v - vehicle ?r - road_type_road_0027 ?from - loc_type_loc_0019 ?to - loc_type_loc_0221)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0028
    :parameters (?v - vehicle ?r - road_type_road_0028 ?from - loc_type_loc_0020 ?to - loc_type_loc_0222)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0030
    :parameters (?v - vehicle ?r - road_type_road_0030 ?from - loc_type_loc_0021 ?to - loc_type_loc_0022)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0031
    :parameters (?v - vehicle ?r - road_type_road_0031 ?from - loc_type_loc_0022 ?to - loc_type_loc_0224)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0032
    :parameters (?v - vehicle ?r - road_type_road_0032 ?from - loc_type_loc_0023 ?to - loc_type_loc_0254)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0033
    :parameters (?v - vehicle ?r - road_type_road_0033 ?from - loc_type_loc_0024 ?to - loc_type_loc_0017)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034
    :parameters (?v - vehicle ?r - road_type_road_0034 ?from - loc_type_loc_0024 ?to - loc_type_loc_0097)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0035 ?from - loc_type_loc_0024 ?to - loc_type_loc_0060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0036 ?from - loc_type_loc_0025 ?to - loc_type_loc_0147)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0037 ?from - loc_type_loc_0025 ?to - loc_type_loc_0026)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0038-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0026 ?to - loc_type_loc_0090 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0039 ?from - loc_type_loc_0026 ?to - loc_type_loc_0025)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0040
    :parameters (?v - vehicle ?r - road_type_road_0040 ?from - loc_type_loc_0026 ?to - loc_type_loc_0273)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0041
    :parameters (?v - vehicle ?r - road_type_road_0041 ?from - loc_type_loc_0027 ?to - loc_type_loc_0219)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0042-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0027 ?to - loc_type_loc_0286 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0043
    :parameters (?v - vehicle ?r - road_type_road_0043 ?from - loc_type_loc_0028 ?to - loc_type_loc_0164)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0044 ?from - loc_type_loc_0029 ?to - loc_type_loc_0107)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0045 ?from - loc_type_loc_0029 ?to - loc_type_loc_0000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0046 ?from - loc_type_loc_0030 ?to - loc_type_loc_0010)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0047 ?from - loc_type_loc_0030 ?to - loc_type_loc_0146)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0048
    :parameters (?v - vehicle ?r - road_type_road_0048 ?from - loc_type_loc_0031 ?to - loc_type_loc_0154)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0049 ?from - loc_type_loc_0031 ?to - loc_type_loc_0032)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0050
    :parameters (?v - vehicle ?r - road_type_road_0050 ?from - loc_type_loc_0032 ?to - loc_type_loc_0218)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0051-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0032 ?to - loc_type_loc_0030 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0052
    :parameters (?v - vehicle ?r - road_type_road_0052 ?from - loc_type_loc_0033 ?to - loc_type_loc_0039)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0053
    :parameters (?v - vehicle ?r - road_type_road_0053 ?from - loc_type_loc_0034 ?to - loc_type_loc_0033)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0058
    :parameters (?v - vehicle ?r - road_type_road_0058 ?from - loc_type_loc_0037 ?to - loc_type_loc_0223)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0059
    :parameters (?v - vehicle ?r - road_type_road_0059 ?from - loc_type_loc_0038 ?to - loc_type_loc_0220)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0061 ?from - loc_type_loc_0038 ?to - loc_type_loc_0037)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0062-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0039 ?to - loc_type_loc_0044 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0063
    :parameters (?v - vehicle ?r - road_type_road_0063 ?from - loc_type_loc_0039 ?to - loc_type_loc_0222)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0064-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0040 ?to - loc_type_loc_0038 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0065
    :parameters (?v - vehicle ?r - road_type_road_0065 ?from - loc_type_loc_0041 ?to - loc_type_loc_0211)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0066 ?from - loc_type_loc_0042 ?to - loc_type_loc_0043)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0067 ?from - loc_type_loc_0042 ?to - loc_type_loc_0178)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0068 ?from - loc_type_loc_0042 ?to - loc_type_loc_0266)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0069 ?from - loc_type_loc_0042 ?to - loc_type_loc_0077)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0070-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0043 ?to - loc_type_loc_0177 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0071 ?from - loc_type_loc_0043 ?to - loc_type_loc_0078)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0072 ?from - loc_type_loc_0043 ?to - loc_type_loc_0045)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0073 ?from - loc_type_loc_0043 ?to - loc_type_loc_0042)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0074-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0044 ?to - loc_type_loc_0040 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0075 ?from - loc_type_loc_0045 ?to - loc_type_loc_0034)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0076 ?from - loc_type_loc_0045 ?to - loc_type_loc_0044)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0077-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0045 ?to - loc_type_loc_0043 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0078
    :parameters (?v - vehicle ?r - road_type_road_0078 ?from - loc_type_loc_0046 ?to - loc_type_loc_0053)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0079
    :parameters (?v - vehicle ?r - road_type_road_0079 ?from - loc_type_loc_0046 ?to - loc_type_loc_0005)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0080 ?from - loc_type_loc_0047 ?to - loc_type_loc_0049)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0081
    :parameters (?v - vehicle ?r - road_type_road_0081 ?from - loc_type_loc_0048 ?to - loc_type_loc_0004)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0082
    :parameters (?v - vehicle ?r - road_type_road_0082 ?from - loc_type_loc_0049 ?to - loc_type_loc_0087)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0083 ?from - loc_type_loc_0049 ?to - loc_type_loc_0216)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0084 ?from - loc_type_loc_0050 ?to - loc_type_loc_0029)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0085 ?from - loc_type_loc_0050 ?to - loc_type_loc_0119)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0086-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0051 ?to - loc_type_loc_0059 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0087
    :parameters (?v - vehicle ?r - road_type_road_0087 ?from - loc_type_loc_0051 ?to - loc_type_loc_0052)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0088 ?from - loc_type_loc_0052 ?to - loc_type_loc_0051)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0090
    :parameters (?v - vehicle ?r - road_type_road_0090 ?from - loc_type_loc_0053 ?to - loc_type_loc_0047)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0094
    :parameters (?v - vehicle ?r - road_type_road_0094 ?from - loc_type_loc_0055 ?to - loc_type_loc_0116)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0095 ?from - loc_type_loc_0055 ?to - loc_type_loc_0011)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0096 ?from - loc_type_loc_0056 ?to - loc_type_loc_0064)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0097
    :parameters (?v - vehicle ?r - road_type_road_0097 ?from - loc_type_loc_0057 ?to - loc_type_loc_0023)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0099
    :parameters (?v - vehicle ?r - road_type_road_0099 ?from - loc_type_loc_0058 ?to - loc_type_loc_0051)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0100-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0059 ?to - loc_type_loc_0060 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0101
    :parameters (?v - vehicle ?r - road_type_road_0101 ?from - loc_type_loc_0059 ?to - loc_type_loc_0061)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0102 ?from - loc_type_loc_0060 ?to - loc_type_loc_0024)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0103 ?from - loc_type_loc_0060 ?to - loc_type_loc_0147)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0104
    :parameters (?v - vehicle ?r - road_type_road_0104 ?from - loc_type_loc_0061 ?to - loc_type_loc_0025)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0105
    :parameters (?v - vehicle ?r - road_type_road_0105 ?from - loc_type_loc_0062 ?to - loc_type_loc_0051)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0107
    :parameters (?v - vehicle ?r - road_type_road_0107 ?from - loc_type_loc_0064 ?to - loc_type_loc_0065)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0108 ?from - loc_type_loc_0065 ?to - loc_type_loc_0164)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0109-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0065 ?to - loc_type_loc_0066 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0110
    :parameters (?v - vehicle ?r - road_type_road_0110 ?from - loc_type_loc_0066 ?to - loc_type_loc_0270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0111-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0066 ?to - loc_type_loc_0056 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0112
    :parameters (?v - vehicle ?r - road_type_road_0112 ?from - loc_type_loc_0067 ?to - loc_type_loc_0068)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0113
    :parameters (?v - vehicle ?r - road_type_road_0113 ?from - loc_type_loc_0068 ?to - loc_type_loc_0069)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0114
    :parameters (?v - vehicle ?r - road_type_road_0114 ?from - loc_type_loc_0068 ?to - loc_type_loc_0183)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0115
    :parameters (?v - vehicle ?r - road_type_road_0115 ?from - loc_type_loc_0069 ?to - loc_type_loc_0068)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0116
    :parameters (?v - vehicle ?r - road_type_road_0116 ?from - loc_type_loc_0069 ?to - loc_type_loc_0185)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0117-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0070 ?to - loc_type_loc_0016 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0118
    :parameters (?v - vehicle ?r - road_type_road_0118 ?from - loc_type_loc_0071 ?to - loc_type_loc_0047)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0120
    :parameters (?v - vehicle ?r - road_type_road_0120 ?from - loc_type_loc_0073 ?to - loc_type_loc_0249)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0121
    :parameters (?v - vehicle ?r - road_type_road_0121 ?from - loc_type_loc_0074 ?to - loc_type_loc_0180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0122
    :parameters (?v - vehicle ?r - road_type_road_0122 ?from - loc_type_loc_0075 ?to - loc_type_loc_0228)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123
    :parameters (?v - vehicle ?r - road_type_road_0123 ?from - loc_type_loc_0076 ?to - loc_type_loc_0141)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0124 ?from - loc_type_loc_0077 ?to - loc_type_loc_0247)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0125 ?from - loc_type_loc_0078 ?to - loc_type_loc_0160)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0126 ?from - loc_type_loc_0079 ?to - loc_type_loc_0161)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0127 ?from - loc_type_loc_0079 ?to - loc_type_loc_0080)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0128-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0079 ?to - loc_type_loc_0296 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0129 ?from - loc_type_loc_0080 ?to - loc_type_loc_0079)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0130-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0081 ?to - loc_type_loc_0161 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0131 ?from - loc_type_loc_0081 ?to - loc_type_loc_0108)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0132-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0081 ?to - loc_type_loc_0126 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0133 ?from - loc_type_loc_0082 ?to - loc_type_loc_0272)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0134
    :parameters (?v - vehicle ?r - road_type_road_0134 ?from - loc_type_loc_0083 ?to - loc_type_loc_0254)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0135
    :parameters (?v - vehicle ?r - road_type_road_0135 ?from - loc_type_loc_0083 ?to - loc_type_loc_0082)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0137
    :parameters (?v - vehicle ?r - road_type_road_0137 ?from - loc_type_loc_0085 ?to - loc_type_loc_0084)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0138-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0086 ?to - loc_type_loc_0143 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0139
    :parameters (?v - vehicle ?r - road_type_road_0139 ?from - loc_type_loc_0086 ?to - loc_type_loc_0122)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0140 ?from - loc_type_loc_0087 ?to - loc_type_loc_0070)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0141
    :parameters (?v - vehicle ?r - road_type_road_0141 ?from - loc_type_loc_0088 ?to - loc_type_loc_0182)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0142
    :parameters (?v - vehicle ?r - road_type_road_0142 ?from - loc_type_loc_0088 ?to - loc_type_loc_0278)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0143
    :parameters (?v - vehicle ?r - road_type_road_0143 ?from - loc_type_loc_0089 ?to - loc_type_loc_0027)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0144
    :parameters (?v - vehicle ?r - road_type_road_0144 ?from - loc_type_loc_0089 ?to - loc_type_loc_0090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0145-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0090 ?to - loc_type_loc_0025 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0146
    :parameters (?v - vehicle ?r - road_type_road_0146 ?from - loc_type_loc_0091 ?to - loc_type_loc_0089)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0147-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0091 ?to - loc_type_loc_0257 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0148 ?from - loc_type_loc_0092 ?to - loc_type_loc_0062)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0149 ?from - loc_type_loc_0093 ?to - loc_type_loc_0282)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0150 ?from - loc_type_loc_0093 ?to - loc_type_loc_0092)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0151
    :parameters (?v - vehicle ?r - road_type_road_0151 ?from - loc_type_loc_0094 ?to - loc_type_loc_0012)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0152
    :parameters (?v - vehicle ?r - road_type_road_0152 ?from - loc_type_loc_0094 ?to - loc_type_loc_0267)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0153
    :parameters (?v - vehicle ?r - road_type_road_0153 ?from - loc_type_loc_0094 ?to - loc_type_loc_0093)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0155
    :parameters (?v - vehicle ?r - road_type_road_0155 ?from - loc_type_loc_0096 ?to - loc_type_loc_0168)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0157 ?from - loc_type_loc_0097 ?to - loc_type_loc_0096)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0158 ?from - loc_type_loc_0097 ?to - loc_type_loc_0166)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0159 ?from - loc_type_loc_0097 ?to - loc_type_loc_0024)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0161
    :parameters (?v - vehicle ?r - road_type_road_0161 ?from - loc_type_loc_0099 ?to - loc_type_loc_0226)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0162
    :parameters (?v - vehicle ?r - road_type_road_0162 ?from - loc_type_loc_0099 ?to - loc_type_loc_0227)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0163-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0100 ?to - loc_type_loc_0292 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0164-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0100 ?to - loc_type_loc_0101 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0165
    :parameters (?v - vehicle ?r - road_type_road_0165 ?from - loc_type_loc_0101 ?to - loc_type_loc_0100)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0166-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0101 ?to - loc_type_loc_0204 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0167
    :parameters (?v - vehicle ?r - road_type_road_0167 ?from - loc_type_loc_0101 ?to - loc_type_loc_0201)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0168
    :parameters (?v - vehicle ?r - road_type_road_0168 ?from - loc_type_loc_0102 ?to - loc_type_loc_0193)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0169
    :parameters (?v - vehicle ?r - road_type_road_0169 ?from - loc_type_loc_0102 ?to - loc_type_loc_0212)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0171
    :parameters (?v - vehicle ?r - road_type_road_0171 ?from - loc_type_loc_0103 ?to - loc_type_loc_0243)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0172
    :parameters (?v - vehicle ?r - road_type_road_0172 ?from - loc_type_loc_0103 ?to - loc_type_loc_0195)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0173
    :parameters (?v - vehicle ?r - road_type_road_0173 ?from - loc_type_loc_0104 ?to - loc_type_loc_0103)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0174
    :parameters (?v - vehicle ?r - road_type_road_0174 ?from - loc_type_loc_0104 ?to - loc_type_loc_0176)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0175
    :parameters (?v - vehicle ?r - road_type_road_0175 ?from - loc_type_loc_0105 ?to - loc_type_loc_0140)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0176
    :parameters (?v - vehicle ?r - road_type_road_0176 ?from - loc_type_loc_0105 ?to - loc_type_loc_0106)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0177
    :parameters (?v - vehicle ?r - road_type_road_0177 ?from - loc_type_loc_0105 ?to - loc_type_loc_0014)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0178
    :parameters (?v - vehicle ?r - road_type_road_0178 ?from - loc_type_loc_0106 ?to - loc_type_loc_0136)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0179
    :parameters (?v - vehicle ?r - road_type_road_0179 ?from - loc_type_loc_0106 ?to - loc_type_loc_0105)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0180
    :parameters (?v - vehicle ?r - road_type_road_0180 ?from - loc_type_loc_0106 ?to - loc_type_loc_0137)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0181
    :parameters (?v - vehicle ?r - road_type_road_0181 ?from - loc_type_loc_0107 ?to - loc_type_loc_0110)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0182
    :parameters (?v - vehicle ?r - road_type_road_0182 ?from - loc_type_loc_0107 ?to - loc_type_loc_0029)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0183
    :parameters (?v - vehicle ?r - road_type_road_0183 ?from - loc_type_loc_0107 ?to - loc_type_loc_0109)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0184
    :parameters (?v - vehicle ?r - road_type_road_0184 ?from - loc_type_loc_0108 ?to - loc_type_loc_0238)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0185
    :parameters (?v - vehicle ?r - road_type_road_0185 ?from - loc_type_loc_0108 ?to - loc_type_loc_0081)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0186
    :parameters (?v - vehicle ?r - road_type_road_0186 ?from - loc_type_loc_0109 ?to - loc_type_loc_0161)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0187
    :parameters (?v - vehicle ?r - road_type_road_0187 ?from - loc_type_loc_0109 ?to - loc_type_loc_0107)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0188
    :parameters (?v - vehicle ?r - road_type_road_0188 ?from - loc_type_loc_0110 ?to - loc_type_loc_0217)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0189
    :parameters (?v - vehicle ?r - road_type_road_0189 ?from - loc_type_loc_0111 ?to - loc_type_loc_0174)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0190
    :parameters (?v - vehicle ?r - road_type_road_0190 ?from - loc_type_loc_0111 ?to - loc_type_loc_0110)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0191
    :parameters (?v - vehicle ?r - road_type_road_0191 ?from - loc_type_loc_0112 ?to - loc_type_loc_0283)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0192
    :parameters (?v - vehicle ?r - road_type_road_0192 ?from - loc_type_loc_0113 ?to - loc_type_loc_0115)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0193
    :parameters (?v - vehicle ?r - road_type_road_0193 ?from - loc_type_loc_0113 ?to - loc_type_loc_0114)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0194
    :parameters (?v - vehicle ?r - road_type_road_0194 ?from - loc_type_loc_0113 ?to - loc_type_loc_0234)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0195-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0114 ?to - loc_type_loc_0008 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0196
    :parameters (?v - vehicle ?r - road_type_road_0196 ?from - loc_type_loc_0114 ?to - loc_type_loc_0113)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0197-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0115 ?to - loc_type_loc_0011 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0198
    :parameters (?v - vehicle ?r - road_type_road_0198 ?from - loc_type_loc_0116 ?to - loc_type_loc_0215)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0199
    :parameters (?v - vehicle ?r - road_type_road_0199 ?from - loc_type_loc_0116 ?to - loc_type_loc_0268)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0200
    :parameters (?v - vehicle ?r - road_type_road_0200 ?from - loc_type_loc_0116 ?to - loc_type_loc_0055)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0201
    :parameters (?v - vehicle ?r - road_type_road_0201 ?from - loc_type_loc_0117 ?to - loc_type_loc_0291)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0202
    :parameters (?v - vehicle ?r - road_type_road_0202 ?from - loc_type_loc_0117 ?to - loc_type_loc_0290)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0203
    :parameters (?v - vehicle ?r - road_type_road_0203 ?from - loc_type_loc_0118 ?to - loc_type_loc_0210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0204
    :parameters (?v - vehicle ?r - road_type_road_0204 ?from - loc_type_loc_0119 ?to - loc_type_loc_0001)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0205
    :parameters (?v - vehicle ?r - road_type_road_0205 ?from - loc_type_loc_0119 ?to - loc_type_loc_0269)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0206-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0120 ?to - loc_type_loc_0086 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0207-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0121 ?to - loc_type_loc_0120 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0208
    :parameters (?v - vehicle ?r - road_type_road_0208 ?from - loc_type_loc_0121 ?to - loc_type_loc_0123)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0209
    :parameters (?v - vehicle ?r - road_type_road_0209 ?from - loc_type_loc_0122 ?to - loc_type_loc_0121)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0210
    :parameters (?v - vehicle ?r - road_type_road_0210 ?from - loc_type_loc_0122 ?to - loc_type_loc_0087)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0211
    :parameters (?v - vehicle ?r - road_type_road_0211 ?from - loc_type_loc_0123 ?to - loc_type_loc_0001)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0212
    :parameters (?v - vehicle ?r - road_type_road_0212 ?from - loc_type_loc_0123 ?to - loc_type_loc_0121)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0213
    :parameters (?v - vehicle ?r - road_type_road_0213 ?from - loc_type_loc_0124 ?to - loc_type_loc_0149)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0215
    :parameters (?v - vehicle ?r - road_type_road_0215 ?from - loc_type_loc_0125 ?to - loc_type_loc_0171)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0216
    :parameters (?v - vehicle ?r - road_type_road_0216 ?from - loc_type_loc_0126 ?to - loc_type_loc_0124)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0217
    :parameters (?v - vehicle ?r - road_type_road_0217 ?from - loc_type_loc_0126 ?to - loc_type_loc_0058)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0218
    :parameters (?v - vehicle ?r - road_type_road_0218 ?from - loc_type_loc_0127 ?to - loc_type_loc_0055)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0219
    :parameters (?v - vehicle ?r - road_type_road_0219 ?from - loc_type_loc_0128 ?to - loc_type_loc_0288)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0220
    :parameters (?v - vehicle ?r - road_type_road_0220 ?from - loc_type_loc_0129 ?to - loc_type_loc_0130)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0221
    :parameters (?v - vehicle ?r - road_type_road_0221 ?from - loc_type_loc_0130 ?to - loc_type_loc_0134)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0222
    :parameters (?v - vehicle ?r - road_type_road_0222 ?from - loc_type_loc_0130 ?to - loc_type_loc_0129)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0223
    :parameters (?v - vehicle ?r - road_type_road_0223 ?from - loc_type_loc_0130 ?to - loc_type_loc_0133)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0226
    :parameters (?v - vehicle ?r - road_type_road_0226 ?from - loc_type_loc_0131 ?to - loc_type_loc_0132)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0227
    :parameters (?v - vehicle ?r - road_type_road_0227 ?from - loc_type_loc_0132 ?to - loc_type_loc_0131)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0228
    :parameters (?v - vehicle ?r - road_type_road_0228 ?from - loc_type_loc_0132 ?to - loc_type_loc_0236)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0232
    :parameters (?v - vehicle ?r - road_type_road_0232 ?from - loc_type_loc_0134 ?to - loc_type_loc_0135)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0233
    :parameters (?v - vehicle ?r - road_type_road_0233 ?from - loc_type_loc_0134 ?to - loc_type_loc_0214)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0234
    :parameters (?v - vehicle ?r - road_type_road_0234 ?from - loc_type_loc_0134 ?to - loc_type_loc_0130)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0235
    :parameters (?v - vehicle ?r - road_type_road_0235 ?from - loc_type_loc_0135 ?to - loc_type_loc_0013)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0236
    :parameters (?v - vehicle ?r - road_type_road_0236 ?from - loc_type_loc_0135 ?to - loc_type_loc_0134)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0237
    :parameters (?v - vehicle ?r - road_type_road_0237 ?from - loc_type_loc_0135 ?to - loc_type_loc_0213)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0238
    :parameters (?v - vehicle ?r - road_type_road_0238 ?from - loc_type_loc_0136 ?to - loc_type_loc_0261)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0239
    :parameters (?v - vehicle ?r - road_type_road_0239 ?from - loc_type_loc_0136 ?to - loc_type_loc_0138)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0240
    :parameters (?v - vehicle ?r - road_type_road_0240 ?from - loc_type_loc_0136 ?to - loc_type_loc_0106)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0241
    :parameters (?v - vehicle ?r - road_type_road_0241 ?from - loc_type_loc_0136 ?to - loc_type_loc_0181)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0242
    :parameters (?v - vehicle ?r - road_type_road_0242 ?from - loc_type_loc_0137 ?to - loc_type_loc_0139)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0243
    :parameters (?v - vehicle ?r - road_type_road_0243 ?from - loc_type_loc_0138 ?to - loc_type_loc_0137)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0244
    :parameters (?v - vehicle ?r - road_type_road_0244 ?from - loc_type_loc_0139 ?to - loc_type_loc_0138)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0245
    :parameters (?v - vehicle ?r - road_type_road_0245 ?from - loc_type_loc_0139 ?to - loc_type_loc_0297)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0246
    :parameters (?v - vehicle ?r - road_type_road_0246 ?from - loc_type_loc_0139 ?to - loc_type_loc_0277)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0247
    :parameters (?v - vehicle ?r - road_type_road_0247 ?from - loc_type_loc_0140 ?to - loc_type_loc_0274)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0248
    :parameters (?v - vehicle ?r - road_type_road_0248 ?from - loc_type_loc_0140 ?to - loc_type_loc_0105)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0249
    :parameters (?v - vehicle ?r - road_type_road_0249 ?from - loc_type_loc_0140 ?to - loc_type_loc_0288)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0250
    :parameters (?v - vehicle ?r - road_type_road_0250 ?from - loc_type_loc_0141 ?to - loc_type_loc_0076)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0251
    :parameters (?v - vehicle ?r - road_type_road_0251 ?from - loc_type_loc_0141 ?to - loc_type_loc_0192)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0252
    :parameters (?v - vehicle ?r - road_type_road_0252 ?from - loc_type_loc_0142 ?to - loc_type_loc_0184)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0253
    :parameters (?v - vehicle ?r - road_type_road_0253 ?from - loc_type_loc_0142 ?to - loc_type_loc_0164)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0254
    :parameters (?v - vehicle ?r - road_type_road_0254 ?from - loc_type_loc_0143 ?to - loc_type_loc_0144)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0255
    :parameters (?v - vehicle ?r - road_type_road_0255 ?from - loc_type_loc_0144 ?to - loc_type_loc_0070)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0256
    :parameters (?v - vehicle ?r - road_type_road_0256 ?from - loc_type_loc_0145 ?to - loc_type_loc_0153)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0257
    :parameters (?v - vehicle ?r - road_type_road_0257 ?from - loc_type_loc_0146 ?to - loc_type_loc_0218)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0258
    :parameters (?v - vehicle ?r - road_type_road_0258 ?from - loc_type_loc_0146 ?to - loc_type_loc_0152)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0259
    :parameters (?v - vehicle ?r - road_type_road_0259 ?from - loc_type_loc_0146 ?to - loc_type_loc_0030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0260-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0260 ?from - loc_type_loc_0147 ?to - loc_type_loc_0148 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0261
    :parameters (?v - vehicle ?r - road_type_road_0261 ?from - loc_type_loc_0147 ?to - loc_type_loc_0060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0262
    :parameters (?v - vehicle ?r - road_type_road_0262 ?from - loc_type_loc_0147 ?to - loc_type_loc_0025)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0263-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0263 ?from - loc_type_loc_0148 ?to - loc_type_loc_0169 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0264
    :parameters (?v - vehicle ?r - road_type_road_0264 ?from - loc_type_loc_0148 ?to - loc_type_loc_0061)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0265
    :parameters (?v - vehicle ?r - road_type_road_0265 ?from - loc_type_loc_0149 ?to - loc_type_loc_0172)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0266
    :parameters (?v - vehicle ?r - road_type_road_0266 ?from - loc_type_loc_0149 ?to - loc_type_loc_0165)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0269
    :parameters (?v - vehicle ?r - road_type_road_0269 ?from - loc_type_loc_0152 ?to - loc_type_loc_0146)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0270
    :parameters (?v - vehicle ?r - road_type_road_0270 ?from - loc_type_loc_0153 ?to - loc_type_loc_0031)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0272
    :parameters (?v - vehicle ?r - road_type_road_0272 ?from - loc_type_loc_0154 ?to - loc_type_loc_0155)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0273
    :parameters (?v - vehicle ?r - road_type_road_0273 ?from - loc_type_loc_0155 ?to - loc_type_loc_0162)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0274
    :parameters (?v - vehicle ?r - road_type_road_0274 ?from - loc_type_loc_0155 ?to - loc_type_loc_0157)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0275
    :parameters (?v - vehicle ?r - road_type_road_0275 ?from - loc_type_loc_0155 ?to - loc_type_loc_0156)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0276
    :parameters (?v - vehicle ?r - road_type_road_0276 ?from - loc_type_loc_0156 ?to - loc_type_loc_0153)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0277-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0277 ?from - loc_type_loc_0157 ?to - loc_type_loc_0295 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0278
    :parameters (?v - vehicle ?r - road_type_road_0278 ?from - loc_type_loc_0158 ?to - loc_type_loc_0263)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0279
    :parameters (?v - vehicle ?r - road_type_road_0279 ?from - loc_type_loc_0158 ?to - loc_type_loc_0163)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0280
    :parameters (?v - vehicle ?r - road_type_road_0280 ?from - loc_type_loc_0159 ?to - loc_type_loc_0117)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0281-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0281 ?from - loc_type_loc_0160 ?to - loc_type_loc_0158 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0282
    :parameters (?v - vehicle ?r - road_type_road_0282 ?from - loc_type_loc_0160 ?to - loc_type_loc_0159)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0283-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0283 ?from - loc_type_loc_0161 ?to - loc_type_loc_0079 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0285
    :parameters (?v - vehicle ?r - road_type_road_0285 ?from - loc_type_loc_0161 ?to - loc_type_loc_0109)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0286
    :parameters (?v - vehicle ?r - road_type_road_0286 ?from - loc_type_loc_0162 ?to - loc_type_loc_0155)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0287
    :parameters (?v - vehicle ?r - road_type_road_0287 ?from - loc_type_loc_0163 ?to - loc_type_loc_0012)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0288
    :parameters (?v - vehicle ?r - road_type_road_0288 ?from - loc_type_loc_0163 ?to - loc_type_loc_0158)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0289
    :parameters (?v - vehicle ?r - road_type_road_0289 ?from - loc_type_loc_0163 ?to - loc_type_loc_0118)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0290
    :parameters (?v - vehicle ?r - road_type_road_0290 ?from - loc_type_loc_0164 ?to - loc_type_loc_0142)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0291
    :parameters (?v - vehicle ?r - road_type_road_0291 ?from - loc_type_loc_0164 ?to - loc_type_loc_0065)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0292
    :parameters (?v - vehicle ?r - road_type_road_0292 ?from - loc_type_loc_0165 ?to - loc_type_loc_0125)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0293
    :parameters (?v - vehicle ?r - road_type_road_0293 ?from - loc_type_loc_0165 ?to - loc_type_loc_0170)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0294
    :parameters (?v - vehicle ?r - road_type_road_0294 ?from - loc_type_loc_0166 ?to - loc_type_loc_0097)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0295
    :parameters (?v - vehicle ?r - road_type_road_0295 ?from - loc_type_loc_0167 ?to - loc_type_loc_0063)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0297
    :parameters (?v - vehicle ?r - road_type_road_0297 ?from - loc_type_loc_0168 ?to - loc_type_loc_0096)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0298
    :parameters (?v - vehicle ?r - road_type_road_0298 ?from - loc_type_loc_0169 ?to - loc_type_loc_0148)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0299
    :parameters (?v - vehicle ?r - road_type_road_0299 ?from - loc_type_loc_0170 ?to - loc_type_loc_0124)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0300
    :parameters (?v - vehicle ?r - road_type_road_0300 ?from - loc_type_loc_0171 ?to - loc_type_loc_0125)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0301
    :parameters (?v - vehicle ?r - road_type_road_0301 ?from - loc_type_loc_0172 ?to - loc_type_loc_0108)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0302
    :parameters (?v - vehicle ?r - road_type_road_0302 ?from - loc_type_loc_0173 ?to - loc_type_loc_0283)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0303
    :parameters (?v - vehicle ?r - road_type_road_0303 ?from - loc_type_loc_0173 ?to - loc_type_loc_0217)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0304
    :parameters (?v - vehicle ?r - road_type_road_0304 ?from - loc_type_loc_0174 ?to - loc_type_loc_0109)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0305
    :parameters (?v - vehicle ?r - road_type_road_0305 ?from - loc_type_loc_0174 ?to - loc_type_loc_0294)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0306
    :parameters (?v - vehicle ?r - road_type_road_0306 ?from - loc_type_loc_0175 ?to - loc_type_loc_0294)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0307
    :parameters (?v - vehicle ?r - road_type_road_0307 ?from - loc_type_loc_0176 ?to - loc_type_loc_0018)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0309
    :parameters (?v - vehicle ?r - road_type_road_0309 ?from - loc_type_loc_0177 ?to - loc_type_loc_0289)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0310-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0310 ?from - loc_type_loc_0177 ?to - loc_type_loc_0040 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0311
    :parameters (?v - vehicle ?r - road_type_road_0311 ?from - loc_type_loc_0178 ?to - loc_type_loc_0289)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0312
    :parameters (?v - vehicle ?r - road_type_road_0312 ?from - loc_type_loc_0178 ?to - loc_type_loc_0042)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0313
    :parameters (?v - vehicle ?r - road_type_road_0313 ?from - loc_type_loc_0179 ?to - loc_type_loc_0077)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0314
    :parameters (?v - vehicle ?r - road_type_road_0314 ?from - loc_type_loc_0179 ?to - loc_type_loc_0042)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0315
    :parameters (?v - vehicle ?r - road_type_road_0315 ?from - loc_type_loc_0180 ?to - loc_type_loc_0202)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0316
    :parameters (?v - vehicle ?r - road_type_road_0316 ?from - loc_type_loc_0180 ?to - loc_type_loc_0189)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0317
    :parameters (?v - vehicle ?r - road_type_road_0317 ?from - loc_type_loc_0183 ?to - loc_type_loc_0142)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0318
    :parameters (?v - vehicle ?r - road_type_road_0318 ?from - loc_type_loc_0183 ?to - loc_type_loc_0184)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0321
    :parameters (?v - vehicle ?r - road_type_road_0321 ?from - loc_type_loc_0187 ?to - loc_type_loc_0281)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0323
    :parameters (?v - vehicle ?r - road_type_road_0323 ?from - loc_type_loc_0188 ?to - loc_type_loc_0262)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0324
    :parameters (?v - vehicle ?r - road_type_road_0324 ?from - loc_type_loc_0188 ?to - loc_type_loc_0003)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0325
    :parameters (?v - vehicle ?r - road_type_road_0325 ?from - loc_type_loc_0189 ?to - loc_type_loc_0012)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0327
    :parameters (?v - vehicle ?r - road_type_road_0327 ?from - loc_type_loc_0191 ?to - loc_type_loc_0195)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0328
    :parameters (?v - vehicle ?r - road_type_road_0328 ?from - loc_type_loc_0192 ?to - loc_type_loc_0212)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0329
    :parameters (?v - vehicle ?r - road_type_road_0329 ?from - loc_type_loc_0192 ?to - loc_type_loc_0193)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0330
    :parameters (?v - vehicle ?r - road_type_road_0330 ?from - loc_type_loc_0192 ?to - loc_type_loc_0075)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0331
    :parameters (?v - vehicle ?r - road_type_road_0331 ?from - loc_type_loc_0193 ?to - loc_type_loc_0102)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0332-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0332 ?from - loc_type_loc_0193 ?to - loc_type_loc_0244 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0333-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0333 ?from - loc_type_loc_0194 ?to - loc_type_loc_0232 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0334
    :parameters (?v - vehicle ?r - road_type_road_0334 ?from - loc_type_loc_0194 ?to - loc_type_loc_0233)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0335
    :parameters (?v - vehicle ?r - road_type_road_0335 ?from - loc_type_loc_0195 ?to - loc_type_loc_0191)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0336
    :parameters (?v - vehicle ?r - road_type_road_0336 ?from - loc_type_loc_0195 ?to - loc_type_loc_0176)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0337
    :parameters (?v - vehicle ?r - road_type_road_0337 ?from - loc_type_loc_0195 ?to - loc_type_loc_0103)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0338
    :parameters (?v - vehicle ?r - road_type_road_0338 ?from - loc_type_loc_0196 ?to - loc_type_loc_0103)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0339
    :parameters (?v - vehicle ?r - road_type_road_0339 ?from - loc_type_loc_0196 ?to - loc_type_loc_0100)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0340
    :parameters (?v - vehicle ?r - road_type_road_0340 ?from - loc_type_loc_0197 ?to - loc_type_loc_0196)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0341
    :parameters (?v - vehicle ?r - road_type_road_0341 ?from - loc_type_loc_0197 ?to - loc_type_loc_0198)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0342
    :parameters (?v - vehicle ?r - road_type_road_0342 ?from - loc_type_loc_0198 ?to - loc_type_loc_0197)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0344
    :parameters (?v - vehicle ?r - road_type_road_0344 ?from - loc_type_loc_0199 ?to - loc_type_loc_0102)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0345-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0345 ?from - loc_type_loc_0200 ?to - loc_type_loc_0230 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0346
    :parameters (?v - vehicle ?r - road_type_road_0346 ?from - loc_type_loc_0200 ?to - loc_type_loc_0041)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0347-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0347 ?from - loc_type_loc_0201 ?to - loc_type_loc_0203 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0348
    :parameters (?v - vehicle ?r - road_type_road_0348 ?from - loc_type_loc_0201 ?to - loc_type_loc_0101)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0349-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0349 ?from - loc_type_loc_0202 ?to - loc_type_loc_0205 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0350-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0350 ?from - loc_type_loc_0202 ?to - loc_type_loc_0203 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0351-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0351 ?from - loc_type_loc_0203 ?to - loc_type_loc_0210 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0352
    :parameters (?v - vehicle ?r - road_type_road_0352 ?from - loc_type_loc_0203 ?to - loc_type_loc_0201)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0353
    :parameters (?v - vehicle ?r - road_type_road_0353 ?from - loc_type_loc_0203 ?to - loc_type_loc_0202)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0354-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0354 ?from - loc_type_loc_0204 ?to - loc_type_loc_0197 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0355
    :parameters (?v - vehicle ?r - road_type_road_0355 ?from - loc_type_loc_0204 ?to - loc_type_loc_0205)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0356
    :parameters (?v - vehicle ?r - road_type_road_0356 ?from - loc_type_loc_0204 ?to - loc_type_loc_0101)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0357
    :parameters (?v - vehicle ?r - road_type_road_0357 ?from - loc_type_loc_0205 ?to - loc_type_loc_0074)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0358
    :parameters (?v - vehicle ?r - road_type_road_0358 ?from - loc_type_loc_0205 ?to - loc_type_loc_0202)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0359
    :parameters (?v - vehicle ?r - road_type_road_0359 ?from - loc_type_loc_0205 ?to - loc_type_loc_0204)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0360
    :parameters (?v - vehicle ?r - road_type_road_0360 ?from - loc_type_loc_0206 ?to - loc_type_loc_0295)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0361
    :parameters (?v - vehicle ?r - road_type_road_0361 ?from - loc_type_loc_0207 ?to - loc_type_loc_0034)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0364
    :parameters (?v - vehicle ?r - road_type_road_0364 ?from - loc_type_loc_0209 ?to - loc_type_loc_0208)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0366
    :parameters (?v - vehicle ?r - road_type_road_0366 ?from - loc_type_loc_0210 ?to - loc_type_loc_0041)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0367
    :parameters (?v - vehicle ?r - road_type_road_0367 ?from - loc_type_loc_0210 ?to - loc_type_loc_0230)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0368
    :parameters (?v - vehicle ?r - road_type_road_0368 ?from - loc_type_loc_0211 ?to - loc_type_loc_0293)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0369
    :parameters (?v - vehicle ?r - road_type_road_0369 ?from - loc_type_loc_0211 ?to - loc_type_loc_0248)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0370
    :parameters (?v - vehicle ?r - road_type_road_0370 ?from - loc_type_loc_0211 ?to - loc_type_loc_0212)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0371
    :parameters (?v - vehicle ?r - road_type_road_0371 ?from - loc_type_loc_0212 ?to - loc_type_loc_0192)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0372
    :parameters (?v - vehicle ?r - road_type_road_0372 ?from - loc_type_loc_0212 ?to - loc_type_loc_0141)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0373
    :parameters (?v - vehicle ?r - road_type_road_0373 ?from - loc_type_loc_0213 ?to - loc_type_loc_0135)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0374
    :parameters (?v - vehicle ?r - road_type_road_0374 ?from - loc_type_loc_0214 ?to - loc_type_loc_0134)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0375
    :parameters (?v - vehicle ?r - road_type_road_0375 ?from - loc_type_loc_0215 ?to - loc_type_loc_0054)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0376
    :parameters (?v - vehicle ?r - road_type_road_0376 ?from - loc_type_loc_0216 ?to - loc_type_loc_0123)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0377
    :parameters (?v - vehicle ?r - road_type_road_0377 ?from - loc_type_loc_0217 ?to - loc_type_loc_0239)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0379-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0379 ?from - loc_type_loc_0219 ?to - loc_type_loc_0253 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0380
    :parameters (?v - vehicle ?r - road_type_road_0380 ?from - loc_type_loc_0220 ?to - loc_type_loc_0038)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0381
    :parameters (?v - vehicle ?r - road_type_road_0381 ?from - loc_type_loc_0220 ?to - loc_type_loc_0020)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0382
    :parameters (?v - vehicle ?r - road_type_road_0382 ?from - loc_type_loc_0221 ?to - loc_type_loc_0220)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0383
    :parameters (?v - vehicle ?r - road_type_road_0383 ?from - loc_type_loc_0221 ?to - loc_type_loc_0020)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0384
    :parameters (?v - vehicle ?r - road_type_road_0384 ?from - loc_type_loc_0222 ?to - loc_type_loc_0021)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0385
    :parameters (?v - vehicle ?r - road_type_road_0385 ?from - loc_type_loc_0223 ?to - loc_type_loc_0037)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0386
    :parameters (?v - vehicle ?r - road_type_road_0386 ?from - loc_type_loc_0223 ?to - loc_type_loc_0019)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0387
    :parameters (?v - vehicle ?r - road_type_road_0387 ?from - loc_type_loc_0224 ?to - loc_type_loc_0223)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0388
    :parameters (?v - vehicle ?r - road_type_road_0388 ?from - loc_type_loc_0224 ?to - loc_type_loc_0019)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0390
    :parameters (?v - vehicle ?r - road_type_road_0390 ?from - loc_type_loc_0226 ?to - loc_type_loc_0227)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0391
    :parameters (?v - vehicle ?r - road_type_road_0391 ?from - loc_type_loc_0227 ?to - loc_type_loc_0228)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0392
    :parameters (?v - vehicle ?r - road_type_road_0392 ?from - loc_type_loc_0228 ?to - loc_type_loc_0229)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0393-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0393 ?from - loc_type_loc_0229 ?to - loc_type_loc_0075 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0395
    :parameters (?v - vehicle ?r - road_type_road_0395 ?from - loc_type_loc_0230 ?to - loc_type_loc_0179)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0396
    :parameters (?v - vehicle ?r - road_type_road_0396 ?from - loc_type_loc_0231 ?to - loc_type_loc_0293)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0397
    :parameters (?v - vehicle ?r - road_type_road_0397 ?from - loc_type_loc_0231 ?to - loc_type_loc_0201)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0398
    :parameters (?v - vehicle ?r - road_type_road_0398 ?from - loc_type_loc_0232 ?to - loc_type_loc_0178)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0400
    :parameters (?v - vehicle ?r - road_type_road_0400 ?from - loc_type_loc_0233 ?to - loc_type_loc_0077)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0401
    :parameters (?v - vehicle ?r - road_type_road_0401 ?from - loc_type_loc_0234 ?to - loc_type_loc_0113)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0402
    :parameters (?v - vehicle ?r - road_type_road_0402 ?from - loc_type_loc_0235 ?to - loc_type_loc_0236)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0403
    :parameters (?v - vehicle ?r - road_type_road_0403 ?from - loc_type_loc_0236 ?to - loc_type_loc_0235)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0404
    :parameters (?v - vehicle ?r - road_type_road_0404 ?from - loc_type_loc_0236 ?to - loc_type_loc_0297)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0405
    :parameters (?v - vehicle ?r - road_type_road_0405 ?from - loc_type_loc_0237 ?to - loc_type_loc_0275)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0406
    :parameters (?v - vehicle ?r - road_type_road_0406 ?from - loc_type_loc_0237 ?to - loc_type_loc_0276)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0407
    :parameters (?v - vehicle ?r - road_type_road_0407 ?from - loc_type_loc_0238 ?to - loc_type_loc_0108)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0408
    :parameters (?v - vehicle ?r - road_type_road_0408 ?from - loc_type_loc_0238 ?to - loc_type_loc_0173)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0409
    :parameters (?v - vehicle ?r - road_type_road_0409 ?from - loc_type_loc_0239 ?to - loc_type_loc_0111)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0410-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0410 ?from - loc_type_loc_0239 ?to - loc_type_loc_0238 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0411
    :parameters (?v - vehicle ?r - road_type_road_0411 ?from - loc_type_loc_0240 ?to - loc_type_loc_0241)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0412
    :parameters (?v - vehicle ?r - road_type_road_0412 ?from - loc_type_loc_0240 ?to - loc_type_loc_0249)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0414-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0414 ?from - loc_type_loc_0241 ?to - loc_type_loc_0240 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0415-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0415 ?from - loc_type_loc_0242 ?to - loc_type_loc_0102 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0416
    :parameters (?v - vehicle ?r - road_type_road_0416 ?from - loc_type_loc_0242 ?to - loc_type_loc_0244)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0417-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0417 ?from - loc_type_loc_0243 ?to - loc_type_loc_0292 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0419-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0419 ?from - loc_type_loc_0245 ?to - loc_type_loc_0195 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0420-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0420 ?from - loc_type_loc_0245 ?to - loc_type_loc_0243 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0422
    :parameters (?v - vehicle ?r - road_type_road_0422 ?from - loc_type_loc_0247 ?to - loc_type_loc_0200)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0423-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0423 ?from - loc_type_loc_0247 ?to - loc_type_loc_0287 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0424
    :parameters (?v - vehicle ?r - road_type_road_0424 ?from - loc_type_loc_0248 ?to - loc_type_loc_0211)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0425
    :parameters (?v - vehicle ?r - road_type_road_0425 ?from - loc_type_loc_0249 ?to - loc_type_loc_0187)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0426
    :parameters (?v - vehicle ?r - road_type_road_0426 ?from - loc_type_loc_0250 ?to - loc_type_loc_0054)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0430
    :parameters (?v - vehicle ?r - road_type_road_0430 ?from - loc_type_loc_0253 ?to - loc_type_loc_0083)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0431
    :parameters (?v - vehicle ?r - road_type_road_0431 ?from - loc_type_loc_0253 ?to - loc_type_loc_0091)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0432
    :parameters (?v - vehicle ?r - road_type_road_0432 ?from - loc_type_loc_0254 ?to - loc_type_loc_0255)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0433
    :parameters (?v - vehicle ?r - road_type_road_0433 ?from - loc_type_loc_0254 ?to - loc_type_loc_0257)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0435
    :parameters (?v - vehicle ?r - road_type_road_0435 ?from - loc_type_loc_0255 ?to - loc_type_loc_0057)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0437
    :parameters (?v - vehicle ?r - road_type_road_0437 ?from - loc_type_loc_0257 ?to - loc_type_loc_0259)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0438
    :parameters (?v - vehicle ?r - road_type_road_0438 ?from - loc_type_loc_0257 ?to - loc_type_loc_0091)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0439
    :parameters (?v - vehicle ?r - road_type_road_0439 ?from - loc_type_loc_0259 ?to - loc_type_loc_0257)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0440
    :parameters (?v - vehicle ?r - road_type_road_0440 ?from - loc_type_loc_0259 ?to - loc_type_loc_0260)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0441
    :parameters (?v - vehicle ?r - road_type_road_0441 ?from - loc_type_loc_0260 ?to - loc_type_loc_0261)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0442
    :parameters (?v - vehicle ?r - road_type_road_0442 ?from - loc_type_loc_0260 ?to - loc_type_loc_0258)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0443
    :parameters (?v - vehicle ?r - road_type_road_0443 ?from - loc_type_loc_0261 ?to - loc_type_loc_0136)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0444
    :parameters (?v - vehicle ?r - road_type_road_0444 ?from - loc_type_loc_0261 ?to - loc_type_loc_0258)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0445
    :parameters (?v - vehicle ?r - road_type_road_0445 ?from - loc_type_loc_0263 ?to - loc_type_loc_0158)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0446
    :parameters (?v - vehicle ?r - road_type_road_0446 ?from - loc_type_loc_0263 ?to - loc_type_loc_0159)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0447
    :parameters (?v - vehicle ?r - road_type_road_0447 ?from - loc_type_loc_0264 ?to - loc_type_loc_0078)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0448
    :parameters (?v - vehicle ?r - road_type_road_0448 ?from - loc_type_loc_0264 ?to - loc_type_loc_0266)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0449-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0449 ?from - loc_type_loc_0265 ?to - loc_type_loc_0194 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0450
    :parameters (?v - vehicle ?r - road_type_road_0450 ?from - loc_type_loc_0265 ?to - loc_type_loc_0232)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0451
    :parameters (?v - vehicle ?r - road_type_road_0451 ?from - loc_type_loc_0266 ?to - loc_type_loc_0290)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0452
    :parameters (?v - vehicle ?r - road_type_road_0452 ?from - loc_type_loc_0266 ?to - loc_type_loc_0042)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0453
    :parameters (?v - vehicle ?r - road_type_road_0453 ?from - loc_type_loc_0267 ?to - loc_type_loc_0052)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0454
    :parameters (?v - vehicle ?r - road_type_road_0454 ?from - loc_type_loc_0267 ?to - loc_type_loc_0094)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0455
    :parameters (?v - vehicle ?r - road_type_road_0455 ?from - loc_type_loc_0268 ?to - loc_type_loc_0116)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0456
    :parameters (?v - vehicle ?r - road_type_road_0456 ?from - loc_type_loc_0269 ?to - loc_type_loc_0119)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0457
    :parameters (?v - vehicle ?r - road_type_road_0457 ?from - loc_type_loc_0270 ?to - loc_type_loc_0143)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0458
    :parameters (?v - vehicle ?r - road_type_road_0458 ?from - loc_type_loc_0270 ?to - loc_type_loc_0271)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0459
    :parameters (?v - vehicle ?r - road_type_road_0459 ?from - loc_type_loc_0271 ?to - loc_type_loc_0270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0460
    :parameters (?v - vehicle ?r - road_type_road_0460 ?from - loc_type_loc_0272 ?to - loc_type_loc_0286)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0461
    :parameters (?v - vehicle ?r - road_type_road_0461 ?from - loc_type_loc_0272 ?to - loc_type_loc_0219)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0462
    :parameters (?v - vehicle ?r - road_type_road_0462 ?from - loc_type_loc_0273 ?to - loc_type_loc_0026)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0463-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0463 ?from - loc_type_loc_0273 ?to - loc_type_loc_0027 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0464
    :parameters (?v - vehicle ?r - road_type_road_0464 ?from - loc_type_loc_0274 ?to - loc_type_loc_0140)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0465
    :parameters (?v - vehicle ?r - road_type_road_0465 ?from - loc_type_loc_0275 ?to - loc_type_loc_0237)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0466
    :parameters (?v - vehicle ?r - road_type_road_0466 ?from - loc_type_loc_0276 ?to - loc_type_loc_0132)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0467
    :parameters (?v - vehicle ?r - road_type_road_0467 ?from - loc_type_loc_0276 ?to - loc_type_loc_0277)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0468
    :parameters (?v - vehicle ?r - road_type_road_0468 ?from - loc_type_loc_0277 ?to - loc_type_loc_0298)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0470
    :parameters (?v - vehicle ?r - road_type_road_0470 ?from - loc_type_loc_0279 ?to - loc_type_loc_0038)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0472
    :parameters (?v - vehicle ?r - road_type_road_0472 ?from - loc_type_loc_0280 ?to - loc_type_loc_0265)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0473
    :parameters (?v - vehicle ?r - road_type_road_0473 ?from - loc_type_loc_0282 ?to - loc_type_loc_0093)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0474
    :parameters (?v - vehicle ?r - road_type_road_0474 ?from - loc_type_loc_0283 ?to - loc_type_loc_0112)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0475
    :parameters (?v - vehicle ?r - road_type_road_0475 ?from - loc_type_loc_0283 ?to - loc_type_loc_0172)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0476
    :parameters (?v - vehicle ?r - road_type_road_0476 ?from - loc_type_loc_0283 ?to - loc_type_loc_0173)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0478
    :parameters (?v - vehicle ?r - road_type_road_0478 ?from - loc_type_loc_0285 ?to - loc_type_loc_0144)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0479-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0479 ?from - loc_type_loc_0285 ?to - loc_type_loc_0185 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0480
    :parameters (?v - vehicle ?r - road_type_road_0480 ?from - loc_type_loc_0286 ?to - loc_type_loc_0273)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0481
    :parameters (?v - vehicle ?r - road_type_road_0481 ?from - loc_type_loc_0287 ?to - loc_type_loc_0247)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0482
    :parameters (?v - vehicle ?r - road_type_road_0482 ?from - loc_type_loc_0288 ?to - loc_type_loc_0128)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0483
    :parameters (?v - vehicle ?r - road_type_road_0483 ?from - loc_type_loc_0288 ?to - loc_type_loc_0140)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0484
    :parameters (?v - vehicle ?r - road_type_road_0484 ?from - loc_type_loc_0289 ?to - loc_type_loc_0280)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0485
    :parameters (?v - vehicle ?r - road_type_road_0485 ?from - loc_type_loc_0290 ?to - loc_type_loc_0117)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0486
    :parameters (?v - vehicle ?r - road_type_road_0486 ?from - loc_type_loc_0290 ?to - loc_type_loc_0264)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0487
    :parameters (?v - vehicle ?r - road_type_road_0487 ?from - loc_type_loc_0291 ?to - loc_type_loc_0118)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0488
    :parameters (?v - vehicle ?r - road_type_road_0488 ?from - loc_type_loc_0291 ?to - loc_type_loc_0263)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0489-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0489 ?from - loc_type_loc_0292 ?to - loc_type_loc_0100 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0490-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0490 ?from - loc_type_loc_0292 ?to - loc_type_loc_0242 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0493
    :parameters (?v - vehicle ?r - road_type_road_0493 ?from - loc_type_loc_0294 ?to - loc_type_loc_0175)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0494
    :parameters (?v - vehicle ?r - road_type_road_0494 ?from - loc_type_loc_0294 ?to - loc_type_loc_0299)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0495
    :parameters (?v - vehicle ?r - road_type_road_0495 ?from - loc_type_loc_0294 ?to - loc_type_loc_0174)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0496
    :parameters (?v - vehicle ?r - road_type_road_0496 ?from - loc_type_loc_0295 ?to - loc_type_loc_0251)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0497
    :parameters (?v - vehicle ?r - road_type_road_0497 ?from - loc_type_loc_0295 ?to - loc_type_loc_0206)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00000
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00000)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00030
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00030)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00060
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00060)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00090
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00090)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00120
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00120)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00150
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00150)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00180
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00180)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00210
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00210)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00240
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00240)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00270
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00270)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00300
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00300)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00330
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00330)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00360
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00360)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00390
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00390)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-dynamic-road_0498-tw_00420
    :parameters (?v - vehicle ?r - road_type_road_0498 ?from - loc_type_loc_0296 ?to - loc_type_loc_0045 ?w - window_type_tw_00420)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action traverse-road-static-road_0499
    :parameters (?v - vehicle ?r - road_type_road_0499 ?from - loc_type_loc_0297 ?to - loc_type_loc_0139)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0500
    :parameters (?v - vehicle ?r - road_type_road_0500 ?from - loc_type_loc_0297 ?to - loc_type_loc_0105)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0501
    :parameters (?v - vehicle ?r - road_type_road_0501 ?from - loc_type_loc_0298 ?to - loc_type_loc_0017)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0502
    :parameters (?v - vehicle ?r - road_type_road_0502 ?from - loc_type_loc_0298 ?to - loc_type_loc_0237)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0503
    :parameters (?v - vehicle ?r - road_type_road_0503 ?from - loc_type_loc_0299 ?to - loc_type_loc_0294)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  ;; Advances the single global congestion window.
  (:event advance-window
    :parameters (?from - time-window ?to - time-window)
    :precondition (and
      (current-window ?from)
      (next-window ?from ?to)
      (>= (sim-time) (window-start ?to))
    )
    :effect (and
      (not (current-window ?from))
      (current-window ?to)
    )
  )
)
