;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |169 - Legal|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function legal. Like translate from exercise 168, the function consumes and produces a list of Posns.
;; The result contains all those Posns whose x-coordinates are between 0 and 100 and whose y-coordinates are between
;; 0 and 200.

; Lop -> Lop
; Creates a list of posn from a given Lop where:
; - x-coordenate is between [0, 100]
; - y-coordeante is between [0, 200]
(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn -1 10) '())) '())
(check-expect (legal (cons (make-posn 0 200)
                           (cons (make-posn 100 0) '())))
              (cons (make-posn 0 200)
                    (cons (make-posn 100 0) '())))
(define (legal lp)
  (cond
    [(empty? lp) '()]
    [(and (x-range? (first lp))
          (y-range? (first lp)))
     (cons (first lp) (legal (rest lp)))]
    [else (rest lp)]))

; Pons -> Boolean
; Checks if x-coordenate p belongs to the interval [0, 100]
(define (x-range? p)
  (and (<= 0 (posn-x p))
       (>= 100 (posn-x p))))

; Posn -> Boolean
; Checks if y-coordenate p belongs to the interval [0, 200]
(define (y-range? p)
  (and (<= 0 (posn-y p))
       (>= 200 (posn-y p))))