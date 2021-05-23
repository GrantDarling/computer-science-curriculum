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

(define-struct ammo (x y b))
;; Ammo is (make-ammo Natural[0, WIDTH] Natural[0, HEIGHT] Boolean)
;; interp. some ammo at position x, y or false for non-existent

(define A1 (make-ammo AMMO-X HEIGHT true))       ;start
(define A2 (make-ammo AMMO-X (/ HEIGHT 2) true)) ;middle 
(define A3 (make-ammo AMMO-X 0 true))            ;end
(define A4 (make-ammo AMMO-X 0 false))           ;non-existent

#;
(define (fn-for-ammo a)
  (... (ammo-x a)     ;Natural[0, WIDTH]
       (ammo-y a)     ;Natural[0, HEIGHT]
       (ammo-b a)))   ;Boolean
;; Template rules used:
;;  - compound: 3 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic non-distinct: Integer[0, HEIGHT]
;;  - atomic distinct: "false"



(define-struct tank (x y))
;; Tank is (make-tank Natural[0, WIDTH] Natural[TANK-Y])
;; interp. a tank at position x, y

(define T1 (make-tank 0 TANK-Y))           ;start
(define T2 (make-tank (/ 2 WIDTH) TANK-Y)) ;middle 
(define T3 (make-tank WIDTH TANK-Y))       ;end
 
(define (fn-for-ammo t)
  (... (tank-x t)      ;Natural[0, WIDTH]
       (tank-y t)))    ;Natural[TANK-Y]

;; Template rules used:
;;  - compound: 2 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic non-distinct: Integer[TANK-Y]


;; Functions:

;; Tank -> Tank
;; start the world with initial state t, for example: (main (make-tank TANK-X TANK-Y))
(define (main t)
  (big-bang t                  ; Tank
    (to-draw   render)         ; Tank -> Image
    (on-key    move-tank)))    ; Tank KeyEvent -> Tank

;; Tank -> Tank
;; Produce tank at next position

;(define T1 (make-tank 0 TANK-Y))           ;start
;(define T2 (make-tank (/ 2 WIDTH) TANK-Y)) ;middle 
;(define T3 (make-tank WIDTH TANK-Y))       ;end
(define T4 (make-tank 14 TANK-Y))  

(check-expect (move-tank T1 "left")   (make-tank (+ 0 (/ TANK-SIZE 2)) TANK-Y))
(check-expect (move-tank T2 "right")  (make-tank (+ TANK-SPEED (tank-x T2)) TANK-Y))
(check-expect (move-tank T3 "left")   (make-tank  (- (tank-x T3) TANK-SPEED) TANK-Y))
(check-expect (move-tank T3   "up")                                               T3)
(check-expect (move-tank T4 "left")   (make-tank (+ 0 (/ TANK-SIZE 2)) TANK-Y))            
(check-expect (move-tank (make-tank (- WIDTH 10) TANK-Y) "right")  (make-tank (- WIDTH (/ TANK-SIZE 2)) TANK-Y))

(define (move-tank t a-key)
  (cond
    [(key=? a-key "left")  (if (<= (tank-x t) TANK-SPEED)
                               (make-tank (+ 0 (/ TANK-SIZE 2)) TANK-Y)
                               (make-tank (- (tank-x t) TANK-SPEED) TANK-Y))]
    [(key=? a-key "right") (if (>= (tank-x t) (- WIDTH TANK-SPEED))
                               (make-tank (- WIDTH (/ TANK-SIZE 2)) TANK-Y)
                               (make-tank (+ (tank-x t) TANK-SPEED) TANK-Y))]
    [else t]))

;; Tank -> Image
;; produce image with TANK-IMG placed on MTS at proper x, y position
(check-expect (render T1) (place-image TANK-IMG (tank-x T1) TANK-Y MTS))

(define (render t) (place-image TANK-IMG (tank-x t) TANK-Y MTS))

;; Ammo -> Ammo
;; start the world with initial state a, for example: (main (make-ammo AMMO-X AMMO-Y true))
;(define (main a)
;  (big-bang a                  ; Ammo
;    (on-tick   advance-ammo)   ; Ammo -> Ammo
;    (to-draw    render-ammo)   ; Ammo -> Image
;    (on-key  restart-ammo)))   ; Ammo KeyEvent -> Ammo

;; Ammo -> Ammo
;; produce the next ammo position
(check-expect (advance-ammo A1) (make-ammo AMMO-X (- HEIGHT AMMO-SPEED) true))
(check-expect (advance-ammo A2) (make-ammo AMMO-X (- (/ HEIGHT 2) AMMO-SPEED) true))
(check-expect (advance-ammo A3) (make-ammo AMMO-X 0 false))
(check-expect (advance-ammo A4) (make-ammo AMMO-X 0 false))

(define (advance-ammo a)
  (cond [(and (<= (ammo-y a) HEIGHT) (>= (ammo-y a) AMMO-SPEED)) (make-ammo AMMO-X (- (ammo-y a) AMMO-SPEED) true)]
        [else (make-ammo AMMO-X 0 false)]))

;; Ammo -> Image
;; render the ammo position 
(check-expect (render-ammo A1) (place-image AMMO-IMG AMMO-X (ammo-y A1) MTS))
(check-expect (render-ammo A2) (place-image AMMO-IMG AMMO-X (ammo-y A2) MTS))
(check-expect (render-ammo A3) (place-image AMMO-IMG AMMO-X (ammo-y A3) MTS))
(check-expect (render-ammo A4) MTS)

(define (render-ammo a) (if (ammo-b a)
                            (place-image AMMO-IMG AMMO-X (ammo-y a) MTS)
                            MTS))

;; Ammo KeyEvent -> Ammo
;; restart the ammo position
(check-expect (restart-ammo A2 "left")  (make-ammo AMMO-X (/ HEIGHT 2) true))
(check-expect (restart-ammo A2 " ")     (make-ammo AMMO-X AMMO-Y true))

(define (restart-ammo a a-key)
  (cond
    [(key=? a-key " ")  (make-ammo AMMO-X AMMO-Y true)]
    [else a]))
