;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |133 - Contains-Name|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


; Develop the contains? function, which determines whether some given string occurs on a given list of strings.

; A List-of-names is one of: 
; – '()
; – (cons String List-of-names)
; interpretation a list of invitees, by last name

; String List-of-names -> Boolean
; determines whether any given name occurs on alon
(check-expect
  (contains? "Flatt" (cons "X" (cons "Y"  (cons "Z" '()))))
  #false)
(check-expect
  (contains? "Billy" (cons "A" (cons "Flatt" (cons "C" '()))))
  #false)
(check-expect
 (contains? "Carter" (cons "Flatt" (cons "Carter" (cons "Miller" '()))))
 #true)
(define (contains? name alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? (first alon) name)
         (contains? name (rest alon)))]))

(define friends-list
  (cons "Fagan"
   (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))

(contains? "Carter" friends-list)