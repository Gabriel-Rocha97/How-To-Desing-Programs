;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |153 - Attack-Balloons|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; The goal of this exercise is to visualize the result of a 1968-style
;; European student riot. Here is the rough idea. A small group of
;; students meets to make paint-filled balloons, enters some lecture hall,
;; and randomly throws the balloons at the attendees. Your program displays
;; how the balloons color the seats in the lecture hall.

;; Use the two functions from exercise 152 to create a rectangle of COLUMNS
;; by ROWS squares, each of which has size 10 by 10. Place it in an empty-scene
;; of the same size. This image is your lecture hall.

;; Design add-balloons. The function consumes a list of Posn whose coordinates
;; fit into the dimensions of the lecture hall. It produces an image of the lecture
;; hall with red dots added as specified by the Posns.

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

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


(define SQUARE (rectangle 10 10 "outline" "black"))
(define DOT (circle 3 "solid" "red"))
(define COLUMNS 10)
(define ROWS 20)
(define SCENE (overlay (row ROWS (col COLUMNS SQUARE))
                       (empty-scene 100 100)))


; A List-of-pons is one of:
; - '()
; - (cons Pons List-of-posn)

; List-of-posn -> Image
; Produce a image of red dots added as specifies Posn coordinates
(check-expect (add-balloons (cons (make-posn 10 20) '()))
              (place-image DOT 10 20 SCENE))
(check-expect(add-balloons (cons (make-posn 10 20)
                                 (cons (make-posn 20 30) '())))
             (place-image DOT 10 20
              (place-image DOT 20 30 SCENE)))
(define (add-balloons l-posn)
  (cond
    [(empty? l-posn) SCENE]
    [else
     (place-image
      DOT
      (posn-x (first l-posn))
      (posn-y (first l-posn))
      (add-balloons (rest l-posn)))]))


                  




