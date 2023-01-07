;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |179 - Editor-kh-Auxiliary-Functions|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))


(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)

; world constants
(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

; String String -> Editor
; Consumes two strings and produces an Editor. The first string is the text
; to the left of the cursor and the second string is the text to the right of the cursor.
(define (create-editor pre post)
  (make-editor
   (reverse (explode pre))
   (explode post)))

; main : String -> Editor
; launches the editor given some initial string 
(define (main s)
   (big-bang (create-editor s "")
     [on-key editor-kh]
     [to-draw editor-render]))

; Editor -> Image
; renders an editor as an image of the two texts 
; separated by the cursor 
(define (editor-render e) MT)


; Editor KeyEvent -> Editor
; deals with a key event, given some editor
(check-expect (editor-kh (create-editor "" "") "e")
              (create-editor "e" ""))
(check-expect
  (editor-kh (create-editor "cd" "fgh") "e")
  (create-editor "cde" "fgh"))
(check-expect
 (editor-kh (create-editor "cd" "fgh") "left")
 (create-editor "c" "dfgh"))
(check-expect
 (editor-kh (create-editor "cd" "fhg") "right")
 (create-editor "cdf" "hg"))
(check-expect
 (editor-kh (create-editor "cd" "fhg") "\b")
 (create-editor "c" "fhg"))

(define (editor-kh ed k)
  (cond
    [(key=? k "left") (editor-lft ed)]
    [(key=? k "right") (editor-rgt ed)]
    [(key=? k "\b") (editor-del ed)]
    [(key=? k "\t") ed]
    [(key=? k "\r") ed]
    [(= (string-length k) 1) (editor-ins ed k)]
    [else ed]))

; add key
; Editor 1String -> Editor
; insert the 1String k between pre and post
(check-expect
  (editor-ins (make-editor '() '()) "e")
  (make-editor (cons "e" '()) '()))
 
(check-expect
  (editor-ins
    (make-editor (cons "d" '())
                 (cons "f" (cons "g" '())))
    "e")
  (make-editor (cons "e" (cons "d" '()))
               (cons "f" (cons "g" '()))))

(define (editor-ins ed k)
  (make-editor (cons k (editor-pre ed))
               (editor-post ed)))

;; Exercise 179. Design the functions

; left key
; Editor -> Editor
; moves the cursor position one 1String left, 
; if possible

(check-expect
 (editor-lft
  (make-editor (cons "h" (cons "i" '()))
               '()))
  (make-editor (cons "i" '())
               (cons "h" '())))

(check-expect
 (editor-lft
  (make-editor '()
               (cons "h" (cons "i" '()))))
 (make-editor '() (cons "h" (cons "i" '()))))

(define (editor-lft ed)
  (cond
    [(empty? (editor-pre ed)) ed]
    [else (make-editor
           (rest (editor-pre ed))
           (list* (first (editor-pre ed)) (editor-post ed)))]))

; right key
; Editor -> Editor
; moves the cursor position one 1String right, 
; if possible

(check-expect
 (editor-rgt
  (make-editor '() (cons "h" (cons "i" '()))))
 (make-editor (cons "h" '())
              (cons "i" '())))
(check-expect
 (editor-rgt
  (make-editor (cons "i" (cons "h" '())) '()))
 (make-editor (cons "i" (cons "h" '())) '()))

(define (editor-rgt ed)
  (cond
    [(empty? (editor-post ed)) ed]
    [else (make-editor
           (list* (first (editor-post ed)) (editor-pre ed))
           (rest (editor-post ed)))]))

; del key
; Editor -> Editor
; deletes a 1String to the left of the cursor,
; if possible

(check-expect
 (editor-del
  (make-editor (cons "i" (cons "h" '())) '()))
  (make-editor (cons "h" '()) '()))

(check-expect
 (editor-del
  (make-editor '() (cons "h" (cons "i" '()))))
 (make-editor '() (cons "h" (cons "i" '()))))
 
(define (editor-del ed)
  (cond
    [(empty? (editor-pre ed)) ed]
    [else (make-editor (rest (editor-pre ed))
                       (editor-post ed))]))








