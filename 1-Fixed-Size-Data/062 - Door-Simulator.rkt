;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |062 - Door-Simulator|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

	
; A DoorState is one of:
; – LOCKED
; – CLOSED
; – OPEN


; DoorState -> DoorState
; closes an oper door over the period of one click
(check-expect (door-closer "open") CLOSED)
(check-expect (door-closer "closed") CLOSED)
(check-expect (door-closer "locked") LOCKED)
(define (door-closer state-of-door)
  (cond
    [(string=? LOCKED state-of-door) LOCKED]
    [(string=? CLOSED state-of-door) CLOSED]
    [(string=? OPEN state-of-door) CLOSED]))

; DoorState KeyEvent -> DoorState
; turns key event k into an action on state s
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action OPEN "a") OPEN)
(check-expect (door-action CLOSED "a") CLOSED)
(define (door-action s k)
  (cond
    [(and (string=? LOCKED s) (string=? "u" k))
     CLOSED]
    [(and (string=? CLOSED s) (string=? " " k))
     OPEN]
    [(and (string=? CLOSED s) (string=? "l" k))
     LOCKED]
    [else s]))


; DoorState -> Image
; translates the state s into a large text image
(check-expect (door-render CLOSED)
              (text CLOSED 40 "red"))
(define (door-render s)
  (text s 40 "red"))  


; DoorState -> DoorState
; simulates a door with an automatic door closer
(define (door-simulation initial-state)
  (big-bang initial-state
    [on-tick door-closer 5]
    [on-key door-action]
    [to-draw door-render]))

(door-simulation LOCKED)