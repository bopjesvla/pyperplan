(define (problem wolf-goat-cabbage-classic)
  (:domain wolf-goat-cabbage)

  (:objects
   w - wolf
   g - goat
   c - cabbage
   farmer - person
   start - side
   end - side
   b - boat
   )

  (:init
   (passenger-at w start)
   (passenger-at g start)
   (passenger-at c start)
   (passenger-at farmer start)

   (boat-at b start)
   (other-side start end)
   (other-side end start)
   )

  (:goal
   (and
    (passenger-at w end)
    (passenger-at g end)
    (passenger-at c end)
    ))



  )
