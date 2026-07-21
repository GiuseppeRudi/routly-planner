;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_llm_macro
;;    traversal             : compiled_duration
;;    state representation  : node_based
;;    action generation     : parameterized
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=static
;;    llm_events      : True
;;    fuel            : enabled=False, replanning=False, consumption=continuous
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents)
  (:types vehicle location road)

  (:predicates
    (connects  ?r - road  ?from - location  ?to - location)
    (road-open ?r - road)
    (has-traffic-light ?l - location)
    (road-blocked ?r - road)   ;; set by LLM event generator
    (location-blocked ?l - location)   ;; derived from blocked roads
    (at       ?v - vehicle  ?l - location)
  )

  (:functions
    (travel-duration      ?r - road)  ;; precomputed seconds to traverse
    (travel-time          ?v - vehicle)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
  )

  ;; Compiled traversal: the road crossing is represented as one numeric action.
  ;; This is the PDDL-compatible counterpart of a durative road action.
  (:action traverse-road
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )
)
