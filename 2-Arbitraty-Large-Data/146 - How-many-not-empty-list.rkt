;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |146 - How-many-not-empty-list|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

 
(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.


; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

; Design how-many for NEList-of-temperatures. Doing so completes average,
; so ensure that average passes all of its tests, too.

; NEList-of-temperatures -> Number
; compute the average temperatures
(check-expect
 (average (cons 3 (cons 2 (cons 1 '())))) 2)
(check-expect
 (average (cons 10 (cons 4 '()))) 7)
(define (average l-ne)
  (/ (sum l-ne) (how-many l-ne)))

; NEList-of-temperatures -> Number
; computes the sum of the given temperatures 
(check-expect
  (sum (cons 1 (cons 2 (cons 3 '())))) 6)
(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))


; NEList-of-temperatures -> Number 
; counts the temperatures of the given temperature
(check-expect (how-many (cons 1 '())) 1)
(check-expect (how-many (cons 1 (cons 2 '()))) 2)
(check-expect (how-many (cons 1 (cons 2 (cons 3'())))) 3)
(define (how-many l-ne)
  (cond
    [(empty? (rest l-ne)) 1]
    [else (+ (how-many (rest l-ne)) 1)]))

