;; ============================================================
;;  DOMAIN: road-network
;;  Features: tl_cong-pddl-static_llm
;;    traversal             : compiled_duration
;;    state representation  : node_based
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
    loc_type_loc_0000 loc_type_loc_0001 loc_type_loc_0002 loc_type_loc_0003 loc_type_loc_0004 loc_type_loc_0005 loc_type_loc_0006 loc_type_loc_0007 loc_type_loc_0008 loc_type_loc_0009 loc_type_loc_0010 loc_type_loc_0011 loc_type_loc_0012 loc_type_loc_0013 loc_type_loc_0014 loc_type_loc_0015 loc_type_loc_0016 loc_type_loc_0017 loc_type_loc_0018 loc_type_loc_0019 loc_type_loc_0020 loc_type_loc_0021 loc_type_loc_0022 loc_type_loc_0023 loc_type_loc_0024 loc_type_loc_0025 loc_type_loc_0026 loc_type_loc_0027 loc_type_loc_0028 loc_type_loc_0029 loc_type_loc_0030 loc_type_loc_0031 loc_type_loc_0032 loc_type_loc_0033 loc_type_loc_0034 loc_type_loc_0035 loc_type_loc_0036 loc_type_loc_0037 loc_type_loc_0038 loc_type_loc_0039 loc_type_loc_0040 loc_type_loc_0041 loc_type_loc_0042 loc_type_loc_0043 loc_type_loc_0044 loc_type_loc_0045 loc_type_loc_0046 loc_type_loc_0047 loc_type_loc_0048 loc_type_loc_0049 loc_type_loc_0050 loc_type_loc_0051 loc_type_loc_0052 loc_type_loc_0053 loc_type_loc_0054 loc_type_loc_0055 loc_type_loc_0056 loc_type_loc_0057 loc_type_loc_0058 loc_type_loc_0059 loc_type_loc_0060 loc_type_loc_0061 loc_type_loc_0062 loc_type_loc_0063 loc_type_loc_0064 loc_type_loc_0065 loc_type_loc_0066 loc_type_loc_0067 loc_type_loc_0068 loc_type_loc_0069 loc_type_loc_0070 loc_type_loc_0071 loc_type_loc_0072 loc_type_loc_0073 loc_type_loc_0074 loc_type_loc_0075 loc_type_loc_0076 loc_type_loc_0077 loc_type_loc_0078 loc_type_loc_0079 loc_type_loc_0080 loc_type_loc_0081 loc_type_loc_0082 loc_type_loc_0083 loc_type_loc_0084 loc_type_loc_0085 loc_type_loc_0086 loc_type_loc_0087 loc_type_loc_0088 loc_type_loc_0089 loc_type_loc_0090 loc_type_loc_0091 loc_type_loc_0092 loc_type_loc_0093 loc_type_loc_0094 loc_type_loc_0095 loc_type_loc_0096 loc_type_loc_0097 loc_type_loc_0098 loc_type_loc_0099 loc_type_loc_0100 loc_type_loc_0101 loc_type_loc_0102 loc_type_loc_0103 loc_type_loc_0104 loc_type_loc_0105 loc_type_loc_0106 loc_type_loc_0107 loc_type_loc_0108 loc_type_loc_0109 loc_type_loc_0110 loc_type_loc_0111 loc_type_loc_0112 loc_type_loc_0113 loc_type_loc_0114 loc_type_loc_0115 loc_type_loc_0116 loc_type_loc_0117 loc_type_loc_0118 loc_type_loc_0119 loc_type_loc_0120 loc_type_loc_0121 loc_type_loc_0122 loc_type_loc_0123 loc_type_loc_0124 loc_type_loc_0125 loc_type_loc_0126 loc_type_loc_0127 loc_type_loc_0128 loc_type_loc_0129 loc_type_loc_0130 loc_type_loc_0131 loc_type_loc_0132 loc_type_loc_0133 loc_type_loc_0134 loc_type_loc_0135 loc_type_loc_0136 loc_type_loc_0137 loc_type_loc_0138 loc_type_loc_0139 loc_type_loc_0140 loc_type_loc_0141 loc_type_loc_0142 loc_type_loc_0143 loc_type_loc_0144 loc_type_loc_0145 loc_type_loc_0146 loc_type_loc_0147 loc_type_loc_0148 loc_type_loc_0149
    - location
    road_type_road_0000 road_type_road_0001 road_type_road_0002 road_type_road_0003 road_type_road_0004 road_type_road_0005 road_type_road_0006 road_type_road_0007 road_type_road_0008 road_type_road_0009 road_type_road_0010 road_type_road_0011 road_type_road_0012 road_type_road_0013 road_type_road_0014 road_type_road_0015 road_type_road_0016 road_type_road_0017 road_type_road_0018 road_type_road_0019 road_type_road_0020 road_type_road_0021 road_type_road_0022 road_type_road_0023 road_type_road_0024 road_type_road_0025 road_type_road_0026 road_type_road_0027 road_type_road_0028 road_type_road_0029 road_type_road_0030 road_type_road_0031 road_type_road_0032 road_type_road_0033 road_type_road_0034 road_type_road_0035 road_type_road_0036 road_type_road_0037 road_type_road_0038 road_type_road_0039 road_type_road_0040 road_type_road_0041 road_type_road_0042 road_type_road_0043 road_type_road_0044 road_type_road_0045 road_type_road_0046 road_type_road_0047 road_type_road_0048 road_type_road_0049 road_type_road_0050 road_type_road_0051 road_type_road_0052 road_type_road_0053 road_type_road_0054 road_type_road_0055 road_type_road_0056 road_type_road_0057 road_type_road_0058 road_type_road_0059 road_type_road_0060 road_type_road_0061 road_type_road_0062 road_type_road_0063 road_type_road_0064 road_type_road_0065 road_type_road_0066 road_type_road_0067 road_type_road_0068 road_type_road_0069 road_type_road_0070 road_type_road_0071 road_type_road_0072 road_type_road_0073 road_type_road_0074 road_type_road_0075 road_type_road_0076 road_type_road_0077 road_type_road_0078 road_type_road_0079 road_type_road_0080 road_type_road_0081 road_type_road_0082 road_type_road_0083 road_type_road_0084 road_type_road_0085 road_type_road_0086 road_type_road_0087 road_type_road_0088 road_type_road_0089 road_type_road_0090 road_type_road_0091 road_type_road_0092 road_type_road_0093 road_type_road_0094 road_type_road_0095 road_type_road_0096 road_type_road_0097 road_type_road_0098 road_type_road_0099 road_type_road_0100 road_type_road_0101 road_type_road_0102 road_type_road_0103 road_type_road_0104 road_type_road_0105 road_type_road_0106 road_type_road_0107 road_type_road_0108 road_type_road_0109 road_type_road_0110 road_type_road_0111 road_type_road_0112 road_type_road_0113 road_type_road_0114 road_type_road_0115 road_type_road_0116 road_type_road_0117 road_type_road_0118 road_type_road_0119 road_type_road_0120 road_type_road_0121 road_type_road_0122 road_type_road_0123 road_type_road_0124 road_type_road_0125 road_type_road_0126 road_type_road_0127 road_type_road_0128 road_type_road_0129 road_type_road_0130 road_type_road_0131 road_type_road_0132 road_type_road_0133 road_type_road_0134 road_type_road_0135 road_type_road_0136 road_type_road_0137 road_type_road_0138 road_type_road_0139 road_type_road_0140 road_type_road_0141 road_type_road_0142 road_type_road_0143 road_type_road_0144 road_type_road_0145 road_type_road_0146 road_type_road_0147 road_type_road_0148 road_type_road_0149 road_type_road_0150 road_type_road_0151 road_type_road_0152 road_type_road_0153 road_type_road_0154 road_type_road_0155 road_type_road_0156 road_type_road_0157 road_type_road_0158 road_type_road_0159 road_type_road_0160 road_type_road_0161 road_type_road_0162 road_type_road_0163 road_type_road_0164 road_type_road_0165 road_type_road_0166 road_type_road_0167 road_type_road_0168 road_type_road_0169 road_type_road_0170 road_type_road_0171 road_type_road_0172 road_type_road_0173 road_type_road_0174 road_type_road_0175 road_type_road_0176 road_type_road_0177 road_type_road_0178 road_type_road_0179 road_type_road_0180 road_type_road_0181 road_type_road_0182 road_type_road_0183 road_type_road_0184 road_type_road_0185 road_type_road_0186 road_type_road_0187 road_type_road_0188 road_type_road_0189 road_type_road_0190 road_type_road_0191 road_type_road_0192 road_type_road_0193 road_type_road_0194 road_type_road_0195 road_type_road_0196 road_type_road_0197 road_type_road_0198 road_type_road_0199 road_type_road_0200 road_type_road_0201 road_type_road_0202 road_type_road_0203 road_type_road_0204 road_type_road_0205 road_type_road_0206 road_type_road_0207 road_type_road_0208 road_type_road_0209 road_type_road_0210 road_type_road_0211 road_type_road_0212 road_type_road_0213 road_type_road_0214 road_type_road_0215 road_type_road_0216 road_type_road_0217 road_type_road_0218 road_type_road_0219 road_type_road_0220 road_type_road_0221 road_type_road_0222 road_type_road_0223 road_type_road_0224 road_type_road_0225 road_type_road_0226 road_type_road_0227 road_type_road_0228 road_type_road_0229 road_type_road_0230 road_type_road_0231 road_type_road_0232 road_type_road_0233 road_type_road_0234 road_type_road_0235 road_type_road_0236 road_type_road_0237 road_type_road_0238 road_type_road_0239 road_type_road_0240 road_type_road_0241 road_type_road_0242 road_type_road_0243 road_type_road_0244
    - road
  )

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

  (:action traverse-road-static-road_0000
    :parameters (?v - vehicle ?r - road_type_road_0000 ?from - loc_type_loc_0000 ?to - loc_type_loc_0082)
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

  (:action traverse-road-static-road_0001
    :parameters (?v - vehicle ?r - road_type_road_0001 ?from - loc_type_loc_0001 ?to - loc_type_loc_0013)
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

  (:action traverse-road-static-road_0002
    :parameters (?v - vehicle ?r - road_type_road_0002 ?from - loc_type_loc_0001 ?to - loc_type_loc_0069)
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

  (:action traverse-road-static-road_0003
    :parameters (?v - vehicle ?r - road_type_road_0003 ?from - loc_type_loc_0002 ?to - loc_type_loc_0123)
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

  (:action traverse-road-static-road_0004
    :parameters (?v - vehicle ?r - road_type_road_0004 ?from - loc_type_loc_0003 ?to - loc_type_loc_0005)
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

  (:action traverse-road-static-road_0005
    :parameters (?v - vehicle ?r - road_type_road_0005 ?from - loc_type_loc_0003 ?to - loc_type_loc_0051)
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

  (:action traverse-road-static-road_0006
    :parameters (?v - vehicle ?r - road_type_road_0006 ?from - loc_type_loc_0004 ?to - loc_type_loc_0094)
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

  (:action traverse-road-static-road_0007
    :parameters (?v - vehicle ?r - road_type_road_0007 ?from - loc_type_loc_0004 ?to - loc_type_loc_0040)
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

  (:action traverse-road-static-road_0008
    :parameters (?v - vehicle ?r - road_type_road_0008 ?from - loc_type_loc_0004 ?to - loc_type_loc_0010)
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

  (:action traverse-road-static-road_0009
    :parameters (?v - vehicle ?r - road_type_road_0009 ?from - loc_type_loc_0005 ?to - loc_type_loc_0003)
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

  (:action traverse-road-static-road_0010
    :parameters (?v - vehicle ?r - road_type_road_0010 ?from - loc_type_loc_0005 ?to - loc_type_loc_0141)
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

  (:action traverse-road-static-road_0011
    :parameters (?v - vehicle ?r - road_type_road_0011 ?from - loc_type_loc_0006 ?to - loc_type_loc_0146)
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

  (:action traverse-road-static-road_0012
    :parameters (?v - vehicle ?r - road_type_road_0012 ?from - loc_type_loc_0006 ?to - loc_type_loc_0147)
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

  (:action traverse-road-static-road_0013
    :parameters (?v - vehicle ?r - road_type_road_0013 ?from - loc_type_loc_0007 ?to - loc_type_loc_0145)
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

  (:action traverse-road-static-road_0014
    :parameters (?v - vehicle ?r - road_type_road_0014 ?from - loc_type_loc_0008 ?to - loc_type_loc_0022)
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

  (:action traverse-road-static-road_0015
    :parameters (?v - vehicle ?r - road_type_road_0015 ?from - loc_type_loc_0009 ?to - loc_type_loc_0032)
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

  (:action traverse-road-static-road_0016
    :parameters (?v - vehicle ?r - road_type_road_0016 ?from - loc_type_loc_0010 ?to - loc_type_loc_0116)
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

  (:action traverse-road-static-road_0017
    :parameters (?v - vehicle ?r - road_type_road_0017 ?from - loc_type_loc_0010 ?to - loc_type_loc_0004)
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

  (:action traverse-road-static-road_0018
    :parameters (?v - vehicle ?r - road_type_road_0018 ?from - loc_type_loc_0012 ?to - loc_type_loc_0075)
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

  (:action traverse-road-static-road_0019
    :parameters (?v - vehicle ?r - road_type_road_0019 ?from - loc_type_loc_0013 ?to - loc_type_loc_0001)
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

  (:action traverse-road-static-road_0020
    :parameters (?v - vehicle ?r - road_type_road_0020 ?from - loc_type_loc_0014 ?to - loc_type_loc_0135)
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

  (:action traverse-road-static-road_0021
    :parameters (?v - vehicle ?r - road_type_road_0021 ?from - loc_type_loc_0015 ?to - loc_type_loc_0083)
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

  (:action traverse-road-static-road_0022
    :parameters (?v - vehicle ?r - road_type_road_0022 ?from - loc_type_loc_0016 ?to - loc_type_loc_0006)
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

  (:action traverse-road-static-road_0023
    :parameters (?v - vehicle ?r - road_type_road_0023 ?from - loc_type_loc_0017 ?to - loc_type_loc_0116)
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

  (:action traverse-road-static-road_0024
    :parameters (?v - vehicle ?r - road_type_road_0024 ?from - loc_type_loc_0017 ?to - loc_type_loc_0115)
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

  (:action traverse-road-static-road_0025
    :parameters (?v - vehicle ?r - road_type_road_0025 ?from - loc_type_loc_0017 ?to - loc_type_loc_0080)
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

  (:action traverse-road-static-road_0026
    :parameters (?v - vehicle ?r - road_type_road_0026 ?from - loc_type_loc_0018 ?to - loc_type_loc_0132)
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

  (:action traverse-road-static-road_0027
    :parameters (?v - vehicle ?r - road_type_road_0027 ?from - loc_type_loc_0018 ?to - loc_type_loc_0087)
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

  (:action traverse-road-static-road_0028
    :parameters (?v - vehicle ?r - road_type_road_0028 ?from - loc_type_loc_0018 ?to - loc_type_loc_0022)
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

  (:action traverse-road-static-road_0029
    :parameters (?v - vehicle ?r - road_type_road_0029 ?from - loc_type_loc_0019 ?to - loc_type_loc_0078)
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

  (:action traverse-road-static-road_0030
    :parameters (?v - vehicle ?r - road_type_road_0030 ?from - loc_type_loc_0020 ?to - loc_type_loc_0128)
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

  (:action traverse-road-static-road_0031
    :parameters (?v - vehicle ?r - road_type_road_0031 ?from - loc_type_loc_0021 ?to - loc_type_loc_0104)
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

  (:action traverse-road-static-road_0032
    :parameters (?v - vehicle ?r - road_type_road_0032 ?from - loc_type_loc_0022 ?to - loc_type_loc_0008)
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

  (:action traverse-road-static-road_0033
    :parameters (?v - vehicle ?r - road_type_road_0033 ?from - loc_type_loc_0022 ?to - loc_type_loc_0131)
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

  (:action traverse-road-static-road_0034
    :parameters (?v - vehicle ?r - road_type_road_0034 ?from - loc_type_loc_0023 ?to - loc_type_loc_0132)
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

  (:action traverse-road-static-road_0035
    :parameters (?v - vehicle ?r - road_type_road_0035 ?from - loc_type_loc_0024 ?to - loc_type_loc_0025)
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

  (:action traverse-road-static-road_0036
    :parameters (?v - vehicle ?r - road_type_road_0036 ?from - loc_type_loc_0024 ?to - loc_type_loc_0031)
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

  (:action traverse-road-static-road_0037
    :parameters (?v - vehicle ?r - road_type_road_0037 ?from - loc_type_loc_0025 ?to - loc_type_loc_0143)
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

  (:action traverse-road-static-road_0038
    :parameters (?v - vehicle ?r - road_type_road_0038 ?from - loc_type_loc_0025 ?to - loc_type_loc_0071)
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

  (:action traverse-road-static-road_0039
    :parameters (?v - vehicle ?r - road_type_road_0039 ?from - loc_type_loc_0026 ?to - loc_type_loc_0148)
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

  (:action traverse-road-static-road_0040
    :parameters (?v - vehicle ?r - road_type_road_0040 ?from - loc_type_loc_0026 ?to - loc_type_loc_0038)
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

  (:action traverse-road-static-road_0041
    :parameters (?v - vehicle ?r - road_type_road_0041 ?from - loc_type_loc_0028 ?to - loc_type_loc_0054)
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

  (:action traverse-road-static-road_0042
    :parameters (?v - vehicle ?r - road_type_road_0042 ?from - loc_type_loc_0029 ?to - loc_type_loc_0073)
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

  (:action traverse-road-static-road_0043
    :parameters (?v - vehicle ?r - road_type_road_0043 ?from - loc_type_loc_0029 ?to - loc_type_loc_0135)
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

  (:action traverse-road-static-road_0044
    :parameters (?v - vehicle ?r - road_type_road_0044 ?from - loc_type_loc_0030 ?to - loc_type_loc_0089)
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

  (:action traverse-road-static-road_0045
    :parameters (?v - vehicle ?r - road_type_road_0045 ?from - loc_type_loc_0031 ?to - loc_type_loc_0145)
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

  (:action traverse-road-static-road_0046
    :parameters (?v - vehicle ?r - road_type_road_0046 ?from - loc_type_loc_0032 ?to - loc_type_loc_0062)
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

  (:action traverse-road-static-road_0047
    :parameters (?v - vehicle ?r - road_type_road_0047 ?from - loc_type_loc_0033 ?to - loc_type_loc_0037)
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

  (:action traverse-road-static-road_0048
    :parameters (?v - vehicle ?r - road_type_road_0048 ?from - loc_type_loc_0033 ?to - loc_type_loc_0140)
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

  (:action traverse-road-static-road_0049
    :parameters (?v - vehicle ?r - road_type_road_0049 ?from - loc_type_loc_0034 ?to - loc_type_loc_0050)
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

  (:action traverse-road-static-road_0050
    :parameters (?v - vehicle ?r - road_type_road_0050 ?from - loc_type_loc_0034 ?to - loc_type_loc_0063)
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

  (:action traverse-road-static-road_0051
    :parameters (?v - vehicle ?r - road_type_road_0051 ?from - loc_type_loc_0035 ?to - loc_type_loc_0115)
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

  (:action traverse-road-static-road_0052
    :parameters (?v - vehicle ?r - road_type_road_0052 ?from - loc_type_loc_0035 ?to - loc_type_loc_0085)
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

  (:action traverse-road-static-road_0053
    :parameters (?v - vehicle ?r - road_type_road_0053 ?from - loc_type_loc_0036 ?to - loc_type_loc_0095)
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

  (:action traverse-road-static-road_0054
    :parameters (?v - vehicle ?r - road_type_road_0054 ?from - loc_type_loc_0036 ?to - loc_type_loc_0035)
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

  (:action traverse-road-static-road_0055
    :parameters (?v - vehicle ?r - road_type_road_0055 ?from - loc_type_loc_0037 ?to - loc_type_loc_0033)
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

  (:action traverse-road-static-road_0056
    :parameters (?v - vehicle ?r - road_type_road_0056 ?from - loc_type_loc_0037 ?to - loc_type_loc_0019)
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

  (:action traverse-road-static-road_0057
    :parameters (?v - vehicle ?r - road_type_road_0057 ?from - loc_type_loc_0038 ?to - loc_type_loc_0026)
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

  (:action traverse-road-static-road_0058
    :parameters (?v - vehicle ?r - road_type_road_0058 ?from - loc_type_loc_0039 ?to - loc_type_loc_0053)
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

  (:action traverse-road-static-road_0059
    :parameters (?v - vehicle ?r - road_type_road_0059 ?from - loc_type_loc_0039 ?to - loc_type_loc_0028)
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

  (:action traverse-road-static-road_0060
    :parameters (?v - vehicle ?r - road_type_road_0060 ?from - loc_type_loc_0040 ?to - loc_type_loc_0004)
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

  (:action traverse-road-static-road_0061
    :parameters (?v - vehicle ?r - road_type_road_0061 ?from - loc_type_loc_0040 ?to - loc_type_loc_0089)
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

  (:action traverse-road-static-road_0062
    :parameters (?v - vehicle ?r - road_type_road_0062 ?from - loc_type_loc_0040 ?to - loc_type_loc_0039)
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

  (:action traverse-road-static-road_0063
    :parameters (?v - vehicle ?r - road_type_road_0063 ?from - loc_type_loc_0041 ?to - loc_type_loc_0046)
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

  (:action traverse-road-static-road_0064
    :parameters (?v - vehicle ?r - road_type_road_0064 ?from - loc_type_loc_0041 ?to - loc_type_loc_0137)
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

  (:action traverse-road-static-road_0065
    :parameters (?v - vehicle ?r - road_type_road_0065 ?from - loc_type_loc_0042 ?to - loc_type_loc_0112)
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

  (:action traverse-road-static-road_0066
    :parameters (?v - vehicle ?r - road_type_road_0066 ?from - loc_type_loc_0043 ?to - loc_type_loc_0055)
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

  (:action traverse-road-static-road_0067
    :parameters (?v - vehicle ?r - road_type_road_0067 ?from - loc_type_loc_0044 ?to - loc_type_loc_0109)
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

  (:action traverse-road-static-road_0068
    :parameters (?v - vehicle ?r - road_type_road_0068 ?from - loc_type_loc_0045 ?to - loc_type_loc_0138)
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

  (:action traverse-road-static-road_0069
    :parameters (?v - vehicle ?r - road_type_road_0069 ?from - loc_type_loc_0045 ?to - loc_type_loc_0021)
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

  (:action traverse-road-static-road_0070
    :parameters (?v - vehicle ?r - road_type_road_0070 ?from - loc_type_loc_0047 ?to - loc_type_loc_0075)
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

  (:action traverse-road-static-road_0071
    :parameters (?v - vehicle ?r - road_type_road_0071 ?from - loc_type_loc_0047 ?to - loc_type_loc_0124)
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

  (:action traverse-road-static-road_0072
    :parameters (?v - vehicle ?r - road_type_road_0072 ?from - loc_type_loc_0048 ?to - loc_type_loc_0036)
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

  (:action traverse-road-static-road_0073
    :parameters (?v - vehicle ?r - road_type_road_0073 ?from - loc_type_loc_0049 ?to - loc_type_loc_0125)
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

  (:action traverse-road-static-road_0074
    :parameters (?v - vehicle ?r - road_type_road_0074 ?from - loc_type_loc_0050 ?to - loc_type_loc_0113)
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

  (:action traverse-road-static-road_0075
    :parameters (?v - vehicle ?r - road_type_road_0075 ?from - loc_type_loc_0050 ?to - loc_type_loc_0092)
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

  (:action traverse-road-static-road_0076
    :parameters (?v - vehicle ?r - road_type_road_0076 ?from - loc_type_loc_0051 ?to - loc_type_loc_0114)
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

  (:action traverse-road-static-road_0077
    :parameters (?v - vehicle ?r - road_type_road_0077 ?from - loc_type_loc_0051 ?to - loc_type_loc_0003)
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

  (:action traverse-road-static-road_0078
    :parameters (?v - vehicle ?r - road_type_road_0078 ?from - loc_type_loc_0051 ?to - loc_type_loc_0049)
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

  (:action traverse-road-static-road_0079
    :parameters (?v - vehicle ?r - road_type_road_0079 ?from - loc_type_loc_0052 ?to - loc_type_loc_0135)
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

  (:action traverse-road-static-road_0080
    :parameters (?v - vehicle ?r - road_type_road_0080 ?from - loc_type_loc_0053 ?to - loc_type_loc_0039)
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

  (:action traverse-road-static-road_0081
    :parameters (?v - vehicle ?r - road_type_road_0081 ?from - loc_type_loc_0054 ?to - loc_type_loc_0083)
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

  (:action traverse-road-static-road_0082
    :parameters (?v - vehicle ?r - road_type_road_0082 ?from - loc_type_loc_0055 ?to - loc_type_loc_0043)
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

  (:action traverse-road-static-road_0083
    :parameters (?v - vehicle ?r - road_type_road_0083 ?from - loc_type_loc_0055 ?to - loc_type_loc_0042)
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

  (:action traverse-road-static-road_0084
    :parameters (?v - vehicle ?r - road_type_road_0084 ?from - loc_type_loc_0056 ?to - loc_type_loc_0005)
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

  (:action traverse-road-static-road_0085
    :parameters (?v - vehicle ?r - road_type_road_0085 ?from - loc_type_loc_0057 ?to - loc_type_loc_0079)
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

  (:action traverse-road-static-road_0086
    :parameters (?v - vehicle ?r - road_type_road_0086 ?from - loc_type_loc_0057 ?to - loc_type_loc_0064)
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

  (:action traverse-road-static-road_0087
    :parameters (?v - vehicle ?r - road_type_road_0087 ?from - loc_type_loc_0058 ?to - loc_type_loc_0096)
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

  (:action traverse-road-static-road_0088
    :parameters (?v - vehicle ?r - road_type_road_0088 ?from - loc_type_loc_0058 ?to - loc_type_loc_0111)
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

  (:action traverse-road-static-road_0089
    :parameters (?v - vehicle ?r - road_type_road_0089 ?from - loc_type_loc_0058 ?to - loc_type_loc_0085)
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

  (:action traverse-road-static-road_0090
    :parameters (?v - vehicle ?r - road_type_road_0090 ?from - loc_type_loc_0059 ?to - loc_type_loc_0104)
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

  (:action traverse-road-static-road_0091
    :parameters (?v - vehicle ?r - road_type_road_0091 ?from - loc_type_loc_0059 ?to - loc_type_loc_0139)
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

  (:action traverse-road-static-road_0092
    :parameters (?v - vehicle ?r - road_type_road_0092 ?from - loc_type_loc_0060 ?to - loc_type_loc_0128)
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

  (:action traverse-road-static-road_0093
    :parameters (?v - vehicle ?r - road_type_road_0093 ?from - loc_type_loc_0060 ?to - loc_type_loc_0142)
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

  (:action traverse-road-static-road_0094
    :parameters (?v - vehicle ?r - road_type_road_0094 ?from - loc_type_loc_0060 ?to - loc_type_loc_0062)
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

  (:action traverse-road-static-road_0095
    :parameters (?v - vehicle ?r - road_type_road_0095 ?from - loc_type_loc_0061 ?to - loc_type_loc_0105)
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

  (:action traverse-road-static-road_0096
    :parameters (?v - vehicle ?r - road_type_road_0096 ?from - loc_type_loc_0061 ?to - loc_type_loc_0134)
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

  (:action traverse-road-static-road_0097
    :parameters (?v - vehicle ?r - road_type_road_0097 ?from - loc_type_loc_0062 ?to - loc_type_loc_0032)
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

  (:action traverse-road-static-road_0098
    :parameters (?v - vehicle ?r - road_type_road_0098 ?from - loc_type_loc_0062 ?to - loc_type_loc_0009)
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

  (:action traverse-road-static-road_0099
    :parameters (?v - vehicle ?r - road_type_road_0099 ?from - loc_type_loc_0063 ?to - loc_type_loc_0093)
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

  (:action traverse-road-static-road_0100
    :parameters (?v - vehicle ?r - road_type_road_0100 ?from - loc_type_loc_0063 ?to - loc_type_loc_0068)
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

  (:action traverse-road-static-road_0101
    :parameters (?v - vehicle ?r - road_type_road_0101 ?from - loc_type_loc_0064 ?to - loc_type_loc_0102)
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

  (:action traverse-road-static-road_0102
    :parameters (?v - vehicle ?r - road_type_road_0102 ?from - loc_type_loc_0065 ?to - loc_type_loc_0110)
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

  (:action traverse-road-static-road_0103
    :parameters (?v - vehicle ?r - road_type_road_0103 ?from - loc_type_loc_0066 ?to - loc_type_loc_0045)
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

  (:action traverse-road-static-road_0104
    :parameters (?v - vehicle ?r - road_type_road_0104 ?from - loc_type_loc_0067 ?to - loc_type_loc_0098)
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

  (:action traverse-road-static-road_0105
    :parameters (?v - vehicle ?r - road_type_road_0105 ?from - loc_type_loc_0067 ?to - loc_type_loc_0122)
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

  (:action traverse-road-static-road_0106
    :parameters (?v - vehicle ?r - road_type_road_0106 ?from - loc_type_loc_0068 ?to - loc_type_loc_0063)
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

  (:action traverse-road-static-road_0107
    :parameters (?v - vehicle ?r - road_type_road_0107 ?from - loc_type_loc_0069 ?to - loc_type_loc_0027)
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

  (:action traverse-road-static-road_0108
    :parameters (?v - vehicle ?r - road_type_road_0108 ?from - loc_type_loc_0070 ?to - loc_type_loc_0051)
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

  (:action traverse-road-static-road_0109
    :parameters (?v - vehicle ?r - road_type_road_0109 ?from - loc_type_loc_0071 ?to - loc_type_loc_0109)
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

  (:action traverse-road-static-road_0110
    :parameters (?v - vehicle ?r - road_type_road_0110 ?from - loc_type_loc_0071 ?to - loc_type_loc_0025)
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

  (:action traverse-road-static-road_0111
    :parameters (?v - vehicle ?r - road_type_road_0111 ?from - loc_type_loc_0071 ?to - loc_type_loc_0145)
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

  (:action traverse-road-static-road_0112
    :parameters (?v - vehicle ?r - road_type_road_0112 ?from - loc_type_loc_0072 ?to - loc_type_loc_0128)
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

  (:action traverse-road-static-road_0113
    :parameters (?v - vehicle ?r - road_type_road_0113 ?from - loc_type_loc_0073 ?to - loc_type_loc_0116)
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

  (:action traverse-road-static-road_0114
    :parameters (?v - vehicle ?r - road_type_road_0114 ?from - loc_type_loc_0073 ?to - loc_type_loc_0113)
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

  (:action traverse-road-static-road_0115
    :parameters (?v - vehicle ?r - road_type_road_0115 ?from - loc_type_loc_0074 ?to - loc_type_loc_0136)
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

  (:action traverse-road-static-road_0116
    :parameters (?v - vehicle ?r - road_type_road_0116 ?from - loc_type_loc_0075 ?to - loc_type_loc_0096)
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

  (:action traverse-road-static-road_0117
    :parameters (?v - vehicle ?r - road_type_road_0117 ?from - loc_type_loc_0075 ?to - loc_type_loc_0012)
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

  (:action traverse-road-static-road_0118
    :parameters (?v - vehicle ?r - road_type_road_0118 ?from - loc_type_loc_0077 ?to - loc_type_loc_0048)
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

  (:action traverse-road-static-road_0119
    :parameters (?v - vehicle ?r - road_type_road_0119 ?from - loc_type_loc_0079 ?to - loc_type_loc_0060)
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

  (:action traverse-road-static-road_0120
    :parameters (?v - vehicle ?r - road_type_road_0120 ?from - loc_type_loc_0080 ?to - loc_type_loc_0074)
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

  (:action traverse-road-static-road_0121
    :parameters (?v - vehicle ?r - road_type_road_0121 ?from - loc_type_loc_0080 ?to - loc_type_loc_0015)
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

  (:action traverse-road-static-road_0122
    :parameters (?v - vehicle ?r - road_type_road_0122 ?from - loc_type_loc_0081 ?to - loc_type_loc_0086)
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

  (:action traverse-road-static-road_0123
    :parameters (?v - vehicle ?r - road_type_road_0123 ?from - loc_type_loc_0081 ?to - loc_type_loc_0101)
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

  (:action traverse-road-static-road_0124
    :parameters (?v - vehicle ?r - road_type_road_0124 ?from - loc_type_loc_0081 ?to - loc_type_loc_0090)
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

  (:action traverse-road-static-road_0125
    :parameters (?v - vehicle ?r - road_type_road_0125 ?from - loc_type_loc_0081 ?to - loc_type_loc_0127)
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

  (:action traverse-road-static-road_0126
    :parameters (?v - vehicle ?r - road_type_road_0126 ?from - loc_type_loc_0082 ?to - loc_type_loc_0101)
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

  (:action traverse-road-static-road_0127
    :parameters (?v - vehicle ?r - road_type_road_0127 ?from - loc_type_loc_0083 ?to - loc_type_loc_0024)
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

  (:action traverse-road-static-road_0128
    :parameters (?v - vehicle ?r - road_type_road_0128 ?from - loc_type_loc_0083 ?to - loc_type_loc_0084)
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

  (:action traverse-road-static-road_0129
    :parameters (?v - vehicle ?r - road_type_road_0129 ?from - loc_type_loc_0084 ?to - loc_type_loc_0083)
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

  (:action traverse-road-static-road_0130
    :parameters (?v - vehicle ?r - road_type_road_0130 ?from - loc_type_loc_0084 ?to - loc_type_loc_0030)
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

  (:action traverse-road-static-road_0131
    :parameters (?v - vehicle ?r - road_type_road_0131 ?from - loc_type_loc_0085 ?to - loc_type_loc_0058)
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

  (:action traverse-road-static-road_0132
    :parameters (?v - vehicle ?r - road_type_road_0132 ?from - loc_type_loc_0085 ?to - loc_type_loc_0048)
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

  (:action traverse-road-static-road_0133
    :parameters (?v - vehicle ?r - road_type_road_0133 ?from - loc_type_loc_0086 ?to - loc_type_loc_0100)
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

  (:action traverse-road-static-road_0134
    :parameters (?v - vehicle ?r - road_type_road_0134 ?from - loc_type_loc_0086 ?to - loc_type_loc_0066)
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

  (:action traverse-road-static-road_0135
    :parameters (?v - vehicle ?r - road_type_road_0135 ?from - loc_type_loc_0086 ?to - loc_type_loc_0097)
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

  (:action traverse-road-static-road_0136
    :parameters (?v - vehicle ?r - road_type_road_0136 ?from - loc_type_loc_0086 ?to - loc_type_loc_0081)
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

  (:action traverse-road-static-road_0137
    :parameters (?v - vehicle ?r - road_type_road_0137 ?from - loc_type_loc_0087 ?to - loc_type_loc_0018)
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

  (:action traverse-road-static-road_0138
    :parameters (?v - vehicle ?r - road_type_road_0138 ?from - loc_type_loc_0089 ?to - loc_type_loc_0084)
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

  (:action traverse-road-static-road_0139
    :parameters (?v - vehicle ?r - road_type_road_0139 ?from - loc_type_loc_0089 ?to - loc_type_loc_0040)
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

  (:action traverse-road-static-road_0140
    :parameters (?v - vehicle ?r - road_type_road_0140 ?from - loc_type_loc_0090 ?to - loc_type_loc_0059)
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

  (:action traverse-road-static-road_0141
    :parameters (?v - vehicle ?r - road_type_road_0141 ?from - loc_type_loc_0090 ?to - loc_type_loc_0081)
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

  (:action traverse-road-static-road_0142
    :parameters (?v - vehicle ?r - road_type_road_0142 ?from - loc_type_loc_0091 ?to - loc_type_loc_0076)
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

  (:action traverse-road-static-road_0143
    :parameters (?v - vehicle ?r - road_type_road_0143 ?from - loc_type_loc_0092 ?to - loc_type_loc_0133)
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

  (:action traverse-road-static-road_0144
    :parameters (?v - vehicle ?r - road_type_road_0144 ?from - loc_type_loc_0092 ?to - loc_type_loc_0034)
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

  (:action traverse-road-static-road_0145
    :parameters (?v - vehicle ?r - road_type_road_0145 ?from - loc_type_loc_0092 ?to - loc_type_loc_0050)
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

  (:action traverse-road-static-road_0146
    :parameters (?v - vehicle ?r - road_type_road_0146 ?from - loc_type_loc_0093 ?to - loc_type_loc_0091)
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

  (:action traverse-road-static-road_0147
    :parameters (?v - vehicle ?r - road_type_road_0147 ?from - loc_type_loc_0093 ?to - loc_type_loc_0144)
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

  (:action traverse-road-static-road_0148
    :parameters (?v - vehicle ?r - road_type_road_0148 ?from - loc_type_loc_0094 ?to - loc_type_loc_0004)
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

  (:action traverse-road-static-road_0149
    :parameters (?v - vehicle ?r - road_type_road_0149 ?from - loc_type_loc_0094 ?to - loc_type_loc_0138)
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

  (:action traverse-road-static-road_0150
    :parameters (?v - vehicle ?r - road_type_road_0150 ?from - loc_type_loc_0094 ?to - loc_type_loc_0105)
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

  (:action traverse-road-static-road_0151
    :parameters (?v - vehicle ?r - road_type_road_0151 ?from - loc_type_loc_0095 ?to - loc_type_loc_0029)
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

  (:action traverse-road-static-road_0152
    :parameters (?v - vehicle ?r - road_type_road_0152 ?from - loc_type_loc_0095 ?to - loc_type_loc_0077)
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

  (:action traverse-road-static-road_0153
    :parameters (?v - vehicle ?r - road_type_road_0153 ?from - loc_type_loc_0096 ?to - loc_type_loc_0058)
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

  (:action traverse-road-static-road_0154
    :parameters (?v - vehicle ?r - road_type_road_0154 ?from - loc_type_loc_0097 ?to - loc_type_loc_0119)
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

  (:action traverse-road-static-road_0155
    :parameters (?v - vehicle ?r - road_type_road_0155 ?from - loc_type_loc_0097 ?to - loc_type_loc_0098)
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

  (:action traverse-road-static-road_0156
    :parameters (?v - vehicle ?r - road_type_road_0156 ?from - loc_type_loc_0097 ?to - loc_type_loc_0086)
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

  (:action traverse-road-static-road_0157
    :parameters (?v - vehicle ?r - road_type_road_0157 ?from - loc_type_loc_0098 ?to - loc_type_loc_0070)
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

  (:action traverse-road-static-road_0158
    :parameters (?v - vehicle ?r - road_type_road_0158 ?from - loc_type_loc_0099 ?to - loc_type_loc_0097)
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

  (:action traverse-road-static-road_0159
    :parameters (?v - vehicle ?r - road_type_road_0159 ?from - loc_type_loc_0100 ?to - loc_type_loc_0056)
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

  (:action traverse-road-static-road_0160
    :parameters (?v - vehicle ?r - road_type_road_0160 ?from - loc_type_loc_0100 ?to - loc_type_loc_0070)
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

  (:action traverse-road-static-road_0161
    :parameters (?v - vehicle ?r - road_type_road_0161 ?from - loc_type_loc_0101 ?to - loc_type_loc_0056)
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

  (:action traverse-road-static-road_0162
    :parameters (?v - vehicle ?r - road_type_road_0162 ?from - loc_type_loc_0101 ?to - loc_type_loc_0081)
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

  (:action traverse-road-static-road_0163
    :parameters (?v - vehicle ?r - road_type_road_0163 ?from - loc_type_loc_0102 ?to - loc_type_loc_0127)
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

  (:action traverse-road-static-road_0164
    :parameters (?v - vehicle ?r - road_type_road_0164 ?from - loc_type_loc_0102 ?to - loc_type_loc_0081)
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

  (:action traverse-road-static-road_0165
    :parameters (?v - vehicle ?r - road_type_road_0165 ?from - loc_type_loc_0103 ?to - loc_type_loc_0117)
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

  (:action traverse-road-static-road_0166
    :parameters (?v - vehicle ?r - road_type_road_0166 ?from - loc_type_loc_0104 ?to - loc_type_loc_0061)
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

  (:action traverse-road-static-road_0167
    :parameters (?v - vehicle ?r - road_type_road_0167 ?from - loc_type_loc_0104 ?to - loc_type_loc_0059)
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

  (:action traverse-road-static-road_0168
    :parameters (?v - vehicle ?r - road_type_road_0168 ?from - loc_type_loc_0105 ?to - loc_type_loc_0057)
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

  (:action traverse-road-static-road_0169
    :parameters (?v - vehicle ?r - road_type_road_0169 ?from - loc_type_loc_0106 ?to - loc_type_loc_0122)
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

  (:action traverse-road-static-road_0170
    :parameters (?v - vehicle ?r - road_type_road_0170 ?from - loc_type_loc_0107 ?to - loc_type_loc_0129)
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

  (:action traverse-road-static-road_0171
    :parameters (?v - vehicle ?r - road_type_road_0171 ?from - loc_type_loc_0107 ?to - loc_type_loc_0108)
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

  (:action traverse-road-static-road_0172
    :parameters (?v - vehicle ?r - road_type_road_0172 ?from - loc_type_loc_0108 ?to - loc_type_loc_0126)
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

  (:action traverse-road-static-road_0173
    :parameters (?v - vehicle ?r - road_type_road_0173 ?from - loc_type_loc_0109 ?to - loc_type_loc_0044)
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

  (:action traverse-road-static-road_0174
    :parameters (?v - vehicle ?r - road_type_road_0174 ?from - loc_type_loc_0109 ?to - loc_type_loc_0031)
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

  (:action traverse-road-static-road_0175
    :parameters (?v - vehicle ?r - road_type_road_0175 ?from - loc_type_loc_0110 ?to - loc_type_loc_0055)
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

  (:action traverse-road-static-road_0176
    :parameters (?v - vehicle ?r - road_type_road_0176 ?from - loc_type_loc_0110 ?to - loc_type_loc_0065)
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

  (:action traverse-road-static-road_0177
    :parameters (?v - vehicle ?r - road_type_road_0177 ?from - loc_type_loc_0110 ?to - loc_type_loc_0143)
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

  (:action traverse-road-static-road_0178
    :parameters (?v - vehicle ?r - road_type_road_0178 ?from - loc_type_loc_0111 ?to - loc_type_loc_0115)
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

  (:action traverse-road-static-road_0179
    :parameters (?v - vehicle ?r - road_type_road_0179 ?from - loc_type_loc_0113 ?to - loc_type_loc_0077)
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

  (:action traverse-road-static-road_0180
    :parameters (?v - vehicle ?r - road_type_road_0180 ?from - loc_type_loc_0113 ?to - loc_type_loc_0050)
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

  (:action traverse-road-static-road_0181
    :parameters (?v - vehicle ?r - road_type_road_0181 ?from - loc_type_loc_0113 ?to - loc_type_loc_0073)
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

  (:action traverse-road-static-road_0182
    :parameters (?v - vehicle ?r - road_type_road_0182 ?from - loc_type_loc_0114 ?to - loc_type_loc_0051)
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

  (:action traverse-road-static-road_0183
    :parameters (?v - vehicle ?r - road_type_road_0183 ?from - loc_type_loc_0114 ?to - loc_type_loc_0106)
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

  (:action traverse-road-static-road_0184
    :parameters (?v - vehicle ?r - road_type_road_0184 ?from - loc_type_loc_0115 ?to - loc_type_loc_0035)
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

  (:action traverse-road-static-road_0185
    :parameters (?v - vehicle ?r - road_type_road_0185 ?from - loc_type_loc_0115 ?to - loc_type_loc_0017)
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

  (:action traverse-road-static-road_0186
    :parameters (?v - vehicle ?r - road_type_road_0186 ?from - loc_type_loc_0116 ?to - loc_type_loc_0123)
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

  (:action traverse-road-static-road_0187
    :parameters (?v - vehicle ?r - road_type_road_0187 ?from - loc_type_loc_0116 ?to - loc_type_loc_0010)
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

  (:action traverse-road-static-road_0188
    :parameters (?v - vehicle ?r - road_type_road_0188 ?from - loc_type_loc_0116 ?to - loc_type_loc_0073)
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

  (:action traverse-road-static-road_0189
    :parameters (?v - vehicle ?r - road_type_road_0189 ?from - loc_type_loc_0117 ?to - loc_type_loc_0114)
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

  (:action traverse-road-static-road_0190
    :parameters (?v - vehicle ?r - road_type_road_0190 ?from - loc_type_loc_0117 ?to - loc_type_loc_0106)
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

  (:action traverse-road-static-road_0191
    :parameters (?v - vehicle ?r - road_type_road_0191 ?from - loc_type_loc_0118 ?to - loc_type_loc_0067)
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

  (:action traverse-road-static-road_0192
    :parameters (?v - vehicle ?r - road_type_road_0192 ?from - loc_type_loc_0119 ?to - loc_type_loc_0118)
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

  (:action traverse-road-static-road_0193
    :parameters (?v - vehicle ?r - road_type_road_0193 ?from - loc_type_loc_0119 ?to - loc_type_loc_0149)
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

  (:action traverse-road-static-road_0194
    :parameters (?v - vehicle ?r - road_type_road_0194 ?from - loc_type_loc_0120 ?to - loc_type_loc_0121)
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

  (:action traverse-road-static-road_0195
    :parameters (?v - vehicle ?r - road_type_road_0195 ?from - loc_type_loc_0120 ?to - loc_type_loc_0013)
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

  (:action traverse-road-static-road_0196
    :parameters (?v - vehicle ?r - road_type_road_0196 ?from - loc_type_loc_0121 ?to - loc_type_loc_0099)
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

  (:action traverse-road-static-road_0197
    :parameters (?v - vehicle ?r - road_type_road_0197 ?from - loc_type_loc_0122 ?to - loc_type_loc_0107)
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

  (:action traverse-road-static-road_0198
    :parameters (?v - vehicle ?r - road_type_road_0198 ?from - loc_type_loc_0123 ?to - loc_type_loc_0116)
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

  (:action traverse-road-static-road_0199
    :parameters (?v - vehicle ?r - road_type_road_0199 ?from - loc_type_loc_0123 ?to - loc_type_loc_0002)
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

  (:action traverse-road-static-road_0200
    :parameters (?v - vehicle ?r - road_type_road_0200 ?from - loc_type_loc_0123 ?to - loc_type_loc_0099)
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

  (:action traverse-road-static-road_0201
    :parameters (?v - vehicle ?r - road_type_road_0201 ?from - loc_type_loc_0124 ?to - loc_type_loc_0074)
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

  (:action traverse-road-static-road_0202
    :parameters (?v - vehicle ?r - road_type_road_0202 ?from - loc_type_loc_0125 ?to - loc_type_loc_0049)
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

  (:action traverse-road-static-road_0203
    :parameters (?v - vehicle ?r - road_type_road_0203 ?from - loc_type_loc_0125 ?to - loc_type_loc_0103)
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

  (:action traverse-road-static-road_0204
    :parameters (?v - vehicle ?r - road_type_road_0204 ?from - loc_type_loc_0126 ?to - loc_type_loc_0125)
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

  (:action traverse-road-static-road_0205
    :parameters (?v - vehicle ?r - road_type_road_0205 ?from - loc_type_loc_0126 ?to - loc_type_loc_0103)
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

  (:action traverse-road-static-road_0206
    :parameters (?v - vehicle ?r - road_type_road_0206 ?from - loc_type_loc_0127 ?to - loc_type_loc_0026)
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

  (:action traverse-road-static-road_0207
    :parameters (?v - vehicle ?r - road_type_road_0207 ?from - loc_type_loc_0128 ?to - loc_type_loc_0020)
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

  (:action traverse-road-static-road_0208
    :parameters (?v - vehicle ?r - road_type_road_0208 ?from - loc_type_loc_0128 ?to - loc_type_loc_0072)
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

  (:action traverse-road-static-road_0209
    :parameters (?v - vehicle ?r - road_type_road_0209 ?from - loc_type_loc_0129 ?to - loc_type_loc_0108)
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

  (:action traverse-road-static-road_0210
    :parameters (?v - vehicle ?r - road_type_road_0210 ?from - loc_type_loc_0130 ?to - loc_type_loc_0132)
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

  (:action traverse-road-static-road_0211
    :parameters (?v - vehicle ?r - road_type_road_0211 ?from - loc_type_loc_0132 ?to - loc_type_loc_0018)
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

  (:action traverse-road-static-road_0212
    :parameters (?v - vehicle ?r - road_type_road_0212 ?from - loc_type_loc_0132 ?to - loc_type_loc_0130)
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

  (:action traverse-road-static-road_0213
    :parameters (?v - vehicle ?r - road_type_road_0213 ?from - loc_type_loc_0132 ?to - loc_type_loc_0023)
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

  (:action traverse-road-static-road_0214
    :parameters (?v - vehicle ?r - road_type_road_0214 ?from - loc_type_loc_0133 ?to - loc_type_loc_0033)
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

  (:action traverse-road-static-road_0215
    :parameters (?v - vehicle ?r - road_type_road_0215 ?from - loc_type_loc_0134 ?to - loc_type_loc_0138)
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

  (:action traverse-road-static-road_0216
    :parameters (?v - vehicle ?r - road_type_road_0216 ?from - loc_type_loc_0134 ?to - loc_type_loc_0021)
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

  (:action traverse-road-static-road_0217
    :parameters (?v - vehicle ?r - road_type_road_0217 ?from - loc_type_loc_0135 ?to - loc_type_loc_0052)
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

  (:action traverse-road-static-road_0218
    :parameters (?v - vehicle ?r - road_type_road_0218 ?from - loc_type_loc_0135 ?to - loc_type_loc_0014)
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

  (:action traverse-road-static-road_0219
    :parameters (?v - vehicle ?r - road_type_road_0219 ?from - loc_type_loc_0135 ?to - loc_type_loc_0029)
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

  (:action traverse-road-static-road_0220
    :parameters (?v - vehicle ?r - road_type_road_0220 ?from - loc_type_loc_0136 ?to - loc_type_loc_0111)
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

  (:action traverse-road-static-road_0221
    :parameters (?v - vehicle ?r - road_type_road_0221 ?from - loc_type_loc_0136 ?to - loc_type_loc_0047)
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

  (:action traverse-road-static-road_0222
    :parameters (?v - vehicle ?r - road_type_road_0222 ?from - loc_type_loc_0138 ?to - loc_type_loc_0134)
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

  (:action traverse-road-static-road_0223
    :parameters (?v - vehicle ?r - road_type_road_0223 ?from - loc_type_loc_0138 ?to - loc_type_loc_0094)
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

  (:action traverse-road-static-road_0224
    :parameters (?v - vehicle ?r - road_type_road_0224 ?from - loc_type_loc_0139 ?to - loc_type_loc_0066)
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

  (:action traverse-road-static-road_0225
    :parameters (?v - vehicle ?r - road_type_road_0225 ?from - loc_type_loc_0139 ?to - loc_type_loc_0090)
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

  (:action traverse-road-static-road_0226
    :parameters (?v - vehicle ?r - road_type_road_0226 ?from - loc_type_loc_0140 ?to - loc_type_loc_0041)
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

  (:action traverse-road-static-road_0227
    :parameters (?v - vehicle ?r - road_type_road_0227 ?from - loc_type_loc_0141 ?to - loc_type_loc_0000)
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

  (:action traverse-road-static-road_0228
    :parameters (?v - vehicle ?r - road_type_road_0228 ?from - loc_type_loc_0141 ?to - loc_type_loc_0082)
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

  (:action traverse-road-static-road_0229
    :parameters (?v - vehicle ?r - road_type_road_0229 ?from - loc_type_loc_0142 ?to - loc_type_loc_0060)
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

  (:action traverse-road-static-road_0230
    :parameters (?v - vehicle ?r - road_type_road_0230 ?from - loc_type_loc_0143 ?to - loc_type_loc_0087)
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

  (:action traverse-road-static-road_0231
    :parameters (?v - vehicle ?r - road_type_road_0231 ?from - loc_type_loc_0143 ?to - loc_type_loc_0110)
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

  (:action traverse-road-static-road_0232
    :parameters (?v - vehicle ?r - road_type_road_0232 ?from - loc_type_loc_0143 ?to - loc_type_loc_0025)
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

  (:action traverse-road-static-road_0233
    :parameters (?v - vehicle ?r - road_type_road_0233 ?from - loc_type_loc_0144 ?to - loc_type_loc_0011)
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

  (:action traverse-road-static-road_0234
    :parameters (?v - vehicle ?r - road_type_road_0234 ?from - loc_type_loc_0145 ?to - loc_type_loc_0071)
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

  (:action traverse-road-static-road_0235
    :parameters (?v - vehicle ?r - road_type_road_0235 ?from - loc_type_loc_0145 ?to - loc_type_loc_0146)
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

  (:action traverse-road-static-road_0236
    :parameters (?v - vehicle ?r - road_type_road_0236 ?from - loc_type_loc_0146 ?to - loc_type_loc_0007)
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

  (:action traverse-road-static-road_0237
    :parameters (?v - vehicle ?r - road_type_road_0237 ?from - loc_type_loc_0146 ?to - loc_type_loc_0145)
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

  (:action traverse-road-static-road_0238
    :parameters (?v - vehicle ?r - road_type_road_0238 ?from - loc_type_loc_0146 ?to - loc_type_loc_0006)
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

  (:action traverse-road-static-road_0239
    :parameters (?v - vehicle ?r - road_type_road_0239 ?from - loc_type_loc_0147 ?to - loc_type_loc_0088)
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

  (:action traverse-road-static-road_0240
    :parameters (?v - vehicle ?r - road_type_road_0240 ?from - loc_type_loc_0147 ?to - loc_type_loc_0016)
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

  (:action traverse-road-static-road_0241
    :parameters (?v - vehicle ?r - road_type_road_0241 ?from - loc_type_loc_0148 ?to - loc_type_loc_0064)
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

  (:action traverse-road-static-road_0242
    :parameters (?v - vehicle ?r - road_type_road_0242 ?from - loc_type_loc_0148 ?to - loc_type_loc_0079)
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

  (:action traverse-road-static-road_0243
    :parameters (?v - vehicle ?r - road_type_road_0243 ?from - loc_type_loc_0149 ?to - loc_type_loc_0119)
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

  (:action traverse-road-static-road_0244
    :parameters (?v - vehicle ?r - road_type_road_0244 ?from - loc_type_loc_0149 ?to - loc_type_loc_0120)
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
