;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |160 - Set+R-and-Set+L|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the functions set+.L and set+.R, which create a set by adding
;; a number x to some given set s for the left-hand and right-hand data
;; definition, respectively.

; A Son.L is one of: 
; – empty 
; – (cons Number Son.L)
; Son is used when it 
; applies to Son.L and Son.R

; A Son.R is one of: 
; – empty 
; – (cons Number Son.R)
; Constraint If s is a Son.R, 
; no number occurs twice in s

; Son
(define es '())

	
; Number Son.R -> Son.R
; removes x from s
(define s1.R(cons 1 '()))
(check-expect(set-.R 1 s1.R) es)
(define (set-.R x s)
  (remove x s))

; Number Son -> Son
; add n on a giving set list l
(define (set+ n l)
  (list* n l))


; Number Son.L -> Son.L
; add n to a given Son.L set
(check-expect (set+.L 5 '()) (cons 5 '()))
(check-expect (set+.L 1 (cons 1 '()))
              (cons 1 (cons 1 '())))
(define (set+.L n l)
  (set+ n l))

; Number Son.R -> Son.R
; add n to a given set list l.
(check-expect (set+.R 1 '()) (cons 1 '()))
(check-expect (set+.R 5 (cons 1
                              (cons 5
                                    (cons 1 '()))))
              (cons 5 (cons 1 (cons 1 '()))))
(define (set+.R n l)
  (if (member? n l)
      (set+ n (set-.R n l))
      (set+ n l)))


  
