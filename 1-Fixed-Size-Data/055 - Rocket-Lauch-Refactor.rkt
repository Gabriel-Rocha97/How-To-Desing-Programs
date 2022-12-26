;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |055 - Rocket-Lauch-Refactor|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; An LRCD (for launching rocket countdown) is one of:
; – "resting"
; – a Number between -3 and -1
; – a NonnegativeNumber 
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)


(define HEIGHT 300) ; distances in pixels 
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))
(define X-ROCKET 30)




; LRCD -> Image
; renders the state as a resting or flying rocket
; there is a test per subclass
(check-expect
 (show "resting")
 (place-image ROCKET X-ROCKET (- HEIGHT CENTER) BACKG))
 
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET
                           X-ROCKET (- HEIGHT CENTER) BACKG)))
(check-expect
 (show HEIGHT)
 (place-image ROCKET X-ROCKET (- HEIGHT CENTER) BACKG))
(check-expect
 (show 53)
 (place-image ROCKET X-ROCKET (- 53 CENTER) BACKG))

(define (show x)
  (cond
    ; verify x belongs the first subclass by
    ; only evaluates the expression "resting"
    ; others strings are not important.
    [(and (string? x) (string=? x "resting")) 
     (draw-rocket x)]
    [(<= -3 x -1)
     (place-image
      (text (number->string x) 20 "red")
      10 (* 3/4 WIDTH)
      (draw-rocket x))]
    [(>= x 0)
     (draw-rocket x)]))

; LCDR -> Image
; render the rocket resting or flying
(check-expect (draw-rocket "resting")
              (place-image ROCKET
                           X-ROCKET (- HEIGHT CENTER)
                           BACKG))

(check-expect(draw-rocket -2)
             (place-image ROCKET
                          X-ROCKET (- HEIGHT CENTER)
                          BACKG))

(check-expect(draw-rocket 50)
             (place-image ROCKET
                          X-ROCKET (- 50 CENTER)
                          BACKG))
(define (draw-rocket x)
  (cond
    [(and (string? x) (string=? x "resting"))
    (place-image ROCKET X-ROCKET (- HEIGHT CENTER) BACKG)]
    [(<= -3 x -1)
     (place-image ROCKET X-ROCKET (- HEIGHT CENTER) BACKG)]
    [(>= x 0)
     (place-image ROCKET X-ROCKET (- x CENTER) BACKG)]))
    
             
; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
(define (launch x ke)
  x)
 
; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already 
(define (fly x)
  x)