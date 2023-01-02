;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |162 - Checked-Wage|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Change the function so no emplyoee possibly work more than 100 hours
; per week. If does the function must signal a error.

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all weekly given hours
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

; a List-or-Error is one of:
; - List-of-Number
; - Error

(define Limit 100)
; List-of-Number -> Boolean
; checks if any item of a list l is bigger than Limit. If not
; return #false.
(check-expect (check-limit '()) #f)
(check-expect (check-limit (cons 10 (cons 120 '()))) #t)
(check-expect (check-limit (cons 30 (cons 90 '()))) #f)
(define (check-limit hrs)
  (cond
    [(empty? hrs) #false]
    [else
     (if (> (first hrs) Limit) #t (check-limit (rest hrs)))]))

; List-of-Number -> List-or-Error
; Computes the weekly wages for all weekly given hours. If any hours
; from the list is bigger than Limit, display a error message.
(check-expect (checked-wage* (cons 4 (cons 2 '())))
              (cons 48 (cons 24 '())))
(check-error (checked-wage* (cons 10 (cons 120 '())))
             (error "Hour(s) is bigger than 100"))
(define (checked-wage* hrs)
  (cond
    [(check-limit hrs)
     (error "Hour(s) is bigger than 100")]
    [else (wage* hrs)]))
