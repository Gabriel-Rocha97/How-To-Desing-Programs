;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |115 - Light-Predicate|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; Revise light=? so that the error message specifies which of
; the two arguments isn’t an element of TrafficLight:
; (define (light=? a-value another-value)
;   (if (and (light? a-value) (light? another-value))
;       (string=? a-value another-value)
;       (error MESSAGE)))


; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; Any -> Boolean
; is the given value an element of TrafficLight
(define (light? x)
  (cond
    [(string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))]
    [else #false]))


; Any Any -> Boolean
; are the two values elements of TrafficLight and, 
; if so, are they equal
 
(check-expect (light=? "red" "red") #true)
(check-expect (light=? "red" "green") #false)
(check-expect (light=? "green" "green") #true)
(check-expect (light=? "yellow" "yellow") #true)
(define (light=? a-value another-value)
  (if (and (light? a-value) (light? another-value))
      (string=? a-value another-value)
      (error (message a-value another-value))))

; Any Any -> Text
; gives a error message by given values inconsistence
(check-expect (message "blue" "red") "First Value is not a TrafficLight")
(check-expect (message "red" "brown") "Second Value is not a TrafficLight")
(check-expect (message "blue" "brown") "Both values are not TrafficLight")
(define (message a-value another-value)
  (cond
    [(and  (false? (light? a-value))
           (false? (light? another-value)))
     "Both values are not TrafficLight"]
    [(false? (light? a-value))
     "First Value is not a TrafficLight"]
    [else "Second Value is not a TrafficLight"]))