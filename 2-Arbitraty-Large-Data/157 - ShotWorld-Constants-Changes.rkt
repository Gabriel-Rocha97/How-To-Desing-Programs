;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |157 - ShotWorld-Constants-Changes|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

;; Experiment to determine whether the arbitrary decisions concerning constants are easy to change. For example, determine whether changing a single constant definition achieves the desired outcome:
;; change the height of the canvas to 220 pixels;

;; change the width of the canvas to 30 pixels;

;; change the x location of the line of shots to “somewhere to the left of the middle”

;; change the background to a green rectangle; and

;; change the rendering of shots to a red elongated rectangle.


; A Shot is a Number.
; interpretation represents the shot's y-coordinate 

(define HEIGHT 220) ; distances in terms of pixels 
(define WIDTH 30)
(define XSHOTS (/ WIDTH 3))
 
; graphical constants 
(define BACKGROUND (empty-scene WIDTH HEIGHT "green"))
(define SHOT (rectangle (* 10 2) (* 10 2) "solid" "black"))

; A List-of-shots is one of: 
; – '()
; – (cons Shot List-of-shots)
; interpretation the collection of shots fired

; A ShotWorld is List-of-numbers. 
; interpretation each number on such a list
;   represents the y-coordinate of a shot

; ShotWorld -> ShotWorld 
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))

; event-handler

; ShotWorld -> Image
; adds the image of a shot for each  y on w 
; at (XSHOTS,y) to the background image
(check-expect (to-image '()) BACKGROUND)
(check-expect (to-image (cons 9 '()))
              (place-image SHOT XSHOTS 9 BACKGROUND))
(check-expect (to-image (cons 9
                              (cons 20 '())))
              (place-image SHOT XSHOTS 9
                           (place-image SHOT XSHOTS 20 BACKGROUND)))
(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else
     (place-image SHOT  XSHOTS (first w)
                  (to-image (rest w)))]))

; ShotWorld -> ShotWorld
; moves each shot on w up by one pixel
(check-expect (tock '()) '())
(check-expect (tock (cons 10 '())) (cons 9 '()))
(check-expect (tock (cons 10
                          (cons 20 '())))
              (cons 9 (cons 19 '())))
(define (tock w)
  (cond
    [(empty? w) '()]
    [else
     (cons(sub1 (first w))(tock (rest w)))]))

; ShotWorld KeyEvent -> ShotWorld 
; adds a shot to the world 
; if the player presses the space bar
(check-expect (keyh '() " ") (cons HEIGHT '()))
(check-expect (keyh (cons 20 '()) " ")
              (cons HEIGHT (cons 20 '())))
(define (keyh w ke)
  (cond
    [(key=? ke " ") (cons HEIGHT w)]
    [else w]))

; All the constant change achieve the desired outcome.
; It didn't make clear what "without any changes means" but its possible to double sized
; the SHOT dimensions and its color.


