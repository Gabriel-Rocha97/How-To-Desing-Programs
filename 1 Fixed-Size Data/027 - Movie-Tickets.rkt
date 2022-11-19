;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |027 - Movie-Tickets|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define average-ticket 5)
(define average-attend 120)
(define ticket-charge 0.1)
(define performance-coast 180)
(define attendee-coast 0.04)

(define (attendess ticket-price)
  (- average-attend (* (- ticket-price average-ticket) (/ 15 ticket-charge))))

(define (revenue ticket-price)
  (* ticket-price (attendess ticket-price)))

(define (cost ticket-price)
  (+ performance-coast (* attendee-coast (attendess ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
