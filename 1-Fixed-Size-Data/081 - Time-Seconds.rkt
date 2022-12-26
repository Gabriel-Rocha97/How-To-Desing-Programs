;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |081 - Time-Seconds|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))



; A Time is (make-time Number Number Number)
(define-struct time [hours minutes seconds])
; Interpretation point in time after midnight
; - hours: number of point hours passed midnight  [0-23]
; - minutes: number minutes passed in a hour      [0-59]
; - seconds: number of seconds passed in a minute [0-59]

; Clock -> Number
; produces the number os seconds that have passed since midnight
(check-expect (time->seconds (make-time 12 30 2)) 45002)
(define (time->seconds t)
  (+
   (* 60 60(time-hours t))
   (* 60 (time-minutes t))
   (time-seconds t)))

