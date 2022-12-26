;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |139 - Sum-List-of-Numbers|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Exercise 139. Now take a look at this data definition:

; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)

; Some elements of this class of data are appropriate
; inputs for sum from exercise 138 and some aren’t.

; Design the function pos?, which consumes a List-of-numbers and determines whether all numbers
; are positive numbers. In other words, if (pos? l) yields #true, then l is an element
; of List-of-amounts. Use DrRacket’s stepper to understand how pos? works for (cons 5 '()) and (cons -1 '()).


; List-of-amounts -> Number
; computes the sum of the amounts aloa
(check-expect (sum '()) 0)
(check-expect (sum (cons 5 '())) 5)
(check-expect (sum (cons 2 (cons 3 (cons 4 '())))) 9)
(define (sum aloa)
(cond
  [(empty? aloa) 0]
  [(cons? aloa) (+ (first aloa) (sum (rest aloa)))]))


; List-of-numbers -> boolean
; checks if all elements of a List-of-numbers are positive
(check-expect (pos? '()) #t)
(check-expect (pos? (cons 3 '())) #t)
(check-expect (pos? (cons 3 (cons 2 '()))) #t)
(check-expect (pos? (cons -1 '())) #f)
(define (pos? alon)
  (cond
    [(empty? alon) #t]
    [(cons? alon)
     (if (not (positive? (first alon))) #f (pos? (rest alon)))]))


; Also design checked-sum. The function consumes a List-of-numbers.
; It produces their sum if the input also belongs to List-of-amounts;
; otherwise it signals an error. Hint Recall to use check-error.

; List-of-Number -> Number
; Produces the sum of amount if the input given also belongs to List-of-amounts;
; even its signals an error.
(check-expect (checked-sum (cons 3 (cons 4 (cons 2 '())))) 9)
(check-error (checked-sum (cons -1 '())) (error "Not all number the list are positive"))
(define (checked-sum alon)
  (if (pos? alon)
      (sum alon)
      (error "Not all number the list are positive")))

(define l (cons 2(cons 3 (cons 2 (cons 8 '())))))

(checked-sum l)

