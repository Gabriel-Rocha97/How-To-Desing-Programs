;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |112 - Checked-Make-Vec|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Develop the function checked-make-vec, which is to be understood
; as a checked version of the primitive operation make-vec. It ensures
; that the arguments to make-vec are positive numbers. In other words,
; checked-make-vec enforces our informal data definition.

(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

; Any -> VEC
; verify if the arguments of vec are following its data definition
(define (checked-make-vec v)
  (cond
   [(and (positive? (vec-x v))
        (positive? (vec-y v)))
     v]
   [else (error "checked-make-vec: both positive numbers expected")]))