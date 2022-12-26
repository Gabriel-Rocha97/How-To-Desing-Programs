;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |096 - Space-Invader-Renders-Functions|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; Design the functions tank-render, ufo-render, and missile-render.

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

; e.x describes the tank maneuvering into position to fire
; the missile:
; (make-aim (make-posn 20 10) (make-tank 28 -3))
; the struct is create combine aim-ufo, a posn describe the
; x and y location of the UFO, and aim-tank, witch describes the
; tank's position and velocity

; e.x missile has been fired:
; (make-fired (make-posn 20 10)
;            (make-tank 28 -3)
;            (make-posn 28 (- HEIGHT TANK-HEIGHT)))

; e.x the missle will colide the UFO
; (make-fired (make-posn 20 10)
;             (maketank 28 -3)
;             (make-missile 22 13)

;constants
(define HEIGHT 200)
(define WIDTH 200)
(define BACKGROUND (rectangle WIDTH HEIGHT "outline" "black"))
(define TANK (rectangle 25 15 "solid" "blue"))
(define Y-TANK (- (image-height BACKGROUND) (image-height TANK)))
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))


; SIGS -> Image
; adds TANK, UFO, and possibly MISSILE to 
; the BACKGROUND scene
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render
       (fired-tank s)
       (ufo-render (fired-ufo s)
                   (missile-render (fired-missile s)
                                   BACKGROUND)))]))



; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render (make-tank 30 3) BACKGROUND)
              (place-image TANK 30 Y-TANK BACKGROUND))
(define (tank-render t im)
  (place-image TANK
               (tank-loc t)
               Y-TANK
               im)) 
 
; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render (make-posn 30 5) BACKGROUND)
              (place-image UFO 30 5 BACKGROUND))
(define (ufo-render u im)
  (place-image UFO
              (posn-x u)
              (posn-y u)
              im))
        

; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render (make-posn 100 170) BACKGROUND)
              (place-image MISSILE 100 170 BACKGROUND))
(define (missile-render t im)
  (place-image MISSILE
               (posn-x t)
               (posn-y t)
               im))




                
