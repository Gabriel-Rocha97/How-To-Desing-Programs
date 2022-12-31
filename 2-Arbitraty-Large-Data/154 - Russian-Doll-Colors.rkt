;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |154 - Russian-Doll-Colors|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the function colors. It consumes a Russian doll and produces a string of all colors,
; eparated by a comma and a space. Thus our example should produce

(define-struct layer [color doll])

; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)

; RB -> String
; display all string colors of a RB
(check-expect (colors "yellow") "yellow")
(check-expect (colors (make-layer "red" "yellow")) "red, yellow")
(check-expect (colors (make-layer "red" (make-layer "yellow" "blue")))
              "red, yellow, blue")
(define (colors a-rb)
  (cond
    [(string? a-rb) a-rb]
    [else (string-append
           (layer-color a-rb)
           ", "
           (colors (layer-doll a-rb)))]))