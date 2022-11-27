;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |061 - Traffic-Light-Symbolic|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; An S-TrafficLight is one of:
; - RED
; - GREEN
; - YELLOW


; A LightMode is one of the following Strings:
; - "outline"
; - "solid"
; interpretation the strings represents the mode
; that a traffic light may assume given the currest cs

; constants
(define RADIUS 10)
(define BACKGROUND (empty-scene 90 30))

; S-TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "red"
(check-expect (red? 0) "solid")
(check-expect (red? 1) "outline")
(check-expect (red? 2) "outline")
(define (red? cs)
  (if (=  cs 0) "solid" "outline"))

; N-TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "green"
(check-expect (green? 0) "outline")
(check-expect (green? 1) "solid")
(check-expect (green? 2) "outline")
(define (green? cs)
  (if (=  cs 1) "solid" "outline"))

; S-TrafficLight -> LightMode
; switch the mode to "solid" whent the cs is "yellow"
(check-expect (yellow? 0) "outline")
(check-expect (yellow? 1) "outline")
(check-expect (yellow? 2) "solid")
(define (yellow? cs)
  (if (=  cs 2) "solid" "outline"))

; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-symbollic 0) 1)
(check-expect (tl-next-symbollic 1) 2)
(check-expect (tl-next-symbollic 2) 0)
(define (tl-next-symbollic cs)
 (cond
   [(equal? cs RED) GREEN]
   [(equal? cs GREEN) YELLOW]
   [(equal? cs YELLOW) RED]))


; S-TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render current-state)
  (place-image
   (beside (circle RADIUS (red? current-state) "red")
            (circle RADIUS (yellow? current-state) "yellow")
            (circle RADIUS (green? current-state) "green"))
   45 15
  (empty-scene 90 30)))

; S-TrafficLight -> S-TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-symbollic 1]))

(traffic-light-simulation GREEN)