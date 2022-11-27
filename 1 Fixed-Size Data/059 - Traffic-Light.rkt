;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |059 - Traffic-Light|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; A LightMode is one of the following Strings:
; - "outline"
; - "solid"
; interpretation the strings represents the mode
; that a traffic light may assume given the currest cs

; constants
(define RADIUS 10)
(define BACKGROUND (empty-scene 90 30))



; TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "red"
(check-expect (red? "red") "solid")
(check-expect (red? "green") "outline")
(define (red? cs)
  (if (string=? cs "red") "solid" "outline"))

; TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "green"
(check-expect (green? "green") "solid")
(check-expect (green? "yellow") "outline")
(define (green? cs)
  (if (string=? cs "green") "solid" "outline"))

; TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "yellow"
(check-expect (yellow? "yellow") "solid")
(check-expect (yellow? "red") "outline")
(define (yellow? cs)
  (if (string=? cs "yellow") "solid" "outline"))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs)
  (cond
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]
    [(string=? cs "red") "green"]))
 
; TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render current-state)
  (place-image
   (beside (circle RADIUS (red? current-state) "red")
            (circle RADIUS (yellow? current-state) "yellow")
            (circle RADIUS (green? current-state) "green"))
   45 15
  (empty-scene 90 30)))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))