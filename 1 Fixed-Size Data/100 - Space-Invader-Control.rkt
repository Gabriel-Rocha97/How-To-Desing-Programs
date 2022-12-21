;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |100 - Space-Invader-Control|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function si-control, which plays the role of the key-event handler.
;; As such, it consumes a game state and a KeyEvent and produces a new game state.
;; It reacts to three different keys:

;; pressing the left arrow ensures that the tank moves left;

;; pressing the right arrow ensures that the tank moves right; and

;; pressing the space bar fires the missile if it hasn’t been launched yet.

;constats
(define HEIGHT 200)
(define WIDTH 200)
(define BACKGROUND (rectangle WIDTH HEIGHT "outline" "black"))
(define TANK (rectangle 25 15 "solid" "blue"))
(define Y-TANK (- (image-height BACKGROUND) (image-height TANK)))
(define Y-MISSILE (- Y-TANK 5))
(define TANK-DELTA 3)
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))

;structs
(define-struct tank [loc vel])
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

;use in hit?
(define HIT 3)

;use in si-move-proper
(define UFO-DELTA-Y 0.5)
(define MISSILE-DELTA-Y 0.7)

; si-control
; SIGS KeyEvent -> SIGS
; return a new game state by the given key:
; left  - move tank left
; right - move tank right
; space - fire the missile
(check-expect ; aim, moving right, ke left
 (si-control (make-aim (make-posn 100 30)
                       (make-tank 100 TANK-DELTA))
             "left")
 (make-aim (make-posn 100 30)
           (make-tank 100 (- TANK-DELTA))))
(check-expect ; aim, moving left, ke left
 (si-control (make-aim (make-posn 100 30)
                       (make-tank 100 (- TANK-DELTA)))
             "left")
 (make-aim (make-posn 100 30)
           (make-tank 100 (- TANK-DELTA))))
(check-expect ; aim, moving right, ke right
 (si-control (make-aim (make-posn 100 30)
                       (make-tank 100 TANK-DELTA))
             "right")
 (make-aim (make-posn 100 30)
           (make-tank 100 TANK-DELTA)))
(check-expect ; aim, moving left, ke right
 (si-control (make-aim (make-posn 100 30)
                       (make-tank 100 (- TANK-DELTA)))
             "right")
 (make-aim (make-posn 100 30)
           (make-tank 100 TANK-DELTA)))
(check-expect ; aim, ke space
 (si-control (make-aim (make-posn 100 30)
                       (make-tank 100 TANK-DELTA))
             "space")
 (make-fired (make-posn 100 30)
             (make-tank 100 TANK-DELTA)
             (make-posn 100 Y-MISSILE)))
(check-expect ; fired, moveing left, ke left
 (si-control
  (make-fired (make-posn 100 30)
              (make-tank 100 (- TANK-DELTA))
              (make-posn 100 120))
  "left")
 (make-fired (make-posn 100 30)
             (make-tank 100 (- TANK-DELTA))
             (make-posn 100 120)))
(check-expect ; fired, moving right, ke left
 (si-control
  (make-fired (make-posn 100 30)
              (make-tank 100 TANK-DELTA)
              (make-posn 100 120))
  "left")
 (make-fired (make-posn 100 30)
             (make-tank 100 (- TANK-DELTA))
             (make-posn 100 120)))
(check-expect ; fired, moving left, ke right
 (si-control
  (make-fired (make-posn 100 30)
              (make-tank 100 (- TANK-DELTA))
              (make-posn 100 120))
  "right")
 (make-fired (make-posn 100 30)
             (make-tank 100 TANK-DELTA)
             (make-posn 100 120)))
(check-expect ; fired, ke space, state don't change
 (si-control
  (make-fired (make-posn 100 130)
              (make-tank 100 TANK-DELTA)
              (make-posn 100 140))
  "space")
 (make-fired (make-posn 100 130)
             (make-tank 100 TANK-DELTA)
             (make-posn 100 140)))
 
(check-expect ; fired, ke x, state don't change
 (si-control
  (make-fired (make-posn 100 130)
              (make-tank 100 TANK-DELTA)
              (make-posn 100 140))
  "x")
 (make-fired (make-posn 100 130)
              (make-tank 100 TANK-DELTA)
              (make-posn 100 140)))
(define (si-control s ke)
  (if (aim? s)
      (if (eq? ke "space")
          (make-fired (make-posn (posn-x (aim-ufo s)) (posn-y (aim-ufo s)))
                      (make-tank (tank-loc (aim-tank s))
                      (tank-vel (aim-tank s)))
                      ; firing missile
                      (make-posn (tank-loc (aim-tank s)) Y-MISSILE))
          ; regular aim state
          (make-aim (make-posn (posn-x (aim-ufo s)) (posn-y (aim-ufo s)))
                    (make-tank (tank-loc (aim-tank s))
                               (cond
                                 [(eq? ke "right") TANK-DELTA]
                                 [(eq? ke "left") (- TANK-DELTA)]
                                 [else (tank-vel (aim-tank s))]))))
      ; regular fired state
      (make-fired (make-posn (posn-x (fired-ufo s)) (posn-y (fired-ufo s)))
                  (make-tank (tank-loc (fired-tank s))
                             (cond
                                 [(eq? ke "right") TANK-DELTA]
                                 [(eq? ke "left") (- TANK-DELTA)]
                                 [else (tank-vel (fired-tank s))]))
                  (make-posn (posn-x (fired-missile s))
                             (posn-y (fired-missile s))))))
                             
                      