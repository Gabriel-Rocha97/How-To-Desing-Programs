;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |177 - Create-Editor|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)


;; Design the function create-editor. The function consumes two strings and produces an Editor.
;; The first string is the text to the left of the cursor and the second string is the text to
;; the right of the cursor. The rest of the section relies on this function.


; String String -> Editor
; Consumes two strings and produces a editor.
(check-expect (create-editor "" "") (make-editor '() '()))
(check-expect (create-editor "Hello" "World")
              (make-editor
               (cons "o" (cons "l" (cons "l" (cons "e" (cons "H" '())))))
               (cons "W" (cons "o" (cons "r" (cons "l" (cons "d" '())))))))
(define (create-editor pre post)
  (make-editor
   (reverse (explode pre))
   (explode post)))







