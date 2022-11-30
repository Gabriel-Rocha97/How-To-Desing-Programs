;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |082 - Compare-Word|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; A Letter is one of
; - A String of lenght 1
; - #false
; i.e #false when different from letter of another word
; in the same position
; ex: "#false
; ex: "a"


; Words is a string made of three Letters
(define-struct word [first middle last])
;ex: (define MAC (make-word "m" "a" "c")
;ex: (define No (make-word #f #f #f)


; Word Word -> Word
; produces a word that indicates where the given ones agree and disagree. If the
; letters agree, the letter is kept. otherwise it is #f in that field.
(check-expect (compare-word
               (make-word "c" "a" "t")
               (make-word "c" "a" "t"))
               (make-word "c" "a" "t"))
(check-expect (compare-word
               (make-word "c" "a" "t")
               (make-word "c" "a" "p"))
               (make-word "c" "a" #f))
(check-expect (compare-word
               (make-word #f #f #f)
               (make-word #f #f #f))
               (make-word #f #f #f))
(define (compare-word w1 w2)
  (make-word
   (cond [(equal? (word-first w1) (word-first w2)) (word-first w1)]
         [else #f])
   (cond [(equal? (word-middle w1) (word-middle w2)) (word-middle w1)]
         [else #f])
   (cond [(equal? (word-last w1) (word-last w2)) (word-last w1)]
         [else #f])))


