;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |173 - Remove-Article|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design a program that removes all articles from a text file. The program consumes
;; the name n of a file, reads the file, removes the articles, and writes the result
;; out to a file whose name is the result of concatenating "no-articles-" with n.
;; For this exercise, an article is one of the following three words: "a", "an", and "the".

;; Use read-words/line so that the transformation retains the organization of the original text
;; into lines and words. When the program is designed, run it on the Piet Hein poem.

; File -> List-of-List-of-String
(define (remove-articles n)
  (read-file(write-file (string-append "no-articles-" n)
              (collapse(read-words/line n)))))


; Lis - > String
; Converts a list-of-lines into a single string with the contents
(define (collapse lls)
  (cond
    [(empty? lls) ""]
    [else (string-append (take-articles (first lls)) "\n" (collapse (rest lls)))]))

; Los -> String
; Converts a list-of-string in a single text line without the articles
; "a", "an" and "the".
(check-expect (take-articles (cons "a" (cons "hello" '()))) "hello")
(check-expect (take-articles (cons "a"
                                   (cons "Hello"
                                         (cons "to"
                                               (cons "the"
                                                     (cons "World" '()))))))
              "Hello to World")
(define (take-articles ls)
  (cond
    [(empty? ls) ""]
    [(or (string=? "a" (first ls))
         (string=? "an" (first ls))
         (string=? "the" (first ls)))
     (string-append "" (take-articles (rest ls)))]
    [else (string-append (first ls)
                         (if (= (length ls) 1) "" " ")
                         (take-articles (rest ls)))]))

