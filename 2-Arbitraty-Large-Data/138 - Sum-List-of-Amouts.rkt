;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |138 - Sum-List-of-Amouts|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the sum function, which consumes a List-of-amounts and computes the sum of the amounts.

; Use DrRacket’s stepper to see how (sum l) works for a short list l in List-of-amounts. 

; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

; Design the sum function, which consumes a List-of-amounts
; and computes the sum of the amounts. Use DrRacket’s stepper
; to see how (sum l) works for a short list l in List-of-amounts.

; List-of-amounts -> Number
; computes the sum of the amounts aloa
(check-expect (sum '()) 0)
(check-expect (sum (cons 5 '())) 5)
(check-expect (sum (cons 2 (cons 3 (cons 4 '())))) 9)
(define (sum aloa)
(cond
  [(empty? aloa) 0]
  [(cons? aloa) (+ (first aloa) (sum (rest aloa)))]))

(define l (cons 2(cons 3 (cons 2 (cons 8 '())))))
(sum l)