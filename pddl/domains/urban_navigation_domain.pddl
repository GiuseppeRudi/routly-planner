(define (domain urban-navigation)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)

  (:types
    vehicle
    location
  )

  (:predicates
    (at ?v - vehicle ?l - location)
    (connected ?from - location ?to - location)
    (blocked ?from - location ?to - location)
  )

  (:functions
    (total-cost)
    (distance ?from - location ?to - location)
  )

  (:action move
    :parameters (?v - vehicle ?from - location ?to - location)
    :precondition (and
      (at ?v ?from)
      (connected ?from ?to)
      (not (blocked ?from ?to))
    )
    :effect (and
      (not (at ?v ?from))
      (at ?v ?to)
      (increase (total-cost) (distance ?from ?to))
    )
  )
)
