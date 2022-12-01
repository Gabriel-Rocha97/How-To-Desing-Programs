;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |083 - Render-Editor|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))



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
(define (render-editor r)
  (overlay/align "left"
                 "center"
                 (draw-text r)
                 scene))

; Editor -> Image
; drawn the text with cursor
(define (draw-text r)
  (beside/align
   "bottom"
   (text (editor-pre r) 16 "black")
   cursor
   (text (editor-post r) 16 "black")))
  