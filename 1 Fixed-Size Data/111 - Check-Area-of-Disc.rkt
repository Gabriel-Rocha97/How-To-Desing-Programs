;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |111 - Check-Area-of-Disc|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; A checked version of area-of-disk can also enforce that the
; arguments to the function are positive numbers, not just
; arbitrary numbers. Modify checked-area-of-disk in this way.

; Any BSL value is one of: 
; – Number
; – Boolean
; – String
; – Image 
; – (make-posn Any Any)
; ...
; – (make-tank Any Any)
; ...

; Positivenumber -> Positivenumber
; computes the area of a disk with radius r
(define (area-of-disk r)
  (* 3.14 (* r r)))

; Any -> Number
; computes the area of a disk with radius v, 
; if v is a Positive number
(define (checked-area-of-disk v)
  (cond
    [(positive? v) (area-of-disk v)]
    [else (error "area-of-disk: positive number expected")]))
