;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |113 - Missile-or-Not|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))



; Reformulate the predicate now using an or expression.

; Current predicate:
; (define (missile-or-not? v)
;   (cond
;     [(false? v) #true]
;     [(posn? v) #true]
;     [else #false]))


; Any -> Boolean
; is a an element of the MissileOrNot collection
(define (missile-or-not? v)
  (if
   (or (false? v)
       (posn? v))
       #true
   #false))