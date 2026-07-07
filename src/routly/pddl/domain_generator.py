from __future__ import annotations

from src.routly.features import FeatureConfig

TRAVERSAL_PROCESS = "process"
TRAVERSAL_COMPILED_DURATION = "compiled_duration"
VALID_TRAVERSAL_MODELS = {TRAVERSAL_PROCESS, TRAVERSAL_COMPILED_DURATION}


def build_road_network_domain(
    features: FeatureConfig | None = None,
    traversal_model: str = TRAVERSAL_PROCESS,
) -> str:
    """
    Build a PDDL+ domain string conditioned on active features.
    """
    if features is None:
        features = FeatureConfig.base()
    traversal_model = _validate_traversal_model(features, traversal_model)

    predicates = _build_predicates(features, traversal_model)
    functions = _build_functions(features, traversal_model)
    action = _build_action(features, traversal_model)
    refuel = _build_refuel(features, traversal_model)
    process = _build_process(features, traversal_model)
    events = _build_events(features, traversal_model)

    blocks = [predicates, functions, action]
    if refuel:
        blocks.append(refuel)
    if process:
        blocks.append(process)
    if events:
        blocks.append(events)
    body = "\n\n".join(blocks)
    requirements = ":typing :numeric-fluents"
    if traversal_model == TRAVERSAL_PROCESS:
        requirements += " :time"

    return f"""\
;; ============================================================
;;  DOMAIN: road-network
;;  Features: {features.label}
;;    traversal      : {traversal_model}
;;    traffic_lights  : {features.traffic_lights}
;;    congestion      : enabled={features.congestion.enabled}, mode={features.congestion.mode}, type={features.congestion.type}
;;    llm_events      : {features.llm_events.enabled}
;;    fuel            : enabled={features.fuel.enabled}, replanning={features.fuel.replanning}, consumption={features.fuel.consumption_mode}
;; ============================================================

(define (domain road-network)
  (:requirements {requirements})
  (:types vehicle location road{_time_window_type(features)})

{body}
)
"""


def _build_predicates(f: FeatureConfig, traversal_model: str) -> str:
    lines = [
        "  (:predicates",
        "    (connects  ?r - road  ?from - location  ?to - location)",
        "    (road-open ?r - road)",
    ]

    if f.traffic_lights:
        lines.append("    (has-traffic-light ?l - location)")

    if f.fuel_in_pddl:
        lines.append("    (has-fuel-station ?l - location)   ;; refuelling point")

    if f.dynamic_congestion_in_pddl:
        lines.append("    (congestion-update-pending ?r - road ?w - time-window)")

    if f.llm_events.enabled:
        lines.append("    (road-blocked ?r - road)   ;; set by LLM event generator")
        lines.append("    (location-blocked ?l - location)   ;; derived from blocked roads")

    lines.append("    (at       ?v - vehicle  ?l - location)")
    if traversal_model == TRAVERSAL_PROCESS:
        lines.append("    (on-road  ?v - vehicle  ?r - road)")
        lines.append("    (moving   ?v - vehicle)")
    lines.append("  )")
    return "\n".join(lines)


def _build_functions(f: FeatureConfig, traversal_model: str) -> str:
    lines = [
        "  (:functions",
    ]

    if traversal_model == TRAVERSAL_PROCESS:
        lines.append("    (road-length          ?r - road)")
        lines.append("    (speed-limit          ?r - road)")
    else:
        lines.append("    (travel-duration      ?r - road)  ;; precomputed seconds to traverse")
        lines.append("    (travel-time          ?v - vehicle)")

    if f.congestion_in_pddl or f.llm_events.enabled:
        lines.append("    (congestion-factor    ?r - road)  ;; 1.0=free, 2.0=half speed")

    if f.dynamic_congestion_in_pddl:
        lines.append("    (sim-time)")
        lines.append("    (window-start         ?w - time-window)")
        lines.append("    (congestion-value     ?r - road ?w - time-window)")

    if traversal_model == TRAVERSAL_PROCESS:
        lines += [
            "    (distance-remaining   ?v - vehicle)",
            "    (speed                ?v - vehicle)",
            "    (total-distance       ?v - vehicle)",
        ]

    if f.traffic_lights and traversal_model == TRAVERSAL_PROCESS:
        lines.append("    (light-wait           ?l - location)  ;; avg red-light wait (s)")
        lines.append("    (travel-time          ?v - vehicle)   ;; elapsed time incl. waits")

    if f.fuel_in_pddl:
        lines.append("    (fuel-level            ?v - vehicle)  ;; current litres in tank")
        lines.append("    (fuel-capacity         ?v - vehicle)  ;; max tank size (litres)")
        if traversal_model == TRAVERSAL_PROCESS:
            lines.append("    (fuel-consumption-rate ?v - vehicle)  ;; litres per metre")
        else:
            lines.append("    (fuel-cost             ?r - road)     ;; precomputed litres per road")

    lines.append("  )")
    return "\n".join(lines)


def _build_action(f: FeatureConfig, traversal_model: str) -> str:
    if traversal_model == TRAVERSAL_COMPILED_DURATION:
        return _build_compiled_duration_action(f)
    return _build_process_start_action(f)


def _build_process_start_action(f: FeatureConfig) -> str:
    extra_precond = ""
    if f.llm_events.enabled:
        extra_precond += (
            "\n      (not (road-blocked ?r))"
            "\n      (not (location-blocked ?from))"
            "\n      (not (location-blocked ?to))"
        )

    if f.fuel_in_pddl:
        # Only enter a road if there is enough fuel to cross it. The matching
        # discrete burn is in the effect below, so the tank never goes negative
        # and the planner must refuel beforehand when a road is unaffordable.
        extra_precond += (
            "\n      (>= (fuel-level ?v) "
            "(* (road-length ?r) (fuel-consumption-rate ?v)))"
        )

    fuel_effect = ""
    if f.fuel_in_pddl and f.fuel.consumption_mode == "discrete":
        # Discrete burn: subtract the whole road's fuel at entry instead of
        # integrating it in the process. Same litres per road, but fuel-level
        # changes only at action boundaries -> far smaller search space.
        # (consumption_mode == "continuous" moves this into _build_process.)
        fuel_effect = (
            "\n      (decrease (fuel-level ?v) "
            "(* (road-length ?r) (fuel-consumption-rate ?v)))"
        )

    if f.congestion_in_pddl or f.llm_events.enabled:
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
      {speed_assign}{fuel_effect}
    )
  )"""


def _build_compiled_duration_action(f: FeatureConfig) -> str:
    extra_precond = ""
    if f.llm_events.enabled:
        extra_precond += (
            "\n      (not (road-blocked ?r))"
            "\n      (not (location-blocked ?from))"
            "\n      (not (location-blocked ?to))"
        )

    fuel_precond = ""
    fuel_effect = ""
    if f.fuel_in_pddl:
        fuel_precond = "\n      (>= (fuel-level ?v) (fuel-cost ?r))"
        fuel_effect = "\n      (decrease (fuel-level ?v) (fuel-cost ?r))"

    return f"""\
  ;; Compiled traversal: the road crossing is represented as one numeric action.
  ;; This is the PDDL-compatible counterpart of a durative road action.
  (:action traverse-road
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r)){fuel_effect}
    )
  )"""


def _build_refuel(f: FeatureConfig, traversal_model: str) -> str:
    if not f.fuel_in_pddl:
        return ""
    not_moving = "\n      (not (moving ?v))" if traversal_model == TRAVERSAL_PROCESS else ""
    return """\
  (:action refuel
    :parameters (?v - vehicle ?l - location)
    :precondition (and
      (at ?v ?l)
      (has-fuel-station ?l)
      {not_moving}
      (< (fuel-level ?v) (fuel-capacity ?v))
    )
    :effect (and
      (assign (fuel-level ?v) (fuel-capacity ?v))
    )
  )""".format(not_moving=not_moving)


def _build_process(f: FeatureConfig, traversal_model: str) -> str:
    if traversal_model == TRAVERSAL_COMPILED_DURATION:
        return ""

    fuel_effect = ""
    if f.fuel_in_pddl and f.fuel.consumption_mode == "continuous":
        # Continuous burn integrated over time: litres = rate * speed * #t.
        # Physically smooth, but fuel-level changes every tick, which makes
        # the search far heavier -> prefer "discrete" unless you need this.
        fuel_effect = (
            "\n      (decrease (fuel-level ?v) "
            "(* #t (* (speed ?v) (fuel-consumption-rate ?v))))"
        )

    sim_time_effect = ""
    if f.dynamic_congestion_in_pddl:
        sim_time_effect = "\n      (increase (sim-time) (* #t 1))"

    return f"""\
  (:process traverse
    :parameters (?v - vehicle)
    :precondition (and
      (moving ?v)
      (> (distance-remaining ?v) 0)
    )
    :effect (and
      (decrease (distance-remaining ?v) (* #t (speed ?v)))
      (increase (total-distance ?v)     (* #t (speed ?v))){fuel_effect}{sim_time_effect}
    )
  )"""


def _build_events(f: FeatureConfig, traversal_model: str) -> str:
    if traversal_model == TRAVERSAL_COMPILED_DURATION:
        return ""

    events = []

    if f.traffic_lights:
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

    if f.dynamic_congestion_in_pddl:
        events.append("""\
  ;; Activates pre-computed congestion factors when their time window is reached.
  (:event activate-congestion-window
    :parameters (?r - road ?w - time-window)
    :precondition (and
      (congestion-update-pending ?r ?w)
      (>= (sim-time) (window-start ?w))
    )
    :effect (and
      (not (congestion-update-pending ?r ?w))
      (assign (congestion-factor ?r) (congestion-value ?r ?w))
    )
  )""")

    return "\n\n".join(events)


def _time_window_type(f: FeatureConfig) -> str:
    return " time-window" if f.dynamic_congestion_in_pddl else ""


def _validate_traversal_model(
    features: FeatureConfig,
    traversal_model: str,
) -> str:
    traversal_model = str(traversal_model).strip().lower()
    if traversal_model not in VALID_TRAVERSAL_MODELS:
        raise ValueError(
            "traversal_model must be 'process' or 'compiled_duration'"
        )
    if traversal_model != TRAVERSAL_COMPILED_DURATION:
        return traversal_model
    if features.dynamic_congestion_in_pddl:
        raise ValueError(
            "planner.traversal_model='compiled_duration' does not support "
            "features.congestion.type='dynamic' without replanning yet. "
            "Use traversal_model='process' for dynamic PDDL congestion."
        )
    if features.fuel_in_pddl and features.fuel.consumption_mode == "continuous":
        raise ValueError(
            "planner.traversal_model='compiled_duration' requires "
            "fuel.consumption_mode='discrete'. Continuous fuel consumption "
            "is only supported by traversal_model='process'."
        )
    return traversal_model
