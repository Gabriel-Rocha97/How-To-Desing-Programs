;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |136 - More-Stepper|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Validate with DrRacket’s stepper

(define-struct pair [left right])
; A ConsPair is a structure:
;   (make-pair Any Any).

; A ConsOrEmpty is one of: 
; – '()
; – (make-pair Any ConsOrEmpty)
; interpretation ConsOrEmpty is the class of all lists

; Any Any -> ConsOrEmpty
(define (our-cons a-value a-list)
  (cond
    [(empty? a-list) (make-pair a-value a-list)]
    [(pair? a-list) (make-pair a-value a-list)]
    [else (error "cons: second argument ...")]))

; ConsOrEmpty -> Any
; extracts the right part of the given pair
(define (our-rest a-list)
  (if (empty? a-list)
      (error 'our-rest "...")
      (pair-right a-list)))

; ConsorEmpty -> Any
; extracts the left part of the given pair
(define (our-first a-list)
  (if (empty? a-list)
      (error 'our-first "...")
      (pair-left a-list)))

; using stepper
(string=? (our-first (our-cons "a" '())) "a")
(empty? (our-rest (our-cons "a" '()))) 
