;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |155 - Russian-Doll-Inner|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the function inner, which consumes an RD and produces the (color of the) innermost doll.
; Use DrRacket’s stepper to evaluate (inner rd) for your favorite rd.

(define-struct layer [color doll])

; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)

; RB -> String
; Display the color of the innermost doll of a RB
(check-expect (inner "blue") "blue")
(check-expect (inner (make-layer "yellow" "red")) "red")
(define (inner rd)
  (cond
    [(string? rd) rd]
    [else (inner (layer-doll rd))]))
