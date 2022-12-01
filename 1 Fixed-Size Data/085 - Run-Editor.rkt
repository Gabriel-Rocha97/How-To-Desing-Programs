;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |085 - Run-Editor|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


;; Define the function run. Given the pre field of an editor, it launches an
;; interactive editor, using render and edit from the preceding two exercises
;; for the to-draw and on-key clauses, respectively. 

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
(define sentence (make-editor "hello" "world"))


(define cursor (rectangle 1 20 "solid" "red"))
(define scene (empty-scene 200 20))


; Editor -> Image
; place the r text in the scene
(check-expect (render-editor sentence) (overlay/align "left"
                                                      "center"
                                                      (draw-text sentence)
                                                      scene))
(define (render-editor e)
  (overlay/align "left"
                 "center"
                 (draw-text e)
                 scene))

; Editor -> Image
; drawn the text with cursor
(define (draw-text t)
  (beside/align
   "bottom"
   (text (editor-pre t) 16 "black")
   cursor
   (text (editor-post t) 16 "black")))

; Editor KeyEvent -> Editor
(check-expect (edit (make-editor "hello" "") "w") (make-editor "hellow" ""))
(check-expect (edit (make-editor "" "world") "h") (make-editor "h" "world"))
(check-expect (edit (make-editor "hell" "world") "o") (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "left") (make-editor "hell" "oworld"))
(check-expect (edit (make-editor "hello" "world") "right") (make-editor "hellow" "orld"))
(check-expect (edit (make-editor "hello" "world") "\b") (make-editor "hell" "world"))
(check-expect (edit (make-editor "hello" "world") "\t") (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "\r") (make-editor "hello" "world"))
(define (edit e ke)
  (cond
    [(string=? "left" ke) (cursor-left e)]
    [(string=? "right" ke) (cursor-right e)]
    [(string=? "\b" ke) (remove-letter e)]
    [(string=? "\r" ke) e]
    [(string=? "\t" ke) e]
    [(= (string-length ke) 1) (add-letter e ke)]
    [else e]))


; add-letter
; Editor KeyEvent -> Editor
; adds a l letter in the end of pre
(check-expect (add-letter (make-editor "Hello" "World") "p")
                          (make-editor "Hellop" "World"))
(define (add-letter e l)
  (make-editor
   ;pre
   (string-append (editor-pre e) l)
   ;post
   (editor-post e)))

; remove-letter
; Editor -> Editor
; remove the last letter of pre
(check-expect (remove-letter (make-editor "Hello" "world"))
                             (make-editor "Hell" "world"))
(define (remove-letter e)
  (make-editor
   ;pre
   (string-remove-last (editor-pre e))
   ;post
   (editor-post e)))
   

; cursor-left
; Editor -> Editor
; moves the cursor left, adding the last letter of pre
; in the begin of post
(check-expect (cursor-left (make-editor "Hello" "World"))
                           (make-editor "Hell" "oWorld"))
(define (cursor-left e)
  (make-editor
   ;pre
   (string-remove-last (editor-pre e))
   ;post
   (string-append (string-last (editor-pre e)) (editor-post e))))

; cursor-right
; Editor -> Editor
; moves the cursor right, adding the first letter of post
; in the end of pre
(check-expect (cursor-right (make-editor "Hello" "world"))
                            (make-editor "Hellow" "orld"))
(define (cursor-right e)
  (make-editor
   ;pre
   (string-append (editor-pre e) (string-first (editor-post e)))
   ;post
   (string-rest (editor-post e))))


; Editor -> Editor
; launchs a interative text editor
(define (run e)
  (big-bang e
    [on-key edit]
    [to-draw render-editor]))




; Axiliares substrings functions

;String -> String
; Give s without the first letter
(check-expect (string-rest "hello") "ello")
(check-expect (string-rest "o") "")
(define (string-rest s)
  (if (> (string-length s) 0) (substring s 1) s))


;String -> 1String
; Remove the first letter of s
(check-expect (string-first "hello") "h")
(check-expect (string-first "o") "o")
(define (string-first s)
  (if (> (string-length s) 1) (substring s 0 1) s))


; String -> String
; Give s without the last letter
(check-expect (string-remove-last "hello") "hell")
(check-expect (string-remove-last "o") "")
(define (string-remove-last s)
  (if (> (string-length s) 0) (substring s 0 (- (string-length s) 1)) s))


; String -> 1String
; Remove the last letter of s
(check-expect (string-last "hello") "o")
(check-expect (string-last "") "")
(define (string-last s)
  (if (> (string-length s) 1)(substring s (- (string-length s) 1)) s))


  