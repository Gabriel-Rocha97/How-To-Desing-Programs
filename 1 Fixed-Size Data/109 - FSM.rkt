;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |109 - FSM|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design a world program that recognizes a pattern in a sequence of KeyEvents.
; Initially the program shows a 100 by 100 white rectangle. Once your program has
; encountered the first desired letter, it displays a yellow rectangle of the same size.
; After encountering the final letter, the color of the rectangle turns green.
; If any “bad” key event occurs, the program displays a red rectangle.



; ExpectsToSee is one of:
; – AA
; – BB
; – DD 
; – ER 
 
(define AA "start, expect an 'a'")
(define BB "expect 'b', 'c', or 'd'")
(define DD "finished")
(define ER "error, illegal key")

; render
; ExpectsToSee -> Image
; renders the worlds given the current state ets
(check-expect (render AA) (rectangle 100 100 "solid" "white"))
(check-expect (render BB) (rectangle 100 100 "solid" "yellow"))
(check-expect (render DD) (rectangle 100 100 "solid" "green"))
(check-expect (render ER) (rectangle 100 100 "solid" "red"))
(define (render ets)
  (rectangle 100 100 "solid" (cond
                               [(eq? ets AA) "white"]
                               [(eq? ets BB) "yellow"]
                               [(eq? ets DD) "green"]
                               [(eq? ets ER) "red"])))

; key
; ExpectsToSee KeyEvent-> ExpectsToSee
; given the next world state by current state ets and a the KeyEvent given.
; Acording data definition, the desired keys are (a,b,c,d)
(check-expect (key-handler AA "a") BB)
(check-expect (key-handler AA "x") ER)
(check-expect (key-handler BB "b") BB)
(check-expect (key-handler BB "c") BB)
(check-expect (key-handler BB "d") DD)
(check-expect (key-handler BB "z") ER)
(define (key-handler ets ke)
  (cond
    [(and (eq? ets AA) (key=? ke "a")) BB]
    [(and (eq? ets BB) (key=? ke "b")) BB]
    [(and (eq? ets BB) (key=? ke "c")) BB]
    [(and (eq? ets BB) (key=? ke "d")) DD]
    [(eq? ets DD) DD]
    [else ER]))

;main
(define (main ws)
  (big-bang AA
    [to-draw render]
    [on-key key-handler]))

(main 0)