;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |172 - Collapse-List-of-Words|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Design the function collapse, which converts a list of lines into a string.
;; The strings should be separated by blank spaces (" "). The lines should be
;; separated with a newline ("\n").

;; Challenge When you are finished, use the program like this:

;; (write-file "ttt.dat"
;;             (collapse (read-words/line "ttt.txt")))

;; To make sure the two files "ttt.dat" and "ttt.txt" are identical, remove all
;; extraneous white spaces in your version of the T.T.T. poem. 

; Los
; A List-of-String is one of:
; - '()
; (cons String Los)

; Lis
; A List-of-List-of-String is one of:
; - '()
; (cons Los Lis)
; intepretation a list of lines, each is a list of Strings


; Lis - > String
; Converts a list of lines into a single string with the contents      
(define (collapse lls)
  (cond
    [(empty? lls) ""]
    [else (string-append (line (first lls)) "\n" (collapse (rest lls)))]))

; Los -> String
; Converts a list of string in a single text line
(check-expect (line (cons "Hello" (cons "World" '())))
              "Hello World")
(check-expect (line '()) "")
(define (line ls)
  (cond
    [(empty? ls) ""]
    [else (string-append (first ls)
                         (if (= (length ls) 1) "" " ")
                         (line(rest ls)))]))
