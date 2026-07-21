;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_llm_macro
;;    traversal             : compiled_duration
;;    state representation  : line_graph
;;    action generation     : compiled
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=static
;;    llm_events      : True
;;    fuel            : enabled=False, replanning=False, consumption=continuous
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents)
  (:types
    vehicle location road - object
    road_type_macro_0000 road_type_macro_0001 road_type_macro_0002 road_type_macro_0003 road_type_macro_0004 road_type_macro_0005 road_type_macro_0006 road_type_macro_0007 road_type_macro_0008 road_type_macro_0009 road_type_macro_0010 road_type_macro_0011 road_type_macro_0012 road_type_macro_0013 road_type_macro_0014 road_type_macro_0015 road_type_macro_0016 road_type_macro_0017 road_type_macro_0018 road_type_macro_0019 road_type_macro_0020 road_type_macro_0021 road_type_macro_0022 road_type_macro_0023 road_type_macro_0024 road_type_macro_0025 road_type_macro_0026 road_type_macro_0027 road_type_macro_0028 road_type_macro_0029 road_type_macro_0030 road_type_macro_0031 road_type_macro_0032 road_type_macro_0033 road_type_macro_0034 road_type_macro_0035 road_type_macro_0036 road_type_macro_0037 road_type_macro_0038 road_type_road_0000 road_type_road_0001 road_type_road_0002 road_type_road_0003 road_type_road_0004 road_type_road_0005 road_type_road_0006 road_type_road_0007 road_type_road_0008 road_type_road_0009 road_type_road_0010 road_type_road_0012 road_type_road_0013 road_type_road_0014 road_type_road_0015 road_type_road_0016 road_type_road_0017 road_type_road_0019 road_type_road_0020 road_type_road_0021 road_type_road_0022 road_type_road_0023 road_type_road_0026 road_type_road_0027 road_type_road_0028 road_type_road_0030 road_type_road_0031 road_type_road_0032 road_type_road_0033 road_type_road_0034 road_type_road_0035 road_type_road_0036 road_type_road_0037 road_type_road_0038 road_type_road_0039 road_type_road_0040 road_type_road_0041 road_type_road_0042 road_type_road_0043 road_type_road_0044 road_type_road_0045 road_type_road_0046 road_type_road_0047 road_type_road_0048 road_type_road_0049 road_type_road_0050 road_type_road_0051 road_type_road_0052 road_type_road_0053 road_type_road_0058 road_type_road_0059 road_type_road_0061 road_type_road_0062 road_type_road_0063 road_type_road_0064 road_type_road_0065 road_type_road_0066 road_type_road_0067 road_type_road_0068 road_type_road_0069 road_type_road_0070 road_type_road_0071 road_type_road_0072 road_type_road_0073 road_type_road_0074 road_type_road_0075 road_type_road_0076 road_type_road_0077 road_type_road_0078 road_type_road_0079 road_type_road_0080 road_type_road_0081 road_type_road_0082 road_type_road_0083 road_type_road_0084 road_type_road_0085 road_type_road_0086 road_type_road_0087 road_type_road_0088 road_type_road_0090 road_type_road_0094 road_type_road_0095 road_type_road_0096 road_type_road_0097 road_type_road_0099 road_type_road_0100 road_type_road_0101 road_type_road_0102 road_type_road_0103 road_type_road_0104 road_type_road_0105 road_type_road_0107 road_type_road_0108 road_type_road_0109 road_type_road_0110 road_type_road_0111 road_type_road_0112 road_type_road_0113 road_type_road_0114 road_type_road_0115 road_type_road_0116 road_type_road_0117 road_type_road_0118 road_type_road_0120 road_type_road_0121 road_type_road_0122 road_type_road_0123 road_type_road_0124 road_type_road_0125 road_type_road_0126 road_type_road_0127 road_type_road_0128 road_type_road_0129 road_type_road_0130 road_type_road_0131 road_type_road_0132 road_type_road_0133 road_type_road_0134 road_type_road_0135 road_type_road_0137 road_type_road_0138 road_type_road_0139 road_type_road_0140 road_type_road_0141 road_type_road_0142 road_type_road_0143 road_type_road_0144 road_type_road_0145 road_type_road_0146 road_type_road_0147 road_type_road_0148 road_type_road_0149 road_type_road_0150 road_type_road_0151 road_type_road_0152 road_type_road_0153 road_type_road_0155 road_type_road_0157 road_type_road_0158 road_type_road_0159 road_type_road_0161 road_type_road_0162 road_type_road_0163 road_type_road_0164 road_type_road_0165 road_type_road_0166 road_type_road_0167 road_type_road_0168 road_type_road_0169 road_type_road_0171 road_type_road_0172 road_type_road_0173 road_type_road_0174 road_type_road_0175 road_type_road_0176 road_type_road_0177 road_type_road_0178 road_type_road_0179 road_type_road_0180 road_type_road_0181 road_type_road_0182 road_type_road_0183 road_type_road_0184 road_type_road_0185 road_type_road_0186 road_type_road_0187 road_type_road_0188 road_type_road_0189 road_type_road_0190 road_type_road_0191 road_type_road_0192 road_type_road_0193 road_type_road_0194 road_type_road_0195 road_type_road_0196 road_type_road_0197 road_type_road_0198 road_type_road_0199 road_type_road_0200 road_type_road_0201 road_type_road_0202 road_type_road_0203 road_type_road_0204 road_type_road_0205 road_type_road_0206 road_type_road_0207 road_type_road_0208 road_type_road_0209 road_type_road_0210 road_type_road_0211 road_type_road_0212 road_type_road_0213 road_type_road_0215 road_type_road_0216 road_type_road_0217 road_type_road_0218 road_type_road_0219 road_type_road_0220 road_type_road_0221 road_type_road_0222 road_type_road_0223 road_type_road_0226 road_type_road_0227 road_type_road_0228 road_type_road_0232 road_type_road_0233 road_type_road_0234 road_type_road_0235 road_type_road_0236 road_type_road_0237 road_type_road_0238 road_type_road_0239 road_type_road_0240 road_type_road_0241 road_type_road_0242 road_type_road_0243 road_type_road_0244 road_type_road_0245 road_type_road_0246 road_type_road_0247 road_type_road_0248 road_type_road_0249 road_type_road_0250 road_type_road_0251 road_type_road_0252 road_type_road_0253 road_type_road_0254 road_type_road_0255 road_type_road_0256 road_type_road_0257 road_type_road_0258 road_type_road_0259 road_type_road_0260 road_type_road_0261 road_type_road_0262 road_type_road_0263 road_type_road_0264 road_type_road_0265 road_type_road_0266 road_type_road_0269 road_type_road_0270 road_type_road_0272 road_type_road_0273 road_type_road_0274 road_type_road_0275 road_type_road_0276 road_type_road_0277 road_type_road_0278 road_type_road_0279 road_type_road_0280 road_type_road_0281 road_type_road_0282 road_type_road_0283 road_type_road_0285 road_type_road_0286 road_type_road_0287 road_type_road_0288 road_type_road_0289 road_type_road_0290 road_type_road_0291 road_type_road_0292 road_type_road_0293 road_type_road_0294 road_type_road_0295 road_type_road_0297 road_type_road_0298 road_type_road_0299 road_type_road_0300 road_type_road_0301 road_type_road_0302 road_type_road_0303 road_type_road_0304 road_type_road_0305 road_type_road_0306 road_type_road_0307 road_type_road_0309 road_type_road_0310 road_type_road_0311 road_type_road_0312 road_type_road_0313 road_type_road_0314 road_type_road_0315 road_type_road_0316 road_type_road_0317 road_type_road_0318 road_type_road_0321 road_type_road_0323 road_type_road_0324 road_type_road_0325 road_type_road_0327 road_type_road_0328 road_type_road_0329 road_type_road_0330 road_type_road_0331 road_type_road_0332 road_type_road_0333 road_type_road_0334 road_type_road_0335 road_type_road_0336 road_type_road_0337 road_type_road_0338 road_type_road_0339 road_type_road_0340 road_type_road_0341 road_type_road_0342 road_type_road_0344 road_type_road_0345 road_type_road_0346 road_type_road_0347 road_type_road_0348 road_type_road_0349 road_type_road_0350 road_type_road_0351 road_type_road_0352 road_type_road_0353 road_type_road_0354 road_type_road_0355 road_type_road_0356 road_type_road_0357 road_type_road_0358 road_type_road_0359 road_type_road_0360 road_type_road_0361 road_type_road_0364 road_type_road_0366 road_type_road_0367 road_type_road_0368 road_type_road_0369 road_type_road_0370 road_type_road_0371 road_type_road_0372 road_type_road_0373 road_type_road_0374 road_type_road_0375 road_type_road_0376 road_type_road_0377 road_type_road_0379 road_type_road_0380 road_type_road_0381 road_type_road_0382 road_type_road_0383 road_type_road_0384 road_type_road_0385 road_type_road_0386 road_type_road_0387 road_type_road_0388 road_type_road_0390 road_type_road_0391 road_type_road_0392 road_type_road_0393 road_type_road_0395 road_type_road_0396 road_type_road_0397 road_type_road_0398 road_type_road_0400 road_type_road_0401 road_type_road_0402 road_type_road_0403 road_type_road_0404 road_type_road_0405 road_type_road_0406 road_type_road_0407 road_type_road_0408 road_type_road_0409 road_type_road_0410 road_type_road_0411 road_type_road_0412 road_type_road_0414 road_type_road_0415 road_type_road_0416 road_type_road_0417 road_type_road_0419 road_type_road_0420 road_type_road_0422 road_type_road_0423 road_type_road_0424 road_type_road_0425 road_type_road_0426 road_type_road_0430 road_type_road_0431 road_type_road_0432 road_type_road_0433 road_type_road_0435 road_type_road_0437 road_type_road_0438 road_type_road_0439 road_type_road_0440 road_type_road_0441 road_type_road_0442 road_type_road_0443 road_type_road_0444 road_type_road_0445 road_type_road_0446 road_type_road_0447 road_type_road_0448 road_type_road_0449 road_type_road_0450 road_type_road_0451 road_type_road_0452 road_type_road_0453 road_type_road_0454 road_type_road_0455 road_type_road_0456 road_type_road_0457 road_type_road_0458 road_type_road_0459 road_type_road_0460 road_type_road_0461 road_type_road_0462 road_type_road_0463 road_type_road_0464 road_type_road_0465 road_type_road_0466 road_type_road_0467 road_type_road_0468 road_type_road_0470 road_type_road_0472 road_type_road_0473 road_type_road_0474 road_type_road_0475 road_type_road_0476 road_type_road_0478 road_type_road_0479 road_type_road_0480 road_type_road_0481 road_type_road_0482 road_type_road_0483 road_type_road_0484 road_type_road_0485 road_type_road_0486 road_type_road_0487 road_type_road_0488 road_type_road_0489 road_type_road_0490 road_type_road_0493 road_type_road_0494 road_type_road_0495 road_type_road_0496 road_type_road_0497 road_type_road_0498 road_type_road_0499 road_type_road_0500 road_type_road_0501 road_type_road_0502 road_type_road_0503
    - road
  )

  (:predicates
    (connects  ?r - road  ?from - location  ?to - location)
    (road-open ?r - road)
    (has-traffic-light ?l - location)
    (ready-road ?v - vehicle ?r - road)
    (road-next ?r - road ?next - road)
    (goal-road ?r - road)
    (reached-goal ?v - vehicle)
    (road-blocked ?r - road)   ;; set by LLM event generator
    (location-blocked ?l - location)   ;; derived from blocked roads
    (at       ?v - vehicle  ?l - location)
  )

  (:functions
    (travel-duration      ?r - road)  ;; precomputed seconds to traverse
    (travel-time          ?v - vehicle)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
  )

  (:action traverse-road-static-macro_0000-road_0195
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?next - road_type_road_0195)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0000-road_0196
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?next - road_type_road_0196)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-macro_0026
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_macro_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-road_0283
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_road_0283)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-road_0285
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_road_0285)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0002-road_0478
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?next - road_type_road_0478)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0002-road_0479
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?next - road_type_road_0479)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0003-road_0323
    :parameters (?v - vehicle ?r - road_type_macro_0003 ?next - road_type_road_0323)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0003-road_0324
    :parameters (?v - vehicle ?r - road_type_macro_0003 ?next - road_type_road_0324)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0004-road_0031
    :parameters (?v - vehicle ?r - road_type_macro_0004 ?next - road_type_road_0031)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0005-macro_0006
    :parameters (?v - vehicle ?r - road_type_macro_0005 ?next - road_type_macro_0006)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0005-macro_0007
    :parameters (?v - vehicle ?r - road_type_macro_0005 ?next - road_type_macro_0007)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0006-road_0498
    :parameters (?v - vehicle ?r - road_type_macro_0006 ?next - road_type_road_0498)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0007-road_0276
    :parameters (?v - vehicle ?r - road_type_macro_0007 ?next - road_type_road_0276)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0008-macro_0036
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?next - road_type_macro_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0008-road_0472
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?next - road_type_road_0472)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0009-road_0453
    :parameters (?v - vehicle ?r - road_type_macro_0009 ?next - road_type_road_0453)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0009-road_0454
    :parameters (?v - vehicle ?r - road_type_macro_0009 ?next - road_type_road_0454)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0010-road_0118
    :parameters (?v - vehicle ?r - road_type_macro_0010 ?next - road_type_road_0118)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0011-road_0218
    :parameters (?v - vehicle ?r - road_type_macro_0011 ?next - road_type_road_0218)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0012-road_0006
    :parameters (?v - vehicle ?r - road_type_macro_0012 ?next - road_type_road_0006)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0012-road_0007
    :parameters (?v - vehicle ?r - road_type_macro_0012 ?next - road_type_road_0007)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0013-road_0107
    :parameters (?v - vehicle ?r - road_type_macro_0013 ?next - road_type_road_0107)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0014-road_0294
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?next - road_type_road_0294)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0015-road_0425
    :parameters (?v - vehicle ?r - road_type_macro_0015 ?next - road_type_road_0425)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0016-road_0294
    :parameters (?v - vehicle ?r - road_type_macro_0016 ?next - road_type_road_0294)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0017-road_0294
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?next - road_type_road_0294)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0018-road_0161
    :parameters (?v - vehicle ?r - road_type_macro_0018 ?next - road_type_road_0161)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0018-road_0162
    :parameters (?v - vehicle ?r - road_type_macro_0018 ?next - road_type_road_0162)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0019-macro_0037
    :parameters (?v - vehicle ?r - road_type_macro_0019 ?next - road_type_macro_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0019-macro_0038
    :parameters (?v - vehicle ?r - road_type_macro_0019 ?next - road_type_macro_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0020-road_0474
    :parameters (?v - vehicle ?r - road_type_macro_0020 ?next - road_type_road_0474)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0020-road_0475
    :parameters (?v - vehicle ?r - road_type_macro_0020 ?next - road_type_road_0475)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0020-road_0476
    :parameters (?v - vehicle ?r - road_type_macro_0020 ?next - road_type_road_0476)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0021-road_0221
    :parameters (?v - vehicle ?r - road_type_macro_0021 ?next - road_type_road_0221)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0021-road_0222
    :parameters (?v - vehicle ?r - road_type_macro_0021 ?next - road_type_road_0222)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0021-road_0223
    :parameters (?v - vehicle ?r - road_type_macro_0021 ?next - road_type_road_0223)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0022-road_0221
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?next - road_type_road_0221)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0022-road_0222
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?next - road_type_road_0222)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0022-road_0223
    :parameters (?v - vehicle ?r - road_type_macro_0022 ?next - road_type_road_0223)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0023-road_0227
    :parameters (?v - vehicle ?r - road_type_macro_0023 ?next - road_type_road_0227)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0023-road_0228
    :parameters (?v - vehicle ?r - road_type_macro_0023 ?next - road_type_road_0228)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0024-road_0227
    :parameters (?v - vehicle ?r - road_type_macro_0024 ?next - road_type_road_0227)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0024-road_0228
    :parameters (?v - vehicle ?r - road_type_macro_0024 ?next - road_type_road_0228)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0025-road_0277
    :parameters (?v - vehicle ?r - road_type_macro_0025 ?next - road_type_road_0277)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0026-macro_0001
    :parameters (?v - vehicle ?r - road_type_macro_0026 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0026-road_0016
    :parameters (?v - vehicle ?r - road_type_macro_0026 ?next - road_type_road_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0026-road_0017
    :parameters (?v - vehicle ?r - road_type_macro_0026 ?next - road_type_road_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0027-road_0171
    :parameters (?v - vehicle ?r - road_type_macro_0027 ?next - road_type_road_0171)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0027-road_0172
    :parameters (?v - vehicle ?r - road_type_macro_0027 ?next - road_type_road_0172)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0028-road_0113
    :parameters (?v - vehicle ?r - road_type_macro_0028 ?next - road_type_road_0113)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0028-road_0114
    :parameters (?v - vehicle ?r - road_type_macro_0028 ?next - road_type_road_0114)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0029-road_0218
    :parameters (?v - vehicle ?r - road_type_macro_0029 ?next - road_type_road_0218)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0030-road_0270
    :parameters (?v - vehicle ?r - road_type_macro_0030 ?next - road_type_road_0270)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0031-road_0161
    :parameters (?v - vehicle ?r - road_type_macro_0031 ?next - road_type_road_0161)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0031-road_0162
    :parameters (?v - vehicle ?r - road_type_macro_0031 ?next - road_type_road_0162)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0032-road_0250
    :parameters (?v - vehicle ?r - road_type_macro_0032 ?next - road_type_road_0250)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0032-road_0251
    :parameters (?v - vehicle ?r - road_type_macro_0032 ?next - road_type_road_0251)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0033-road_0195
    :parameters (?v - vehicle ?r - road_type_macro_0033 ?next - road_type_road_0195)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0033-road_0196
    :parameters (?v - vehicle ?r - road_type_macro_0033 ?next - road_type_road_0196)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0034-road_0419
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?next - road_type_road_0419)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0034-road_0420
    :parameters (?v - vehicle ?r - road_type_macro_0034 ?next - road_type_road_0420)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0035-road_0290
    :parameters (?v - vehicle ?r - road_type_macro_0035 ?next - road_type_road_0290)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0035-road_0291
    :parameters (?v - vehicle ?r - road_type_macro_0035 ?next - road_type_road_0291)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0036-macro_0008
    :parameters (?v - vehicle ?r - road_type_macro_0036 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0036-road_0059
    :parameters (?v - vehicle ?r - road_type_macro_0036 ?next - road_type_road_0059)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0036-road_0061
    :parameters (?v - vehicle ?r - road_type_macro_0036 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0037-macro_0019
    :parameters (?v - vehicle ?r - road_type_macro_0037 ?next - road_type_macro_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0037-road_0168
    :parameters (?v - vehicle ?r - road_type_macro_0037 ?next - road_type_road_0168)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0037-road_0169
    :parameters (?v - vehicle ?r - road_type_macro_0037 ?next - road_type_road_0169)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0038-road_0347
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?next - road_type_road_0347)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0038-road_0348
    :parameters (?v - vehicle ?r - road_type_macro_0038 ?next - road_type_road_0348)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0000-road_0375
    :parameters (?v - vehicle ?r - road_type_road_0000 ?next - road_type_road_0375)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0001-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0001 ?next - road_type_road_0084)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0001-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0001 ?next - road_type_road_0085)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0002 ?next - road_type_road_0044)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0002 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0003-road_0206
    :parameters (?v - vehicle ?r - road_type_road_0003 ?next - road_type_road_0206)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0004-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0004 ?next - road_type_road_0096)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0005-road_0323
    :parameters (?v - vehicle ?r - road_type_road_0005 ?next - road_type_road_0323)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0005-road_0324
    :parameters (?v - vehicle ?r - road_type_road_0005 ?next - road_type_road_0324)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0006-road_0376
    :parameters (?v - vehicle ?r - road_type_road_0006 ?next - road_type_road_0376)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0007-road_0078
    :parameters (?v - vehicle ?r - road_type_road_0007 ?next - road_type_road_0078)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0007-road_0079
    :parameters (?v - vehicle ?r - road_type_road_0007 ?next - road_type_road_0079)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0008-road_0137
    :parameters (?v - vehicle ?r - road_type_road_0008 ?next - road_type_road_0137)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0009-road_0218
    :parameters (?v - vehicle ?r - road_type_road_0009 ?next - road_type_road_0218)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010-road_0195
    :parameters (?v - vehicle ?r - road_type_road_0010 ?next - road_type_road_0195)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010-road_0196
    :parameters (?v - vehicle ?r - road_type_road_0010 ?next - road_type_road_0196)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0012-road_0277
    :parameters (?v - vehicle ?r - road_type_road_0012 ?next - road_type_road_0277)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0013-macro_0000
    :parameters (?v - vehicle ?r - road_type_road_0013 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0014-road_0197
    :parameters (?v - vehicle ?r - road_type_road_0014 ?next - road_type_road_0197)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0015-macro_0033
    :parameters (?v - vehicle ?r - road_type_road_0015 ?next - road_type_macro_0033)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0015-road_0414
    :parameters (?v - vehicle ?r - road_type_road_0015 ?next - road_type_road_0414)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0016-road_0287
    :parameters (?v - vehicle ?r - road_type_road_0016 ?next - road_type_road_0287)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0016-road_0288
    :parameters (?v - vehicle ?r - road_type_road_0016 ?next - road_type_road_0288)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0016-road_0289
    :parameters (?v - vehicle ?r - road_type_road_0016 ?next - road_type_road_0289)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017-road_0151
    :parameters (?v - vehicle ?r - road_type_road_0017 ?next - road_type_road_0151)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017-road_0152
    :parameters (?v - vehicle ?r - road_type_road_0017 ?next - road_type_road_0152)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017-road_0153
    :parameters (?v - vehicle ?r - road_type_road_0017 ?next - road_type_road_0153)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-road_0235
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_road_0235)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-road_0236
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_road_0236)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-road_0237
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_road_0237)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0020-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0020 ?next - road_type_road_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0021-road_0405
    :parameters (?v - vehicle ?r - road_type_road_0021 ?next - road_type_road_0405)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0021-road_0406
    :parameters (?v - vehicle ?r - road_type_road_0021 ?next - road_type_road_0406)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0022-road_0141
    :parameters (?v - vehicle ?r - road_type_road_0022 ?next - road_type_road_0141)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0022-road_0142
    :parameters (?v - vehicle ?r - road_type_road_0022 ?next - road_type_road_0142)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0026-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0026 ?next - road_type_road_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0026-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0026 ?next - road_type_road_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0026-road_0021
    :parameters (?v - vehicle ?r - road_type_road_0026 ?next - road_type_road_0021)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0027-road_0382
    :parameters (?v - vehicle ?r - road_type_road_0027 ?next - road_type_road_0382)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0027-road_0383
    :parameters (?v - vehicle ?r - road_type_road_0027 ?next - road_type_road_0383)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0028-road_0384
    :parameters (?v - vehicle ?r - road_type_road_0028 ?next - road_type_road_0384)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0030-road_0031
    :parameters (?v - vehicle ?r - road_type_road_0030 ?next - road_type_road_0031)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0031-road_0387
    :parameters (?v - vehicle ?r - road_type_road_0031 ?next - road_type_road_0387)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0031-road_0388
    :parameters (?v - vehicle ?r - road_type_road_0031 ?next - road_type_road_0388)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0032-road_0432
    :parameters (?v - vehicle ?r - road_type_road_0032 ?next - road_type_road_0432)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0032-road_0433
    :parameters (?v - vehicle ?r - road_type_road_0032 ?next - road_type_road_0433)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0033-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0033 ?next - road_type_road_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0034 ?next - road_type_road_0157)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0034 ?next - road_type_road_0158)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0034 ?next - road_type_road_0159)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0035-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0035 ?next - road_type_road_0102)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0035-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0035 ?next - road_type_road_0103)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0036-road_0260
    :parameters (?v - vehicle ?r - road_type_road_0036 ?next - road_type_road_0260)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0036-road_0261
    :parameters (?v - vehicle ?r - road_type_road_0036 ?next - road_type_road_0261)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0036-road_0262
    :parameters (?v - vehicle ?r - road_type_road_0036 ?next - road_type_road_0262)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-road_0038
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_road_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_road_0039)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-road_0040
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_road_0040)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0038-road_0145
    :parameters (?v - vehicle ?r - road_type_road_0038 ?next - road_type_road_0145)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0039-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0039 ?next - road_type_road_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0039-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0039 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0040-road_0462
    :parameters (?v - vehicle ?r - road_type_road_0040 ?next - road_type_road_0462)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0040-road_0463
    :parameters (?v - vehicle ?r - road_type_road_0040 ?next - road_type_road_0463)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0041-road_0379
    :parameters (?v - vehicle ?r - road_type_road_0041 ?next - road_type_road_0379)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0042-road_0480
    :parameters (?v - vehicle ?r - road_type_road_0042 ?next - road_type_road_0480)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0043-road_0290
    :parameters (?v - vehicle ?r - road_type_road_0043 ?next - road_type_road_0290)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0043-road_0291
    :parameters (?v - vehicle ?r - road_type_road_0043 ?next - road_type_road_0291)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044-road_0181
    :parameters (?v - vehicle ?r - road_type_road_0044 ?next - road_type_road_0181)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044-road_0182
    :parameters (?v - vehicle ?r - road_type_road_0044 ?next - road_type_road_0182)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044-road_0183
    :parameters (?v - vehicle ?r - road_type_road_0044 ?next - road_type_road_0183)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0000
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0001
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0002
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0002)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046-road_0013
    :parameters (?v - vehicle ?r - road_type_road_0046 ?next - road_type_road_0013)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046-road_0014
    :parameters (?v - vehicle ?r - road_type_road_0046 ?next - road_type_road_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0047-road_0257
    :parameters (?v - vehicle ?r - road_type_road_0047 ?next - road_type_road_0257)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0047-road_0258
    :parameters (?v - vehicle ?r - road_type_road_0047 ?next - road_type_road_0258)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0047-road_0259
    :parameters (?v - vehicle ?r - road_type_road_0047 ?next - road_type_road_0259)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0048-macro_0025
    :parameters (?v - vehicle ?r - road_type_road_0048 ?next - road_type_macro_0025)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0048-road_0272
    :parameters (?v - vehicle ?r - road_type_road_0048 ?next - road_type_road_0272)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0049-road_0050
    :parameters (?v - vehicle ?r - road_type_road_0049 ?next - road_type_road_0050)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0049-road_0051
    :parameters (?v - vehicle ?r - road_type_road_0049 ?next - road_type_road_0051)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0050-macro_0030
    :parameters (?v - vehicle ?r - road_type_road_0050 ?next - road_type_macro_0030)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0051-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0051 ?next - road_type_road_0046)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0051-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0051 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0052-road_0062
    :parameters (?v - vehicle ?r - road_type_road_0052 ?next - road_type_road_0062)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0052-road_0063
    :parameters (?v - vehicle ?r - road_type_road_0052 ?next - road_type_road_0063)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0053-road_0052
    :parameters (?v - vehicle ?r - road_type_road_0053 ?next - road_type_road_0052)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0058-road_0385
    :parameters (?v - vehicle ?r - road_type_road_0058 ?next - road_type_road_0385)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0058-road_0386
    :parameters (?v - vehicle ?r - road_type_road_0058 ?next - road_type_road_0386)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0059-road_0380
    :parameters (?v - vehicle ?r - road_type_road_0059 ?next - road_type_road_0380)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0059-road_0381
    :parameters (?v - vehicle ?r - road_type_road_0059 ?next - road_type_road_0381)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0061-road_0058
    :parameters (?v - vehicle ?r - road_type_road_0061 ?next - road_type_road_0058)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0062-road_0074
    :parameters (?v - vehicle ?r - road_type_road_0062 ?next - road_type_road_0074)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0063-road_0384
    :parameters (?v - vehicle ?r - road_type_road_0063 ?next - road_type_road_0384)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0064-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0064 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0064-road_0059
    :parameters (?v - vehicle ?r - road_type_road_0064 ?next - road_type_road_0059)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0064-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0064 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0065-road_0368
    :parameters (?v - vehicle ?r - road_type_road_0065 ?next - road_type_road_0368)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0065-road_0369
    :parameters (?v - vehicle ?r - road_type_road_0065 ?next - road_type_road_0369)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0065-road_0370
    :parameters (?v - vehicle ?r - road_type_road_0065 ?next - road_type_road_0370)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0070
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0070)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0071)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0072)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0073)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067-road_0311
    :parameters (?v - vehicle ?r - road_type_road_0067 ?next - road_type_road_0311)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067-road_0312
    :parameters (?v - vehicle ?r - road_type_road_0067 ?next - road_type_road_0312)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0068-road_0451
    :parameters (?v - vehicle ?r - road_type_road_0068 ?next - road_type_road_0451)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0068-road_0452
    :parameters (?v - vehicle ?r - road_type_road_0068 ?next - road_type_road_0452)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0069-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0069 ?next - road_type_road_0124)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0070-road_0309
    :parameters (?v - vehicle ?r - road_type_road_0070 ?next - road_type_road_0309)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0070-road_0310
    :parameters (?v - vehicle ?r - road_type_road_0070 ?next - road_type_road_0310)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0071-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0071 ?next - road_type_road_0125)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0075)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0076)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0077
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0077)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0066)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0068)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0074-road_0064
    :parameters (?v - vehicle ?r - road_type_road_0074 ?next - road_type_road_0064)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0075-macro_0005
    :parameters (?v - vehicle ?r - road_type_road_0075 ?next - road_type_macro_0005)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0075-road_0053
    :parameters (?v - vehicle ?r - road_type_road_0075 ?next - road_type_road_0053)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0076-road_0074
    :parameters (?v - vehicle ?r - road_type_road_0076 ?next - road_type_road_0074)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0077-road_0070
    :parameters (?v - vehicle ?r - road_type_road_0077 ?next - road_type_road_0070)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0077-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0077 ?next - road_type_road_0071)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0077-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0077 ?next - road_type_road_0072)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0077-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0077 ?next - road_type_road_0073)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0078-macro_0010
    :parameters (?v - vehicle ?r - road_type_road_0078 ?next - road_type_macro_0010)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0078-road_0090
    :parameters (?v - vehicle ?r - road_type_road_0078 ?next - road_type_road_0090)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0079-road_0008
    :parameters (?v - vehicle ?r - road_type_road_0079 ?next - road_type_road_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-road_0082
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_road_0082)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_road_0083)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0081-road_0006
    :parameters (?v - vehicle ?r - road_type_road_0081 ?next - road_type_road_0006)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0081-road_0007
    :parameters (?v - vehicle ?r - road_type_road_0081 ?next - road_type_road_0007)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0082-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0082 ?next - road_type_road_0140)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0083-road_0376
    :parameters (?v - vehicle ?r - road_type_road_0083 ?next - road_type_road_0376)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0084-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0084 ?next - road_type_road_0044)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0084-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0084 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0085-road_0204
    :parameters (?v - vehicle ?r - road_type_road_0085 ?next - road_type_road_0204)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0085-road_0205
    :parameters (?v - vehicle ?r - road_type_road_0085 ?next - road_type_road_0205)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0086-road_0100
    :parameters (?v - vehicle ?r - road_type_road_0086 ?next - road_type_road_0100)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0086-road_0101
    :parameters (?v - vehicle ?r - road_type_road_0086 ?next - road_type_road_0101)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0087-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0087 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0087-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0087 ?next - road_type_road_0088)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0088 ?next - road_type_road_0086)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088-road_0087
    :parameters (?v - vehicle ?r - road_type_road_0088 ?next - road_type_road_0087)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0090-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0090 ?next - road_type_road_0080)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0094-road_0198
    :parameters (?v - vehicle ?r - road_type_road_0094 ?next - road_type_road_0198)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0094-road_0199
    :parameters (?v - vehicle ?r - road_type_road_0094 ?next - road_type_road_0199)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0094-road_0200
    :parameters (?v - vehicle ?r - road_type_road_0094 ?next - road_type_road_0200)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0095-road_0015
    :parameters (?v - vehicle ?r - road_type_road_0095 ?next - road_type_road_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0096-road_0107
    :parameters (?v - vehicle ?r - road_type_road_0096 ?next - road_type_road_0107)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0097-road_0032
    :parameters (?v - vehicle ?r - road_type_road_0097 ?next - road_type_road_0032)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0099-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0099 ?next - road_type_road_0086)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0099-road_0087
    :parameters (?v - vehicle ?r - road_type_road_0099 ?next - road_type_road_0087)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0100-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0100 ?next - road_type_road_0102)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0100-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0100 ?next - road_type_road_0103)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0101-road_0104
    :parameters (?v - vehicle ?r - road_type_road_0101 ?next - road_type_road_0104)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-road_0033
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_road_0033)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-road_0034
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_road_0034)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_road_0035)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103-road_0260
    :parameters (?v - vehicle ?r - road_type_road_0103 ?next - road_type_road_0260)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103-road_0261
    :parameters (?v - vehicle ?r - road_type_road_0103 ?next - road_type_road_0261)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103-road_0262
    :parameters (?v - vehicle ?r - road_type_road_0103 ?next - road_type_road_0262)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0104-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0104 ?next - road_type_road_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0104-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0104 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0105-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0105 ?next - road_type_road_0086)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0105-road_0087
    :parameters (?v - vehicle ?r - road_type_road_0105 ?next - road_type_road_0087)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0107-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0107 ?next - road_type_road_0108)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0107-road_0109
    :parameters (?v - vehicle ?r - road_type_road_0107 ?next - road_type_road_0109)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0108-road_0290
    :parameters (?v - vehicle ?r - road_type_road_0108 ?next - road_type_road_0290)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0108-road_0291
    :parameters (?v - vehicle ?r - road_type_road_0108 ?next - road_type_road_0291)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0109-road_0110
    :parameters (?v - vehicle ?r - road_type_road_0109 ?next - road_type_road_0110)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0109-road_0111
    :parameters (?v - vehicle ?r - road_type_road_0109 ?next - road_type_road_0111)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0110-road_0457
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_road_0457)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0110-road_0458
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_road_0458)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0111-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0111 ?next - road_type_road_0096)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0112-road_0113
    :parameters (?v - vehicle ?r - road_type_road_0112 ?next - road_type_road_0113)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0112-road_0114
    :parameters (?v - vehicle ?r - road_type_road_0112 ?next - road_type_road_0114)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0113-road_0115
    :parameters (?v - vehicle ?r - road_type_road_0113 ?next - road_type_road_0115)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0113-road_0116
    :parameters (?v - vehicle ?r - road_type_road_0113 ?next - road_type_road_0116)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0114-road_0317
    :parameters (?v - vehicle ?r - road_type_road_0114 ?next - road_type_road_0317)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0114-road_0318
    :parameters (?v - vehicle ?r - road_type_road_0114 ?next - road_type_road_0318)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0115-road_0113
    :parameters (?v - vehicle ?r - road_type_road_0115 ?next - road_type_road_0113)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0115-road_0114
    :parameters (?v - vehicle ?r - road_type_road_0115 ?next - road_type_road_0114)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0117-macro_0002
    :parameters (?v - vehicle ?r - road_type_road_0117 ?next - road_type_macro_0002)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0117-macro_0003
    :parameters (?v - vehicle ?r - road_type_road_0117 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0118-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0118 ?next - road_type_road_0080)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0120-road_0425
    :parameters (?v - vehicle ?r - road_type_road_0120 ?next - road_type_road_0425)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0121-road_0315
    :parameters (?v - vehicle ?r - road_type_road_0121 ?next - road_type_road_0315)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0121-road_0316
    :parameters (?v - vehicle ?r - road_type_road_0121 ?next - road_type_road_0316)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0122-road_0392
    :parameters (?v - vehicle ?r - road_type_road_0122 ?next - road_type_road_0392)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123-road_0250
    :parameters (?v - vehicle ?r - road_type_road_0123 ?next - road_type_road_0250)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123-road_0251
    :parameters (?v - vehicle ?r - road_type_road_0123 ?next - road_type_road_0251)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0124-road_0422
    :parameters (?v - vehicle ?r - road_type_road_0124 ?next - road_type_road_0422)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0124-road_0423
    :parameters (?v - vehicle ?r - road_type_road_0124 ?next - road_type_road_0423)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0125-road_0281
    :parameters (?v - vehicle ?r - road_type_road_0125 ?next - road_type_road_0281)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0125-road_0282
    :parameters (?v - vehicle ?r - road_type_road_0125 ?next - road_type_road_0282)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126-macro_0026
    :parameters (?v - vehicle ?r - road_type_road_0126 ?next - road_type_macro_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126-road_0283
    :parameters (?v - vehicle ?r - road_type_road_0126 ?next - road_type_road_0283)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126-road_0285
    :parameters (?v - vehicle ?r - road_type_road_0126 ?next - road_type_road_0285)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0127-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0127 ?next - road_type_road_0129)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0128-road_0498
    :parameters (?v - vehicle ?r - road_type_road_0128 ?next - road_type_road_0498)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0129-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0129 ?next - road_type_road_0126)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0129-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0129 ?next - road_type_road_0127)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0129-road_0128
    :parameters (?v - vehicle ?r - road_type_road_0129 ?next - road_type_road_0128)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-macro_0026
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_macro_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-road_0283
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_road_0283)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-road_0285
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_road_0285)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0131-road_0184
    :parameters (?v - vehicle ?r - road_type_road_0131 ?next - road_type_road_0184)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0131-road_0185
    :parameters (?v - vehicle ?r - road_type_road_0131 ?next - road_type_road_0185)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0132-road_0216
    :parameters (?v - vehicle ?r - road_type_road_0132 ?next - road_type_road_0216)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0132-road_0217
    :parameters (?v - vehicle ?r - road_type_road_0132 ?next - road_type_road_0217)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0133-road_0460
    :parameters (?v - vehicle ?r - road_type_road_0133 ?next - road_type_road_0460)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0133-road_0461
    :parameters (?v - vehicle ?r - road_type_road_0133 ?next - road_type_road_0461)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0134-road_0432
    :parameters (?v - vehicle ?r - road_type_road_0134 ?next - road_type_road_0432)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0134-road_0433
    :parameters (?v - vehicle ?r - road_type_road_0134 ?next - road_type_road_0433)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0135-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0135 ?next - road_type_road_0133)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0137-macro_0015
    :parameters (?v - vehicle ?r - road_type_road_0137 ?next - road_type_macro_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0138-road_0254
    :parameters (?v - vehicle ?r - road_type_road_0138 ?next - road_type_road_0254)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0139-road_0209
    :parameters (?v - vehicle ?r - road_type_road_0139 ?next - road_type_road_0209)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0139-road_0210
    :parameters (?v - vehicle ?r - road_type_road_0139 ?next - road_type_road_0210)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0140-road_0117
    :parameters (?v - vehicle ?r - road_type_road_0140 ?next - road_type_road_0117)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0143-road_0041
    :parameters (?v - vehicle ?r - road_type_road_0143 ?next - road_type_road_0041)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0143-road_0042
    :parameters (?v - vehicle ?r - road_type_road_0143 ?next - road_type_road_0042)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0144-road_0145
    :parameters (?v - vehicle ?r - road_type_road_0144 ?next - road_type_road_0145)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0145-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0145 ?next - road_type_road_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0145-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0145 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0146-road_0143
    :parameters (?v - vehicle ?r - road_type_road_0146 ?next - road_type_road_0143)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0146-road_0144
    :parameters (?v - vehicle ?r - road_type_road_0146 ?next - road_type_road_0144)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0147-road_0437
    :parameters (?v - vehicle ?r - road_type_road_0147 ?next - road_type_road_0437)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0147-road_0438
    :parameters (?v - vehicle ?r - road_type_road_0147 ?next - road_type_road_0438)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0148-road_0105
    :parameters (?v - vehicle ?r - road_type_road_0148 ?next - road_type_road_0105)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0149-road_0473
    :parameters (?v - vehicle ?r - road_type_road_0149 ?next - road_type_road_0473)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0150-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0150 ?next - road_type_road_0148)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0151-macro_0001
    :parameters (?v - vehicle ?r - road_type_road_0151 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0151-road_0016
    :parameters (?v - vehicle ?r - road_type_road_0151 ?next - road_type_road_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0151-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0151 ?next - road_type_road_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0152-road_0453
    :parameters (?v - vehicle ?r - road_type_road_0152 ?next - road_type_road_0453)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0152-road_0454
    :parameters (?v - vehicle ?r - road_type_road_0152 ?next - road_type_road_0454)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0153-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0153 ?next - road_type_road_0149)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0153-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0153 ?next - road_type_road_0150)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0155-road_0297
    :parameters (?v - vehicle ?r - road_type_road_0155 ?next - road_type_road_0297)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0157-macro_0017
    :parameters (?v - vehicle ?r - road_type_road_0157 ?next - road_type_macro_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0157-road_0155
    :parameters (?v - vehicle ?r - road_type_road_0157 ?next - road_type_road_0155)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0158-road_0294
    :parameters (?v - vehicle ?r - road_type_road_0158 ?next - road_type_road_0294)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0159-road_0033
    :parameters (?v - vehicle ?r - road_type_road_0159 ?next - road_type_road_0033)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0159-road_0034
    :parameters (?v - vehicle ?r - road_type_road_0159 ?next - road_type_road_0034)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0159-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0159 ?next - road_type_road_0035)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0161-road_0390
    :parameters (?v - vehicle ?r - road_type_road_0161 ?next - road_type_road_0390)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0162-road_0391
    :parameters (?v - vehicle ?r - road_type_road_0162 ?next - road_type_road_0391)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0163-road_0489
    :parameters (?v - vehicle ?r - road_type_road_0163 ?next - road_type_road_0489)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0163-road_0490
    :parameters (?v - vehicle ?r - road_type_road_0163 ?next - road_type_road_0490)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0164-road_0165
    :parameters (?v - vehicle ?r - road_type_road_0164 ?next - road_type_road_0165)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0164-road_0166
    :parameters (?v - vehicle ?r - road_type_road_0164 ?next - road_type_road_0166)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0164-road_0167
    :parameters (?v - vehicle ?r - road_type_road_0164 ?next - road_type_road_0167)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0165-road_0163
    :parameters (?v - vehicle ?r - road_type_road_0165 ?next - road_type_road_0163)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0165-road_0164
    :parameters (?v - vehicle ?r - road_type_road_0165 ?next - road_type_road_0164)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0166-road_0354
    :parameters (?v - vehicle ?r - road_type_road_0166 ?next - road_type_road_0354)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0166-road_0355
    :parameters (?v - vehicle ?r - road_type_road_0166 ?next - road_type_road_0355)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0166-road_0356
    :parameters (?v - vehicle ?r - road_type_road_0166 ?next - road_type_road_0356)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0167-road_0347
    :parameters (?v - vehicle ?r - road_type_road_0167 ?next - road_type_road_0347)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0167-road_0348
    :parameters (?v - vehicle ?r - road_type_road_0167 ?next - road_type_road_0348)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0168-road_0331
    :parameters (?v - vehicle ?r - road_type_road_0168 ?next - road_type_road_0331)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0168-road_0332
    :parameters (?v - vehicle ?r - road_type_road_0168 ?next - road_type_road_0332)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0169-road_0371
    :parameters (?v - vehicle ?r - road_type_road_0169 ?next - road_type_road_0371)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0169-road_0372
    :parameters (?v - vehicle ?r - road_type_road_0169 ?next - road_type_road_0372)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0171-road_0417
    :parameters (?v - vehicle ?r - road_type_road_0171 ?next - road_type_road_0417)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0172-road_0335
    :parameters (?v - vehicle ?r - road_type_road_0172 ?next - road_type_road_0335)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0172-road_0336
    :parameters (?v - vehicle ?r - road_type_road_0172 ?next - road_type_road_0336)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0172-road_0337
    :parameters (?v - vehicle ?r - road_type_road_0172 ?next - road_type_road_0337)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0173-road_0171
    :parameters (?v - vehicle ?r - road_type_road_0173 ?next - road_type_road_0171)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0173-road_0172
    :parameters (?v - vehicle ?r - road_type_road_0173 ?next - road_type_road_0172)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0174-macro_0027
    :parameters (?v - vehicle ?r - road_type_road_0174 ?next - road_type_macro_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0174-road_0307
    :parameters (?v - vehicle ?r - road_type_road_0174 ?next - road_type_road_0307)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0175-road_0247
    :parameters (?v - vehicle ?r - road_type_road_0175 ?next - road_type_road_0247)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0175-road_0248
    :parameters (?v - vehicle ?r - road_type_road_0175 ?next - road_type_road_0248)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0175-road_0249
    :parameters (?v - vehicle ?r - road_type_road_0175 ?next - road_type_road_0249)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0176-road_0178
    :parameters (?v - vehicle ?r - road_type_road_0176 ?next - road_type_road_0178)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0176-road_0179
    :parameters (?v - vehicle ?r - road_type_road_0176 ?next - road_type_road_0179)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0176-road_0180
    :parameters (?v - vehicle ?r - road_type_road_0176 ?next - road_type_road_0180)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0177-road_0022
    :parameters (?v - vehicle ?r - road_type_road_0177 ?next - road_type_road_0022)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0177-road_0023
    :parameters (?v - vehicle ?r - road_type_road_0177 ?next - road_type_road_0023)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0178-road_0238
    :parameters (?v - vehicle ?r - road_type_road_0178 ?next - road_type_road_0238)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0178-road_0239
    :parameters (?v - vehicle ?r - road_type_road_0178 ?next - road_type_road_0239)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0178-road_0240
    :parameters (?v - vehicle ?r - road_type_road_0178 ?next - road_type_road_0240)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0178-road_0241
    :parameters (?v - vehicle ?r - road_type_road_0178 ?next - road_type_road_0241)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0179-road_0175
    :parameters (?v - vehicle ?r - road_type_road_0179 ?next - road_type_road_0175)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0179-road_0176
    :parameters (?v - vehicle ?r - road_type_road_0179 ?next - road_type_road_0176)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0179-road_0177
    :parameters (?v - vehicle ?r - road_type_road_0179 ?next - road_type_road_0177)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0180-road_0242
    :parameters (?v - vehicle ?r - road_type_road_0180 ?next - road_type_road_0242)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0181-road_0188
    :parameters (?v - vehicle ?r - road_type_road_0181 ?next - road_type_road_0188)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0182-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0182 ?next - road_type_road_0044)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0182-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0182 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0183-road_0186
    :parameters (?v - vehicle ?r - road_type_road_0183 ?next - road_type_road_0186)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0183-road_0187
    :parameters (?v - vehicle ?r - road_type_road_0183 ?next - road_type_road_0187)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0184-road_0407
    :parameters (?v - vehicle ?r - road_type_road_0184 ?next - road_type_road_0407)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0184-road_0408
    :parameters (?v - vehicle ?r - road_type_road_0184 ?next - road_type_road_0408)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0185-road_0130
    :parameters (?v - vehicle ?r - road_type_road_0185 ?next - road_type_road_0130)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0185-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0185 ?next - road_type_road_0131)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0185-road_0132
    :parameters (?v - vehicle ?r - road_type_road_0185 ?next - road_type_road_0132)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0186-macro_0026
    :parameters (?v - vehicle ?r - road_type_road_0186 ?next - road_type_macro_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0186-road_0283
    :parameters (?v - vehicle ?r - road_type_road_0186 ?next - road_type_road_0283)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0186-road_0285
    :parameters (?v - vehicle ?r - road_type_road_0186 ?next - road_type_road_0285)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0187-road_0181
    :parameters (?v - vehicle ?r - road_type_road_0187 ?next - road_type_road_0181)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0187-road_0182
    :parameters (?v - vehicle ?r - road_type_road_0187 ?next - road_type_road_0182)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0187-road_0183
    :parameters (?v - vehicle ?r - road_type_road_0187 ?next - road_type_road_0183)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0188-road_0377
    :parameters (?v - vehicle ?r - road_type_road_0188 ?next - road_type_road_0377)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0189-road_0304
    :parameters (?v - vehicle ?r - road_type_road_0189 ?next - road_type_road_0304)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0189-road_0305
    :parameters (?v - vehicle ?r - road_type_road_0189 ?next - road_type_road_0305)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0190-road_0188
    :parameters (?v - vehicle ?r - road_type_road_0190 ?next - road_type_road_0188)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0191-road_0474
    :parameters (?v - vehicle ?r - road_type_road_0191 ?next - road_type_road_0474)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0191-road_0475
    :parameters (?v - vehicle ?r - road_type_road_0191 ?next - road_type_road_0475)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0191-road_0476
    :parameters (?v - vehicle ?r - road_type_road_0191 ?next - road_type_road_0476)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0192-road_0197
    :parameters (?v - vehicle ?r - road_type_road_0192 ?next - road_type_road_0197)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0193-road_0195
    :parameters (?v - vehicle ?r - road_type_road_0193 ?next - road_type_road_0195)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0193-road_0196
    :parameters (?v - vehicle ?r - road_type_road_0193 ?next - road_type_road_0196)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0194-road_0401
    :parameters (?v - vehicle ?r - road_type_road_0194 ?next - road_type_road_0401)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0195-macro_0000
    :parameters (?v - vehicle ?r - road_type_road_0195 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0196-road_0192
    :parameters (?v - vehicle ?r - road_type_road_0196 ?next - road_type_road_0192)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0196-road_0193
    :parameters (?v - vehicle ?r - road_type_road_0196 ?next - road_type_road_0193)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0196-road_0194
    :parameters (?v - vehicle ?r - road_type_road_0196 ?next - road_type_road_0194)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0197-road_0015
    :parameters (?v - vehicle ?r - road_type_road_0197 ?next - road_type_road_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0198-road_0375
    :parameters (?v - vehicle ?r - road_type_road_0198 ?next - road_type_road_0375)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0199-road_0455
    :parameters (?v - vehicle ?r - road_type_road_0199 ?next - road_type_road_0455)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0200-road_0094
    :parameters (?v - vehicle ?r - road_type_road_0200 ?next - road_type_road_0094)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0200-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0200 ?next - road_type_road_0095)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0201-road_0487
    :parameters (?v - vehicle ?r - road_type_road_0201 ?next - road_type_road_0487)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0201-road_0488
    :parameters (?v - vehicle ?r - road_type_road_0201 ?next - road_type_road_0488)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0202-road_0485
    :parameters (?v - vehicle ?r - road_type_road_0202 ?next - road_type_road_0485)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0202-road_0486
    :parameters (?v - vehicle ?r - road_type_road_0202 ?next - road_type_road_0486)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0203-road_0366
    :parameters (?v - vehicle ?r - road_type_road_0203 ?next - road_type_road_0366)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0203-road_0367
    :parameters (?v - vehicle ?r - road_type_road_0203 ?next - road_type_road_0367)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0204-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0204 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0204-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0204 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0205-road_0456
    :parameters (?v - vehicle ?r - road_type_road_0205 ?next - road_type_road_0456)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0206-road_0138
    :parameters (?v - vehicle ?r - road_type_road_0206 ?next - road_type_road_0138)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0206-road_0139
    :parameters (?v - vehicle ?r - road_type_road_0206 ?next - road_type_road_0139)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0207-road_0206
    :parameters (?v - vehicle ?r - road_type_road_0207 ?next - road_type_road_0206)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0208-road_0211
    :parameters (?v - vehicle ?r - road_type_road_0208 ?next - road_type_road_0211)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0208-road_0212
    :parameters (?v - vehicle ?r - road_type_road_0208 ?next - road_type_road_0212)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0209-road_0207
    :parameters (?v - vehicle ?r - road_type_road_0209 ?next - road_type_road_0207)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0209-road_0208
    :parameters (?v - vehicle ?r - road_type_road_0209 ?next - road_type_road_0208)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0210-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0210 ?next - road_type_road_0140)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0211-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0211 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0211-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0211 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0212-road_0207
    :parameters (?v - vehicle ?r - road_type_road_0212 ?next - road_type_road_0207)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0212-road_0208
    :parameters (?v - vehicle ?r - road_type_road_0212 ?next - road_type_road_0208)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0213-road_0265
    :parameters (?v - vehicle ?r - road_type_road_0213 ?next - road_type_road_0265)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0213-road_0266
    :parameters (?v - vehicle ?r - road_type_road_0213 ?next - road_type_road_0266)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0215-road_0300
    :parameters (?v - vehicle ?r - road_type_road_0215 ?next - road_type_road_0300)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0216-road_0213
    :parameters (?v - vehicle ?r - road_type_road_0216 ?next - road_type_road_0213)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0217-road_0099
    :parameters (?v - vehicle ?r - road_type_road_0217 ?next - road_type_road_0099)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0218-road_0094
    :parameters (?v - vehicle ?r - road_type_road_0218 ?next - road_type_road_0094)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0218-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0218 ?next - road_type_road_0095)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0219-road_0482
    :parameters (?v - vehicle ?r - road_type_road_0219 ?next - road_type_road_0482)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0219-road_0483
    :parameters (?v - vehicle ?r - road_type_road_0219 ?next - road_type_road_0483)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0220-road_0221
    :parameters (?v - vehicle ?r - road_type_road_0220 ?next - road_type_road_0221)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0220-road_0222
    :parameters (?v - vehicle ?r - road_type_road_0220 ?next - road_type_road_0222)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0220-road_0223
    :parameters (?v - vehicle ?r - road_type_road_0220 ?next - road_type_road_0223)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0221-road_0232
    :parameters (?v - vehicle ?r - road_type_road_0221 ?next - road_type_road_0232)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0221-road_0233
    :parameters (?v - vehicle ?r - road_type_road_0221 ?next - road_type_road_0233)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0221-road_0234
    :parameters (?v - vehicle ?r - road_type_road_0221 ?next - road_type_road_0234)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0222-road_0220
    :parameters (?v - vehicle ?r - road_type_road_0222 ?next - road_type_road_0220)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0223-macro_0023
    :parameters (?v - vehicle ?r - road_type_road_0223 ?next - road_type_macro_0023)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0223-macro_0024
    :parameters (?v - vehicle ?r - road_type_road_0223 ?next - road_type_macro_0024)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0226-road_0227
    :parameters (?v - vehicle ?r - road_type_road_0226 ?next - road_type_road_0227)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0226-road_0228
    :parameters (?v - vehicle ?r - road_type_road_0226 ?next - road_type_road_0228)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0227-macro_0021
    :parameters (?v - vehicle ?r - road_type_road_0227 ?next - road_type_macro_0021)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0227-macro_0022
    :parameters (?v - vehicle ?r - road_type_road_0227 ?next - road_type_macro_0022)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0227-road_0226
    :parameters (?v - vehicle ?r - road_type_road_0227 ?next - road_type_road_0226)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0228-road_0403
    :parameters (?v - vehicle ?r - road_type_road_0228 ?next - road_type_road_0403)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0228-road_0404
    :parameters (?v - vehicle ?r - road_type_road_0228 ?next - road_type_road_0404)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0232-road_0235
    :parameters (?v - vehicle ?r - road_type_road_0232 ?next - road_type_road_0235)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0232-road_0236
    :parameters (?v - vehicle ?r - road_type_road_0232 ?next - road_type_road_0236)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0232-road_0237
    :parameters (?v - vehicle ?r - road_type_road_0232 ?next - road_type_road_0237)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0233-road_0374
    :parameters (?v - vehicle ?r - road_type_road_0233 ?next - road_type_road_0374)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0234-road_0221
    :parameters (?v - vehicle ?r - road_type_road_0234 ?next - road_type_road_0221)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0234-road_0222
    :parameters (?v - vehicle ?r - road_type_road_0234 ?next - road_type_road_0222)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0234-road_0223
    :parameters (?v - vehicle ?r - road_type_road_0234 ?next - road_type_road_0223)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0235-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0235 ?next - road_type_road_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0235-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0235 ?next - road_type_road_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0235-road_0021
    :parameters (?v - vehicle ?r - road_type_road_0235 ?next - road_type_road_0021)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0236-road_0232
    :parameters (?v - vehicle ?r - road_type_road_0236 ?next - road_type_road_0232)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0236-road_0233
    :parameters (?v - vehicle ?r - road_type_road_0236 ?next - road_type_road_0233)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0236-road_0234
    :parameters (?v - vehicle ?r - road_type_road_0236 ?next - road_type_road_0234)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0237-road_0373
    :parameters (?v - vehicle ?r - road_type_road_0237 ?next - road_type_road_0373)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0238-road_0443
    :parameters (?v - vehicle ?r - road_type_road_0238 ?next - road_type_road_0443)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0238-road_0444
    :parameters (?v - vehicle ?r - road_type_road_0238 ?next - road_type_road_0444)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0239-road_0243
    :parameters (?v - vehicle ?r - road_type_road_0239 ?next - road_type_road_0243)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0240-road_0178
    :parameters (?v - vehicle ?r - road_type_road_0240 ?next - road_type_road_0178)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0240-road_0179
    :parameters (?v - vehicle ?r - road_type_road_0240 ?next - road_type_road_0179)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0240-road_0180
    :parameters (?v - vehicle ?r - road_type_road_0240 ?next - road_type_road_0180)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0242-road_0244
    :parameters (?v - vehicle ?r - road_type_road_0242 ?next - road_type_road_0244)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0242-road_0245
    :parameters (?v - vehicle ?r - road_type_road_0242 ?next - road_type_road_0245)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0242-road_0246
    :parameters (?v - vehicle ?r - road_type_road_0242 ?next - road_type_road_0246)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0243-road_0242
    :parameters (?v - vehicle ?r - road_type_road_0243 ?next - road_type_road_0242)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0244-road_0243
    :parameters (?v - vehicle ?r - road_type_road_0244 ?next - road_type_road_0243)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0245-road_0499
    :parameters (?v - vehicle ?r - road_type_road_0245 ?next - road_type_road_0499)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0245-road_0500
    :parameters (?v - vehicle ?r - road_type_road_0245 ?next - road_type_road_0500)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0246-road_0468
    :parameters (?v - vehicle ?r - road_type_road_0246 ?next - road_type_road_0468)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0247-road_0464
    :parameters (?v - vehicle ?r - road_type_road_0247 ?next - road_type_road_0464)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0248-road_0175
    :parameters (?v - vehicle ?r - road_type_road_0248 ?next - road_type_road_0175)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0248-road_0176
    :parameters (?v - vehicle ?r - road_type_road_0248 ?next - road_type_road_0176)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0248-road_0177
    :parameters (?v - vehicle ?r - road_type_road_0248 ?next - road_type_road_0177)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0249-road_0482
    :parameters (?v - vehicle ?r - road_type_road_0249 ?next - road_type_road_0482)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0249-road_0483
    :parameters (?v - vehicle ?r - road_type_road_0249 ?next - road_type_road_0483)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0250-road_0123
    :parameters (?v - vehicle ?r - road_type_road_0250 ?next - road_type_road_0123)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0251-road_0328
    :parameters (?v - vehicle ?r - road_type_road_0251 ?next - road_type_road_0328)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0251-road_0329
    :parameters (?v - vehicle ?r - road_type_road_0251 ?next - road_type_road_0329)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0251-road_0330
    :parameters (?v - vehicle ?r - road_type_road_0251 ?next - road_type_road_0330)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0252-macro_0028
    :parameters (?v - vehicle ?r - road_type_road_0252 ?next - road_type_macro_0028)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0253-road_0290
    :parameters (?v - vehicle ?r - road_type_road_0253 ?next - road_type_road_0290)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0253-road_0291
    :parameters (?v - vehicle ?r - road_type_road_0253 ?next - road_type_road_0291)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0254-road_0255
    :parameters (?v - vehicle ?r - road_type_road_0254 ?next - road_type_road_0255)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0255-road_0117
    :parameters (?v - vehicle ?r - road_type_road_0255 ?next - road_type_road_0117)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0256-road_0270
    :parameters (?v - vehicle ?r - road_type_road_0256 ?next - road_type_road_0270)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0257-macro_0030
    :parameters (?v - vehicle ?r - road_type_road_0257 ?next - road_type_macro_0030)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0258-road_0269
    :parameters (?v - vehicle ?r - road_type_road_0258 ?next - road_type_road_0269)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0259-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0259 ?next - road_type_road_0046)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0259-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0259 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0260-road_0263
    :parameters (?v - vehicle ?r - road_type_road_0260 ?next - road_type_road_0263)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0260-road_0264
    :parameters (?v - vehicle ?r - road_type_road_0260 ?next - road_type_road_0264)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0261-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0261 ?next - road_type_road_0102)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0261-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0261 ?next - road_type_road_0103)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0262-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0262 ?next - road_type_road_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0262-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0262 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0263-road_0298
    :parameters (?v - vehicle ?r - road_type_road_0263 ?next - road_type_road_0298)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0264-road_0104
    :parameters (?v - vehicle ?r - road_type_road_0264 ?next - road_type_road_0104)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0265-road_0301
    :parameters (?v - vehicle ?r - road_type_road_0265 ?next - road_type_road_0301)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0266-road_0292
    :parameters (?v - vehicle ?r - road_type_road_0266 ?next - road_type_road_0292)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0266-road_0293
    :parameters (?v - vehicle ?r - road_type_road_0266 ?next - road_type_road_0293)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0269-road_0257
    :parameters (?v - vehicle ?r - road_type_road_0269 ?next - road_type_road_0257)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0269-road_0258
    :parameters (?v - vehicle ?r - road_type_road_0269 ?next - road_type_road_0258)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0269-road_0259
    :parameters (?v - vehicle ?r - road_type_road_0269 ?next - road_type_road_0259)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0270-road_0048
    :parameters (?v - vehicle ?r - road_type_road_0270 ?next - road_type_road_0048)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0270-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0270 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0272-road_0273
    :parameters (?v - vehicle ?r - road_type_road_0272 ?next - road_type_road_0273)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0272-road_0274
    :parameters (?v - vehicle ?r - road_type_road_0272 ?next - road_type_road_0274)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0272-road_0275
    :parameters (?v - vehicle ?r - road_type_road_0272 ?next - road_type_road_0275)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0273-road_0286
    :parameters (?v - vehicle ?r - road_type_road_0273 ?next - road_type_road_0286)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0274-road_0277
    :parameters (?v - vehicle ?r - road_type_road_0274 ?next - road_type_road_0277)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0275-road_0276
    :parameters (?v - vehicle ?r - road_type_road_0275 ?next - road_type_road_0276)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0276-road_0270
    :parameters (?v - vehicle ?r - road_type_road_0276 ?next - road_type_road_0270)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0277-road_0496
    :parameters (?v - vehicle ?r - road_type_road_0277 ?next - road_type_road_0496)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0277-road_0497
    :parameters (?v - vehicle ?r - road_type_road_0277 ?next - road_type_road_0497)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0278-road_0445
    :parameters (?v - vehicle ?r - road_type_road_0278 ?next - road_type_road_0445)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0278-road_0446
    :parameters (?v - vehicle ?r - road_type_road_0278 ?next - road_type_road_0446)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0279-road_0287
    :parameters (?v - vehicle ?r - road_type_road_0279 ?next - road_type_road_0287)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0279-road_0288
    :parameters (?v - vehicle ?r - road_type_road_0279 ?next - road_type_road_0288)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0279-road_0289
    :parameters (?v - vehicle ?r - road_type_road_0279 ?next - road_type_road_0289)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0280-road_0201
    :parameters (?v - vehicle ?r - road_type_road_0280 ?next - road_type_road_0201)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0280-road_0202
    :parameters (?v - vehicle ?r - road_type_road_0280 ?next - road_type_road_0202)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0281-road_0278
    :parameters (?v - vehicle ?r - road_type_road_0281 ?next - road_type_road_0278)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0281-road_0279
    :parameters (?v - vehicle ?r - road_type_road_0281 ?next - road_type_road_0279)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0282-road_0280
    :parameters (?v - vehicle ?r - road_type_road_0282 ?next - road_type_road_0280)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0283-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0283 ?next - road_type_road_0126)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0283-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0283 ?next - road_type_road_0127)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0283-road_0128
    :parameters (?v - vehicle ?r - road_type_road_0283 ?next - road_type_road_0128)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0285-road_0186
    :parameters (?v - vehicle ?r - road_type_road_0285 ?next - road_type_road_0186)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0285-road_0187
    :parameters (?v - vehicle ?r - road_type_road_0285 ?next - road_type_road_0187)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0286-road_0273
    :parameters (?v - vehicle ?r - road_type_road_0286 ?next - road_type_road_0273)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0286-road_0274
    :parameters (?v - vehicle ?r - road_type_road_0286 ?next - road_type_road_0274)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0286-road_0275
    :parameters (?v - vehicle ?r - road_type_road_0286 ?next - road_type_road_0275)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0287-macro_0001
    :parameters (?v - vehicle ?r - road_type_road_0287 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0287-road_0016
    :parameters (?v - vehicle ?r - road_type_road_0287 ?next - road_type_road_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0287-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0287 ?next - road_type_road_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0288-road_0278
    :parameters (?v - vehicle ?r - road_type_road_0288 ?next - road_type_road_0278)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0288-road_0279
    :parameters (?v - vehicle ?r - road_type_road_0288 ?next - road_type_road_0279)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0289-road_0203
    :parameters (?v - vehicle ?r - road_type_road_0289 ?next - road_type_road_0203)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0290-road_0252
    :parameters (?v - vehicle ?r - road_type_road_0290 ?next - road_type_road_0252)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0290-road_0253
    :parameters (?v - vehicle ?r - road_type_road_0290 ?next - road_type_road_0253)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0291-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0291 ?next - road_type_road_0108)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0291-road_0109
    :parameters (?v - vehicle ?r - road_type_road_0291 ?next - road_type_road_0109)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0292-macro_0020
    :parameters (?v - vehicle ?r - road_type_road_0292 ?next - road_type_macro_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0292-road_0215
    :parameters (?v - vehicle ?r - road_type_road_0292 ?next - road_type_road_0215)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0293-road_0299
    :parameters (?v - vehicle ?r - road_type_road_0293 ?next - road_type_road_0299)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action finish-road-static-road_0293
    :parameters (?v - vehicle ?r - road_type_road_0293)
    :precondition (and
      (ready-road ?v ?r)
      (goal-road ?r)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (reached-goal ?v)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0294-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0294 ?next - road_type_road_0157)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0294-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0294 ?next - road_type_road_0158)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0294-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0294 ?next - road_type_road_0159)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0295-macro_0014
    :parameters (?v - vehicle ?r - road_type_road_0295 ?next - road_type_macro_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0297-macro_0017
    :parameters (?v - vehicle ?r - road_type_road_0297 ?next - road_type_macro_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0297-road_0155
    :parameters (?v - vehicle ?r - road_type_road_0297 ?next - road_type_road_0155)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0298-road_0263
    :parameters (?v - vehicle ?r - road_type_road_0298 ?next - road_type_road_0263)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0298-road_0264
    :parameters (?v - vehicle ?r - road_type_road_0298 ?next - road_type_road_0264)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0299-road_0213
    :parameters (?v - vehicle ?r - road_type_road_0299 ?next - road_type_road_0213)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0300-macro_0020
    :parameters (?v - vehicle ?r - road_type_road_0300 ?next - road_type_macro_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0300-road_0215
    :parameters (?v - vehicle ?r - road_type_road_0300 ?next - road_type_road_0215)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0301-road_0184
    :parameters (?v - vehicle ?r - road_type_road_0301 ?next - road_type_road_0184)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0301-road_0185
    :parameters (?v - vehicle ?r - road_type_road_0301 ?next - road_type_road_0185)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0302-road_0474
    :parameters (?v - vehicle ?r - road_type_road_0302 ?next - road_type_road_0474)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0302-road_0475
    :parameters (?v - vehicle ?r - road_type_road_0302 ?next - road_type_road_0475)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0302-road_0476
    :parameters (?v - vehicle ?r - road_type_road_0302 ?next - road_type_road_0476)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0303-road_0377
    :parameters (?v - vehicle ?r - road_type_road_0303 ?next - road_type_road_0377)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0304-road_0186
    :parameters (?v - vehicle ?r - road_type_road_0304 ?next - road_type_road_0186)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0304-road_0187
    :parameters (?v - vehicle ?r - road_type_road_0304 ?next - road_type_road_0187)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0305-road_0493
    :parameters (?v - vehicle ?r - road_type_road_0305 ?next - road_type_road_0493)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0305-road_0494
    :parameters (?v - vehicle ?r - road_type_road_0305 ?next - road_type_road_0494)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0305-road_0495
    :parameters (?v - vehicle ?r - road_type_road_0305 ?next - road_type_road_0495)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0306-road_0493
    :parameters (?v - vehicle ?r - road_type_road_0306 ?next - road_type_road_0493)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0306-road_0494
    :parameters (?v - vehicle ?r - road_type_road_0306 ?next - road_type_road_0494)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0306-road_0495
    :parameters (?v - vehicle ?r - road_type_road_0306 ?next - road_type_road_0495)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0309-road_0484
    :parameters (?v - vehicle ?r - road_type_road_0309 ?next - road_type_road_0484)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0310-road_0064
    :parameters (?v - vehicle ?r - road_type_road_0310 ?next - road_type_road_0064)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0311-road_0484
    :parameters (?v - vehicle ?r - road_type_road_0311 ?next - road_type_road_0484)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0312-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0312 ?next - road_type_road_0066)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0312-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0312 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0312-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0312 ?next - road_type_road_0068)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0312-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0312 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0313-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0313 ?next - road_type_road_0124)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0314-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0314 ?next - road_type_road_0066)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0314-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0314 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0314-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0314 ?next - road_type_road_0068)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0314-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0314 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0315-road_0349
    :parameters (?v - vehicle ?r - road_type_road_0315 ?next - road_type_road_0349)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0315-road_0350
    :parameters (?v - vehicle ?r - road_type_road_0315 ?next - road_type_road_0350)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0316-road_0325
    :parameters (?v - vehicle ?r - road_type_road_0316 ?next - road_type_road_0325)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0317-road_0252
    :parameters (?v - vehicle ?r - road_type_road_0317 ?next - road_type_road_0252)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0317-road_0253
    :parameters (?v - vehicle ?r - road_type_road_0317 ?next - road_type_road_0253)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0318-macro_0028
    :parameters (?v - vehicle ?r - road_type_road_0318 ?next - road_type_macro_0028)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0325-macro_0001
    :parameters (?v - vehicle ?r - road_type_road_0325 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0325-road_0016
    :parameters (?v - vehicle ?r - road_type_road_0325 ?next - road_type_road_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0325-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0325 ?next - road_type_road_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0327-road_0335
    :parameters (?v - vehicle ?r - road_type_road_0327 ?next - road_type_road_0335)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0327-road_0336
    :parameters (?v - vehicle ?r - road_type_road_0327 ?next - road_type_road_0336)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0327-road_0337
    :parameters (?v - vehicle ?r - road_type_road_0327 ?next - road_type_road_0337)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0328-road_0371
    :parameters (?v - vehicle ?r - road_type_road_0328 ?next - road_type_road_0371)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0328-road_0372
    :parameters (?v - vehicle ?r - road_type_road_0328 ?next - road_type_road_0372)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0329-road_0331
    :parameters (?v - vehicle ?r - road_type_road_0329 ?next - road_type_road_0331)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0329-road_0332
    :parameters (?v - vehicle ?r - road_type_road_0329 ?next - road_type_road_0332)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0330-road_0122
    :parameters (?v - vehicle ?r - road_type_road_0330 ?next - road_type_road_0122)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0331-macro_0019
    :parameters (?v - vehicle ?r - road_type_road_0331 ?next - road_type_macro_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0331-road_0168
    :parameters (?v - vehicle ?r - road_type_road_0331 ?next - road_type_road_0168)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0331-road_0169
    :parameters (?v - vehicle ?r - road_type_road_0331 ?next - road_type_road_0169)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0332-macro_0034
    :parameters (?v - vehicle ?r - road_type_road_0332 ?next - road_type_macro_0034)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0333-road_0398
    :parameters (?v - vehicle ?r - road_type_road_0333 ?next - road_type_road_0398)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0334-macro_0032
    :parameters (?v - vehicle ?r - road_type_road_0334 ?next - road_type_macro_0032)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0334-road_0400
    :parameters (?v - vehicle ?r - road_type_road_0334 ?next - road_type_road_0400)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0335-road_0327
    :parameters (?v - vehicle ?r - road_type_road_0335 ?next - road_type_road_0327)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0336-macro_0027
    :parameters (?v - vehicle ?r - road_type_road_0336 ?next - road_type_macro_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0336-road_0307
    :parameters (?v - vehicle ?r - road_type_road_0336 ?next - road_type_road_0307)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0337-road_0171
    :parameters (?v - vehicle ?r - road_type_road_0337 ?next - road_type_road_0171)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0337-road_0172
    :parameters (?v - vehicle ?r - road_type_road_0337 ?next - road_type_road_0172)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0338-road_0171
    :parameters (?v - vehicle ?r - road_type_road_0338 ?next - road_type_road_0171)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0338-road_0172
    :parameters (?v - vehicle ?r - road_type_road_0338 ?next - road_type_road_0172)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0339-road_0163
    :parameters (?v - vehicle ?r - road_type_road_0339 ?next - road_type_road_0163)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0339-road_0164
    :parameters (?v - vehicle ?r - road_type_road_0339 ?next - road_type_road_0164)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0340-road_0338
    :parameters (?v - vehicle ?r - road_type_road_0340 ?next - road_type_road_0338)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0340-road_0339
    :parameters (?v - vehicle ?r - road_type_road_0340 ?next - road_type_road_0339)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0341-road_0342
    :parameters (?v - vehicle ?r - road_type_road_0341 ?next - road_type_road_0342)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0342-road_0340
    :parameters (?v - vehicle ?r - road_type_road_0342 ?next - road_type_road_0340)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0342-road_0341
    :parameters (?v - vehicle ?r - road_type_road_0342 ?next - road_type_road_0341)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0344-macro_0019
    :parameters (?v - vehicle ?r - road_type_road_0344 ?next - road_type_macro_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0344-road_0168
    :parameters (?v - vehicle ?r - road_type_road_0344 ?next - road_type_road_0168)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0344-road_0169
    :parameters (?v - vehicle ?r - road_type_road_0344 ?next - road_type_road_0169)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0345-road_0395
    :parameters (?v - vehicle ?r - road_type_road_0345 ?next - road_type_road_0395)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0346-road_0065
    :parameters (?v - vehicle ?r - road_type_road_0346 ?next - road_type_road_0065)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0347-road_0351
    :parameters (?v - vehicle ?r - road_type_road_0347 ?next - road_type_road_0351)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0347-road_0352
    :parameters (?v - vehicle ?r - road_type_road_0347 ?next - road_type_road_0352)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0347-road_0353
    :parameters (?v - vehicle ?r - road_type_road_0347 ?next - road_type_road_0353)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0348-road_0165
    :parameters (?v - vehicle ?r - road_type_road_0348 ?next - road_type_road_0165)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0348-road_0166
    :parameters (?v - vehicle ?r - road_type_road_0348 ?next - road_type_road_0166)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0348-road_0167
    :parameters (?v - vehicle ?r - road_type_road_0348 ?next - road_type_road_0167)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0349-road_0357
    :parameters (?v - vehicle ?r - road_type_road_0349 ?next - road_type_road_0357)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0349-road_0358
    :parameters (?v - vehicle ?r - road_type_road_0349 ?next - road_type_road_0358)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0349-road_0359
    :parameters (?v - vehicle ?r - road_type_road_0349 ?next - road_type_road_0359)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0350-road_0351
    :parameters (?v - vehicle ?r - road_type_road_0350 ?next - road_type_road_0351)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0350-road_0352
    :parameters (?v - vehicle ?r - road_type_road_0350 ?next - road_type_road_0352)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0350-road_0353
    :parameters (?v - vehicle ?r - road_type_road_0350 ?next - road_type_road_0353)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0351-road_0366
    :parameters (?v - vehicle ?r - road_type_road_0351 ?next - road_type_road_0366)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0351-road_0367
    :parameters (?v - vehicle ?r - road_type_road_0351 ?next - road_type_road_0367)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0352-road_0347
    :parameters (?v - vehicle ?r - road_type_road_0352 ?next - road_type_road_0347)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0352-road_0348
    :parameters (?v - vehicle ?r - road_type_road_0352 ?next - road_type_road_0348)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0353-road_0349
    :parameters (?v - vehicle ?r - road_type_road_0353 ?next - road_type_road_0349)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0353-road_0350
    :parameters (?v - vehicle ?r - road_type_road_0353 ?next - road_type_road_0350)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0354-road_0340
    :parameters (?v - vehicle ?r - road_type_road_0354 ?next - road_type_road_0340)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0354-road_0341
    :parameters (?v - vehicle ?r - road_type_road_0354 ?next - road_type_road_0341)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0355-road_0357
    :parameters (?v - vehicle ?r - road_type_road_0355 ?next - road_type_road_0357)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0355-road_0358
    :parameters (?v - vehicle ?r - road_type_road_0355 ?next - road_type_road_0358)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0355-road_0359
    :parameters (?v - vehicle ?r - road_type_road_0355 ?next - road_type_road_0359)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0356-road_0165
    :parameters (?v - vehicle ?r - road_type_road_0356 ?next - road_type_road_0165)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0356-road_0166
    :parameters (?v - vehicle ?r - road_type_road_0356 ?next - road_type_road_0166)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0356-road_0167
    :parameters (?v - vehicle ?r - road_type_road_0356 ?next - road_type_road_0167)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0357-road_0121
    :parameters (?v - vehicle ?r - road_type_road_0357 ?next - road_type_road_0121)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0358-road_0349
    :parameters (?v - vehicle ?r - road_type_road_0358 ?next - road_type_road_0349)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0358-road_0350
    :parameters (?v - vehicle ?r - road_type_road_0358 ?next - road_type_road_0350)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0359-road_0354
    :parameters (?v - vehicle ?r - road_type_road_0359 ?next - road_type_road_0354)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0359-road_0355
    :parameters (?v - vehicle ?r - road_type_road_0359 ?next - road_type_road_0355)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0359-road_0356
    :parameters (?v - vehicle ?r - road_type_road_0359 ?next - road_type_road_0356)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0360-road_0496
    :parameters (?v - vehicle ?r - road_type_road_0360 ?next - road_type_road_0496)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0360-road_0497
    :parameters (?v - vehicle ?r - road_type_road_0360 ?next - road_type_road_0497)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0361-macro_0005
    :parameters (?v - vehicle ?r - road_type_road_0361 ?next - road_type_macro_0005)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0361-road_0053
    :parameters (?v - vehicle ?r - road_type_road_0361 ?next - road_type_road_0053)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0366-road_0065
    :parameters (?v - vehicle ?r - road_type_road_0366 ?next - road_type_road_0065)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0367-road_0395
    :parameters (?v - vehicle ?r - road_type_road_0367 ?next - road_type_road_0395)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0368-macro_0037
    :parameters (?v - vehicle ?r - road_type_road_0368 ?next - road_type_macro_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0368-macro_0038
    :parameters (?v - vehicle ?r - road_type_road_0368 ?next - road_type_macro_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0369-road_0424
    :parameters (?v - vehicle ?r - road_type_road_0369 ?next - road_type_road_0424)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0370-road_0371
    :parameters (?v - vehicle ?r - road_type_road_0370 ?next - road_type_road_0371)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0370-road_0372
    :parameters (?v - vehicle ?r - road_type_road_0370 ?next - road_type_road_0372)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0371-road_0328
    :parameters (?v - vehicle ?r - road_type_road_0371 ?next - road_type_road_0328)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0371-road_0329
    :parameters (?v - vehicle ?r - road_type_road_0371 ?next - road_type_road_0329)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0371-road_0330
    :parameters (?v - vehicle ?r - road_type_road_0371 ?next - road_type_road_0330)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0372-road_0250
    :parameters (?v - vehicle ?r - road_type_road_0372 ?next - road_type_road_0250)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0372-road_0251
    :parameters (?v - vehicle ?r - road_type_road_0372 ?next - road_type_road_0251)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0373-road_0235
    :parameters (?v - vehicle ?r - road_type_road_0373 ?next - road_type_road_0235)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0373-road_0236
    :parameters (?v - vehicle ?r - road_type_road_0373 ?next - road_type_road_0236)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0373-road_0237
    :parameters (?v - vehicle ?r - road_type_road_0373 ?next - road_type_road_0237)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0374-road_0232
    :parameters (?v - vehicle ?r - road_type_road_0374 ?next - road_type_road_0232)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0374-road_0233
    :parameters (?v - vehicle ?r - road_type_road_0374 ?next - road_type_road_0233)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0374-road_0234
    :parameters (?v - vehicle ?r - road_type_road_0374 ?next - road_type_road_0234)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0375-macro_0011
    :parameters (?v - vehicle ?r - road_type_road_0375 ?next - road_type_macro_0011)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0375-macro_0012
    :parameters (?v - vehicle ?r - road_type_road_0375 ?next - road_type_macro_0012)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0376-road_0211
    :parameters (?v - vehicle ?r - road_type_road_0376 ?next - road_type_road_0211)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0376-road_0212
    :parameters (?v - vehicle ?r - road_type_road_0376 ?next - road_type_road_0212)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0377-road_0409
    :parameters (?v - vehicle ?r - road_type_road_0377 ?next - road_type_road_0409)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0377-road_0410
    :parameters (?v - vehicle ?r - road_type_road_0377 ?next - road_type_road_0410)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0379-road_0430
    :parameters (?v - vehicle ?r - road_type_road_0379 ?next - road_type_road_0430)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0379-road_0431
    :parameters (?v - vehicle ?r - road_type_road_0379 ?next - road_type_road_0431)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0380-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0380 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0380-road_0059
    :parameters (?v - vehicle ?r - road_type_road_0380 ?next - road_type_road_0059)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0380-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0380 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0381-road_0028
    :parameters (?v - vehicle ?r - road_type_road_0381 ?next - road_type_road_0028)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0382-road_0380
    :parameters (?v - vehicle ?r - road_type_road_0382 ?next - road_type_road_0380)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0382-road_0381
    :parameters (?v - vehicle ?r - road_type_road_0382 ?next - road_type_road_0381)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0383-road_0028
    :parameters (?v - vehicle ?r - road_type_road_0383 ?next - road_type_road_0028)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0384-macro_0004
    :parameters (?v - vehicle ?r - road_type_road_0384 ?next - road_type_macro_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0384-road_0030
    :parameters (?v - vehicle ?r - road_type_road_0384 ?next - road_type_road_0030)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0385-road_0058
    :parameters (?v - vehicle ?r - road_type_road_0385 ?next - road_type_road_0058)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0386-road_0027
    :parameters (?v - vehicle ?r - road_type_road_0386 ?next - road_type_road_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0387-road_0385
    :parameters (?v - vehicle ?r - road_type_road_0387 ?next - road_type_road_0385)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0387-road_0386
    :parameters (?v - vehicle ?r - road_type_road_0387 ?next - road_type_road_0386)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0388-road_0027
    :parameters (?v - vehicle ?r - road_type_road_0388 ?next - road_type_road_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0390-road_0391
    :parameters (?v - vehicle ?r - road_type_road_0390 ?next - road_type_road_0391)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0391-road_0392
    :parameters (?v - vehicle ?r - road_type_road_0391 ?next - road_type_road_0392)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0392-macro_0031
    :parameters (?v - vehicle ?r - road_type_road_0392 ?next - road_type_macro_0031)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0392-road_0393
    :parameters (?v - vehicle ?r - road_type_road_0392 ?next - road_type_road_0393)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0393-road_0122
    :parameters (?v - vehicle ?r - road_type_road_0393 ?next - road_type_road_0122)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0395-road_0313
    :parameters (?v - vehicle ?r - road_type_road_0395 ?next - road_type_road_0313)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0395-road_0314
    :parameters (?v - vehicle ?r - road_type_road_0395 ?next - road_type_road_0314)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0396-macro_0037
    :parameters (?v - vehicle ?r - road_type_road_0396 ?next - road_type_macro_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0396-macro_0038
    :parameters (?v - vehicle ?r - road_type_road_0396 ?next - road_type_macro_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0397-road_0347
    :parameters (?v - vehicle ?r - road_type_road_0397 ?next - road_type_road_0347)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0397-road_0348
    :parameters (?v - vehicle ?r - road_type_road_0397 ?next - road_type_road_0348)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0398-road_0311
    :parameters (?v - vehicle ?r - road_type_road_0398 ?next - road_type_road_0311)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0398-road_0312
    :parameters (?v - vehicle ?r - road_type_road_0398 ?next - road_type_road_0312)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0400-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0400 ?next - road_type_road_0124)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0401-road_0192
    :parameters (?v - vehicle ?r - road_type_road_0401 ?next - road_type_road_0192)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0401-road_0193
    :parameters (?v - vehicle ?r - road_type_road_0401 ?next - road_type_road_0193)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0401-road_0194
    :parameters (?v - vehicle ?r - road_type_road_0401 ?next - road_type_road_0194)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0402-road_0403
    :parameters (?v - vehicle ?r - road_type_road_0402 ?next - road_type_road_0403)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0402-road_0404
    :parameters (?v - vehicle ?r - road_type_road_0402 ?next - road_type_road_0404)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0403-road_0402
    :parameters (?v - vehicle ?r - road_type_road_0403 ?next - road_type_road_0402)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0404-road_0499
    :parameters (?v - vehicle ?r - road_type_road_0404 ?next - road_type_road_0499)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0404-road_0500
    :parameters (?v - vehicle ?r - road_type_road_0404 ?next - road_type_road_0500)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0405-road_0465
    :parameters (?v - vehicle ?r - road_type_road_0405 ?next - road_type_road_0465)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0406-road_0466
    :parameters (?v - vehicle ?r - road_type_road_0406 ?next - road_type_road_0466)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0406-road_0467
    :parameters (?v - vehicle ?r - road_type_road_0406 ?next - road_type_road_0467)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0407-road_0184
    :parameters (?v - vehicle ?r - road_type_road_0407 ?next - road_type_road_0184)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0407-road_0185
    :parameters (?v - vehicle ?r - road_type_road_0407 ?next - road_type_road_0185)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0408-road_0302
    :parameters (?v - vehicle ?r - road_type_road_0408 ?next - road_type_road_0302)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0408-road_0303
    :parameters (?v - vehicle ?r - road_type_road_0408 ?next - road_type_road_0303)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0409-road_0189
    :parameters (?v - vehicle ?r - road_type_road_0409 ?next - road_type_road_0189)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0409-road_0190
    :parameters (?v - vehicle ?r - road_type_road_0409 ?next - road_type_road_0190)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0410-road_0407
    :parameters (?v - vehicle ?r - road_type_road_0410 ?next - road_type_road_0407)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0410-road_0408
    :parameters (?v - vehicle ?r - road_type_road_0410 ?next - road_type_road_0408)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0411-macro_0033
    :parameters (?v - vehicle ?r - road_type_road_0411 ?next - road_type_macro_0033)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0411-road_0414
    :parameters (?v - vehicle ?r - road_type_road_0411 ?next - road_type_road_0414)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0412-road_0425
    :parameters (?v - vehicle ?r - road_type_road_0412 ?next - road_type_road_0425)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0414-road_0411
    :parameters (?v - vehicle ?r - road_type_road_0414 ?next - road_type_road_0411)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0414-road_0412
    :parameters (?v - vehicle ?r - road_type_road_0414 ?next - road_type_road_0412)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0415-macro_0019
    :parameters (?v - vehicle ?r - road_type_road_0415 ?next - road_type_macro_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0415-road_0168
    :parameters (?v - vehicle ?r - road_type_road_0415 ?next - road_type_road_0168)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0415-road_0169
    :parameters (?v - vehicle ?r - road_type_road_0415 ?next - road_type_road_0169)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0416-macro_0034
    :parameters (?v - vehicle ?r - road_type_road_0416 ?next - road_type_macro_0034)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0417-road_0489
    :parameters (?v - vehicle ?r - road_type_road_0417 ?next - road_type_road_0489)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0417-road_0490
    :parameters (?v - vehicle ?r - road_type_road_0417 ?next - road_type_road_0490)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0419-road_0335
    :parameters (?v - vehicle ?r - road_type_road_0419 ?next - road_type_road_0335)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0419-road_0336
    :parameters (?v - vehicle ?r - road_type_road_0419 ?next - road_type_road_0336)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0419-road_0337
    :parameters (?v - vehicle ?r - road_type_road_0419 ?next - road_type_road_0337)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0420-road_0417
    :parameters (?v - vehicle ?r - road_type_road_0420 ?next - road_type_road_0417)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0422-road_0345
    :parameters (?v - vehicle ?r - road_type_road_0422 ?next - road_type_road_0345)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0422-road_0346
    :parameters (?v - vehicle ?r - road_type_road_0422 ?next - road_type_road_0346)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0423-road_0481
    :parameters (?v - vehicle ?r - road_type_road_0423 ?next - road_type_road_0481)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0424-road_0368
    :parameters (?v - vehicle ?r - road_type_road_0424 ?next - road_type_road_0368)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0424-road_0369
    :parameters (?v - vehicle ?r - road_type_road_0424 ?next - road_type_road_0369)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0424-road_0370
    :parameters (?v - vehicle ?r - road_type_road_0424 ?next - road_type_road_0370)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0425-macro_0029
    :parameters (?v - vehicle ?r - road_type_road_0425 ?next - road_type_macro_0029)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0425-road_0321
    :parameters (?v - vehicle ?r - road_type_road_0425 ?next - road_type_road_0321)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0426-macro_0011
    :parameters (?v - vehicle ?r - road_type_road_0426 ?next - road_type_macro_0011)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0426-macro_0012
    :parameters (?v - vehicle ?r - road_type_road_0426 ?next - road_type_macro_0012)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0430-road_0134
    :parameters (?v - vehicle ?r - road_type_road_0430 ?next - road_type_road_0134)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0430-road_0135
    :parameters (?v - vehicle ?r - road_type_road_0430 ?next - road_type_road_0135)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0431-road_0146
    :parameters (?v - vehicle ?r - road_type_road_0431 ?next - road_type_road_0146)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0431-road_0147
    :parameters (?v - vehicle ?r - road_type_road_0431 ?next - road_type_road_0147)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0432-macro_0035
    :parameters (?v - vehicle ?r - road_type_road_0432 ?next - road_type_macro_0035)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0432-road_0435
    :parameters (?v - vehicle ?r - road_type_road_0432 ?next - road_type_road_0435)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0433-road_0437
    :parameters (?v - vehicle ?r - road_type_road_0433 ?next - road_type_road_0437)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0433-road_0438
    :parameters (?v - vehicle ?r - road_type_road_0433 ?next - road_type_road_0438)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0435-macro_0013
    :parameters (?v - vehicle ?r - road_type_road_0435 ?next - road_type_macro_0013)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0435-road_0097
    :parameters (?v - vehicle ?r - road_type_road_0435 ?next - road_type_road_0097)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0437-road_0439
    :parameters (?v - vehicle ?r - road_type_road_0437 ?next - road_type_road_0439)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0437-road_0440
    :parameters (?v - vehicle ?r - road_type_road_0437 ?next - road_type_road_0440)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0438-road_0146
    :parameters (?v - vehicle ?r - road_type_road_0438 ?next - road_type_road_0146)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0438-road_0147
    :parameters (?v - vehicle ?r - road_type_road_0438 ?next - road_type_road_0147)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0439-road_0437
    :parameters (?v - vehicle ?r - road_type_road_0439 ?next - road_type_road_0437)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0439-road_0438
    :parameters (?v - vehicle ?r - road_type_road_0439 ?next - road_type_road_0438)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0440-road_0441
    :parameters (?v - vehicle ?r - road_type_road_0440 ?next - road_type_road_0441)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0440-road_0442
    :parameters (?v - vehicle ?r - road_type_road_0440 ?next - road_type_road_0442)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0441-road_0443
    :parameters (?v - vehicle ?r - road_type_road_0441 ?next - road_type_road_0443)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0441-road_0444
    :parameters (?v - vehicle ?r - road_type_road_0441 ?next - road_type_road_0444)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0443-road_0238
    :parameters (?v - vehicle ?r - road_type_road_0443 ?next - road_type_road_0238)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0443-road_0239
    :parameters (?v - vehicle ?r - road_type_road_0443 ?next - road_type_road_0239)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0443-road_0240
    :parameters (?v - vehicle ?r - road_type_road_0443 ?next - road_type_road_0240)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0443-road_0241
    :parameters (?v - vehicle ?r - road_type_road_0443 ?next - road_type_road_0241)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0445-road_0278
    :parameters (?v - vehicle ?r - road_type_road_0445 ?next - road_type_road_0278)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0445-road_0279
    :parameters (?v - vehicle ?r - road_type_road_0445 ?next - road_type_road_0279)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0446-road_0280
    :parameters (?v - vehicle ?r - road_type_road_0446 ?next - road_type_road_0280)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0447-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0447 ?next - road_type_road_0125)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0448-road_0451
    :parameters (?v - vehicle ?r - road_type_road_0448 ?next - road_type_road_0451)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0448-road_0452
    :parameters (?v - vehicle ?r - road_type_road_0448 ?next - road_type_road_0452)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0449-road_0333
    :parameters (?v - vehicle ?r - road_type_road_0449 ?next - road_type_road_0333)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0449-road_0334
    :parameters (?v - vehicle ?r - road_type_road_0449 ?next - road_type_road_0334)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0450-road_0398
    :parameters (?v - vehicle ?r - road_type_road_0450 ?next - road_type_road_0398)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0451-road_0485
    :parameters (?v - vehicle ?r - road_type_road_0451 ?next - road_type_road_0485)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0451-road_0486
    :parameters (?v - vehicle ?r - road_type_road_0451 ?next - road_type_road_0486)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0452-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0452 ?next - road_type_road_0066)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0452-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0452 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0452-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0452 ?next - road_type_road_0068)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0452-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0452 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0453-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0453 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0453-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0453 ?next - road_type_road_0088)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0454-road_0151
    :parameters (?v - vehicle ?r - road_type_road_0454 ?next - road_type_road_0151)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0454-road_0152
    :parameters (?v - vehicle ?r - road_type_road_0454 ?next - road_type_road_0152)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0454-road_0153
    :parameters (?v - vehicle ?r - road_type_road_0454 ?next - road_type_road_0153)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0455-road_0198
    :parameters (?v - vehicle ?r - road_type_road_0455 ?next - road_type_road_0198)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0455-road_0199
    :parameters (?v - vehicle ?r - road_type_road_0455 ?next - road_type_road_0199)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0455-road_0200
    :parameters (?v - vehicle ?r - road_type_road_0455 ?next - road_type_road_0200)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0456-road_0204
    :parameters (?v - vehicle ?r - road_type_road_0456 ?next - road_type_road_0204)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0456-road_0205
    :parameters (?v - vehicle ?r - road_type_road_0456 ?next - road_type_road_0205)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0457-road_0254
    :parameters (?v - vehicle ?r - road_type_road_0457 ?next - road_type_road_0254)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0458-road_0459
    :parameters (?v - vehicle ?r - road_type_road_0458 ?next - road_type_road_0459)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0459-road_0457
    :parameters (?v - vehicle ?r - road_type_road_0459 ?next - road_type_road_0457)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0459-road_0458
    :parameters (?v - vehicle ?r - road_type_road_0459 ?next - road_type_road_0458)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0460-road_0480
    :parameters (?v - vehicle ?r - road_type_road_0460 ?next - road_type_road_0480)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0461-road_0379
    :parameters (?v - vehicle ?r - road_type_road_0461 ?next - road_type_road_0379)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0462-road_0038
    :parameters (?v - vehicle ?r - road_type_road_0462 ?next - road_type_road_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0462-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0462 ?next - road_type_road_0039)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0462-road_0040
    :parameters (?v - vehicle ?r - road_type_road_0462 ?next - road_type_road_0040)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0463-road_0041
    :parameters (?v - vehicle ?r - road_type_road_0463 ?next - road_type_road_0041)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0463-road_0042
    :parameters (?v - vehicle ?r - road_type_road_0463 ?next - road_type_road_0042)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0464-road_0247
    :parameters (?v - vehicle ?r - road_type_road_0464 ?next - road_type_road_0247)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0464-road_0248
    :parameters (?v - vehicle ?r - road_type_road_0464 ?next - road_type_road_0248)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0464-road_0249
    :parameters (?v - vehicle ?r - road_type_road_0464 ?next - road_type_road_0249)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0465-road_0405
    :parameters (?v - vehicle ?r - road_type_road_0465 ?next - road_type_road_0405)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0465-road_0406
    :parameters (?v - vehicle ?r - road_type_road_0465 ?next - road_type_road_0406)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0466-road_0227
    :parameters (?v - vehicle ?r - road_type_road_0466 ?next - road_type_road_0227)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0466-road_0228
    :parameters (?v - vehicle ?r - road_type_road_0466 ?next - road_type_road_0228)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0467-road_0468
    :parameters (?v - vehicle ?r - road_type_road_0467 ?next - road_type_road_0468)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0468-road_0501
    :parameters (?v - vehicle ?r - road_type_road_0468 ?next - road_type_road_0501)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0468-road_0502
    :parameters (?v - vehicle ?r - road_type_road_0468 ?next - road_type_road_0502)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0470-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0470 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0470-road_0059
    :parameters (?v - vehicle ?r - road_type_road_0470 ?next - road_type_road_0059)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0470-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0470 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0472-road_0449
    :parameters (?v - vehicle ?r - road_type_road_0472 ?next - road_type_road_0449)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0472-road_0450
    :parameters (?v - vehicle ?r - road_type_road_0472 ?next - road_type_road_0450)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0473-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0473 ?next - road_type_road_0149)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0473-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0473 ?next - road_type_road_0150)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0474-road_0191
    :parameters (?v - vehicle ?r - road_type_road_0474 ?next - road_type_road_0191)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0475-road_0301
    :parameters (?v - vehicle ?r - road_type_road_0475 ?next - road_type_road_0301)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0476-road_0302
    :parameters (?v - vehicle ?r - road_type_road_0476 ?next - road_type_road_0302)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0476-road_0303
    :parameters (?v - vehicle ?r - road_type_road_0476 ?next - road_type_road_0303)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0478-road_0255
    :parameters (?v - vehicle ?r - road_type_road_0478 ?next - road_type_road_0255)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0480-road_0462
    :parameters (?v - vehicle ?r - road_type_road_0480 ?next - road_type_road_0462)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0480-road_0463
    :parameters (?v - vehicle ?r - road_type_road_0480 ?next - road_type_road_0463)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0481-road_0422
    :parameters (?v - vehicle ?r - road_type_road_0481 ?next - road_type_road_0422)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0481-road_0423
    :parameters (?v - vehicle ?r - road_type_road_0481 ?next - road_type_road_0423)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0482-road_0219
    :parameters (?v - vehicle ?r - road_type_road_0482 ?next - road_type_road_0219)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0483-road_0247
    :parameters (?v - vehicle ?r - road_type_road_0483 ?next - road_type_road_0247)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0483-road_0248
    :parameters (?v - vehicle ?r - road_type_road_0483 ?next - road_type_road_0248)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0483-road_0249
    :parameters (?v - vehicle ?r - road_type_road_0483 ?next - road_type_road_0249)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0484-macro_0036
    :parameters (?v - vehicle ?r - road_type_road_0484 ?next - road_type_macro_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0484-road_0472
    :parameters (?v - vehicle ?r - road_type_road_0484 ?next - road_type_road_0472)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0485-road_0201
    :parameters (?v - vehicle ?r - road_type_road_0485 ?next - road_type_road_0201)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0485-road_0202
    :parameters (?v - vehicle ?r - road_type_road_0485 ?next - road_type_road_0202)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0486-road_0447
    :parameters (?v - vehicle ?r - road_type_road_0486 ?next - road_type_road_0447)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0486-road_0448
    :parameters (?v - vehicle ?r - road_type_road_0486 ?next - road_type_road_0448)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0487-road_0203
    :parameters (?v - vehicle ?r - road_type_road_0487 ?next - road_type_road_0203)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0488-road_0445
    :parameters (?v - vehicle ?r - road_type_road_0488 ?next - road_type_road_0445)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0488-road_0446
    :parameters (?v - vehicle ?r - road_type_road_0488 ?next - road_type_road_0446)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0489-road_0163
    :parameters (?v - vehicle ?r - road_type_road_0489 ?next - road_type_road_0163)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0489-road_0164
    :parameters (?v - vehicle ?r - road_type_road_0489 ?next - road_type_road_0164)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0490-road_0415
    :parameters (?v - vehicle ?r - road_type_road_0490 ?next - road_type_road_0415)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0490-road_0416
    :parameters (?v - vehicle ?r - road_type_road_0490 ?next - road_type_road_0416)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0493-road_0306
    :parameters (?v - vehicle ?r - road_type_road_0493 ?next - road_type_road_0306)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0494-road_0503
    :parameters (?v - vehicle ?r - road_type_road_0494 ?next - road_type_road_0503)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0495-road_0304
    :parameters (?v - vehicle ?r - road_type_road_0495 ?next - road_type_road_0304)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0495-road_0305
    :parameters (?v - vehicle ?r - road_type_road_0495 ?next - road_type_road_0305)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0497-road_0360
    :parameters (?v - vehicle ?r - road_type_road_0497 ?next - road_type_road_0360)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0498-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0498 ?next - road_type_road_0075)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0498-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0498 ?next - road_type_road_0076)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0498-road_0077
    :parameters (?v - vehicle ?r - road_type_road_0498 ?next - road_type_road_0077)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0499-road_0244
    :parameters (?v - vehicle ?r - road_type_road_0499 ?next - road_type_road_0244)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0499-road_0245
    :parameters (?v - vehicle ?r - road_type_road_0499 ?next - road_type_road_0245)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0499-road_0246
    :parameters (?v - vehicle ?r - road_type_road_0499 ?next - road_type_road_0246)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0500-road_0175
    :parameters (?v - vehicle ?r - road_type_road_0500 ?next - road_type_road_0175)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0500-road_0176
    :parameters (?v - vehicle ?r - road_type_road_0500 ?next - road_type_road_0176)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0500-road_0177
    :parameters (?v - vehicle ?r - road_type_road_0500 ?next - road_type_road_0177)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0501-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0501 ?next - road_type_road_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0502-road_0405
    :parameters (?v - vehicle ?r - road_type_road_0502 ?next - road_type_road_0405)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0502-road_0406
    :parameters (?v - vehicle ?r - road_type_road_0502 ?next - road_type_road_0406)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0503-road_0493
    :parameters (?v - vehicle ?r - road_type_road_0503 ?next - road_type_road_0493)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0503-road_0494
    :parameters (?v - vehicle ?r - road_type_road_0503 ?next - road_type_road_0494)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0503-road_0495
    :parameters (?v - vehicle ?r - road_type_road_0503 ?next - road_type_road_0495)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )
)
