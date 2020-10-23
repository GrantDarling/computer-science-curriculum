;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Quiz #1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ;; Image Image -> Bolean
 ;; Check if first image is larger than the second (l x w)
 ;; (define (is-larger (circle 60 "solid" "black") (circle 50 "solid" "black")) true) ;stub


 (check-expect (is-larger (circle 60 "solid" "black") (circle 30 "solid" "black")) true)
 (check-expect (is-larger (rectangle 10 5 "solid" "black") (circle 60 "solid" "black")) false)
(check-expect (is-larger (rectangle 10 5 "solid" "black") (rectangle 60 60 "solid" "black")) false)

 ;; (define (is-larger img1 img2)  ;template
 ;;         (... (> ((width img1) (height img1)) ((width img2) (height img2))))

 (require 2htdp/image)

 (define (is-larger img1 img2)
         (> (*(image-width img1) (image-height img1))  (*(image-width img2) (image-height img2))))