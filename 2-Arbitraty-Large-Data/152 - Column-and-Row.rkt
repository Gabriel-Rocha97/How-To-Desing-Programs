;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |152 - Column-and-Row|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; Exercise 152. Design two functions: col and row.

; The function col consumes a natural number n and an image img. It produces a column—a vertical arrangement—of n copies of img.

(define CIB (circle 5 "solid" "black"))

; N Image -> Image
; computes a column of n copies of im
(check-expect (col 3 CIB) (above CIB CIB CIB))
(define (col n im)
   (cond
    [(<= n 1) im]
    [else (above im (col (sub1 n) im))]))


; The function row consumes a natural number n and an image img. It produces a row—a horizontal arrangement—of n copies of img

; N Image -> Image
; computes a row of n copies of im
(check-expect (row 3 CIB) (beside CIB CIB CIB))
(define (row n im)
  (cond
    [(<= n 1) im]
    [else (beside im (row (sub1 n) im))]))
