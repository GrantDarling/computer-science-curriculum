;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invadors-Tank) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; A Tanks that moves across the screen

;; Constants:

;canvas
(define WIDTH  600)
(define HEIGHT 400)
(define MTS (empty-scene WIDTH HEIGHT))

;tank
(define TANK-SPEED 50)
(define TANK-SIZE 20)
(define TANK-Y (- HEIGHT TANK-SIZE))
(define TANK-IMG (above 
                  (rectangle (/ TANK-SIZE 4) (/ TANK-SIZE 2) "solid" "black")
                  (square TANK-SIZE "solid" "black")))

;; Data definitions:

;; Tank is Integer[0, WIDTH]
;; interp. the x coordinate of the tanks position
(define T1           0)  ; start
(define T2 (/ 2 WIDTH))  ; middle
(define T3       WIDTH)  ; end
 
#;
(define (fn-for-tank t)
  (... t))

;; Template rules used:
;;  - atomic non-distinct: Integer[0, WIDTH]


;; Functions:

;; Tank -> Tank
;; start the world with initial state t, for example: (main (/ WIDTH 2))
(define (main t)
  (big-bang t                  ; Tank
    (to-draw   render)         ; Tank -> Image
    (on-key    move-tank)))    ; Tank KeyEvent -> Tank     

;; Tank -> Tank
;; Produce tank at next position

(check-expect (move-tank T1 "left")                 (+ 0 (/ TANK-SIZE 2)))
(check-expect (move-tank T2 "right")                    (+ TANK-SPEED T2))
(check-expect (move-tank T3 "left")                     (- T3 TANK-SPEED))
(check-expect (move-tank T3   "up")                                    T3)
(check-expect (move-tank 14 "left")                 (+ 0 (/ TANK-SIZE 2)))
(check-expect (move-tank (- WIDTH 10) "right")  (- WIDTH (/ TANK-SIZE 2)))

(define (move-tank t a-key)
  (cond
    [(key=? a-key "left")  (if (<= t TANK-SPEED)
                               (+ 0 (/ TANK-SIZE 2))
                               (- t TANK-SPEED))]
    [(key=? a-key "right") (if (>= t (- WIDTH TANK-SPEED))
                               (- WIDTH (/ TANK-SIZE 2))
                               (+ t TANK-SPEED))]
    [else t]))

;; Tank -> Image
;; produce image with TANK-IMG placed on MTS at proper x, y position
(check-expect (render T1) (place-image TANK-IMG T1 TANK-Y MTS))

(define (render t) (place-image TANK-IMG t TANK-Y MTS))