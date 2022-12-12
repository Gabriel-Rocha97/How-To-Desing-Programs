;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |087 - Editor-New-Definitions|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Now editor is representend by a string
; and a numeric index, indicate the cursor position

(define-struct editor [text position])
; An Editor is a structure:
;   (make-editor String number)
; interpretation (make-editor t n) describes an editor
; whose visible text t with the cursor displayed at the
; index p between the string
(define ex (make-editor "helloworld" 5))

; constants
(define cursor (rectangle 1 20 "solid" "red"))
(define scene (empty-scene 200 20))

; Editor -> Image
; place the r text in the scene
(define (render-editor e)
  (overlay/align "left"
                 "center"
                 (draw-text e)
                 scene))

; Editor -> Image
; drawn the text with cursor
(define (draw-text e)
  (beside/align
   "bottom"
   (text (substring (editor-text e) 0 (editor-position e)) 16 "black")
   cursor
   (text (substring (editor-text e) (editor-position e)) 16 "black")))


; Editor KeyEvent -> Editor
(check-expect (edit (make-editor "hello" 5) "w") (make-editor "hellow" 6))
(check-expect (edit (make-editor "helloworld" 5) " ") (make-editor "hello world" 6)) 
(check-expect (edit (make-editor "hello" 5) "left") (make-editor "hello" 4))
(check-expect (edit (make-editor "hello" 4) "right") (make-editor "hello" 5))
(check-expect (edit (make-editor "hello" 5) "\t") (make-editor "hello" 5))
(check-expect (edit (make-editor "hello" 5) "\r") (make-editor "hello" 5))
(check-expect (edit (make-editor "hello" 5) "\b") (make-editor "hell" 4))
(define (edit e ke)
  (cond
    [(string=? "left" ke) (cursor-left e)]
    [(string=? "right" ke) (cursor-right e)]
    [(string=? "\b" ke) (remove-letter e)]
    [(string=? "\r" ke) e]
    [(string=? "\t" ke) e]
    [(= (string-length ke) 1)
     (if (< (image-width (draw-text (add-letter e ke))) (image-width scene))
         (add-letter e ke)
         e)]
    [else e]))

; wish list
; cursor-left
; cursor-right

; add-letter
; Editor char -> Editor
; adds char to the cursor
(check-expect (add-letter (make-editor "helloworld" 5) " ")
                          (make-editor "hello world" 6))
(define (add-letter e char)
  (make-editor
   (string-append
    (substring (editor-text e) 0 (editor-position e))
    char
    (substring (editor-text e) (editor-position e)))
   (+ (editor-position e) 1)))


; remove-letter
; Editor -> Editor
; remove char end of pre
(check-expect (remove-letter (make-editor "helloworld" 5))
                             (make-editor "hellworld" 4))
(define (remove-letter e)
  (if (<= (editor-position e) 0)
      (make-editor (editor-text e) (editor-position e))
      (make-editor
       (string-append
        (substring (editor-text e) 0 (- (editor-position e) 1))
        (substring (editor-text e) (editor-position e)))
       (- (editor-position e) 1))))

; cursor-left
; Editor -> Editor
; moves the cursor left, adding the cursor char at the beginning of post
(check-expect (cursor-left (make-editor "hello" 5)) (make-editor "hello" 4))
(check-expect (cursor-left (make-editor "hello" 0)) (make-editor "hello" 0))
(define (cursor-left e)
  (make-editor
   (editor-text e)
   (if (<= (editor-position e) 0)
       0
       (- (editor-position e) 1))))

; cursor-right
; Editor -> Editor
; moves the cursor right, adding the cursor char at the end of pre
(check-expect (cursor-right (make-editor "hello" 3)) (make-editor "hello" 4))
(check-expect (cursor-right (make-editor "hello" 0)) (make-editor "hello" 1))
(define (cursor-right e)
  (make-editor
   (editor-text e)
   (if (= (editor-position e) (string-length (editor-text e)))
       (editor-position e)
       (+ (editor-position e) 1))))


; Editor -> Editor
; launchs a interative text editor
(define (run e)
  (big-bang e
    [on-key edit]
    [to-draw render-editor]))


(define TEST (make-editor "helloworld" 5))

(run TEST)

   

