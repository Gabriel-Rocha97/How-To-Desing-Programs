;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |058 - Tax-Price|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; A Price is a Natural Number

; A Price falls into one of three intervals: 
; — minor than 1000
; — 1000 through 10000
; — above 10000.
; interpretation the price of an item

;Tax contants
(define LOW-PRICE 0.05)
(define LUXURY-PRICE 0.08)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* LOW-PRICE 1000))
(check-expect (sales-tax 1500) (* LOW-PRICE 1500))
(check-expect (sales-tax 10000) (* LUXURY-PRICE 10000))
(check-expect (sales-tax 12017) (* LUXURY-PRICE 12017))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* LOW-PRICE p)]
    [(>= p 10000) (* LUXURY-PRICE p)]))