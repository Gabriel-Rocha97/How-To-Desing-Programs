;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |149 - Copier-and-Copier-v2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; N String -> List-of-strings 
; creates a list of n copies of s
(define (copier n s)
  (cond
    [(zero? n) '()]
    [(positive? n) (cons s (copier (sub1 n) s))]))


;; Does copier function properly when you apply it to a natural number and a Boolean or an image? Or do you have to design another function? Read Abstraction for an answer.

;; An alternative definition of copier might use else:

; N String -> List-of-strings 
; creates a list of n copies of s
(define (copier.v2 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier.v2 (sub1 n) s))]))

;; How do copier and copier.v2 behave when you apply them to 0.1 and "x"? Explain. Use DrRacket’s stepper to confirm your explanation.

;using stepper
(copier.v2 0.1 "x")
(copier 0.1 "x")

; Both funcions can't return a result value. The cond expression on copier results a error
; messages warning all results are false, not having a condition to deal with it. copier.v2,
; otherwise keep the the loop of the recursion endlessly, since (sub1 0.1) its not be validate
; on the (zero? n) clause.
