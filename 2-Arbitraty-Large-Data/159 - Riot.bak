;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |159 - Riot|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Turn the solution of exercise 153 into a world program. Its main function,
;; dubbed riot, consumes how many balloons the students want to throw its
;; visualization shows one balloon dropping after another at a rate of one per second.
;; The function produces the list of Posns where the balloons hit.

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; A List-of-pons is one of:
; - '()
; - (cons Pons List-of-posn)

(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; (make-pair n lob) means n balloons must yet be
; thrown and added to lob

;constans
(define SQUARE (square 10 "outline" "black"))
(define DOT (circle 3 "solid" "red"))
(define COLUMNS 10)
(define ROWS 20)

; N Image -> Image
; computes a row of n copies of im
(define (row n im)
  (cond
    [(<= n 1) im]
    [else (above im (row (sub1 n) im))]))

; N Image -> Image
; computes a column of n copies of im
(define (col n im)
   (cond
    [(<= n 1) im]
    [else (beside im (col (sub1 n) im))]))

; creating the lecture hall
(define LECTURE-HALL (overlay (row ROWS (col COLUMNS SQUARE))(empty-scene 100 200)))
(define LECTURE-HEIGHT (image-height LECTURE-HALL))
(define LECTURE-WIDTH (image-width LECTURE-HALL))

; N -> Pair
; lauch the world program
(define (riot p)
  (main (make-pair p '())))

; Pair -> Pair
; lauching the world of a lecture riot
(define (main p)
  (big-bang p
    [to-draw render]
    [on-tick tock 1]))
  

; Pair -> Image
; Produce the world image
(define (render p)
  (add-balloons (pair-lob p)))

; List-of-posn -> Image
; Produce a image of a lecture hall with red dots added as specifies by l-posn
(check-expect (add-balloons (cons (make-posn 10 20) '()))
              (place-image DOT 10 20 LECTURE-HALL))
(check-expect(add-balloons (cons (make-posn 10 20)
                                 (cons (make-posn 20 30) '())))
             (place-image DOT 10 20
              (place-image DOT 20 30 LECTURE-HALL)))
(define (add-balloons l-posn)
  (cond
    [(empty? l-posn) LECTURE-HALL]
    [else
     (place-image
      DOT
      (posn-x (first l-posn))
      (posn-y (first l-posn))
      (add-balloons (rest l-posn)))]))

; Pair -> Pair
; Adds a Ballon to the list of posn on every clock tick
(check-expect (tock (make-pair 0 '())) (make-pair 0 '()))
(check-expect (tock (make-pair 0 (cons (make-posn 5 10) '())))
              (make-pair 0 (cons (make-posn 5 10) '())))
(check-random (tock (make-pair 1 '()))
              (make-pair 0 (cons (make-posn (random LECTURE-WIDTH)
                                            (random LECTURE-HEIGHT))
                                 '())))
(check-random (tock (make-pair 1 (cons (make-posn 5 10) '())))
              (make-pair 0 (cons (make-posn (random LECTURE-WIDTH)
                                            (random LECTURE-HEIGHT))
                                 (cons (make-posn 5 10) '()))))
(define (tock p)
  (cond
    [(zero? (pair-balloon# p)) p]
    [else
     (make-pair
      (sub1 (pair-balloon# p))
      (cons (make-posn (random LECTURE-WIDTH) (random LECTURE-HEIGHT)) (pair-lob p)))]))
                       


