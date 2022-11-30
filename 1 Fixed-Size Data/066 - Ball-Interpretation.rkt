;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |066 - Ball-Interpretation|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")
; represents a ball boucing at 10 px from the top of the canvas
; at a fixed rate of SPEED pixels per clock
(make-balld 5 "down")

; depeding on the direction interpretation
; we can make the function ignore the direction command stop the
; rate movement
(make-balld 10 "stop")

; we can also change the direction values by using a keyEvent handler
; altering the pixels rate at the x-coordenate ball moviment
(make-balld 10 "left")

