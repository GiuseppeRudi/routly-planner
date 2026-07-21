;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_llm_fuel_macro
;;    traversal             : process
;;    state representation  : node_based
;;    action generation     : parameterized
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=static
;;    llm_events      : True
;;    fuel            : enabled=True, replanning=False, consumption=discrete
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents :time)
  (:types vehicle location road)

  (:predicates
    (connects  ?r - road  ?from - location  ?to - location)
    (road-open ?r - road)
    (has-traffic-light ?l - location)
    (has-fuel-station ?l - location)   ;; refuelling point
    (road-blocked ?r - road)   ;; set by LLM event generator
    (location-blocked ?l - location)   ;; derived from blocked roads
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
    (fuel-level            ?v - vehicle)  ;; current litres in tank
    (fuel-capacity         ?v - vehicle)  ;; max tank size (litres)
    (fuel-consumption-rate ?v - vehicle)  ;; litres per metre
  )

  (:action start-traversal
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
      (>= (fuel-level ?v) (* (road-length ?r) (fuel-consumption-rate ?v)))
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (/ (speed-limit ?r) (congestion-factor ?r)))
      (decrease (fuel-level ?v) (* (road-length ?r) (fuel-consumption-rate ?v)))
    )
  )

  (:action refuel
    :parameters (?v - vehicle ?l - location)
    :precondition (and
      (at ?v ?l)
      (has-fuel-station ?l)
      
      (not (moving ?v))
      (< (fuel-level ?v) (fuel-capacity ?v))
    )
    :effect (and
      (assign (fuel-level ?v) (fuel-capacity ?v))
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
