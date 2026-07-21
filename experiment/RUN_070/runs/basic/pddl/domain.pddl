;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_macro
;;    traversal             : process
;;    state representation  : node_based
;;    action generation     : parameterized
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=static
;;    llm_events      : False
;;    fuel            : enabled=False, replanning=False, consumption=continuous
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents :time)
  (:types vehicle location road)

  (:predicates
    (connects  ?r - road  ?from - location  ?to - location)
    (road-open ?r - road)
    (has-traffic-light ?l - location)
    (at       ?v - vehicle  ?l - location)
    (on-road  ?v - vehicle  ?r - road)
    (moving   ?v - vehicle)
  )

  (:functions
    (road-length          ?r - road)
    (speed-limit          ?r - road)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
    (distance-remaining   ?v - vehicle)
    (speed                ?v - vehicle)
    (total-distance       ?v - vehicle)
    (light-wait           ?l - location)  ;; avg red-light wait (s)
    (travel-time          ?v - vehicle)   ;; elapsed time incl. waits
  )

  (:action start-traversal
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (/ (speed-limit ?r) (congestion-factor ?r)))
    )
  )

  (:process traverse
    :parameters (?v - vehicle)
    :precondition (and
      (moving ?v)
      (> (distance-remaining ?v) 0)
    )
    :effect (and
      (decrease (distance-remaining ?v) (* #t (speed ?v)))
      (increase (total-distance ?v)     (* #t (speed ?v)))
    )
  )

  ;; Arrive at a normal intersection
  (:event arrive
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (on-road ?v ?r)
      (moving ?v)
      (connects ?r ?from ?to)
      (not (has-traffic-light ?to))
      (<= (distance-remaining ?v) 0)
    )
    :effect (and
      (not (on-road ?v ?r))
      (not (moving ?v))
      (at ?v ?to)
      (assign (distance-remaining ?v) 0)
      (assign (speed ?v) 0)
    )
  )

  ;; Arrive at a signalized intersection and add the average red-light wait.
  (:event arrive-at-traffic-light
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (on-road ?v ?r)
      (moving ?v)
      (connects ?r ?from ?to)
      (has-traffic-light ?to)
      (<= (distance-remaining ?v) 0)
    )
    :effect (and
      (not (on-road ?v ?r))
      (not (moving ?v))
      (at ?v ?to)
      (assign (distance-remaining ?v) 0)
      (assign (speed ?v) 0)
      (increase (travel-time ?v) (light-wait ?to))
    )
  )
)
