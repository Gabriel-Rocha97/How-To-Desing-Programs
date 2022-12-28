;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |143 - Checked-Average|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; Determine how average behaves in DrRacket when applied to the empty list.
; Then design checked-average, a function that produces an informative error message when it is applied to '().

; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
 
(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.

; List-of-temperatures -> Number
; computes the average temperature 
(define (average alot)
  (/ (sum alot) (how-many alot)))
 
; List-of-temperatures -> Number 
; adds up the temperatures on the given list
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))
 
; List-of-temperatures -> Number 
; counts the temperatures on the given list
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [else (+ (how-many (rest alot)) 1)]))

; A NumberorError is one of:
; - Number
; - Error

; List-of-temperatures -> NumberorError
; determinate the average of temperature list. If its empty return a error.
(check-expect (checked-average (cons 5 (cons 3 (cons 4 '())))) 4)
(define (checked-average alot)
  (if (empty? alot)
      (error "Error: List its empty")
      (average alot)))
