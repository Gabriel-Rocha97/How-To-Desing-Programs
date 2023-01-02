;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |161 - Wage|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Evaluate the examples into test and make sure they succeded. Then change
; the function to that everyone receive $14 per hour.

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all weekly given hours

;example-tests
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons 336 '()))
(check-expect (wage* (cons 4 (cons 2 '())))
              (cons 48 (cons 24 '())))
(define (wage* hrs)
  (cond
    [(empty? hrs) '()]
    [else
     (cons (wage (first hrs)) (wage* (rest hrs)))]))

; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* 12 h))

; For compute the wage of $14 per hours, the only necessary change is:
; (define (wage h)
; ---> (* 14 h))