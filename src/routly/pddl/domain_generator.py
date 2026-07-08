from __future__ import annotations

from src.routly.features import FeatureConfig

TRAVERSAL_PROCESS = "process"
TRAVERSAL_COMPILED_DURATION = "compiled_duration"
VALID_TRAVERSAL_MODELS = {TRAVERSAL_PROCESS, TRAVERSAL_COMPILED_DURATION}


def build_road_network_domain(
    features: FeatureConfig | None = None,
    traversal_model: str = TRAVERSAL_PROCESS,
    time_window_starts: list[int] | None = None,
    roads: list[dict] | None = None,
    dynamic_road_ids: set[str] | None = None,
    location_ids: list[str] | None = None,
) -> str:
    """
    Build a PDDL+ domain string conditioned on active features.
    """
    if features is None:
        features = FeatureConfig.base()
    traversal_model = _validate_traversal_model(features, traversal_model)

    time_window_starts = _normalize_time_window_starts(features, time_window_starts)

    constants = _build_constants(
        features,
        traversal_model,
        time_window_starts,
        roads or [],
        location_ids or [],
        dynamic_road_ids,
    )
    predicates = _build_predicates(features, traversal_model, time_window_starts)
    functions = _build_functions(features, traversal_model, time_window_starts)
    action = _build_action(
        features,
        traversal_model,
        time_window_starts,
        roads or [],
        dynamic_road_ids,
    )
    refuel = _build_refuel(features, traversal_model)
    process = _build_process(features, traversal_model)
    events = _build_events(features, traversal_model, time_window_starts)

    blocks = []
    if constants:
        blocks.append(constants)
    blocks += [predicates, functions, action]
    if refuel:
        blocks.append(refuel)
    if process:
        blocks.append(process)
    if events:
        blocks.append(events)
    body = "\n\n".join(blocks)
    requirements = ":typing :numeric-fluents"
    if traversal_model == TRAVERSAL_PROCESS or features.dynamic_congestion_in_pddl:
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


def _normalize_time_window_starts(
    f: FeatureConfig,
    time_window_starts: list[int] | None,
) -> list[int]:
    if not f.dynamic_congestion_in_pddl:
        return []
    starts = sorted({0, *(int(start) for start in (time_window_starts or []))})
    if not starts:
        raise ValueError(
            "Dynamic PDDL congestion requires at least one time window start."
        )
    return starts


def _build_constants(
    f: FeatureConfig,
    traversal_model: str,
    time_window_starts: list[int],
    roads: list[dict],
    location_ids: list[str],
    dynamic_road_ids: set[str] | None,
) -> str:
    lines: list[str] = []
    if _uses_road_specific_compiled_actions(
        f,
        traversal_model,
        roads,
        dynamic_road_ids,
    ):
        road_ids = sorted(str(road["id"]) for road in roads)
        loc_ids = sorted(
            set(location_ids)
            | {str(road["from"]) for road in roads}
            | {str(road["to"]) for road in roads}
        )
        lines += [
            f"    {' '.join(loc_ids)}",
            "    - location",
            f"    {' '.join(road_ids)}",
            "    - road",
        ]

    if not lines:
        return ""
    return (
        "  (:constants\n"
        + "\n".join(lines)
        + "\n"
        "  )"
    )


def _uses_road_specific_compiled_actions(
    f: FeatureConfig,
    traversal_model: str,
    roads: list[dict],
    dynamic_road_ids: set[str] | None,
) -> bool:
    return False


def _build_predicates(
    f: FeatureConfig,
    traversal_model: str,
    time_window_starts: list[int],
) -> str:
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
        lines.append("    (static-road  ?r - road)")
        lines.append("    (dynamic-road ?r - road)")
        lines.append("    (current-window ?w - time-window)")
        lines.append("    (next-window ?from - time-window ?to - time-window)")

    if f.llm_events.enabled:
        lines.append("    (road-blocked ?r - road)   ;; set by LLM event generator")
        lines.append("    (location-blocked ?l - location)   ;; derived from blocked roads")

    lines.append("    (at       ?v - vehicle  ?l - location)")
    if traversal_model == TRAVERSAL_PROCESS:
        lines.append("    (on-road  ?v - vehicle  ?r - road)")
        lines.append("    (moving   ?v - vehicle)")
    lines.append("  )")
    return "\n".join(lines)


def _build_functions(
    f: FeatureConfig,
    traversal_model: str,
    time_window_starts: list[int],
) -> str:
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
        if traversal_model == TRAVERSAL_PROCESS:
            lines.append("    (effective-speed      ?r - road)")
            lines.append("    (effective-speed-window ?r - road ?w - time-window)")
        else:
            lines.append("    (travel-duration-window ?r - road ?w - time-window)")

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


def _build_action(
    f: FeatureConfig,
    traversal_model: str,
    time_window_starts: list[int],
    roads: list[dict],
    dynamic_road_ids: set[str] | None,
) -> str:
    if traversal_model == TRAVERSAL_COMPILED_DURATION:
        return _build_compiled_duration_action(
            f,
            time_window_starts,
            roads,
            dynamic_road_ids,
        )
    return _build_process_start_action(f, time_window_starts)


def _build_process_start_action(
    f: FeatureConfig,
    time_window_starts: list[int],
) -> str:
    extra_precond, fuel_effect = _process_common_guards_and_effects(f)

    if f.dynamic_congestion_in_pddl:
        return f"""\
  (:action start-traversal-static
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r){extra_precond}
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (effective-speed ?r)){fuel_effect}
    )
  )

  (:action start-traversal-dynamic
    :parameters (?v - vehicle ?r - road ?from - location ?to - location ?w - time-window)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w){extra_precond}
      (not (moving ?v))
    )
    :effect (and
      (not (at ?v ?from))
      (on-road ?v ?r)
      (moving ?v)
      (assign (distance-remaining ?v) (road-length ?r))
      (assign (speed ?v) (effective-speed-window ?r ?w)){fuel_effect}
    )
  )"""

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


def _build_compiled_duration_line_graph_action(
    f: FeatureConfig,
    time_window_starts: list[int],
) -> str:
    extra_precond, fuel_precond, fuel_effect = _compiled_common_guards_and_effects(f)
    extra_precond = extra_precond.replace(
        "\n      (not (location-blocked ?from))"
        "\n      (not (location-blocked ?to))",
        "",
    )

    actions = [f"""\
  ;; Line-graph traversal: the state is the next traversable road, not a location.
  (:action traverse-road-static
    :parameters (?v - vehicle ?r - road ?next - road)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (static-road ?r){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r)){fuel_effect}
    )
  )

  (:action finish-road-static
    :parameters (?v - vehicle ?r - road)
    :precondition (and
      (ready-road ?v ?r)
      (goal-road ?r)
      (road-open ?r)
      (static-road ?r){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (ready-road ?v ?r))
      (reached-goal ?v)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r)){fuel_effect}
    )
  )"""]

    for start in time_window_starts:
        window_id = _window_id(start)
        actions.append(f"""\
  (:action traverse-road-dynamic-{window_id}
    :parameters (?v - vehicle ?r - road ?next - road)
    :precondition (and
      (ready-road ?v ?r)
      (road-next ?r ?next)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window-{window_id}){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (ready-road ?v ?r))
      (ready-road ?v ?next)
      (increase (travel-time ?v) (travel-duration-window-{window_id} ?r))
      (increase (sim-time) (travel-duration-window-{window_id} ?r)){fuel_effect}
    )
  )

  (:action finish-road-dynamic-{window_id}
    :parameters (?v - vehicle ?r - road)
    :precondition (and
      (ready-road ?v ?r)
      (goal-road ?r)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window-{window_id}){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (ready-road ?v ?r))
      (reached-goal ?v)
      (increase (travel-time ?v) (travel-duration-window-{window_id} ?r))
      (increase (sim-time) (travel-duration-window-{window_id} ?r)){fuel_effect}
    )
  )""")

    return "\n\n".join(actions)


def _process_common_guards_and_effects(f: FeatureConfig) -> tuple[str, str]:
    extra_precond = ""
    if f.llm_events.enabled:
        extra_precond += (
            "\n      (not (road-blocked ?r))"
            "\n      (not (location-blocked ?from))"
            "\n      (not (location-blocked ?to))"
        )

    if f.fuel_in_pddl:
        extra_precond += (
            "\n      (>= (fuel-level ?v) "
            "(* (road-length ?r) (fuel-consumption-rate ?v)))"
        )

    fuel_effect = ""
    if f.fuel_in_pddl and f.fuel.consumption_mode == "discrete":
        fuel_effect = (
            "\n      (decrease (fuel-level ?v) "
            "(* (road-length ?r) (fuel-consumption-rate ?v)))"
        )

    return extra_precond, fuel_effect


def _build_compiled_duration_action(
    f: FeatureConfig,
    time_window_starts: list[int],
    roads: list[dict],
    dynamic_road_ids: set[str] | None,
) -> str:
    extra_precond, fuel_precond, fuel_effect = _compiled_common_guards_and_effects(f)

    if f.dynamic_congestion_in_pddl:
        return f"""\
  ;; Compiled traversal with global time windows.
  (:action traverse-road-static
    :parameters (?v - vehicle ?r - road ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (static-road ?r){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration ?r))
      (increase (sim-time) (travel-duration ?r)){fuel_effect}
    )
  )

  (:action traverse-road-dynamic
    :parameters (?v - vehicle ?r - road ?from - location ?to - location ?w - time-window)
    :precondition (and
      (at ?v ?from)
      (connects ?r ?from ?to)
      (road-open ?r)
      (dynamic-road ?r)
      (current-window ?w){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (travel-time ?v) (travel-duration-window ?r ?w))
      (increase (sim-time) (travel-duration-window ?r ?w)){fuel_effect}
    )
  )"""

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


def _build_compiled_duration_road_actions(
    f: FeatureConfig,
    time_window_starts: list[int],
    roads: list[dict],
    dynamic_road_ids: set[str],
) -> str:
    actions: list[str] = []

    for road in roads:
        road_id = str(road["id"])
        from_loc = str(road["from"])
        to_loc = str(road["to"])
        extra_precond, fuel_precond, fuel_effect = _compiled_hardcoded_guards(
            f,
            road_id,
            from_loc,
            to_loc,
        )

        if road_id not in dynamic_road_ids:
            actions.append(f"""\
  (:action traverse-road-static-{road_id}
    :parameters (?v - vehicle)
    :precondition (and
      (at ?v {from_loc})
      (road-open {road_id}){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (at ?v {from_loc}))
      (at ?v {to_loc})
      (increase (travel-time ?v) (travel-duration {road_id}))
      (increase (sim-time) (travel-duration {road_id})){fuel_effect}
    )
  )""")
            continue

        for start in time_window_starts:
            window_id = _window_id(start)
            actions.append(f"""\
  (:action traverse-road-dynamic-{road_id}-{window_id}
    :parameters (?v - vehicle)
    :precondition (and
      (at ?v {from_loc})
      (road-open {road_id})
      (current-window {window_id}){extra_precond}{fuel_precond}
    )
    :effect (and
      (not (at ?v {from_loc}))
      (at ?v {to_loc})
      (increase (travel-time ?v) (travel-duration-window {road_id} {window_id}))
      (increase (sim-time) (travel-duration-window {road_id} {window_id})){fuel_effect}
    )
  )""")

    return "\n\n".join(actions)


def _compiled_hardcoded_guards(
    f: FeatureConfig,
    road_id: str,
    from_loc: str,
    to_loc: str,
) -> tuple[str, str, str]:
    extra_precond = ""
    if f.llm_events.enabled:
        extra_precond += (
            f"\n      (not (road-blocked {road_id}))"
            f"\n      (not (location-blocked {from_loc}))"
            f"\n      (not (location-blocked {to_loc}))"
        )

    fuel_precond = ""
    fuel_effect = ""
    if f.fuel_in_pddl:
        fuel_precond = f"\n      (>= (fuel-level ?v) (fuel-cost {road_id}))"
        fuel_effect = f"\n      (decrease (fuel-level ?v) (fuel-cost {road_id}))"

    return extra_precond, fuel_precond, fuel_effect


def _compiled_common_guards_and_effects(
    f: FeatureConfig,
) -> tuple[str, str, str]:
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

    return extra_precond, fuel_precond, fuel_effect


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


def _build_events(
    f: FeatureConfig,
    traversal_model: str,
    time_window_starts: list[int],
) -> str:
    events = []

    if traversal_model == TRAVERSAL_PROCESS and f.traffic_lights:
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

    elif traversal_model == TRAVERSAL_PROCESS:
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
  )""")

    return "\n\n".join(events)


def _time_window_type(f: FeatureConfig) -> str:
    if f.dynamic_congestion_in_pddl:
        return " time-window"
    return ""


def _window_id(window_start: int) -> str:
    return f"tw_{window_start:05d}"


def _uses_line_graph_traversal(
    f: FeatureConfig,
    traversal_model: str,
) -> bool:
    return False


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
    if features.fuel_in_pddl and features.fuel.consumption_mode == "continuous":
        raise ValueError(
            "planner.traversal_model='compiled_duration' requires "
            "fuel.consumption_mode='discrete'. Continuous fuel consumption "
            "is only supported by traversal_model='process'."
        )
    return traversal_model
