;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |183 - List-Examples|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))


;; On some occasions lists are formed with cons and list.

;; Reformulate each of the following expressions using only cons or only list.
;; Use check-expect to check your answers.

; (cons "a" (list 0 #false))
(check-expect (cons "a" (list 0 #false))
              (list "a" 0 #false))

; (list (cons 1 (cons 13 '())))
(check-expect (list (cons 1 (cons 13 '()))) 
              (list (list 1 13)))

; (cons (list 1 (list 13 '())) '())
(check-expect (cons (list 1 (list 13 '())) '())
              (list (list 1 (list 13 '()))))

; (list '() '() (cons 1 '()))
(check-expect (list '() '() (cons 1 '()))
              (list '() '() (list 1)))

; (cons "a" (cons (list 1) (list #false '())))
(check-expect (cons "a"(cons (list 1) (list #false '())))
              (list "a" (list 1)  #false '()))