;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |101 - Si.Move.V2 -Test-Cases|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Turn the examples in figure 35 into test cases. 

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 

(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
;   (make-sigs UFO Tank MissileOrNot)
; interpretation represents the complete state of a
; space invader game
 
; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location

;constants
(define HEIGHT 200)
(define WIDTH 200)
(define BACKGROUND (rectangle WIDTH HEIGHT "outline" "black"))
(define TANK (rectangle 25 15 "solid" "blue"))
(define Y-TANK (- (image-height BACKGROUND) (image-height TANK)))
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))


; SIGS.V2 -> Image
; adds TANK, UFO, and possibly MISSILE to 
; the BACKGROUND scene
(check-expect (si-render.V2 (make-sigs (make-posn 10 20)
                                       (make-tank 100 5)
                                       #false))
              (place-image TANK 100 Y-TANK
                           (place-image UFO 10 20
                                        BACKGROUND)))
(check-expect (si-render.V2 (make-sigs (make-posn 10 20)
                                       (make-tank 100 5)
                                       (make-posn 100 90)))
              (place-image TANK 100 Y-TANK
                           (place-image UFO 10 20
                                        (place-image
                                         MISSILE
                                         100 90
                                         BACKGROUND))))
(define (si-render.V2 s)
     (tank-render
       (sigs-tank s)
       (ufo-render (sigs-ufo s)
                   (missile-render.V2 (sigs-missile s)
                                   BACKGROUND))))



; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render (make-tank 30 3) BACKGROUND)
              (place-image TANK 30 Y-TANK BACKGROUND))
(define (tank-render t im)
  (place-image
   TANK
   (tank-loc t) Y-TANK
   im))
 
; Posn Imasge -> Image 
; adds u to the given image im
(check-expect (ufo-render (make-posn 30 5) BACKGROUND)
              (place-image UFO 30 5 BACKGROUND))
(define (ufo-render u im)
  (place-image
   UFO
   (posn-x u)
   (posn-y u)
   im))
        

; MissileOrNot Image -> Image 
; adds an image of missile m to scene s
(check-expect (missile-render.V2 #false BACKGROUND) BACKGROUND)
(check-expect (missile-render.V2 (make-posn 100 130)
                                 BACKGROUND)
              (place-image MISSILE 100 130 BACKGROUND))
(define (missile-render.V2 m s)
  (cond
    [(boolean? m) s]
    [(posn? m)
     (place-image MISSILE (posn-x m) (posn-y m) s)]))