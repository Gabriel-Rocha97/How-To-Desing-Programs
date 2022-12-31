;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |148 - Empty-or-Not-Empty|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; Compare the function definitions from this section (sum, how-many, all-true, one-true)
; with the corresponding function definitions from the preceding sections. Is it better
; to work with data definitions that accommodate empty lists as opposed to definitions
; for non-empty lists? Why? Why not?


; Working on empty and not empty list has practically the shame resolutions. Although
; empty list has more simple to handle and its more practicle to work with, since not-empty
; list, even not been mentioned on data defintion, belongs in empty list data defitions.