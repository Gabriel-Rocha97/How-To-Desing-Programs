;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |171 - List-of-Words-Definitions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; You know what the data definition for List-of-strings looks like. Spell it out.
;; Make sure that you can represent Piet Hein’s poem as an instance of the definition
;; where each line is represented as a string and another instance where each word is
;; a string. Use read-lines and read-words to confirm your representation choices.


;; Next develop the data definition for List-of-list-of-strings. Again, represent
;; Piet Hein’s poem as an instance of the definition where each line is represented
;; as a list of strings, one per word, and the entire poem is a list of such line
;; representations. You may use read-words/line to confirm your choice.

; A Los (List-of-string) is one of:
; - '()
; - (cons String Los)

; Represent a file on a list of lines, witch each line is a string is a Los
; (cons "TTT"
;   (cons ""
;     (cons "Put up in a place"
;       (cons ...
;         '()))))
; (read-lines f)


; Represent a file on a list of words is also a Los
; (cons "TTT"
;   (cons "Put"
;     (cons "up"
;      (cons "in"
;        (cons ...
;          '())))))
; (read-words f)

; A Lis (List-of-List-of-String) is one of:
; - '()
; - (cons Los Lis)

; Represent a file on a list where every item is a list of words is a Lis
;(cons (cons "TTT" '())
;  (cons '()
;    (cons (cons "Put"
;            (cons "up"
;              (cons ... '())))
;      (cons ...
;       '()))))
; (read-words/line w)
