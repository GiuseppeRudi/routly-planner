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
    road_type_macro_0000 road_type_macro_0001 road_type_macro_0002 road_type_macro_0003 road_type_macro_0004 road_type_macro_0005 road_type_macro_0006 road_type_macro_0007 road_type_macro_0008 road_type_macro_0009 road_type_macro_0010 road_type_macro_0011 road_type_macro_0012 road_type_macro_0013 road_type_macro_0014 road_type_macro_0015 road_type_macro_0016 road_type_macro_0017 road_type_road_0000 road_type_road_0001 road_type_road_0002 road_type_road_0003 road_type_road_0004 road_type_road_0008 road_type_road_0009 road_type_road_0010 road_type_road_0011 road_type_road_0012 road_type_road_0013 road_type_road_0014 road_type_road_0015 road_type_road_0017 road_type_road_0018 road_type_road_0019 road_type_road_0020 road_type_road_0021 road_type_road_0022 road_type_road_0023 road_type_road_0024 road_type_road_0025 road_type_road_0026 road_type_road_0027 road_type_road_0028 road_type_road_0029 road_type_road_0030 road_type_road_0031 road_type_road_0032 road_type_road_0033 road_type_road_0034 road_type_road_0035 road_type_road_0036 road_type_road_0037 road_type_road_0038 road_type_road_0039 road_type_road_0040 road_type_road_0041 road_type_road_0042 road_type_road_0043 road_type_road_0044 road_type_road_0045 road_type_road_0046 road_type_road_0047 road_type_road_0049 road_type_road_0050 road_type_road_0051 road_type_road_0052 road_type_road_0054 road_type_road_0056 road_type_road_0057 road_type_road_0058 road_type_road_0059 road_type_road_0060 road_type_road_0061 road_type_road_0063 road_type_road_0064 road_type_road_0065 road_type_road_0066 road_type_road_0067 road_type_road_0069 road_type_road_0070 road_type_road_0071 road_type_road_0072 road_type_road_0073 road_type_road_0075 road_type_road_0076 road_type_road_0077 road_type_road_0078 road_type_road_0079 road_type_road_0080 road_type_road_0083 road_type_road_0084 road_type_road_0085 road_type_road_0086 road_type_road_0088 road_type_road_0089 road_type_road_0090 road_type_road_0092 road_type_road_0093 road_type_road_0094 road_type_road_0095 road_type_road_0096 road_type_road_0098 road_type_road_0100 road_type_road_0101 road_type_road_0102 road_type_road_0103 road_type_road_0105 road_type_road_0106 road_type_road_0108 road_type_road_0109 road_type_road_0110 road_type_road_0111 road_type_road_0112 road_type_road_0113 road_type_road_0114 road_type_road_0116 road_type_road_0117 road_type_road_0118 road_type_road_0122 road_type_road_0123 road_type_road_0124 road_type_road_0125 road_type_road_0126 road_type_road_0127 road_type_road_0128 road_type_road_0129 road_type_road_0130 road_type_road_0131 road_type_road_0133 road_type_road_0134 road_type_road_0135 road_type_road_0137 road_type_road_0138 road_type_road_0139 road_type_road_0140 road_type_road_0141 road_type_road_0142 road_type_road_0143 road_type_road_0144 road_type_road_0146 road_type_road_0147 road_type_road_0148 road_type_road_0149 road_type_road_0150 road_type_road_0151 road_type_road_0152 road_type_road_0154 road_type_road_0156 road_type_road_0157 road_type_road_0158 road_type_road_0159 road_type_road_0160 road_type_road_0161
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

  (:action traverse-road-static-macro_0000-macro_0014
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?next - road_type_macro_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0000-road_0131
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?next - road_type_road_0131)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0000-road_0133
    :parameters (?v - vehicle ?r - road_type_macro_0000 ?next - road_type_road_0133)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-macro_0003
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-road_0047
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0001-road_0049
    :parameters (?v - vehicle ?r - road_type_macro_0001 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0002-road_0059
    :parameters (?v - vehicle ?r - road_type_macro_0002 ?next - road_type_road_0059)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0003-macro_0001
    :parameters (?v - vehicle ?r - road_type_macro_0003 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0004-macro_0003
    :parameters (?v - vehicle ?r - road_type_macro_0004 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0004-road_0047
    :parameters (?v - vehicle ?r - road_type_macro_0004 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0004-road_0049
    :parameters (?v - vehicle ?r - road_type_macro_0004 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0005-road_0117
    :parameters (?v - vehicle ?r - road_type_macro_0005 ?next - road_type_road_0117)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0005-road_0118
    :parameters (?v - vehicle ?r - road_type_macro_0005 ?next - road_type_road_0118)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0006-road_0025
    :parameters (?v - vehicle ?r - road_type_macro_0006 ?next - road_type_road_0025)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0007-road_0056
    :parameters (?v - vehicle ?r - road_type_macro_0007 ?next - road_type_road_0056)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0007-road_0057
    :parameters (?v - vehicle ?r - road_type_macro_0007 ?next - road_type_road_0057)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0007-road_0058
    :parameters (?v - vehicle ?r - road_type_macro_0007 ?next - road_type_road_0058)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0008-macro_0004
    :parameters (?v - vehicle ?r - road_type_macro_0008 ?next - road_type_macro_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0010-road_0095
    :parameters (?v - vehicle ?r - road_type_macro_0010 ?next - road_type_road_0095)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0010-road_0096
    :parameters (?v - vehicle ?r - road_type_macro_0010 ?next - road_type_road_0096)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0011-road_0040
    :parameters (?v - vehicle ?r - road_type_macro_0011 ?next - road_type_road_0040)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0011-road_0041
    :parameters (?v - vehicle ?r - road_type_macro_0011 ?next - road_type_road_0041)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0012-road_0026
    :parameters (?v - vehicle ?r - road_type_macro_0012 ?next - road_type_road_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0012-road_0027
    :parameters (?v - vehicle ?r - road_type_macro_0012 ?next - road_type_road_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0013-macro_0005
    :parameters (?v - vehicle ?r - road_type_macro_0013 ?next - road_type_macro_0005)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0013-road_0054
    :parameters (?v - vehicle ?r - road_type_macro_0013 ?next - road_type_road_0054)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0014-macro_0000
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0014-road_0003
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0014-road_0004
    :parameters (?v - vehicle ?r - road_type_macro_0014 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0015-road_0137
    :parameters (?v - vehicle ?r - road_type_macro_0015 ?next - road_type_road_0137)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0015-road_0138
    :parameters (?v - vehicle ?r - road_type_macro_0015 ?next - road_type_road_0138)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0016-macro_0002
    :parameters (?v - vehicle ?r - road_type_macro_0016 ?next - road_type_macro_0002)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-macro_0017-road_0015
    :parameters (?v - vehicle ?r - road_type_macro_0017 ?next - road_type_road_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0000-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0000 ?next - road_type_road_0140)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0000-road_0141
    :parameters (?v - vehicle ?r - road_type_road_0000 ?next - road_type_road_0141)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0000-road_0142
    :parameters (?v - vehicle ?r - road_type_road_0000 ?next - road_type_road_0142)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0001-macro_0001
    :parameters (?v - vehicle ?r - road_type_road_0001 ?next - road_type_macro_0001)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002-macro_0003
    :parameters (?v - vehicle ?r - road_type_road_0002 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0002 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0002-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0002 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0003-macro_0013
    :parameters (?v - vehicle ?r - road_type_road_0003 ?next - road_type_macro_0013)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0003-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0003 ?next - road_type_road_0102)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0003-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0003 ?next - road_type_road_0103)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0004-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0004 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0004-road_0038
    :parameters (?v - vehicle ?r - road_type_road_0004 ?next - road_type_road_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0004-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0004 ?next - road_type_road_0039)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0008-macro_0000
    :parameters (?v - vehicle ?r - road_type_road_0008 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0008-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0008 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0008-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0008 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0009-macro_0007
    :parameters (?v - vehicle ?r - road_type_road_0009 ?next - road_type_macro_0007)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0009-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0009 ?next - road_type_road_0075)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0010 ?next - road_type_road_0148)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0010 ?next - road_type_road_0149)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0010-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0010 ?next - road_type_road_0150)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0011-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0011 ?next - road_type_road_0084)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0011-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0011 ?next - road_type_road_0085)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0012-macro_0014
    :parameters (?v - vehicle ?r - road_type_road_0012 ?next - road_type_macro_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0012-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0012 ?next - road_type_road_0131)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0012-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0012 ?next - road_type_road_0133)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0013-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0013 ?next - road_type_road_0129)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0013-road_0130
    :parameters (?v - vehicle ?r - road_type_road_0013 ?next - road_type_road_0130)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0014-road_0078
    :parameters (?v - vehicle ?r - road_type_road_0014 ?next - road_type_road_0078)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0014-road_0079
    :parameters (?v - vehicle ?r - road_type_road_0014 ?next - road_type_road_0079)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0015-road_0094
    :parameters (?v - vehicle ?r - road_type_road_0015 ?next - road_type_road_0094)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0017 ?next - road_type_road_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0017-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0017 ?next - road_type_road_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0018-road_0025
    :parameters (?v - vehicle ?r - road_type_road_0018 ?next - road_type_road_0025)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-macro_0017
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_macro_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-road_0156
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_road_0156)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0019-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0019 ?next - road_type_road_0157)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0020-macro_0006
    :parameters (?v - vehicle ?r - road_type_road_0020 ?next - road_type_macro_0006)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0020-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0020 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0020-road_0070
    :parameters (?v - vehicle ?r - road_type_road_0020 ?next - road_type_road_0070)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0021-road_0052
    :parameters (?v - vehicle ?r - road_type_road_0021 ?next - road_type_road_0052)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0022-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0022 ?next - road_type_road_0071)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0022-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0022 ?next - road_type_road_0072)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0023-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0023 ?next - road_type_road_0148)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0023-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0023 ?next - road_type_road_0149)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0023-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0023 ?next - road_type_road_0150)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0024-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0024 ?next - road_type_road_0095)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0024-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0024 ?next - road_type_road_0096)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0025-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0025 ?next - road_type_road_0158)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0025-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0025 ?next - road_type_road_0159)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0026-road_0034
    :parameters (?v - vehicle ?r - road_type_road_0026 ?next - road_type_road_0034)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0028-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0028 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0028-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0028 ?next - road_type_road_0046)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0029-road_0060
    :parameters (?v - vehicle ?r - road_type_road_0029 ?next - road_type_road_0060)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0029-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0029 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0030-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0030 ?next - road_type_road_0129)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0030-road_0130
    :parameters (?v - vehicle ?r - road_type_road_0030 ?next - road_type_road_0130)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0031-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0031 ?next - road_type_road_0088)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0031-road_0089
    :parameters (?v - vehicle ?r - road_type_road_0031 ?next - road_type_road_0089)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0032-road_0105
    :parameters (?v - vehicle ?r - road_type_road_0032 ?next - road_type_road_0105)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0032-road_0106
    :parameters (?v - vehicle ?r - road_type_road_0032 ?next - road_type_road_0106)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0033-road_0030
    :parameters (?v - vehicle ?r - road_type_road_0033 ?next - road_type_road_0030)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0033-road_0031
    :parameters (?v - vehicle ?r - road_type_road_0033 ?next - road_type_road_0031)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0034 ?next - road_type_road_0026)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0034-road_0027
    :parameters (?v - vehicle ?r - road_type_road_0034 ?next - road_type_road_0027)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0035-road_0051
    :parameters (?v - vehicle ?r - road_type_road_0035 ?next - road_type_road_0051)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0036-road_0021
    :parameters (?v - vehicle ?r - road_type_road_0036 ?next - road_type_road_0021)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-macro_0000
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0037-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0037 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0038-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0038 ?next - road_type_road_0095)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0038-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0038 ?next - road_type_road_0096)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0039-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0039 ?next - road_type_road_0035)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
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

  (:action traverse-road-static-road_0040-macro_0016
    :parameters (?v - vehicle ?r - road_type_road_0040 ?next - road_type_macro_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0040-road_0154
    :parameters (?v - vehicle ?r - road_type_road_0040 ?next - road_type_road_0154)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0041-macro_0002
    :parameters (?v - vehicle ?r - road_type_road_0041 ?next - road_type_macro_0002)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0042-macro_0007
    :parameters (?v - vehicle ?r - road_type_road_0042 ?next - road_type_macro_0007)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0042-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0042 ?next - road_type_road_0075)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0043-road_0143
    :parameters (?v - vehicle ?r - road_type_road_0043 ?next - road_type_road_0143)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044-road_0032
    :parameters (?v - vehicle ?r - road_type_road_0044 ?next - road_type_road_0032)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0044-road_0033
    :parameters (?v - vehicle ?r - road_type_road_0044 ?next - road_type_road_0033)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0125)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0126)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0045-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0045 ?next - road_type_road_0127)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046-macro_0012
    :parameters (?v - vehicle ?r - road_type_road_0046 ?next - road_type_macro_0012)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046-road_0100
    :parameters (?v - vehicle ?r - road_type_road_0046 ?next - road_type_road_0100)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0046-road_0101
    :parameters (?v - vehicle ?r - road_type_road_0046 ?next - road_type_road_0101)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0047-road_0128
    :parameters (?v - vehicle ?r - road_type_road_0047 ?next - road_type_road_0128)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0050-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0050 ?next - road_type_road_0148)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0050-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0050 ?next - road_type_road_0149)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0050-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0050 ?next - road_type_road_0150)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0051-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0051 ?next - road_type_road_0035)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0051-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0051 ?next - road_type_road_0036)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0052-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0052 ?next - road_type_road_0084)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0052-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0052 ?next - road_type_road_0085)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0054-road_0077
    :parameters (?v - vehicle ?r - road_type_road_0054 ?next - road_type_road_0077)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0057-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0057 ?next - road_type_road_0124)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0058-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0058 ?next - road_type_road_0088)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0058-road_0089
    :parameters (?v - vehicle ?r - road_type_road_0058 ?next - road_type_road_0089)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0061-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0061 ?next - road_type_road_0066)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0063-road_0040
    :parameters (?v - vehicle ?r - road_type_road_0063 ?next - road_type_road_0040)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0063-road_0041
    :parameters (?v - vehicle ?r - road_type_road_0063 ?next - road_type_road_0041)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0064-road_0111
    :parameters (?v - vehicle ?r - road_type_road_0064 ?next - road_type_road_0111)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0060
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0060)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0066-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0066 ?next - road_type_road_0061)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067-macro_0003
    :parameters (?v - vehicle ?r - road_type_road_0067 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0067 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0067-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0067 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0069-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0069 ?next - road_type_road_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0069-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0069 ?next - road_type_road_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0070-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0070 ?next - road_type_road_0158)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0070-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0070 ?next - road_type_road_0159)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0071-macro_0014
    :parameters (?v - vehicle ?r - road_type_road_0071 ?next - road_type_macro_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0071-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0071 ?next - road_type_road_0131)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0071-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0071 ?next - road_type_road_0133)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0125)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0126)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0072-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0072 ?next - road_type_road_0127)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0151
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0151)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0073-road_0152
    :parameters (?v - vehicle ?r - road_type_road_0073 ?next - road_type_road_0152)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0075-road_0009
    :parameters (?v - vehicle ?r - road_type_road_0075 ?next - road_type_road_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0076-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0076 ?next - road_type_road_0044)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0078-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0078 ?next - road_type_road_0073)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0079-road_0011
    :parameters (?v - vehicle ?r - road_type_road_0079 ?next - road_type_road_0011)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-macro_0011
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_macro_0011)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-road_0090
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_road_0090)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-road_0092
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_road_0092)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0080-road_0093
    :parameters (?v - vehicle ?r - road_type_road_0080 ?next - road_type_road_0093)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0083-road_0144
    :parameters (?v - vehicle ?r - road_type_road_0083 ?next - road_type_road_0144)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0084-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0084 ?next - road_type_road_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0084-road_0018
    :parameters (?v - vehicle ?r - road_type_road_0084 ?next - road_type_road_0018)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0085-macro_0010
    :parameters (?v - vehicle ?r - road_type_road_0085 ?next - road_type_macro_0010)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0085-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0085 ?next - road_type_road_0086)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0086-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0086 ?next - road_type_road_0084)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0086-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0086 ?next - road_type_road_0085)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088-road_0056
    :parameters (?v - vehicle ?r - road_type_road_0088 ?next - road_type_road_0056)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088-road_0057
    :parameters (?v - vehicle ?r - road_type_road_0088 ?next - road_type_road_0057)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0088-road_0058
    :parameters (?v - vehicle ?r - road_type_road_0088 ?next - road_type_road_0058)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0089-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0089 ?next - road_type_road_0044)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0090-road_0113
    :parameters (?v - vehicle ?r - road_type_road_0090 ?next - road_type_road_0113)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0090-road_0114
    :parameters (?v - vehicle ?r - road_type_road_0090 ?next - road_type_road_0114)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0092-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0092 ?next - road_type_road_0108)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0092-road_0109
    :parameters (?v - vehicle ?r - road_type_road_0092 ?next - road_type_road_0109)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0092-road_0110
    :parameters (?v - vehicle ?r - road_type_road_0092 ?next - road_type_road_0110)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0093-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0093 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0093-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0093 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0093-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0093 ?next - road_type_road_0080)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0093-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0093 ?next - road_type_road_0083)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0094-road_0015
    :parameters (?v - vehicle ?r - road_type_road_0094 ?next - road_type_road_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0095-macro_0010
    :parameters (?v - vehicle ?r - road_type_road_0095 ?next - road_type_macro_0010)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0095-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0095 ?next - road_type_road_0086)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0096-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0096 ?next - road_type_road_0037)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0096-road_0038
    :parameters (?v - vehicle ?r - road_type_road_0096 ?next - road_type_road_0038)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0096-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0096 ?next - road_type_road_0039)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0098-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0098 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0098-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0098 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0098-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0098 ?next - road_type_road_0080)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0098-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0098 ?next - road_type_road_0083)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0100-road_0028
    :parameters (?v - vehicle ?r - road_type_road_0100 ?next - road_type_road_0028)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0100-road_0029
    :parameters (?v - vehicle ?r - road_type_road_0100 ?next - road_type_road_0029)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0101-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0101 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0101-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0101 ?next - road_type_road_0046)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-macro_0000
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_macro_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_road_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0102-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0102 ?next - road_type_road_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103-macro_0016
    :parameters (?v - vehicle ?r - road_type_road_0103 ?next - road_type_macro_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0103-road_0154
    :parameters (?v - vehicle ?r - road_type_road_0103 ?next - road_type_road_0154)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0105-road_0022
    :parameters (?v - vehicle ?r - road_type_road_0105 ?next - road_type_road_0022)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0105-road_0023
    :parameters (?v - vehicle ?r - road_type_road_0105 ?next - road_type_road_0023)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0106-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0106 ?next - road_type_road_0076)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0108-macro_0015
    :parameters (?v - vehicle ?r - road_type_road_0108 ?next - road_type_macro_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0108-road_0135
    :parameters (?v - vehicle ?r - road_type_road_0108 ?next - road_type_road_0135)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
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

  (:action traverse-road-static-road_0110-macro_0011
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_macro_0011)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0110-road_0090
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_road_0090)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0110-road_0092
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_road_0092)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0110-road_0093
    :parameters (?v - vehicle ?r - road_type_road_0110 ?next - road_type_road_0093)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0111-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0111 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0112-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0112 ?next - road_type_road_0108)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0112-road_0109
    :parameters (?v - vehicle ?r - road_type_road_0112 ?next - road_type_road_0109)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0112-road_0110
    :parameters (?v - vehicle ?r - road_type_road_0112 ?next - road_type_road_0110)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0113-macro_0004
    :parameters (?v - vehicle ?r - road_type_road_0113 ?next - road_type_macro_0004)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0114-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0114 ?next - road_type_road_0067)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0116-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0116 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0116-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0116 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0116-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0116 ?next - road_type_road_0080)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0116-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0116 ?next - road_type_road_0083)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0117-road_0144
    :parameters (?v - vehicle ?r - road_type_road_0117 ?next - road_type_road_0144)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0118-macro_0008
    :parameters (?v - vehicle ?r - road_type_road_0118 ?next - road_type_macro_0008)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0118-macro_0009
    :parameters (?v - vehicle ?r - road_type_road_0118 ?next - road_type_macro_0009)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
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

  (:action traverse-road-static-road_0118-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0118 ?next - road_type_road_0083)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123-macro_0017
    :parameters (?v - vehicle ?r - road_type_road_0123 ?next - road_type_macro_0017)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123-road_0156
    :parameters (?v - vehicle ?r - road_type_road_0123 ?next - road_type_road_0156)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0123-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0123 ?next - road_type_road_0157)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0124-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0124 ?next - road_type_road_0129)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0124-road_0130
    :parameters (?v - vehicle ?r - road_type_road_0124 ?next - road_type_road_0130)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0125-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0125 ?next - road_type_road_0076)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0126 ?next - road_type_road_0045)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0126-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0126 ?next - road_type_road_0046)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0127-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0127 ?next - road_type_road_0071)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0127-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0127 ?next - road_type_road_0072)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0128-macro_0003
    :parameters (?v - vehicle ?r - road_type_road_0128 ?next - road_type_macro_0003)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0128-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0128 ?next - road_type_road_0047)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0128-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0128 ?next - road_type_road_0049)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0129-road_0030
    :parameters (?v - vehicle ?r - road_type_road_0129 ?next - road_type_road_0030)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0129-road_0031
    :parameters (?v - vehicle ?r - road_type_road_0129 ?next - road_type_road_0031)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-road_0012
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_road_0012)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-road_0013
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_road_0013)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0130-road_0014
    :parameters (?v - vehicle ?r - road_type_road_0130 ?next - road_type_road_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0131-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0131 ?next - road_type_road_0140)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0131-road_0141
    :parameters (?v - vehicle ?r - road_type_road_0131 ?next - road_type_road_0141)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0131-road_0142
    :parameters (?v - vehicle ?r - road_type_road_0131 ?next - road_type_road_0142)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0133-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0133 ?next - road_type_road_0071)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0133-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0133 ?next - road_type_road_0072)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0134-road_0064
    :parameters (?v - vehicle ?r - road_type_road_0134 ?next - road_type_road_0064)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0134-road_0065
    :parameters (?v - vehicle ?r - road_type_road_0134 ?next - road_type_road_0065)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0135-road_0134
    :parameters (?v - vehicle ?r - road_type_road_0135 ?next - road_type_road_0134)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0137-road_0139
    :parameters (?v - vehicle ?r - road_type_road_0137 ?next - road_type_road_0139)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action finish-road-static-road_0137
    :parameters (?v - vehicle ?r - road_type_road_0137)
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

  (:action traverse-road-static-road_0139-road_0112
    :parameters (?v - vehicle ?r - road_type_road_0139 ?next - road_type_road_0112)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0140-macro_0014
    :parameters (?v - vehicle ?r - road_type_road_0140 ?next - road_type_macro_0014)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0140-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0140 ?next - road_type_road_0131)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0140-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0140 ?next - road_type_road_0133)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0141-road_0000
    :parameters (?v - vehicle ?r - road_type_road_0141 ?next - road_type_road_0000)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0142-road_0112
    :parameters (?v - vehicle ?r - road_type_road_0142 ?next - road_type_road_0112)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0143-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0143 ?next - road_type_road_0073)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0146-macro_0016
    :parameters (?v - vehicle ?r - road_type_road_0146 ?next - road_type_macro_0016)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0146-road_0154
    :parameters (?v - vehicle ?r - road_type_road_0146 ?next - road_type_road_0154)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0147-macro_0002
    :parameters (?v - vehicle ?r - road_type_road_0147 ?next - road_type_macro_0002)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0148-road_0050
    :parameters (?v - vehicle ?r - road_type_road_0148 ?next - road_type_road_0050)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0149-road_0010
    :parameters (?v - vehicle ?r - road_type_road_0149 ?next - road_type_road_0010)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0150-road_0022
    :parameters (?v - vehicle ?r - road_type_road_0150 ?next - road_type_road_0022)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0150-road_0023
    :parameters (?v - vehicle ?r - road_type_road_0150 ?next - road_type_road_0023)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0151-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0151 ?next - road_type_road_0124)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0152-road_0042
    :parameters (?v - vehicle ?r - road_type_road_0152 ?next - road_type_road_0042)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0152-road_0043
    :parameters (?v - vehicle ?r - road_type_road_0152 ?next - road_type_road_0043)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0154-macro_0013
    :parameters (?v - vehicle ?r - road_type_road_0154 ?next - road_type_macro_0013)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0154-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0154 ?next - road_type_road_0102)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0154-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0154 ?next - road_type_road_0103)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0156-road_0122
    :parameters (?v - vehicle ?r - road_type_road_0156 ?next - road_type_road_0122)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0156-road_0123
    :parameters (?v - vehicle ?r - road_type_road_0156 ?next - road_type_road_0123)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0157-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0157 ?next - road_type_road_0019)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0157-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0157 ?next - road_type_road_0020)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0158-macro_0006
    :parameters (?v - vehicle ?r - road_type_road_0158 ?next - road_type_macro_0006)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0158-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0158 ?next - road_type_road_0069)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0158-road_0070
    :parameters (?v - vehicle ?r - road_type_road_0158 ?next - road_type_road_0070)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0159-road_0160
    :parameters (?v - vehicle ?r - road_type_road_0159 ?next - road_type_road_0160)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0160-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0160 ?next - road_type_road_0158)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0160-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0160 ?next - road_type_road_0159)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0161-macro_0015
    :parameters (?v - vehicle ?r - road_type_road_0161 ?next - road_type_macro_0015)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (not (road-blocked ?r))
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
    )
  )

  (:action traverse-road-static-road_0161-road_0135
    :parameters (?v - vehicle ?r - road_type_road_0161 ?next - road_type_road_0135)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
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
