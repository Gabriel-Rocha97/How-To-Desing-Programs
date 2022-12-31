;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |150 - Add-to-Pi|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function add-to-pi. It consumes a natural number n
;; and adds it to pi without using the primitive + operation.
;; Here is a start:

; N -> Number
; computes (+ n pi) without using +
; (check-within (add-to-pi 3) (+ 3 pi) 0.001)
; (define (add-to-pi n)
;   pi)

;; Once you have a complete definition, generalize the function to add,
;; which adds a natural number n to some arbitrary number x without using +.
;; Why does the skeleton use check-within?

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; N -> Number
; computes (+ n pi) without using +
(check-within (add-to-pi 3) (+ 3 pi) 0.001)
(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [else (add1 (add-to-pi (sub1 n)))]))

; N Number -> Number
; computes a natural number n to some number x without using +
(check-expect (add 3 5) (+ 3 5))
(check-expect (add 1 -1) (+ 1 -1))
(define (add n x)
  (cond
    [(zero? n) x]
    [else (add1 (add (sub1 n) x))]))

; Due to the presence of inexact numbers pi in the defition data,
; check-within is the correct choice for testing, and the
; test succeeds if the given delta is reasonably large.
              