;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |103 - Zoo-Animals|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Develop a data representation for the following four kinds of zoo animals:

; Design the fits? function, which consumes a zoo animal and a description of a cage.
; It determines whether the cage’s volume is large enough for the animal.


; A Zanimal represent a animal on a zoo
; The Zanimal are:
(define-struct spider [legs space])
; Spiders is (make-spider Number Number)
; (make-spiders l s) represeent a spider with l legs remaning
; and s space for cage
(define-struct elephant [space weight])
; Elephants is (make-elehphant Number Number)
; (make-elephant s w) represent the s elephant space required
; for cage the elephant and its w weight. 
(define-struct armadilo [space species])
; Armadilho is (make-armadilo Number String)
; (make-armadilho s n) represent a armadilo s space for cage
; and its n species


(define-struct cage [width depth heigth])
; A Cage is (make-cage Number Number Number)
; interpretation (make-cage x y z) is the cage measurements.
; x is the width, y the depth and z the height.

;fits?
; Zanimal Cage -> Boolean
; determinate if cage volume is large enought for the a animal
(check-expect (fits? (make-spider 5 30)
                     (make-cage 2 3 5))
              #true)
(check-expect (fits? (make-elephant 100 20)
                     (make-cage 2 3 5))
              #false)
(define (fits? z c)
    (<= (get-space z) (volume c)))

; Zanimal -> Number
; extracs the space from a given animal a
(check-expect (get-space (make-spider 6 30)) 30)
(check-expect (get-space (make-elephant 100 30)) 100)
(check-expect (get-space (make-armadilo 20 "Pichi")) 20)
(define (get-space a)
  (cond
    [(spider? a) (spider-space a)]
    [(elephant? a) (elephant-space a)]
    [(armadilo? a) (armadilo-space a)]))

; Cage -> String
; measure the volume of the given cage c
(check-expect (volume (make-cage 2 3 5)) 30)
(define (volume c)
  (* (cage-width c)
     (cage-depth c)
     (cage-heigth c)))



