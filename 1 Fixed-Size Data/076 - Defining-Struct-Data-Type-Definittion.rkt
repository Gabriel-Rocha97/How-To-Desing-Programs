;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |076 - Defining-Struct-Data-Type-Definittion|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "testing.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))

; Formulate data definitions for the following structure type definitions:

(define-struct movie [title producer year])
; A movie is (make-movie String String Number)
; A movie has three parts:
; - Title: A string for the movie's name
; - Producer: A string for the producer's name
; - Year: A number for the year release


(define-struct person [name hair eyes phone])
; A person is (make-person String String String Number)
; A person has four parts:
; - Name: String for the person's name
; - Hair: String for the type of person's hair
; - Eyes: String for the person's color eyes
; - Number: Number for the phone-contact


(define-struct pet [name number])
; A pet is (make-pet String Number)
; A pet has two parts
; - Name: String for pet's name
; - Number: coulbe be a number for a key code or a
; contact number


(define-struct CD [artist title price])
; A CD is (make-CD String String number)
; A CD has three parts
; - Artist: String for artist's name
; - Title: String for the CD's title
; - Price: Number for the CD's price


(define-struct sweater [material size producer])
; A sweater is (make-sweater String Number String)
; A sweater has three parts
; - Material: string for the sweater'a material
; - Size: number for the sweater size
; - Producer: String for the sweater's producer name