; This is a placeholder problem.
; Run scripts/03_generate_pddl_problem.py to generate the real Bologna problem from the OSM graph.

(define (problem bologna-center-placeholder)
  (:domain urban-navigation)

  (:objects
    vehicle_1 - vehicle
    loc_1 loc_2 - location
  )

  (:init
    (at vehicle_1 loc_1)
    (connected loc_1 loc_2)
    (= (distance loc_1 loc_2) 1)
    (= (total-cost) 0)
  )

  (:goal
    (at vehicle_1 loc_2)
  )

  (:metric minimize (total-cost))
)
