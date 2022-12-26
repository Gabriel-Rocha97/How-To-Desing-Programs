;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |065 - Constructors-Selectors-Predicates|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))




; Write down the names of the functions (constructors, selectors, and predicates) that each introduces

(define-struct movie [title producer year])

; constructor
(define m (make-movie "The Matrix" "Warner Bros" 1999))

; selectors
(movie-title m)
(movie-producer m)
(movie-year m)

;predicate
(movie? m)

;______________________________________________________

(define-struct person [name hair eyes phone])

; constructor
(define p (make-person "Gabriel" "Brown" "Blue" "99-5784-1245"))

;selectors
(person-name p)
(person-hair p)
(person-eyes p)
(person-phone p)

;predicate
(person? m)

;______________________________________________________

(define-struct pet [name number])

;constructor
(define Cat (make-pet "Bob" "99-2345-1245"))

;selectors
(pet-name Cat)
(pet-number Cat)

;predicate
(pet? Cat)

;____________________________________________________

(define-struct CD [artist title price])

;constructor
(define cd1 (make-CD "Interpol" "Evil" "1.19"))

;selectors
(CD-artist cd1)
(CD-title cd1)
(CD-price cd1)

;predicate
(CD? cd1)

;____________________________________________________

(define-struct sweater [material size producer])

;constructor
(define s (make-sweater "Cotton" "medium" "Nike"))

;selectors
(sweater-material s)
(sweater-size s)
(sweater-producer s)

;predicate
(sweater? s)
            

