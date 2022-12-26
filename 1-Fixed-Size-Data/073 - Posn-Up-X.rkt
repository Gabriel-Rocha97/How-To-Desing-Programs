;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |073 - Posn-Up-X|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; A Posn represents the state of the world.

;constants
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; Posn -> Image
; adds a red spot to MTS at p
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

;Posn Number -> Posn
; Produces a Posn p with n value in the x field
(check-expect (posn-up-x (make-posn 10 15) 20) (make-posn 20 15))
(define (posn-up-x p n)
  (make-posn n (posn-y p)))

; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))
(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

; Posn -> Posn 
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot] ; to be developed
    [to-draw scene+dot]))