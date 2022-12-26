;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |131 - List-of-Booleans|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Provide a data definition for representing lists of Boolean values.
; The class contains all arbitrarily long lists of Booleans.

; A List-of-Booleans is
; - '()
; - (cons Boolean List-of-Booleans)
; interpretation: arbitraty list of booleans values for
; compute in following data computation.

; ex:
(cons #t
      (cons #t
            (cons #f
                  (cons #t
                        (cons #f
                              (cons #f
                                    '()))))))
                  