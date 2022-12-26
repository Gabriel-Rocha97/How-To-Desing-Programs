;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |129 - Create-Lists|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Create BSL lists that represent

; 1 a list of celestial bodies, say, at least all the planets in our solar system;
(cons "Mercury"
      (cons "Venus"
            (cons "Earth"
                  (cons "Mars"
                        (cons "Jupiter"
                              (cons "Saturn"
                                    (cons "Uranus"
                                          (cons "Neptune" '())))))))) ; i don't care, its a planet for me





; a list of items for a meal, for example,
(cons "Steak"
      (cons "French Fries"
            (cons "Beans"
                  (cons "Bread"
                        (cons "Soda"
                              (cons "Cheese"
                                    (cons "Ice Cream"
                                          (cons "Popcorn" '()))))))))


; a list of colors
(cons "Black"
      (cons "White"
            (cons "Blue"
                  (cons "Red"
                        (cons "Green"
                              (cons "Yellow"
                                    (cons "Brown"
                                          (cons "Grey" '()))))))))