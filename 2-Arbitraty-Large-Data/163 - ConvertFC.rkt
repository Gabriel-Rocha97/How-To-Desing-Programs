;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |163 - ConvertFC|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Design convertFC. The function converts a list of measurements in Fahrenheit to a list of Celsius measurements.

; List-of-Number -> List-of-Number
; Convert a list of Fahrenheit degress in Celsius
(check-expect (convertFC (cons 50 (cons 32 '()))) (cons 10 (cons 0 '())))
(define (convertFC fc)
  (cond
    [(empty? fc) '()]
    [else
     (cons (convert (first fc)) (convertFC (rest fc)))]))

; Number -> Number
; convert a Fahrenheit degree in Celsius
(check-expect (convert 32) 0)
(check-expect (convert 50) 10)
(define (convert fc)
  (* (- fc 32) 5/9))

      