;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |070 -Computing-Struct-Laws|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Demostrating laws for the following struct type definitions
(define-struct centry [name home office cell])

; (centry-name (make-centry n0 h0 o0 c0)) == n0

; (entry-home (make-centry n0 h0 o0 c0)) == h0

; (entry-office (make-centry n0 h0 o0 c0)) == o0

; (entry-cell (make-centry n0 h0 o0 c0)) == c0




(define-struct phone [area number])

; (phone-aera (make-phone a0 n0)) == a0

; (phone-number (make-phone a0 n0) == n0


; using stepper to evaluate the value of the expression
(= (phone-area
    (centry-office
     (make-centry "Shriram Fisler"
     (make-phone 207 "363-2421")
     (make-phone 101 "776-1099")
     (make-phone 208 "112-9981"))))
   101)




