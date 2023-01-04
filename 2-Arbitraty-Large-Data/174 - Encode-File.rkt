;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Test) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; File -> List-of-List-of-String
(define (encode-file f)
  (read-file (write-file (string-append "Enconde-" f)
                         (collapse (read-words/line f)))))

; Lis - > String
; Converts a list-of-lines into a single string with the contents encoded
(define (collapse lls)
  (cond
    [(empty? lls) ""]
    [else (string-append (explode-word (first lls)) "\n" (collapse (rest lls)))]))

; Los -> String
; Converts a list-of-strings into a string with each letter on a word tranformed in a
; 3-letter numeric String
(define (explode-word ls)
  (cond
    [(empty? ls) ""]
    [else (string-append (encode-word (explode (first ls)))
                         (if (< (length (rest ls)) 1)
                             ""
                             " ")
                         (explode-word (rest ls)))]))

; List-of-Char -> String
; Converts a list-of-chars into 3-letter number string
(define (encode-word lc)
  (cond
    [(empty? lc) ""]
    [else (string-append (encode-letter (first lc))
                         (if (< (length (rest lc)) 1)
                             ""
                             "-")
                         (encode-word (rest lc)))]))

; 1String -> String
; converts the given 1String to a 3-letter numeric String
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t")
              (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a")
              (string-append "0" (code1 "a")))
(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))
 
; 1String -> String
; converts the given 1String into a String
(check-expect (code1 "z") "122")
(define (code1 c)
  (number->string (string->int c)))