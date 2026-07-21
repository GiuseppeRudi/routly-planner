;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_llm_macro
;;    traversal             : compiled_duration
;;    state representation  : line_graph
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

  ;; Line-graph traversal: the vehicle state is the next road to traverse.
  (:action traverse-road
    :parameters (?v - vehicle ?r - road ?next - road)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action finish-road
    :parameters (?v - vehicle ?r - road)
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
)
