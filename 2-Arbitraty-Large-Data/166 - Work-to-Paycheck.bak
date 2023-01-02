;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |166 - Work-to-Paycheck|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))


(define-struct work [employee rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h

; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees

; Work -> Number
; computes the wage for the given work record w
(define (wage.v2 w)
  (* (work-rate w) (work-hours w)))

;; The wage*.v2 function consumes a list of work records and produces a list of numbers. Of course, functions may also produce lists of structures.

;; Develop a data representation for paychecks. Assume that a paycheck contains two distinctive pieces of information: the employee’s name and an amount.
;; Then design the function wage*.v3. It consumes a list of work records and computes a list of paychecks from it, one per record.

(define-struct paycheck [name amount])
; A (piece of) Paycheck is a structure:
;   (make-paycheck String Number)
; interpretation (make-paycheck n m) combines
; a employee's n name and his wage hours amount.

; Lop (short for list of paycheck) is one of:
; - '()
; - (cons Paycheck Lop)
; interpretation an instance of Lop represent the
; record of a employee weekly amount.

; Low -> Lop
; produce a paycheck from a list-of-work
(check-expect (wage*.v3 '()) '())
(check-expect (wage*.v3
               (cons (make-work "Robby" 11.95 39) '()))
              (cons (make-paycheck "Robby" (* 11.95 39)) '()))
(define (wage*.v3 w)
  (cond
    [(empty? w) '()]
    [else
     (cons
      (make-paycheck (work-employee (first w))(wage.v2 (first w)))
      (wage*.v3 (rest w)))]))

;; In reality, a paycheck also contains an employee number. Develop a data representation for employee information and change the data definition for work records
;; so that it uses employee information and not just a string for the employee’s name. Also change your data representation of paychecks so that it contains an
;; employee’s name and number, too. Finally, design wage*.v4, a function that maps lists of revised work records to lists of revised paychecks.

; A Code is a number between [0, 999]

(define-struct employee [code name])
; A Employee is a structure:
; (make-employee Number String)
; interpretation (make-employee c n) represent a
; employee with social number c and his name.

(define-struct work.v2 [employee rate hours])
; (make-work.v2 Employee Number Number

(define-struct paycheck.v2 [employee amount])
; (make-paycheck.v2 Employee Number)

; Low.v2 (short for list of works) is one of: 
; – '()
; – (cons Work.v2 Low.v2)

; Lop.v2 (short for list of paycheck) is one of:
; - '()
; - (cons Paycheck.v2 Lop.v2)
; interpretation an instance of Lop represent the
; record of a employee weekly amount.

; Low.v2 -> Lop.v2
; produce a paycheck from a list-of-work with employee full information
(check-expect (wage*.v4 '()) '())
(check-expect (wage*.v4
               (cons (make-work.v2 (make-employee 125 "Robby")
                                   11.95 39) '()))
              (cons (make-paycheck.v2 (make-employee 125 "Robby")
                                      (* 11.95 39)) '()))
(define (wage*.v4 w)
  (cond
    [(empty? w) '()]
    [else
     (cons (make-paycheck.v2 (work.v2-employee (first w)) (wage.v3 (first w)))
           (wage*.v4 (rest w)))]))

; Work -> Number
; computes the wage for the given work record w
(define (wage.v3 w)
  (* (work.v2-rate w) (work.v2-hours w)))

