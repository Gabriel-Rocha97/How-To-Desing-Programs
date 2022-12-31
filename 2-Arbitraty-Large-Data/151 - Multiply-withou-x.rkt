;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |151 - Multiply-withou-x|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

;; Design the function multiply. It consumes a natural number n and multiplies it with a number x without using *.

;; Use DrRacket’s stepper to evaluate (multiply 3 x) for any x you like. How does multiply relate to what you know from grade school?

; N Number -> Number
; multiply a natural number b by a arbitraty number x without using *
(check-expect (multiply 10 3) (* 10 3))
(check-expect (multiply 2 1) (* 2 1))
(check-expect (multiply 5 1.15) (* 5 1.15))
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (+ (multiply (sub1 n) x) x)]))