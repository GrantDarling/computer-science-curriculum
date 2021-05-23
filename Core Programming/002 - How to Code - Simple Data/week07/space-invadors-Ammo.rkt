;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invadors-Ammo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; A Fireball that moves moves up until hitting the top of screen

;; Constants:

;canvas
(define WIDTH  600)
(define HEIGHT 400)
(define MTS (empty-scene WIDTH HEIGHT))

;tank
(define TANK-SPEED 50)
(define TANK-SIZE 40)
(define TANK-X (/ WIDTH 2))
(define TANK-Y (- HEIGHT TANK-SIZE))
(define TANK-IMG (above 
                  (rectangle (/ TANK-SIZE 4) (/ TANK-SIZE 2) "solid" "black")
                  (square TANK-SIZE "solid" "black")))

;ammo
(define AMMO-SPEED 5)
(define AMMO-SIZE 5)
(define AMMO-X (/ WIDTH 2)) ;!!!
(define AMMO-Y      (/ WIDTH 2))
(define AMMO-IMG (circle AMMO-SIZE "solid" "red"))

;; Data definitions:

;; Ammo is one of:
;;  - Integer[0, HEIGHT]
;;  - false
;; interp. the y coordinate of the tanks ammo Integer[0, HEIGHT] or none existent

(define A1            0)  ; start
(define A2 (/ 2 HEIGHT))  ; middle
(define A3       HEIGHT)  ; end
(define A4        false)  ; non-existent

#;
(define (fn-for-ammo a)
  (cond [(string=? "false" a) (...)]
        [(and (> a 0) (< a HEIGHT)) (... a)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Integer[0, HEIGHT]
;;  - atomic distinct: "false"

;; Template rules used:
;;  - atomic non-distinct: Integer[0, HEIGHT]

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
;; start the world with initial state t, for example: (main TANK-X)
(define (main t)
  (big-bang t                  ; Tank
    (to-draw   render)         ; Tank -> Image
    (on-key    move-tank)))    ; Tank KeyEvent -> Tank   

;; Ammo -> Ammo
;; start the world with initial state a, for example: (main AMMO-Y)
;(define (main a)
;  (big-bang a                  ; Ammo
;    (on-tick   advance-ammo)   ; Ammo -> Ammo
;    (to-draw    render-ammo)   ; Ammo -> Image
;    (on-key  restart-ammo)))   ; Ammo KeyEvent -> Ammo

;; Ammo -> Ammo
;; produce the next ammo position
(check-expect (advance-ammo HEIGHT)           (- HEIGHT AMMO-SPEED))
(check-expect (advance-ammo (/ WIDTH 2)) (- (/ WIDTH 2) AMMO-SPEED))
(check-expect (advance-ammo 0)                                false)
(check-expect (advance-ammo AMMO-SPEED)                           0)

(define (advance-ammo a)
  (cond [(and (number? a) (<= a HEIGHT) (>= a AMMO-SPEED)) (- a AMMO-SPEED)]
        [else false]))

;; Ammo -> Image
;; render the ammo position 
(check-expect (render-ammo A1) (place-image AMMO-IMG AMMO-X A1 MTS))
(check-expect (render-ammo A2) (place-image AMMO-IMG AMMO-X A2 MTS))
(check-expect (render-ammo A3) (place-image AMMO-IMG AMMO-X A3 MTS))
(check-expect (render-ammo A4) MTS)

(define (render-ammo a) (if (number? a)
                            (place-image AMMO-IMG AMMO-X a MTS)
                            MTS))

;; Ammo KeyEvent -> Ammo
;; restart the ammo position
(check-expect (restart-ammo A3 "left")    A3)
(check-expect (restart-ammo A3 " ")   AMMO-Y)

(define (restart-ammo a a-key)
  (cond
    [(key=? a-key " ")  AMMO-Y]
    [else a]))


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