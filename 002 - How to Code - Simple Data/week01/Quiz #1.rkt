;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Quiz #1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Problem: Design a function that consumes two images and produces true if the first is larger than the second.

(require 2htdp/image)

;; Image Image -> Boolean
;; return true if the area of image one is greater than image two

(check-expect (image1-is-greater? (rectangle 100 100 "solid" "darkolivegreen") (rectangle 10 10 "solid" "darkolivegreen")) true)
(check-expect (image1-is-greater? (rectangle 10 10 "solid" "darkolivegreen")   (rectangle 100 100 "solid" "darkolivegreen")) false)
(check-expect (image1-is-greater? (rectangle 100 100 "solid" "darkolivegreen") (rectangle 100 100 "solid" "darkolivegreen")) false)

(define (image1-is-greater? img1 img2)
        (> (* (image-width img1) (image-height img1))
           (* (image-width img2) (image-height img2))))