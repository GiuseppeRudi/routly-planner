;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-dynamic_llm_macro
;;    traversal             : process
;;    state representation  : node_based
;;    action generation     : parameterized
;;    traffic_lights  : True
;;    congestion      : enabled=True, mode=pddl, type=dynamic
;;    llm_events      : True
;;    fuel            : enabled=False, replanning=False, consumption=continuous
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents :time)
  (:types vehicle location road time-window)

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
    (on-road  ?v - vehicle  ?r - road)
    (moving   ?v - vehicle)
  )

  (:functions
    (road-length          ?r - road)
    (speed-limit          ?r - road)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
    (sim-time)
    (window-start         ?w - time-window)
    (effective-speed      ?r - road)
    (effective-speed-window ?r - road ?w - time-window)
    (distance-remaining   ?v - vehicle)
    (speed                ?v - vehicle)
    (total-distance       ?v - vehicle)
    (light-wait           ?l - location)  ;; avg red-light wait (s)
    (travel-time          ?v - vehicle)   ;; elapsed time incl. waits
  )

  (:action start-traversal-static
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (effective-speed ?r))
    )
  )

  (:action start-traversal-dynamic
    :parameters (?v - vehicle ?r - road ?from - location ?to - location ?w - time-window)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (effective-speed-window ?r ?w))
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
      (increase (sim-time) (* #t 1))
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
