(define (domain wolf-goat-cabbage)
  (:requirements :typing )
  (:types
   place - object
   boat side - place
   passenger - object
   thing - passenger
   wolf goat cabbage - thing
   person - passenger
   )

  (:predicates
   (passenger-at ?passenger ?place)
   (boat-at ?boat ?side)
   (other-side ?side ?side)
   )

  ;; does not support simultaneous actions
  ;; no negations

  (:action enter-boat
           :parameters (?p - person ?w - wolf ?g - goat ?c - cabbage ?b - boat
                           ?ps - side ?ws - side ?cs - side ?gs - side)
           :precondition (and (passenger-at ?p ?ps) (boat-at ?b ?ps) (other-side ?gs ?cs)
                              (other-side ?ws ?gs)
                              (passenger-at ?w ?ws) (passenger-at ?g ?gs) (passenger-at ?c ?cs)
                              )
           :effect (and (passenger-at ?p ?b) (not (passenger-at ?p ?ps))))

  (:action leave-empty-boat
           :parameters (?p - person ?w - wolf ?g - goat ?c - cabbage ?b - boat
                           ?ps - side ?ws - side ?cs - side ?gs - side)
           :precondition (and (passenger-at ?p ?b) (boat-at ?b ?ps) (other-side ?gs ?cs)
                              (other-side ?ws ?gs)
                              (passenger-at ?w ?ws) (passenger-at ?g ?gs) (passenger-at ?c ?cs)
                              )
           :effect (and (passenger-at ?p ?ps) (not (passenger-at ?p ?b))))

  (:action enter-boat-with-wolf
           :parameters (?p - person ?w - wolf ?g - goat ?c - cabbage ?b - boat
                           ?ws - side ?cs - side ?gs - side)
           :precondition (and (passenger-at ?p ?ws) (boat-at ?b ?ws) (other-side ?gs ?cs)
                              (passenger-at ?w ?ws) (passenger-at ?g ?gs) (passenger-at ?c ?cs)
                              )
           :effect (and (passenger-at ?p ?b) (not (passenger-at ?p ?ws))
                        (passenger-at ?w ?b) (not (passenger-at ?w ?ws)) ))

  (:action enter-boat-with-cabbage
           :parameters (?p - person ?w - wolf ?g - goat ?c - cabbage ?b - boat
                           ?ws - side ?cs - side ?gs - side)
           :precondition (and (passenger-at ?p ?cs) (boat-at ?b ?cs) (other-side ?gs ?ws)
                              (passenger-at ?w ?ws) (passenger-at ?g ?gs) (passenger-at ?c ?cs)
                              )
           :effect (and (passenger-at ?p ?b) (not (passenger-at ?p ?cs))
                        (passenger-at ?c ?b) (not (passenger-at ?c ?cs)) ))

  (:action enter-boat-with-goat
           :parameters (?p - person ?w - wolf ?g - goat ?c - cabbage ?b - boat
                           ?ws - side ?cs - side ?gs - side)
           :precondition (and (passenger-at ?p ?gs) (boat-at ?b ?gs)
                              (passenger-at ?w ?ws) (passenger-at ?g ?gs) (passenger-at ?c ?cs)
                              )
           :effect (and (passenger-at ?p ?b) (not (passenger-at ?p ?gs))
                        (passenger-at ?g ?b) (not (passenger-at ?g ?gs)) ))

  (:action leave-boat-with-thing
           :parameters (?p - person ?t - thing ?b - boat ?s - side)
           :precondition (and (passenger-at ?p ?b) (passenger-at ?t ?b) (boat-at ?b ?s) )
           :effect (and (passenger-at ?p ?s) (not (passenger-at ?p ?b))
                        (passenger-at ?t ?s) (not (passenger-at ?t ?b)) ))

  (:action row-boat
           :parameters (?p - person ?b - boat ?from - side ?to - side)
           :precondition (and (passenger-at ?p ?b) (boat-at ?b ?from) (other-side ?from ?to))
           :effect (and (boat-at ?b ?to) (not (boat-at ?b ?from)) ))
  )

