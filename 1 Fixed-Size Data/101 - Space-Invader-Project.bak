;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |101 - Space-Invader-Project|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Once you have this function, you can define the si-main function,
; which uses big-bang to spawn the game-playing window. Enjoy!

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

;use in hit?
(define HIT 10)

;use in si-move-proper
(define UFO-DELTA-Y 0.5)
(define MISSILE-DELTA-Y 2)


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
             " ")
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
  " ")
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
      (if (key=? " " ke)
          (make-fired (make-posn (posn-x (aim-ufo s)) (posn-y (aim-ufo s)))
                      (make-tank (tank-loc (aim-tank s))
                      (tank-vel (aim-tank s)))
                      ; firing missile
                      (make-posn (tank-loc (aim-tank s)) Y-MISSILE)) 
          ; regular aim state
          (make-aim (make-posn (posn-x (aim-ufo s)) (posn-y (aim-ufo s)))
                    (make-tank (tank-loc (aim-tank s))
                               (cond
                                 [(key=? ke "right") TANK-DELTA]
                                 [(key=? ke "left") (- TANK-DELTA)]
                                 [else (tank-vel (aim-tank s))]))))
      ; regular fired state
      (make-fired (make-posn (posn-x (fired-ufo s)) (posn-y (fired-ufo s)))
                  (make-tank (tank-loc (fired-tank s))
                             (cond
                                 [(key=? ke "right") TANK-DELTA]
                                 [(key=? ke "left") (- TANK-DELTA)]
                                 [else (tank-vel (fired-tank s))]))
                  (make-posn (posn-x (fired-missile s))
                             (posn-y (fired-missile s))))))

;(si-move)
; SIGS -> SIGS
; moves the space invader objects on their particular ways
(define (si-move w)
  (si-move-proper w (ufo-x w)))

; SIGS Number -> SIGS 
; moves the space-invader objects predictably by delta
(check-expect (si-move-proper (make-aim (make-posn 50 30)
                                        (make-tank 50 3))
                              3)
              (make-aim (make-posn 3 (+ 30 UFO-DELTA-Y))
                        (make-tank 53 3)))
(check-expect (si-move-proper (make-fired (make-posn 80 30)
                                          (make-tank 100 3)
                                          (make-posn 100 180))
                              20)
              (make-fired (make-posn 20 (+ 30 UFO-DELTA-Y))
                          (make-tank 103 3)
                          (make-posn 100 (- 180 MISSILE-DELTA-Y))))
(define (si-move-proper w delta)
  (if (aim? w)
      (make-aim
       (make-posn delta (+ (posn-y (aim-ufo w)) UFO-DELTA-Y))
       (make-tank (modulo (+ (tank-loc (aim-tank w)) (tank-vel (aim-tank w))) WIDTH) (tank-vel (aim-tank w))))
      (make-fired
       (make-posn delta (+ (posn-y (fired-ufo w)) UFO-DELTA-Y))
       (make-tank (modulo (+ (tank-loc (fired-tank w)) (tank-vel (fired-tank w))) WIDTH) (tank-vel (fired-tank w)))
       (make-posn (posn-x (fired-missile w)) (- (posn-y (fired-missile w)) MISSILE-DELTA-Y)))))

; SIGS -> Number
; computes a random number for UFO x-coordenate
(check-random (ufo-x (make-aim (make-posn 20 100)
                               (make-tank 120 3)))
              (random WIDTH))
                     
(define (ufo-x s)
  (random WIDTH))

;stop-when
; SIGS -> Booleans
; stop the game when:
; - UFO reach the bottom of the canvas.
; - missile hit the UFO.
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
    [(and
      (fired? s)
      (hit? (fired-ufo s)(fired-missile s)))
     #true]
    [else #false]))

; UFO MISSLE -> Number
; calculate the diatance between the UFO and the missile, return #t
; when the missle are close to the UFO.
(check-expect (hit? (make-posn 10 10) (make-posn 100 100)) #f)
(check-expect (hit? (make-posn 100 100) (make-posn 100 100)) #t)
(define (hit? p1 p2)
   (>= HIT
    (sqrt
     (+
      (sqr (- (posn-x p2)(posn-x p1)))
      (sqr (- (posn-y p2)(posn-y p1)))))
    ))

; si-render-final
; SIGS -> Image
(check-expect (si-render-final (make-aim (make-posn 100 100)
                                         (make-tank 20 5)))
                               (overlay (text "Game Over" 30 "red") BACKGROUND))
(define (si-render-final s)
  (overlay (text "Game Over" 30 "red") BACKGROUND))

; SIGS -> Imaga
; launchs the space-invader gameplay
(define (main w)
  (big-bang (make-aim (make-posn (/ WIDTH 2) 10)
                      (make-tank (/ WIDTH 2) TANK-DELTA))
    [on-tick si-move 0.05]
    [to-draw si-render]
    [on-key si-control]
    [stop-when si-game-over? si-render-final]))

(main 0)
