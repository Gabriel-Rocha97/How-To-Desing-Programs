;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |184 - List-Values|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))


;; Determine the values of the following expressions:

; (list (string=? "a" "b") #false)

; (list (+ 10 20) (* 10 20) (/ 10 20))

; (list "dana" "jane" "mary" "laura")

;; Use check-expect to express your answers.

; (list (string=? "a" "b") #false)
(check-expect (list (string=? "a" "b") #false)
              (list #f #f))

; (list (+ 10 20) (* 10 20) (/ 10 20))
(check-expect (list (+ 10 20) (* 10 20) (/ 10 20))
              (list 30 200 0.5))

; (list "dana" "jane" "mary" "laura")
(check-expect (list "dana" "jane" "mary" "laura")
              '("dana" "jane" "mary" "laura"))