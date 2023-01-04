;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |170 - Repleace|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

;; Here is one way to represent a phone number:

(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999. 

;; Design the function replace. It consumes and produces a list of Phones.
;; It replaces all occurrence of area code 713 with 281.

; Lop (short for List-of-Phones) is one of:
; - '()
; - (cons Phone Lop)

; Lop -> Lop
; Produce a new Lop from a given list lp, but with area code 713 repleace
; by 281
(check-expect (replace '()) '())
(check-expect (replace (cons (make-phone 713 569 4545) '()))
              (cons (make-phone 281 569 4545) '()))
(check-expect (replace (cons (make-phone 555 012 1614) '()))
              (cons (make-phone 555 012 1614) '()))
(define (replace lp)
  (cond
    [(empty? lp) '()]
    [else
     (cons (make-phone
            (replace-area (phone-area (first lp)))
            (phone-switch (first lp))
            (phone-four (first lp)))
           (replace (rest lp)))]))

; Three -> Three
; if the code area is 713, its repleaced by 281
(define (replace-area n)
  (cond
    [(= n 713) 281]
    [else n]))