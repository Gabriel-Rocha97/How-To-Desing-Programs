;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |047 - Happiness-Gauge|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

(define WIDTH-OF-WORLD 200)
(define X (/ WIDTH-OF-WORLD 2))
(define HEIGHT-OF-WORLD 200)

(define BACKGROUND (rectangle
                     WIDTH-OF-WORLD
                     HEIGHT-OF-WORLD
                     "outline"
                     "black"))

; WorldState is a Number for "happiness gauge"

; WorldState -> Image
; display the hapiness gauge in the world
; the score decrease 0.1 for each tick
; minium hapiness score is 0
(define (render ws)
  (place-image/align (rectangle
                      WIDTH-OF-WORLD
                      ws
                      "solid" "red")
                     X
                     HEIGHT-OF-WORLD
                     "middle"
                     "bottom"
                     BACKGROUND))

; WorldState -> WorldState
; Hapiness score falls by 0.1 for each clock tick
; minimium score is 0
(check-expect (tock 0) 0)
(check-expect (tock 100) 99.9)
(check-expect (tock 201) 200)
(define (tock ws)
  (cond
    [(< ws 1) 0]
    [else (min (- ws 0.1) HEIGHT-OF-WORLD)]))



; WorldState String -> WorldState
; when "up" key is pressed, happiness is increased by 1.3
; When "down" key is pressed, happiness is decreased by 0.2
(check-expect (press 50 "up") 65)
(check-expect (press 50 "down") 40)
(define (press ws ke)
  (cond
    [(string=? ke "up") (min (* ws 1.3) HEIGHT-OF-WORLD)]
    [(string=? ke "down") (max (* ws 0.8) 0)]))




; WorldState -> Image
; lauchs the happiness gauge world
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [on-key press]
    [to-draw render]))


(main 100)

