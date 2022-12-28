;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |145 - Sorted|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
 
(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

; Design the sorted>? predicate, which consumes a NEList-of-temperatures and produces #true if the temperatures are sorted in descending order.
; That is, if the second is smaller than the first, the third smaller than the second, and so on. Otherwise it produces #false.


; NEList-of-temperatures -> Boolean
; determinate #true if the temperatures of a list are sorted in descending order.
; Otherwise produce #false
(check-expect (sorted>? (cons 3 '())) #true)
(check-expect (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)
(check-expect (sorted>? (cons 2 (cons 3 '()))) #false)
(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else
     (if (not (>= (first ne-l)(first (rest ne-l))))
         #false
         (sorted>? (rest ne-l)))]))

         

