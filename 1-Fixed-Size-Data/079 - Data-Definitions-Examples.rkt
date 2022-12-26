;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |079 - Data-Definitions-Examples|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Create examples for the following data definitions:

; A Color is one of: 
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"
; ex: "white"


; H is a Number between 0 and 100.
; interpretation represents a happiness value
; ex: 50, 20, 30, 50, 100


(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
; ex:
; (define FP (make-person "John" "Lennon" #t))
; i.e
; A person has:
; - a first name string
; - a last name string
; - a boolean for a person genre

; It is a good ideia name a field closely to a predicate?
; In this case doesen't make a difference since the value
; of the field is a boolean. But it's a case by case analysis



(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; ex:
; (define bull-dog (make-dog FP "Tim" 8 50))
; ie:
; a dog has a owner which is a person
; a name witch is a string
; a age witch is a positive integer
; a happiness scale


; A Weapon is one of: 
; — #false
; — Posn
; interpretation #false means the missile hasn't 
; been fired yet; a Posn means it is in flight
; ex:
; #false
; (make-posn 5 10)
 
 
 