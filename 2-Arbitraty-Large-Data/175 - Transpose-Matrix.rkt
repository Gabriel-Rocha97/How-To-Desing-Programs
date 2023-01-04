;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |175 - Transpose-Matrix|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Mathematics teachers may have introduced you to matrix calculations by now.
;; In principle, matrix just means rectangle of numbers. Here is one possible
;; data representation for matrices:

; A Matrix is one of: 
;  – (cons Row '())
;  – (cons Row Matrix)
; constraint all rows in matrix are of the same length

;; Here is the solution for the five-second puzzle:

; A Row is one of: 
;  – '() 
;  – (cons Number Row)

(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))
(define mat1 (cons row1 (cons row2 '())))


; Matrix -> Matrix
; transposes the given matrix along the diagonal 
 
(define wor1 (cons 11 (cons 21 '())))
(define wor2 (cons 12 (cons 22 '())))
(define tam1 (cons wor1 (cons wor2 '())))
 
(check-expect (transpose mat1) tam1)
 
(define (transpose lln)
  (cond
    [(empty? (first lln)) '()]
    [else (cons (first* lln) (transpose (rest* lln)))]))

;; The definition assumes two auxiliary functions:

;; first*, which consumes a matrix and produces the first column as a list of numbers; and

;; rest*, which consumes a matrix and removes the first column. The result is a matrix.

;; Even though you lack definitions for these functions, you should be able to understand how transpose works.
;; You should also understand that you cannot design this function with the design recipes you have seen so far.
;; Explain why.

;; Design the two wish-list functions. Then complete the design of transpose with some test cases. 

; Matrix -> Lon
; Consumes a Matrix and return the first column in a list of numbers
(define (first* m)
  (cond
    [(empty? m) '()]
    (else (cons (first (first m)) (first* (rest m))))))

; Matrix -> Lon
; Consumes a Matrix and return a list of number without the first column
(define (rest* m)
  (cond
    [(empty? m) '()]
    [else (cons (rest (first m)) (rest* (rest m)))]))
