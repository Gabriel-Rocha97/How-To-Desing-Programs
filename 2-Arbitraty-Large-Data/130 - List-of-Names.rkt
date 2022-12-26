;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |130 - List-of-Names|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Create an element of List-of-names that contains five Strings.

; A List-of-names is one of: 
; – '()
; – (cons String List-of-names)
; interpretation a list of invitees, by last name

(cons "Spencer"
      (cons "Holmes"
            (cons "Thompson"
                  (cons "Howard"
                        (cons "Bruce"
                              '())))))
;==============================================================


;Explain why
;(cons "1" (cons "2" '()))
;is an element of List-of-names and why (cons 2 '()) isn’t.

; the first sentence is a a element of List-of-names because its using
; a string and the list from List-of names, producing a piece of data
; acording to the data definition.

; The second setence is not a element of List-of-names for combine the list
; of List-of-names '() with a number, not following it's own list definition.
                        