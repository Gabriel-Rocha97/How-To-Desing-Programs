;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |147 - Nelist-of-Booleans|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Develop a data definition for NEList-of-Booleans, a representation of non-empty lists of Boolean values.
;; Then redesign the functions all-true and one-true from exercise 140.

; A NEList-of-Booleans is one of:
; - (cons Boolean '())
; - (cons Boolean NEList-of-Booleans)
; interpretation: a not empty list of booleans

; NEList-of-Booleans -> Boolean
; checks if all the items of a given booleans are #true
(check-expect (all-true (cons #f '())) #f)
(check-expect (all-true (cons #t (cons #t '()))) #t)
(check-expect (all-true (cons #t (cons #f (cons #t '())))) #f)
(define (all-true l-ne)
  (cond
    [(empty? (rest l-ne))
     (if (false? (first l-ne))#f #t)]
    [else (if (false? (first l-ne)) #f (all-true (rest l-ne)))]))

; NEList-of-Booleans -> Boolean
; checks if at least one item of a given booleans are #true.
; If not return #false
(check-expect (one-true (cons #t '())) #t)
(check-expect
 (one-true (cons #f (cons #t (cons #f '())))) #t)
(check-expect (one-true (cons #f (cons #f '()))) #f)
(define (one-true l-ne)
  (cond
    [(empty? (rest l-ne))
     (if (false? (first l-ne)) #f #t)]
    [else (or (not (false? (first l-ne)))
              (not (false? (one-true (rest l-ne)))))]))