;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invadors-Ammo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders

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
(define TANK-L-EDGE (/ TANK-SIZE 2))
(define TANK-R-EDGE (- WIDTH (/ TANK-SIZE 2)))
(define TANK-IMG (above 
                  (rectangle (/ TANK-SIZE 4) (/ TANK-SIZE 2) "solid" "black")
                  (square TANK-SIZE "solid" "black")))

;ammo
(define AMMO-SPEED 5)
(define AMMO-SIZE 5)
(define AMMO-X TANK-X)
(define AMMO-Y      (/ WIDTH 2))
(define AMMO-IMG (circle AMMO-SIZE "solid" "red"))
(define (CURRENT-AMMO t) (make-ammo (ammo-x (tank-a t)) (ammo-y (tank-a t)) (ammo-b (tank-a t)))) ;define the current ammo

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


(define-struct tank (x y a))
;; Tank is (make-tank Natural[0, WIDTH] Natural[TANK-Y] Ammo)
;; interp. a tank at position x, y, with ammo 'a'

(define T1 (make-tank 0 TANK-Y A1))           ;start
(define T2 (make-tank (/ WIDTH 2) TANK-Y A2)) ;middle 
(define T3 (make-tank WIDTH TANK-Y A3))       ;end
(define T4 (make-tank (- WIDTH 1) TANK-Y A4))          ;edge case
 
(define (fn-for-tank t)
  (... (tank-x t)      ;Natural[0, WIDTH]
       (tank-y t)      ;Natural[TANK-Y]
       (tank-a t)))    ;Ammo

;; Template rules used:
;;  - compound: 2 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic non-distinct: Integer[TANK-Y]
;;  - ammo


;; Functions:

;; Tank Ammo -> Tank Ammo
;; start the world with initial state t, for example: (main (make-tank TANK-X TANK-Y (make-ammo AMMO-X AMMO-Y true)))
(define (main t)
  (big-bang t                  ; Tank
    (on-tick   fire)           ; Ammo -> Ammo
    (to-draw   render)         ; Tank -> Image
    (on-key    move-tank)))    ; Tank KeyEvent -> Tank

;; Tank Ammo  -> Image Image
;; produce image with TANK-IMG placed on MTS at proper x, y position
(check-expect (render T1) (place-images
                           (list AMMO-IMG TANK-IMG)
                           (list (make-posn (ammo-x (tank-a T1)) (ammo-y (tank-a T1)))
                                 (make-posn (tank-x T1) (tank-y T1)))
                           MTS))

(define (render t)
  (place-images (list AMMO-IMG TANK-IMG)
                (list (make-posn (ammo-x (tank-a t)) (ammo-y (tank-a t)))
                      (make-posn (tank-x t) (tank-y t)))
                MTS))

;; Tank Ammo -> Tank Ammo
;; produce the next ammo position
(check-expect (fire T1) (make-tank 0 TANK-Y (make-ammo AMMO-X (- HEIGHT AMMO-SPEED) true)))
(check-expect (fire T2) (make-tank (/ WIDTH 2) TANK-Y (make-ammo AMMO-X (- (/ HEIGHT 2) AMMO-SPEED) true)))
(check-expect (fire T3) (make-tank WIDTH TANK-Y (make-ammo AMMO-X 0 false)))
(check-expect (fire T4) (make-tank 14 TANK-Y (make-ammo AMMO-X 0 false)))

(define (fire t)
  (cond [(and (<= (ammo-y (tank-a t)) HEIGHT)
              (>= (ammo-y (tank-a t)) AMMO-SPEED))
         (make-tank (tank-x t) (tank-y t) (make-ammo (ammo-x (tank-a t)) (- (ammo-y (tank-a t)) AMMO-SPEED) true))]
        [else (make-tank (tank-x t) (tank-y t) (make-ammo (ammo-x (tank-a t)) 0 false))]))

;; Tank Ammo -> Tank Ammo
;; Tank key events (shooting and moving)
(check-expect (move-tank T1 "left")                               (make-tank TANK-L-EDGE TANK-Y A1)) ;left edge case
(check-expect (move-tank T3 "left")               (make-tank  (- (tank-x T3) TANK-SPEED) TANK-Y A3)) ;left WIDTH of map
(check-expect (move-tank T2 "left")                (make-tank (- (tank-x T2) TANK-SPEED) TANK-Y A2)) ;left half of map
(check-expect (move-tank T2 "right")               (make-tank (+ (tank-x T2) TANK-SPEED) TANK-Y A2)) ;right half of map
(check-expect (move-tank T4 "right")                              (make-tank TANK-R-EDGE TANK-Y A4));right edge case
(check-expect (move-tank T4 " ") (make-tank (- WIDTH 1) TANK-Y (make-ammo (tank-x T4) AMMO-Y true)));right edge case
(check-expect (move-tank T3   "up")                                                              T3) ;improper key pressed


(define (move-tank t a-key)
  (cond
    [(key=? a-key "left")  (if (<= (tank-x t) TANK-SPEED)
                               (make-tank TANK-L-EDGE TANK-Y (CURRENT-AMMO t))
                               (make-tank (- (tank-x t) TANK-SPEED) TANK-Y (CURRENT-AMMO t)))]
    [(key=? a-key "right") (if (>= (tank-x t) (- WIDTH TANK-SPEED))
                               (make-tank TANK-R-EDGE TANK-Y (CURRENT-AMMO t))
                               (make-tank (+ (tank-x t) TANK-SPEED) TANK-Y (CURRENT-AMMO t)))]
    [(key=? a-key " ")         (make-tank (tank-x t) (tank-y t) (make-ammo (tank-x t) AMMO-Y true))]
    [else t]))

