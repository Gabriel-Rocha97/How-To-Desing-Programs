;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |168 - Translate|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function translate. It consumes and produces lists of Posns.
;; For each (make-posn x y) in the former, the latter contains (make-posn x (+ y 1)).
;; We borrow the word “translate” from geometry, where the movement of a point
;; by a constant distance along a straight line is called a translation.

; A List-of-Posn is one of:
; - '()
; - (cons Posn List-of-Posn)


; List-of-Posn -> List-of-Posn
; create a Posn list with (+ posn-y 1) from every
; every item from given list lp.
(check-expect (translate '()) '())
(check-expect (translate
              (cons (make-posn 1 1) '()))
              (cons (make-posn 1 2) '()))
(check-expect (translate
               (cons (make-posn 1 1)
                     (cons (make-posn 1 2) '())))
              (cons (make-posn 1 2)
                    (cons (make-posn 1 3) '())))
(define (translate lp)
  (cond
    [(empty? lp) '()]
    [else
     (cons (make-posn (posn-x (first lp)) (add1 (posn-y (first lp))))
           (translate (rest lp)))]))

