;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |094 - Space-Invader-Sketchs|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Draw some sketches of what the game scenery looks like
; at various stages. Use the sketches to determine the constant
; and the variable pieces of the game. For the former, develop
; physical and graphical constants that describe the dimensions
; of the world (canvas) and its objects. Also develop some background
; scenery. Finally, create your initial scene from the constants for the
; tank, the UFO, and the background.

;constants
(define HEIGHT 200)
(define WIDTH 200)
(define CANVAS (rectangle WIDTH HEIGHT "outline" "black"))
(define TANK (rectangle 30 15 "solid" "blue"))
(define Y-TANK (- (image-height CANVAS) (image-height TANK)))
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))

(place-image UFO (* 0.5 (image-width CANVAS)) 25
 (place-image TANK (* 0.5 (image-width CANVAS)) Y-TANK
   (place-image MISSILE (* 0.5 (image-width CANVAS))
                        (* 0.5 (image-height CANVAS))
                        CANVAS))) 
              