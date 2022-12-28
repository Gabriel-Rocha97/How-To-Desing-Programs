;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |142 - ill-sized|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design the ill-sized? function, which consumes a list of images loi and a positive number n.
; It produces the first image on loi that is not an n by n square; if it cannot find such an image,
; it produces #false.

; List-of-Images is one of:
; - '()
; - (cons Image List-of-Image)

; ImageOrFalse is one of:
; – Image
; – #false

; List-of-Images Number -> ImageorFalse
; produces the first image on a list that is not an n by n square.
; if cannot, produce #false
(define REC10 (rectangle 10 10 "solid" "black"))
(define REC5 (rectangle 5 5 "solid" "black"))
(define REC525 (rectangle 5 25 "solid" "black"))
(check-expect (ill-sized?  '() 5)
              #false)
(check-expect (ill-sized? (cons REC10 '()) 10)
              #false)
(check-expect (ill-sized? (cons REC5
                                (cons REC525 '())) 5)
              REC525)
(check-expect (ill-sized? (cons REC10
                                (cons REC5
                                      (cons REC525 '()))) 10)
              REC5)
(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [else
     (cond
       [(and (image? (first loi))
             (not (same-pixels? (first loi) n)))
        (first loi)]
       [else (ill-sized? (rest loi) n)])]))
       

; Image Number -> Boolean
; determinate if a image m has the same pixels of a n by n square.
(define (same-pixels? im n)
  (=
   (* (image-width im) (image-height im))
   (* n n)))