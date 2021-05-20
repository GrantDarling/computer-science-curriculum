;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignment3a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Simple Countdown

(require 2htdp/image)
(require 2htdp/universe)

;; =================
;; Constants:

(define WIDTH 600)
(define HEIGHT 600)

(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))

(define TEXT-SIZE 46)
(define TEXT-COLOR "RED")

(define MTS (empty-scene WIDTH HEIGHT))

;; =================
;; Data definitions:

;; TextImage is a Natural[0,10]
;; interp. the current seconds remaining in the countdown
(define TI1 10)   ; start
(define TI2  5)   ; middle
(define TI3  0)   ; end

#;
(define (fn-for-text-image cd)
  (... cd))

;; Template rules used:
;;  - atomic non-distinct: Natural[0, 10]

;; =================
;; Functions:

;; TI -> TI
;; start the world with (main 10)
;; 
(define (main ti)
  (big-bang ti                     ; TI
            (on-tick   countdown)  ; TI -> TI
            (to-draw   render)
            (on-key   handle-key)))   ; TI -> Image

;; TI -> TI
;; produce the TextImage - 1 (unless 0 then stop)
(check-expect (countdown 0) 0)
(check-expect (countdown 10) 9)
(check-expect (countdown 1) 0)

(define (countdown ti)
  (cond [(> ti 0) (- ti 1)]
        [else 0]))


;; TI -> Image
;; render TextImage as an image placed on MTS at proper x,y position
(check-expect (render 10) (place-image (text (number->string 10) 40 "green") CTR-X CTR-Y MTS))
(check-expect (render 0) (place-image (text (number->string 0) 40 "green") CTR-X CTR-Y MTS))
(define (render ti)
  (place-image (text (number->string ti) TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))

;; Countdown KeyEvent -> Countdown
;; reset the countdown to 10 when the spacebar is pressed
(check-expect (handle-key 0 " ") 10)
(check-expect (handle-key 5 " ") 10)
(check-expect (handle-key 5 "left") 5)

(define (handle-key cd ke)
  (cond [(key=? ke " ") 10]
        [else cd]))