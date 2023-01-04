;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |167 - Sum-X-Posn|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the function sum, which consumes a list of Posns and produces the sum of all of its x-coordinates.

; A Lop (short for List-of-Posn) is one of;
; - '()
; - (cons Posn Lop)

;Lop -> Sum
; produce a list of posn x-coordiantes sum from a Lop
(check-expect (sum '()) 0)
(check-expect (sum (cons (make-posn 5 3) '())) 5)
(check-expect (sum (cons (make-posn 5 3)
                         (cons (make-posn 10 2) '())))
              15)
(define (sum a-lp)
  (cond
    [(empty? a-lp) 0]
    [(posn? (first a-lp))
     (+ (posn-x (first a-lp)) (sum (rest a-lp)))]))
