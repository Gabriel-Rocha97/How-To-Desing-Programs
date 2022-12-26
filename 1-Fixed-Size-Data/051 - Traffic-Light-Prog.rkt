;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |051 - Traffic-Light-Prog|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))




; World Constants
(define RADIUS 50)
(define HEIGHT-WORLD (* RADIUS 5))
(define WIDTH-WORLD (* RADIUS 5))
(define BACKGROUND (empty-scene WIDTH-WORLD HEIGHT-WORLD))
(define X-LIGHT (/ WIDTH-WORLD 2))
(define Y-LIGHT (/ HEIGHT-WORLD 2))
  

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; TrafficLight -> Image
; ilustrate the traffic light by the current state s
(check-expect (traffic-light-render "green")
              (place-image (circle RADIUS "solid" "yellow") X-LIGHT Y-LIGHT BACKGROUND))
(check-expect (traffic-light-render "yellow")
              (place-image (circle RADIUS "solid" "red") X-LIGHT  Y-LIGHT BACKGROUND))
(check-expect (traffic-light-render "red")
              (place-image (circle RADIUS "solid" "green") X-LIGHT Y-LIGHT BACKGROUND))
(define (traffic-light-render s)
  (place-image (circle RADIUS
                       "solid"
                       (traffic-light-next s))
               X-LIGHT
               Y-LIGHT
               BACKGROUND))
               


; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))


; TrafficLight -> Image
; launchs the TrafficLight World
(define (main s)
  (big-bang s
    [on-tick traffic-light-next 3]
    [to-draw traffic-light-render]))
  
