;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |185 - List-Selectors|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))


;; You know about first and rest from BSL, but BSL+ comes with even more selectors than that.
;; Determine the values of the following expressions:

;(first (list 1 2 3))
(check-expect (first (list 1 2 3)) 1)

;(rest (list 1 2 3))
(check-expect (rest (list 1 2 3)) (list 2 3))

;(second (list 1 2 3))
(check-expect (second (list 1 2 3)) 2)



