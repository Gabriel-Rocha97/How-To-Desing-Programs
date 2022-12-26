;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |039 - Single-Point-Control-Car|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
;A WorldState is a Number
;interpreation: the number of pixels between the left border of the scene and the car

;Constants of the world space
(define WIDTH-OF-WORLD 200)
(define WHELL-RADIUS 6)
(define WHELL-DISTANCE (* WHELL-RADIUS 3))
(define HEIGHT-OF-WORLD (* WHELL-RADIUS 5))

;WHELLS OF THE CAR
(define WHELL
  (circle WHELL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHELL-DISTANCE WHELL-RADIUS "solid" "transparent"))
(define BOTH-WHELLS
  (beside WHELL SPACE WHELL))

;CAR BODY
(define DOWN-CAR
  (rectangle (* WHELL-DISTANCE 2.8) (* WHELL-RADIUS 2) "solid" "red"))
(define UP-CAR
  (rectangle (* WHELL-DISTANCE 1.5) (* WHELL-RADIUS 3) "solid" "red"))
(define CAR-BODY
  (overlay/align "middle" "bottom"
                 UP-CAR
                 DOWN-CAR))
(define CAR
  (overlay/offset BOTH-WHELLS 0 -10 CAR-BODY))

;BACKGROUND
(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

;CAR y-coordinate
(define y (- HEIGHT-OF-WORLD (/ (image-height CAR) 2)))


; WorldState -> Image
; place a image of the the car x pixels from the left margin of the BACKGROUND image
(define (render x)
  (place-image CAR x y BACKGROUND))
 
; WorldState -> WorldState
; adds 3 to x to move the car right
(define (tock x)
  (+ x 3))

; WorldState -> WorldState
; launchs the program from the initial state
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))


;Wish List
; clock-tick-handler
; keystroke-handler
; mouse-event-handler  
