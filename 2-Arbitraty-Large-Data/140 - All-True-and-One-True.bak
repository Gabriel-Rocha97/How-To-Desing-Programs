;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |140 - All-True-and-One-True|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the function all-true, which consumes a list of Boolean values and determines
; whether all of them are #true. In other words, if there is any #false on the list,
; the function produces #false.

; A List-of-Booleans is one of:
; - '()
; - (cons Boolean List-of-Boolean)

; List-of-Boolean -> Boolean
; checks if all the items of a List-of-Booleans are #true
(check-expect (all-true '()) #true)
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #true (cons #false '()))) #false)
(define (all-true alob)
  (cond
    [(empty? alob) #t]
    [(cons? alob)
     (if (false? (first alob)) #f (all-true (rest alob)))]))

; Now design one-true, a function that consumes a list of Boolean
; values and determines whether at least one item on the list is #true.

; List-of-Booleans -> Boolean
; checks if at least one item of a  List-of-Booleans is #true
(check-expect (one-true (cons #t '())) #t)
(check-expect (one-true (cons #f '())) #f)
(check-expect (one-true (cons #t (cons #f '()))) #t)
(check-expect (one-true (cons #f (cons #f '()))) #f)
(check-expect (one-true (cons #f (cons #t (cons #f '())))) #t)
(define (one-true alob)
  (cond
    [(empty? alob) #f]
    [(cons? alob)
     (or (not (false? (first alob)))
         (not (false? (one-true (rest alob)))))]))
