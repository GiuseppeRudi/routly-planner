;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-dynamic_llm_macro
;;    traversal             : compiled_duration
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
  )

  (:functions
    (travel-duration      ?r - road)  ;; precomputed seconds to traverse
    (travel-time          ?v - vehicle)
    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed
    (sim-time)
    (window-start         ?w - time-window)
    (travel-duration-window ?r - road ?w - time-window)
  )

  ;; Compiled traversal with global time windows.
  (:action traverse-road-static
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
      (not (location-blocked ?from))
      (not (location-blocked ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic
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
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
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
