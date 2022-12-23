;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |114 - Checked-Space-Invader|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Use the predicates to check the space invader world program

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

; A UFO is a Posn
; - says the x and y UFO location on the canvas
 
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
(define TANK-DELTA 3)
(define UFO (overlay (ellipse 30 5 "solid" "grey")
                     (circle 6 "solid" "green")))
(define MISSILE (triangle 15 "solid" "black"))

;use in hit?
(define HIT 5)

;use in si-move-proper
(define UFO-DELTA-Y 0.5)
(define MISSILE-DELTA-Y 2)


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

; si-move
; SIGS.V2 -> SIGS.V2
; moves the space invader objects on their particular ways
(define (si-move.V2 w)
  (si-move-proper.V2 w (ufo-x w)))

; SIGS.V2 Number -> SIGS.V2 
; moves the space-invader objects predictably by delta
(check-expect (si-move-proper.V2 (make-sigs (make-posn 100 120)
                                            (make-tank 30 5)
                                            #false)
                                 3)
              (make-sigs (make-posn 3 (+ 120 UFO-DELTA-Y))
                         (make-tank 35 5)
                         #false))
(check-expect (si-move-proper.V2 (make-sigs (make-posn 100 120)
                                            (make-tank 30 -5)
                                            (make-posn 100 180))
                                 10)
              (make-sigs (make-posn 10 (+ 120 UFO-DELTA-Y))
                         (make-tank 25 -5)
                         (make-posn 100 (- 180 MISSILE-DELTA-Y))))
(define (si-move-proper.V2 w delta)
  (make-sigs
   (make-posn delta (+ (posn-y (sigs-ufo w)) UFO-DELTA-Y))
   (make-tank (modulo (+ (tank-loc (sigs-tank w)) (tank-vel (sigs-tank w))) WIDTH)
              (tank-vel (sigs-tank w)))
   (cond
     [(boolean? (sigs-missile w)) (sigs-missile w)]
     [(posn? (sigs-missile w))
      (make-posn (posn-x (sigs-missile w))
                 (- (posn-y (sigs-missile w)) MISSILE-DELTA-Y))]))) 

; SIGS -> Number
; computes a random number for UFO x-coordenate
(check-random (ufo-x (make-sigs (make-posn 20 100)
                               (make-tank 120 3)
                               #false))
              (random WIDTH))
(define (ufo-x s)
  (random WIDTH))

; si-control.V2
; SIGS.V2 KeyeEVent-> SIGS.V2
; return a new game state by the given key:
; left  - move tank left
; right - move tank right
; space - fire the missile
(check-expect ; (boolean? missile), moving left, ke left
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 (- TANK-DELTA))
                           #false)
                "left")
 (make-sigs (make-posn 100 130)
            (make-tank 100 (- TANK-DELTA))
            #false))
(check-expect ; (boolean? missile), moving left, ke right
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 (- TANK-DELTA))
                           #false)
                "right")
 (make-sigs (make-posn 100 130)
            (make-tank 100 TANK-DELTA)
            #false))
(check-expect ; (boolean? missile), moving right, ke left
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 TANK-DELTA)
                           #false)
                "left")
 (make-sigs (make-posn 100 130)
            (make-tank 100 (- TANK-DELTA))
            #false))
(check-expect ; (boolean? missile), ke space -> missile fired
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 TANK-DELTA)
                           #false)
                " ")
 (make-sigs (make-posn 100 130)
            (make-tank 100 TANK-DELTA)
            (make-posn 100 (- HEIGHT (image-height TANK) 5))))
(check-expect ; (posn? missile), moving right -> ke left
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 TANK-DELTA)
                           (make-posn 100 60))
                "left")
 (make-sigs (make-posn 100 130)
            (make-tank 100 (- TANK-DELTA))
            (make-posn 100 60)))
(check-expect  ; (posn? missile), moving right, ke space
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 TANK-DELTA)
                           (make-posn 100 60))
                " ")
 (make-sigs (make-posn 100 130)
            (make-tank 100 TANK-DELTA)
            (make-posn 100 60)))
(check-expect ; (posn? missile), ke x
 (si-control.V2 (make-sigs (make-posn 100 130)
                           (make-tank 100 TANK-DELTA)
                           (make-posn 100 60))
                "z")
 (make-sigs (make-posn 100 130)
            (make-tank 100 TANK-DELTA)
            (make-posn 100 60)))
(define (si-control.V2 s ke)
  (make-sigs
   (make-posn (posn-x (sigs-ufo s)) (posn-y (sigs-ufo s)))
   (make-tank (tank-loc (sigs-tank s))
              (cond
                [(key=? ke "left") (- TANK-DELTA)]
                [(key=? ke "right") TANK-DELTA]
                [else (tank-vel (sigs-tank s))]))
   (cond
     [(and (boolean? (sigs-missile s))
           (key=? ke " "))
      (make-posn (tank-loc (sigs-tank s))
                 (- HEIGHT (image-height TANK) 5))]
     [else (sigs-missile s)])))


;stop-when
; SIGS.V2 -> Booleans
; stop the game when:
; - UFO reach the bottom of the canvas.
; - missile hit the UFO.
(check-expect (si-game-over?.V2 (make-sigs
                                 (make-posn 100 HEIGHT)
                                 (make-tank 30 5)
                                 #false))
              #t)
(check-expect (si-game-over?.V2 (make-sigs
                                 (make-posn 100 100)
                                 (make-tank 30 5)
                                 (make-posn 100 100)))
              #t)
(check-expect (si-game-over?.V2 (make-sigs
                                 (make-posn 100 100)
                                 (make-tank 30 5)
                                 (make-posn 90 180)))
              #f)
(define (si-game-over?.V2 s)
  (cond
    [(>= (posn-y (sigs-ufo s)) HEIGHT)
     #true]
    [(and (posn? (sigs-missile s))
          (hit? (sigs-ufo s)(sigs-missile s)))
     #true]
    [else #false]))

; UFO MISSLE -> Number
; calculate the diatance between the UFO and the missile, return #t
; when the missle are close to the UFO.
(check-expect (hit? (make-posn 10 10) (make-posn 100 100)) #f)
(check-expect (hit? (make-posn 100 100) (make-posn 100 100)) #t)
(define (hit? p1 p2)
   (<=
    (sqrt
     (+
      (sqr (- (posn-x p2)(posn-x p1)))
      (sqr (- (posn-y p2)(posn-y p1)))))
    HIT))


; si-render-final
; SIGS.V2 -> Image
; render the final stage when the game stop.
(check-expect (si-render-final(make-sigs
                                 (make-posn 100 100)
                                 (make-tank 30 5)
                                 (make-posn 100 100)))
              (overlay (text "Game Over" 30 "red") BACKGROUND))
(define (si-render-final s)
  (overlay (text "Game Over" 30 "red") BACKGROUND))

; Any -> Boolean
; is a an element of the MissileOrNot collection
(define (missile-or-not? v)
  (if
   (or (false? (sigs-missile v))
       (posn? (sigs-missile v)))
       #true
   #false))

; SIGS -> Imaga
; launchs the space-invader gameplay
(define (main.V2 w)
  (big-bang (make-sigs (make-posn (/ WIDTH 2) 0)
                       (make-tank (/ WIDTH 2) TANK-DELTA)
                       #false)
    [on-tick si-move.V2 0.05]
    [to-draw si-render.V2]
    [on-key si-control.V2]
    [stop-when si-game-over?.V2 si-render-final]
    [check-with missile-or-not?]))

(main.V2 0)