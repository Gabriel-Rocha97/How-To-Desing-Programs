;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |043 - Time-Space-Definitions|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
;Constants of the world space
(define WIDTH-OF-WORLD 200)
(define WHELL-RADIUS 5)
(define WHELL-DISTANCE (* WHELL-RADIUS 3))
(define HEIGHT-OF-WORLD (* WHELL-RADIUS 10))

;BACKGROUND
(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

;WHELLS OF THE CAR
(define WHELL (circle WHELL-RADIUS
                      "solid" "black"))
(define SPACE (rectangle WHELL-DISTANCE WHELL-RADIUS
                         "solid" "transparent"))
(define BOTH-WHELLS(beside WHELL SPACE WHELL))

;CAR BODY
(define DOWN-CAR
  (rectangle (* WHELL-DISTANCE 2.8) (* WHELL-RADIUS 2) "solid" "red"))
(define UP-CAR
  (rectangle (* WHELL-DISTANCE 1.5) (* WHELL-RADIUS 3) "solid" "red"))
(define CAR-BODY
  (overlay/align "middle" "bottom"
                 UP-CAR
                 DOWN-CAR))

(define CAR (above CAR-BODY BOTH-WHELLS))

;CAR y-coordinate
(define y-car (- HEIGHT-OF-WORLD (/ (image-height CAR) 2)))

;TREE
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

;TREE x-coordinate
(define x-tree 20)
;TREE y-coordinate
(define y-tree (- HEIGHT-OF-WORLD (/ (image-height TREE) 2)))

;Limit border of the world
(define limit (+ WIDTH-OF-WORLD (/ (image-width CAR) 2)))



; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

  
; AnimationState -> Image
; use the number of ticks since start as x to place the car from the left edge BACKGROUND canvas 
(check-expect (render 20) (place-image TREE x-tree y-tree (place-image CAR 20 y-car BACKGROUND)))
(check-expect (render 100) (place-image TREE x-tree y-tree (place-image CAR 100 y-car BACKGROUND)))
(define (render x)
  (place-image TREE x-tree y-tree (place-image CAR x y-car BACKGROUND)))



; AnimationState -> WorldState
; adds 3 to x to ani-state
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ani-state)
  (+ ani-state 3))



; AnimationState -> Boolean
; stops the world when car left gone off the edge of BACKGROUND
(check-expect (end? 200) #f)
(check-expect (end? 222) #t)
(define (end? ani-state)
  ( >= ani-state limit))



; AnimationState -> WorldState
; launchs the program from the initial state
(define (main ani-state)
  (big-bang ani-state
    [on-tick tock]
    [to-draw render]
    [stop-when end?]))


;Wish List
; clock-tick-handler
; keystroke-handler
; mouse-event-handler

