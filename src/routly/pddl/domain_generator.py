from __future__ import annotations

from src.routly.features import FeatureConfig


def build_road_network_domain(features: FeatureConfig | None = None) -> str:
    """
    Build a PDDL+ domain string conditioned on active features.

    Feature matrix:
      base          — connects, road-open, at, on-road, moving
                      road-length, speed-limit, distance-remaining, speed, total-distance
                      start-traversal (4-param), traverse process, arrive event

      +traffic_lights  — has-traffic-light predicate, light-wait + travel-time functions
                         arrive-at-traffic-light event (adds light-wait to travel-time)
                         metric changes to minimize travel-time

      +congestion_pddl — congested predicate, congestion-factor function
                         start-traversal assigns speed = speed-limit / congestion-factor
                         planner naturally avoids slow congested roads

      +llm_events      — road-blocked predicate declared (road-open already gates traversal)
                         LLM populates blocked roads in the problem file at runtime
    """
    if features is None:
        features = FeatureConfig.base()

    predicates  = _build_predicates(features)
    functions   = _build_functions(features)
    action      = _build_action(features)
    process     = _build_process()
    events      = _build_events(features)

    return f"""\
;; ============================================================
;;  DOMAIN: road-network
;;  Features: {features.label}
;;    traffic_lights  : {features.traffic_lights}
;;    congestion mode : {features.congestion.mode}
;;    llm_events      : {features.llm_events.enabled}
;; ============================================================

(define (domain road-network)
  (:requirements :typing :numeric-fluents :time)
  (:types vehicle location road)

{predicates}

{functions}

{action}

{process}

{events}
)
"""


# ── PREDICATES ────────────────────────────────────────────────────────────────

def _build_predicates(f: FeatureConfig) -> str:
    lines = [
        "  (:predicates",
        "    (connects  ?r - road  ?from - location  ?to - location)",
        "    (road-open ?r - road)",
    ]

    if f.traffic_lights:
        lines.append("    (has-traffic-light ?l - location)")

    # LLM events: road-blocked is declared so the domain is valid even when
    # no road is blocked. The LLM (or human) sets blocked roads in the problem.
    if f.llm_events.enabled:
        lines.append("    (road-blocked ?r - road)   ;; set by LLM event generator")

    lines += [
        "    (at       ?v - vehicle  ?l - location)",
        "    (on-road  ?v - vehicle  ?r - road)",
        "    (moving   ?v - vehicle)",
        "  )",
    ]
    return "\n".join(lines)


# ── FUNCTIONS ─────────────────────────────────────────────────────────────────

def _build_functions(f: FeatureConfig) -> str:
    lines = [
        "  (:functions",
        "    (road-length          ?r - road)",
        "    (speed-limit          ?r - road)",
    ]

    if f.congestion_in_pddl:
        lines.append("    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed")

    lines += [
        "    (distance-remaining   ?v - vehicle)",
        "    (speed                ?v - vehicle)",
        "    (total-distance       ?v - vehicle)",
    ]

    if f.traffic_lights:
        lines.append("    (light-wait           ?l - location)  ;; avg red-light wait (s)")
        lines.append("    (travel-time          ?v - vehicle)   ;; elapsed time incl. waits")

    lines.append("  )")
    return "\n".join(lines)


# ── ACTION ────────────────────────────────────────────────────────────────────

def _build_action(f: FeatureConfig) -> str:
    # Without congestion: speed = speed-limit
    # With congestion:    speed = speed-limit / congestion-factor
    #   (no extra parameter needed — congestion-factor is on the road object)

    extra_precond = ""
    if f.llm_events.enabled:
        extra_precond = "\n      (not (road-blocked ?r))"

    if f.congestion_in_pddl:
        speed_assign = "(assign (speed ?v) (/ (speed-limit ?r) (congestion-factor ?r)))"
    else:
        speed_assign = "(assign (speed ?v) (speed-limit ?r))"

    return f"""\
  (:action start-traversal
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r){extra_precond}
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      {speed_assign}
    )
  )"""


# ── PROCESS ───────────────────────────────────────────────────────────────────

def _build_process() -> str:
    # traverse is always the same — speed is already adjusted in start-traversal
    return """\
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
  )"""


# ── EVENTS ────────────────────────────────────────────────────────────────────

def _build_events(f: FeatureConfig) -> str:
    events = []

    if f.traffic_lights:
        # Two arrive events: plain intersection and signalized intersection
        events.append("""\
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
  )""")

        events.append("""\
  ;; Arrive at a signalized intersection — adds average red-light wait
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
  )""")

    else:
        # Single arrive event — no traffic light distinction
        events.append("""\
  (:event arrive
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (on-road ?v ?r)
      (moving ?v)
      (connects ?r ?from ?to)
      (<= (distance-remaining ?v) 0)
    )
    :effect (and
      (not (on-road ?v ?r))
      (not (moving ?v))
      (at ?v ?to)
      (assign (distance-remaining ?v) 0)
      (assign (speed ?v) 0)
    )
  )""")

    return "\n\n".join(events)
