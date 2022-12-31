;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |158 - ShotWorld-tockV2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; If you run main, press the space bar (fire a shot), and wait for a goodly amount of time,
;; the shot disappears from the canvas. When you shut down the world canvas, however,
;; the result is a world that still contains this invisible shot.

;; Design an alternative tock function that doesn’t just move shots one pixel per clock tick
;; but also eliminates those whose coordinates place them above the canvas. Hint You may wish
;; to consider the design of an auxiliary function for the recursive cond clause.

; A ShotWorld is List-of-numbers. 
; interpretation each number on such a list
;   represents the y-coordinate of a shot

; ....

; ShotWorld -> ShotWorld
; moves each shot on w up by one pixel
(check-expect (tock.v2 '()) '())
(check-expect (tock.v2 (cons 10 '()))
              (cons 9 '()))
(check-expect (tock.v2 (cons 10 (cons 20 '())))
              (cons 9 (cons 19 '())))
(check-expect (tock.v2 (cons 0 (cons 20 '())))
              (cons 19 '()))
(define (tock.v2 w)
  (cond
    [(empty? w) '()]
    [(out-of-sight? w)
     (cond
       [(empty? (rest w)) '()]
       [else
        (cons (sub1 (first (rest w))) (rest (tock.v2 (rest w))))])]
    [else
     (cons (sub1 (first w)) (tock.v2 (rest w)))]))
     

; ShotWorld -> ShotWorld
; removes a shot w of a list if it's value is above 0.
(define (out-of-sight? w)
  (zero? (first w)))

;.....