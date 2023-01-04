;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |174 - Unix-Command|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design a BSL program that simulates the UNIX command wc. The purpose of
;; the command is to count the number of 1Strings, words, and lines in a given file.
;; That is, the command consumes the name of a file and produces a value that consists
;; of three numbers. (Why might your computer’s wc give a slightly different result from your code?)

(define-struct unix [rows words char])
; A Unix is a Structure
; (make-unix Number Number Number)
; interpretation (make-unix r w c) is the line, words and 1String count.

(define text (cons
              (cons "Hello" (cons "World" '()))
              '()))

; File -> Unix
; consume a file and counts its rows, words and chars,
; simulate the unix command wc
(define (wc f)
  (unix-from-file (read-words/line f)))

; LLs -> Unix
; Counts rows, words and char from a given file content
(define (unix-from-file lls)
  (make-unix
   (rows lls)
   (words lls)
   (char lls)))

; rows
; LLs -> Number
; Computes how many lines are in a given text file
(check-expect (rows '()) 0)
(check-expect (rows text) 1)
(define (rows lls)
  (length lls))

; words
; LLs -> Number
; computes how many words a file content have
(check-expect (words '()) 0)
(check-expect (words text) 2)
(define (words lls)
  (cond
    [(empty? lls) 0]
    [else (+ (words-in-line (first lls)) (words (rest lls)))]))

; Los -> Number
; computes how many words a given Los have
(check-expect (words-in-line '()) 0)
(check-expect (words-in-line (cons "Hello" (cons "World" '()))) 2)
(define (words-in-line ls)
  (length ls))

; char
; LLs -> Number
; computes how many charecters a list of list of string have
(define (char lls)
  (cond
    [(empty? lls) 0]
    [else (+ (chars-in-line (first lls)) (char (rest lls)))]))

; Los -> Number
; computes how many characters a list of string have
(check-expect (chars-in-line (cons "Hello"
                                   (cons "World"
                                         (cons "the end" '()))))
              17)
(check-expect (chars-in-line '()) 0)
(define (chars-in-line ls)
  (cond
    [(empty? ls) 0]
    [else (+ (chars-in-word (first ls)) (chars-in-line (rest ls)))]))

; String -> Number
; Counts the chars from a string s
(check-expect (chars-in-word "Hello") 5)
(check-expect (chars-in-word "World") 5)
(define (chars-in-word s)
  (length (explode s)))


