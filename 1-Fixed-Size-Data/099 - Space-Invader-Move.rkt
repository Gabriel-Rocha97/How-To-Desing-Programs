;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |099 - Space-Invader-Move|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design si-move. This function is called for every clock
;; tick to determine to which position the objects move now.
;; Accordingly, it consumes an element of SIGS and produces
;; another one.

;; Moving the tank and the missile (if any) is relatively straightforward.
;; They move in straight lines at a constant speed. Moving the UFO calls for
;; small random jumps to the left or the right. Since you have never dealt
;; with functions that create random numbers, the rest of this exercise is
;; a longish hint on how to deal with this issue.

;constats
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

;use in hit?
(define HIT 3)

;use in si-move-proper
(define UFO-DELTA-Y 0.5)
(define MISSILE-DELTA-Y 0.7)

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

       
                