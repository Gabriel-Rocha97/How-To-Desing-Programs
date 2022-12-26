;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |133 - Cond-or-Or|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))



; Here is another way of formulating the second cond clause in contains-flatt?:
; ... (cond
;       [(string=? (first alon) "Flatt") #true]
;       [else (contains-flatt? (rest alon))]) ...
; Explain why this expression produces the same answers as the or expression
; in the version of exercise 132. Which version is clearer to you? Explain.

; its produces the same answers for using the same evaluation of or, validate the first
; cond expression, if its #false, validate the next one. Each version its has the same
; result, but cond expressions are clearer by showing the result expression.