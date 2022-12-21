;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |098 - Space-invader-Stop|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function si-game-over? for use as the stop-when handler.
;; The game stops if the UFO lands or if the missile hits the UFO.
;; For both conditions, we recommend that you check for proximity of
;; one object to another.

;; The stop-when clause allows for an optional second sub-expression,
;; namely a function that renders the final state of the game. Design
;; si-render-final and use it as the second part for your stop-when
;; clause in the main function of exercise 100.


;constants
(define HEIGHT 200)
(define WIDTH 200)
(define BACKGROUND (rectangle WIDTH HEIGHT "outline" "black"))
(define TANK (rectangle 25 15 "solid" "blue"))
(define Y-TANK (- (image-height BACKGROUND) (image-height TANK)))
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))

;structs
(define-struct tank [loc vel])
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

;stop-when
; SIGS -> Booleans
; stop the game when:
; - UFO reach the bottom of the canvas.
; - missile hit the UFO.
(define HIT 3)
(check-expect (si-game-over? (make-aim
                              (make-posn 100 HEIGHT)
                              (make-tank 30 5)))
              #t)
(check-expect (si-game-over? (make-aim
                              (make-posn 100 120)
                              (make-tank 110 5)))
              #f)

(define (si-game-over? s)
  (cond
    [(>=
      (posn-y (if (aim? s)
               (aim-ufo s)
               (fired-ufo s)))
      HEIGHT)
     #true]
    [(and (fired? s)
     (hit? (fired-ufo s)(fired-missile s)))
     #true]
    [else #false]))

; UFO MISSLE -> Number
; calculate the diatance between the UFO and the missile, return #t
; when the missle are close to the UFO.
(check-expect (hit? (make-posn 10 10) (make-posn 100 100)) #f)
(check-expect (hit? (make-posn 100 100) (make-posn 100 100)) #t)
(define (hit? p1 p2)
  (if (>= HIT
   (sqrt
   (+
    (sqr (- (posn-x p1)(posn-x p2)))
    (sqr (- (posn-y p2)(posn-y p2))))))
      #true
      #false))

; si-render-final
; SIGS -> Image
(check-expect (si-render-final (make-aim (make-posn 100 100)
                                         (make-tank 20 5)))
                               (overlay (text "Game Over" 30 "red") BACKGROUND))
(define (si-render-final s)
  (overlay (text "Game Over" 30 "red") BACKGROUND))
  


