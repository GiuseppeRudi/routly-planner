;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-dynamic_llm_macro
;;    traversal             : compiled_duration
;;    state representation  : line_graph
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
    (ready-road ?v - vehicle ?r - road)
    (road-next ?r - road ?next - road)
    (goal-road ?r - road)
    (reached-goal ?v - vehicle)
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

  ;; Line-graph traversal with static and dynamic road costs.
  (:action traverse-road-static
    :parameters (?v - vehicle ?r - road ?next - road)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action traverse-road-dynamic
    :parameters (?v - vehicle ?r - road ?next - road ?w - time-window)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w))
    )
  )

  (:action finish-road-static
    :parameters (?v - vehicle ?r - road)
    :precondition (and
      (ready-road ?v ?r)
      (goal-road ?r)
      (road-open ?r)
      (static-road ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (reached-goal ?v)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r))
    )
  )

  (:action finish-road-dynamic
    :parameters (?v - vehicle ?r - road ?w - time-window)
    :precondition (and
      (ready-road ?v ?r)
      (goal-road ?r)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (reached-goal ?v)
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
