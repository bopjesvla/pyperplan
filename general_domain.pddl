(define (domain wolf-goat-cabbage)
  (:requirements :typing )
  (:types
   place - object
   boat side - place
   passenger - object
   thing - passenger
   person - passenger
   )

  (:predicates
   (passenger-at ?passenger ?place)
   (passenger-not-at ?passenger ?place)
   (boat-at ?boat ?side)
   (eats ?passenger ?passenger)
   )

  ;; does not support simultaneous actions
  ;; no negations

  (:action enter-boat
           :parameters (?w - wolf ?b - boat ?s - side )
           :precondition (and (passenger-at ?w ?s) (boat-at ?b ?s) )
           :effect (and (passenger-at ?w ?b) (not (passenger-at ?w ?s)) ))

  (:action leave-boat
           :parameters (?p - passenger ?b - boat ?s - side)
           :precondition (and (passenger-at ?p ?b) (boat-at ?b ?s) )
           :effect (and (passenger-at ?p ?s) (not (passenger-at ?p ?b)) ))

  (:action row-boat
           :parameters (?p - person ?b - boat ?from - side ?to - side)
           :precondition (and (passenger-at ?p ?b) (not (= ?from ?to)))
           :effect (and (boat-at ?b ?to) (not (boat-at ?b ?from)) ))
  )

