(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders Game

;; Constants:

;canvas
(define WIDTH  100)
(define HEIGHT 400)
(define MTS (empty-scene WIDTH HEIGHT))

;tank
(define TANK-SPEED 50)
(define TANK-SIZE 20)
(define TANK-L-EDGE (/ TANK-SIZE 2))
(define TANK-R-EDGE (- WIDTH (/ TANK-SIZE 2)))
(define TANK-IMG (above 
                  (rectangle (/ TANK-SIZE 4) (/ TANK-SIZE 2) "solid" "black")
                  (square TANK-SIZE "solid" "black")))
;default tank
(define TANK-X (/ WIDTH 2))
(define TANK-Y (- HEIGHT TANK-SIZE))

;ammo
(define AMMO-SPEED 5)
(define AMMO-SIZE 5)
(define AMMO-IMG (circle AMMO-SIZE "solid" "blue"))
(define (CURRENT-TANK t) (make-tank (tank-x (world-tank t)) (tank-y (world-tank t))))                                    ;define current tank

;default ammo
(define AMMO-X TANK-X)
(define AMMO-Y (/ WIDTH 2))

;invader
(define INVADER-SPEED 4)
(define INVADER-DIRECTION 1)
(define INVADER-SIZE 20)
(define INVADER-IMG (circle AMMO-SIZE "solid" "pink"))

;; Data Definitions:

(define-struct invader (x y b d))
;; Invader is (make-invader Natural[0, WIDTH] Natural[0, HEIGHT] Boolean)
;; interp. some invader at position x, y or true for game over (touched the ground)
;(random WIDTH)
(define new-invader (make-invader (random WIDTH) 0 #false 1))
(define I1 (make-invader (/ WIDTH 2) (/ HEIGHT 2) false 1))    ;start
;(define I2 (make-invader AMMO-X (/ HEIGHT 2) true)) ;middle 
;(define I3 (make-invader AMMO-X 0 true))            ;end
;(define I4 (make-invader AMMO-X 0 false))           ;game over

#;
(define (fn-for-invader i)
  (... (invader-x i)     ;Natural[0, WIDTH]
       (invader-y i)     ;Natural[0, HEIGHT]
       (invader-b i)))   ;Boolean

;; Template rules used:
;;  - compound: 3 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic non-distinct: Integer[0, HEIGHT]
;;  - atomic distinct: "false"

;; ListOfInvader is one of:
;;  - empty
;;  - (cons Invader ListOfInvader)
;; interp. a list of invaders currently invading

(define LOI0 empty)                                          ;no invaders
(define LOI1 empty)                                          ;no invaders
(define LOI2 (cons I1 empty))                                ;one invader
;(define LOI3 (cons A2 (cons A1 empty)))                      ;two invaders
;(define LOI4 (cons A3 (cons A2 (cons A1 empty))))            ;three invaders
;(define LOI5 (cons A4 (cons A1 empty)))                      ;four invaders

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]                   ;BASE CASE
        [else (... (first loi)                 ;Invader
                   (fn-for-loi (rest loi)))])) ;NATURAL RECURSION

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Ammo ListOAmmo)
;;  - self-reference: (rest loa) is ListOfAmmo

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

;; ListOfAmmo is one of:
;;  - empty
;;  - (cons Ammo ListOfAmmo)
;; interp. a list of ammo currently in use

(define LOA0 empty)                                          ;empty ammo
(define LOA1 empty)                                          ;empty ammo
(define LOA2 (cons A1 empty))                                ;one ammo list
(define LOA3 (cons A2 (cons A1 empty)))                      ;two ammo list
(define LOA4 (cons A3 (cons A2 (cons A1 empty))))            ;three ammo list
(define LOA5 (cons A4 (cons A1 empty)))  ;four ammo list (one false)

#;
(define (fn-for-loa loa)
  (cond [(empty? loa) (...)]                   ;BASE CASE
        [else (... (first loa)                 ;Ammo
                   (fn-for-loa (rest loa)))])) ;NATURAL RECURSION

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Ammo ListOAmmo)
;;  - self-reference: (rest loa) is ListOfAmmo

(define-struct tank (x y))
;; Tank is (make-tank Natural[0, WIDTH] Natural[TANK-Y] Ammo)
;; interp. a tank at position x, y, with ammo 'a'

(define T1 (make-tank 0 TANK-Y))           ;start
(define T2 (make-tank (/ WIDTH 2) TANK-Y)) ;middle 
(define T3 (make-tank WIDTH TANK-Y))       ;end
(define T4 (make-tank (- WIDTH 1) TANK-Y)) ;edge case

(define (fn-for-tank t)
  (... (tank-x t)      ;Natural[0, WIDTH]
       (tank-y t)      ;Natural[TANK-Y]
       (tank-a t)))    ;Ammo

;; Template rules used:
;;  - compound: 2 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic distinct: Integer[TANK-Y]

(define-struct world (tank loa loi))
;; World is (make-world Tank ListOfAmmo)
;; interp. the world that exists for Space Invaders

(define W1 (make-world T1 LOA1 LOI1))
(define W2 (make-world T2 LOA2 LOI1))
(define W3 (make-world T3 LOA3 LOI1))
(define W4 (make-world T4 LOA4 LOI2))

#;
(define (fn-for-world w)
  (... (fn-for-tank (world-tank w))
       (fn-for-ammo (world-loa w))))

;; Template rules used:
;;  - compound: 2 fields
;;  - reference: tank field is Tank
;;  - reference: ammo field is Ammo

;; Functions:

(define TANK-START  (make-tank TANK-X TANK-Y))
(define LOA-START empty)
(define LOI-START (cons (make-invader (random WIDTH) 0 #false 1) empty))

;; Space-Invadors -> Space-Invadors
;; start the world with initial state t, for example: (main (make-world TANK-START LOA-START LOI-START))

(define (main w)
  (big-bang w                     ; World
    (on-tick   tick-world)        ; World -> World
    (to-draw   render-world)      ; World -> Image Image
    (on-key    world-game-pad)))  ; World KeyEvent -> World

;; World  -> Image Image
;; produce image with TANK-IMG placed on MTS at proper x, y position
; 
; (check-expect (render-world W4) (place-images
;                                  (list TANK-IMG AMMO-IMG AMMO-IMG AMMO-IMG INVADER-IMG)
;                                  (list (make-posn 599 380) ;tank position
;                                        (make-posn 300 0)    ;ammo1 position
;                                        (make-posn 300 200)  ;ammo2 position
;                                        (make-posn 300 400)  ;ammo3 position
;                                        (make-posn (invader-x (first (world-loi W4))) (invader-y (first (world-loi W4)))))  ;invader position
;                                  MTS))


(define (render-world w)
  (place-images (append (cons TANK-IMG empty)
                        (ammo-imgs AMMO-IMG (world-loa w))
                        (ammo-imgs INVADER-IMG (world-loi w)))
                (append (cons (make-posn (tank-x (world-tank w)) (tank-y (world-tank w))) empty)
                        (render-imgs w (world-loa w))
                        (render-invaders w (world-loi w)))
                MTS))

;; Render World Helpers

;; Ammo -> Ammo-Position
;; gets the current position of the ammo
(check-expect (render-ammo A1) (make-posn 50 400))
(check-expect (render-ammo A2) (make-posn 50 200))
(check-expect (render-ammo A3)   (make-posn 50 0))

(define (render-ammo a)
  (make-posn (ammo-x a) (ammo-y a)))

(define (render-invader i)
  (make-posn (invader-x i) (invader-y i)))

;; LOA -> (Image x LOA length)
;; returns a "AMMO-IMG" for each Ammo in LOA and one tank
(check-expect (ammo-imgs AMMO-IMG LOA1) empty)
(check-expect (ammo-imgs AMMO-IMG LOA3) (cons AMMO-IMG (cons AMMO-IMG empty)))
(check-expect (ammo-imgs AMMO-IMG LOA4) (cons AMMO-IMG (cons AMMO-IMG (cons AMMO-IMG empty))))
(check-expect (ammo-imgs INVADER-IMG LOI2) (cons INVADER-IMG empty))
;(check-expect (ammo-imgs AMMO-IMG (cons (make-ammo AMMO-X (/ HEIGHT 2) true) (cons make-ammo AMMO-X HEIGHT true) empty)) (cons AMMO-IMG (cons AMMO-IMG empty)))

(define (ammo-imgs img-t loa)
  (cond [(empty? loa) empty]
        [else (cons img-t
                    (ammo-imgs img-t (rest loa)))]))

;; ImageList -> ((make-posn x y) x Length of ImageList)
;; grabs the x and y positions of images
(check-expect (render-imgs W1 (world-loa W1)) empty)        ;checks empty list (just grabs tank pos)
(check-expect (render-imgs W1 (world-loa W2)) (cons (render-ammo (first (world-loa W2))) empty))
(check-expect (render-invaders W4 (world-loi W4)) (cons (render-invader (first (world-loi W4))) empty))

(define (render-imgs w loa)
  (cond [(empty? loa) empty]
        [else (cons (render-ammo (first loa))                 ;ammo
                    (render-imgs w (rest loa)))]))

(define (render-invaders w loi)
  (cond [(empty? loi) empty]
        [else (cons (render-invader (first loi))                 ;ammo
                    (render-invaders w (rest loi)))]))

;; Ammo -> Ammo
;; produce the next ammo position
(check-expect (advance-ammo A1) (make-ammo (ammo-x A1) (-(ammo-y A1) AMMO-SPEED) (ammo-b A1))) ;start
(check-expect (advance-ammo A2) (make-ammo (ammo-x A2) (-(ammo-y A2) AMMO-SPEED) (ammo-b A2))) ;middle
(check-expect (advance-ammo A3) (make-ammo (ammo-x A3) 0 false))                               ;end (remove)

(define (advance-ammo a)
  (cond [(<= (ammo-y a) 0) (make-ammo (ammo-x a) 0 false)]
        [else (make-ammo (ammo-x a) (-(ammo-y a) AMMO-SPEED) (ammo-b a))]))


(define (advance-invader i)
  (cond [(>= (invader-y i) HEIGHT) (make-invader (invader-x i) HEIGHT true 1)]
        [(>= (invader-x i) WIDTH) (make-invader (-(invader-x i) INVADER-SPEED) (+(invader-y i) INVADER-SPEED) (invader-b i) (* -1 (invader-d i)))]
        [(<= (invader-x i) 0) (make-invader (+(invader-x i) INVADER-SPEED) (+(invader-y i) INVADER-SPEED) (invader-b i) (* -1 (invader-d i)))]
        [else (make-invader (+(invader-x i) (* (invader-d i) INVADER-SPEED)) (+(invader-y i) INVADER-SPEED) (invader-b i) (invader-d i))]))


;; ListOfAmmo -> ListOfAmmo
;; advance all ammo within the list of ammo
(check-expect (advance-all-ammo empty) empty) ;empty list
(check-expect (advance-all-ammo LOA1)  empty) ;empty list
(check-expect (advance-all-ammo LOA2) (cons (advance-ammo A1) empty))
(check-expect (advance-all-ammo LOA3) (cons (advance-ammo A2) (cons (advance-ammo A1) empty)))
(check-expect (advance-all-ammo LOA5) (cons (advance-ammo A1) empty)) ;false ammo

(define (advance-all-ammo loa)
  (cond [(empty? loa) empty]
        [else (if (ammo-b (first loa))
                  (cons (advance-ammo (first loa))                 ;ammo
                        (advance-all-ammo (rest loa)))
                  (advance-all-ammo (rest loa)))]))


(define (advance-all-invaders loi)
  (cond [(empty? loi) empty]
        [else (if (false? (invader-b (first loi)))
                  (cons (advance-invader (first loi))                 ;invader
                        (advance-all-invaders (rest loi)))
                  (advance-all-invaders (rest loi)))]))


;(check-expect (tick-world W1) (make-world (CURRENT-TANK W1) empty (world-loi W1)))
;(check-expect (tick-world W2) (make-world (CURRENT-TANK W2) (cons (advance-ammo A1) empty) (world-loi W2)))

(define (tick-world w)
  (if (end-game? w (world-loi w))
      (make-world (make-tank -50 -50) '() '())
      (make-world (CURRENT-TANK w)  (check-all-invaders (world-loi w) (advance-all-ammo (world-loa w))) (check-all-ammo (advance-all-ammo (world-loa w)) (add-invader (advance-all-invaders (world-loi w)))))))



#;
  (define (check-all-invaders loi loa)
  (cond [(empty? loi) loa]           
        [else (check-all-invaders (rest loi) (remove-ammo loa (first loi)))]))
  
;; game-over?
;; return true if game is over
;(check-expect (end-game? (world-loi W4)) false)
;(check-expect (end-game? (list (make-invader 50 200 #false 1) (make-invader 50 HEIGHT #false 1))) true) 

(define (end-game? w l)
  (cond [(equal? (world-tank w) (make-tank -50 -50)) true]
        [(empty? l) false]                   ;BASE CASE
        [else (if (touched? (first l))
                  true
                  (end-game? w (rest l)))])) ;NATURAL RECURSION

(define (touched? l) (>= (invader-y l) HEIGHT))
      
;; 
#;
(define (fn-for-loa loa)
  (cond [(empty? loa) (...)]                   ;BASE CASE
        [else (... (first loa)                 ;Ammo
                   (fn-for-loa (rest loa)))])) ;NATURAL RECURSION

;; Add invader
(define (add-invader w)
  (if (= (random 20) 5) (cons (make-invader (random WIDTH) 0 #false 1) w)
      w))

(define RADIUS 10)
(define TXINVADOR (make-invader 48 47 false 1))  ;touching
(define NTINVADOR (make-invader (/ WIDTH 2) (/ HEIGHT 2) false 1)) ;not touching
(define THEAMMOO (make-ammo 50 50 true))

(check-expect (hit? (make-ammo 50 50 true) (make-invader 48 53 false 1)) true) ;x is close enough (left) y is close enough (top)
(check-expect (hit? (make-ammo 50 50 true) (make-invader 53 47 false 1)) true) ;x is close enough (right) y is close enough (bottom)
(check-expect (hit? (make-ammo 50 50 true) (make-invader 50 20 false 1)) false) ;x is not enough (left)
(check-expect (hit? (make-ammo 50 50 true) (make-invader 64 63 false 1)) false) ;x is not enough (right) y is close enough (top)

;; Invader Ammo -> Boolean
;; checks if the ammo is within radius of the invader
(define (hit? a i)
  (and (<= (invader-x i) (+ (ammo-x a) RADIUS))
       (>= (invader-x i) (- (ammo-x a) RADIUS))
       (<= (invader-y i) (+ (ammo-y a) RADIUS))
       (>= (invader-y i) (- (ammo-y a) RADIUS))))

;; recursive through bullets, check every invader, if hit then do not add invader back into list
(check-expect (remove-hit-invader (cons (make-invader 0 0 false 1) (cons (make-invader 48 47 false 1) empty)) (make-ammo 50 50 true)) (cons (make-invader 0 0 false 1) empty))
(check-expect (remove-hit-invader (cons (make-invader 0 0 false 1) empty) (make-ammo 50 50 true)) (cons (make-invader 0 0 false 1) empty))

(check-expect (remove-ammo (cons (make-ammo 50 50 true) empty) (make-invader 0 0 false 1)) (cons (make-ammo 50 50 true) empty))
(check-expect (remove-ammo (cons (make-ammo 50 50 true) empty) (make-invader 60 60 false 1)) empty)

(define (remove-hit-invader loi a)
  (cond [(empty? loi) empty]                   
        [else (if (hit? a (first loi))
                  (cons (make-invader (invader-x (first loi)) (invader-y (first loi)) true 1)(rest loi))
                  (cons (first loi) (remove-hit-invader (rest loi) a)))]))

(define (remove-ammo loa i)
  (cond [(empty? loa) empty]                   
        [else (if (hit? (first loa) i)
                  (rest loa)
                  (cons (first loa) (remove-ammo (rest loa) i)))]))



(check-expect (check-all-ammo (cons (make-ammo 0 0 false) (cons (make-ammo 48 47 false) empty)) (cons (make-invader 0 0 false 1) (cons (make-invader 48 47 false 1) empty))) empty)
(check-expect (check-all-ammo (cons (make-ammo 0 0 false) (cons (make-ammo 48 47 false) empty)) (cons (make-invader 20 20 false 1) (cons (make-invader 48 47 false 1) empty))) (cons (make-invader 20 20 false 1) empty))
(check-expect (check-all-ammo (cons (make-ammo 23 20 false) (cons (make-ammo 0 0 false) (cons (make-ammo 48 47 false) empty) )) (cons (make-invader 20 20 false 1) (cons (make-invader 20 20 false 1) (cons (make-invader 48 47 false 1) empty)))) (cons (make-invader 20 20 false 1) empty))

(check-expect (check-all-invaders (cons (make-invader 20 20 false 1) (cons (make-invader 20 20 false 1) (cons (make-invader 48 47 false 1) empty))) (cons (make-ammo 23 20 false) (cons (make-ammo 0 0 false) (cons (make-ammo 48 47 false) empty)))) (cons (make-ammo 0 0 false) empty))


(define (check-all-ammo loa loi)
  (cond [(empty? loa) loi]           
        [else (check-all-ammo (rest loa) (remove-hit-invader loi (first loa)))]))

(define (check-all-invaders loi loa)
  (cond [(empty? loi) loa]           
        [else (check-all-invaders (rest loi) (remove-ammo loa (first loi)))]))




#;
(define (fn-for-loa loa)
  (cond [(empty? loa) (...)]                   ;BASE CASE
        [else (... (first loa)                 ;Ammo
                   (fn-for-loa (rest loa)))])) ;NATURAL RECURSION



;; Takes in a list of ammo and a list of invaders and if they match remove the invader
;; Add to toc
;; make radius and if within that radius (between each end of radius) then remove 



;; World -> World
;; Tank key events (shooting and moving)

(check-expect (world-game-pad W1 "left")                                                           (make-world (make-tank TANK-L-EDGE TANK-Y) LOA1 (world-loi W1))) ;left edge case
(check-expect (world-game-pad W3 "left")                              (make-world (make-tank  (- (tank-x (world-tank W3)) TANK-SPEED) TANK-Y) LOA3 (world-loi W2))) ;left WIDTH of map
;(check-expect (world-game-pad W2 "left")                                            (make-world (make-tank (- (tank-x T2) TANK-SPEED) TANK-Y) LOA2 (world-loi W2))) ;left half of map
;(check-expect (world-game-pad W2 "right")                                           (make-world (make-tank (+ (tank-x T2) TANK-SPEED) TANK-Y) LOA2 (world-loi W2))) ;right half of map
(check-expect (world-game-pad W4 "right")                                                          (make-world (make-tank TANK-R-EDGE TANK-Y) LOA4 (world-loi W4)));right edge case
(check-expect (world-game-pad W4 " ")   (make-world T4 (cons (make-ammo (tank-x (world-tank W4)) HEIGHT true) (cons A3 (cons A2 (cons A1 empty)))) (world-loi W4)));right edge case
(check-expect (world-game-pad W3   "up")                                                                                                         W3) ;improper key pressed

(define (world-game-pad w a-key)
  (make-world (move-tank (world-tank w) a-key)
              (fire-ammo (world-loa w) (world-tank w) a-key)
              (world-loi w)))

(define (move-tank t a-key)
  (cond
    [(key=? a-key "left")  (if (<= (tank-x t) TANK-SPEED)
                               (make-tank TANK-L-EDGE TANK-Y)
                               (make-tank (- (tank-x t) TANK-SPEED) TANK-Y))]
    [(key=? a-key "right") (if (>= (tank-x t) (- WIDTH TANK-SPEED))
                               (make-tank TANK-R-EDGE TANK-Y)
                               (make-tank (+ (tank-x t) TANK-SPEED) TANK-Y))]
    [else t]))

(define (fire-ammo loa t a-key)
  (cond
    [(key=? a-key " ") (cons (make-ammo (tank-x t)  HEIGHT true) loa)] 
    [else loa]))








; (define T1 (make-tank 0 TANK-Y))           ;start
; (define T2 (make-tank (/ WIDTH 2) TANK-Y)) ;middle 
; (define T3 (make-tank WIDTH TANK-Y))       ;end
; (define T4 (make-tank (- WIDTH 1) TANK-Y)) ;edge case
; 
; (define A1 (make-ammo AMMO-X HEIGHT true))       ;start
; (define A2 (make-ammo AMMO-X (/ HEIGHT 2) true)) ;middle 
; (define A3 (make-ammo AMMO-X 0 true))            ;end
; (define A4 (make-ammo AMMO-X 0 false))           ;non-existent
; 
; (define LOA1 empty)                                ;empty ammo
; (define LOA2 (cons A1 empty))                      ;one ammo list
; (define LOA3 (cons A2 (cons A1 empty)))            ;two ammo list
; (define LOA4 (cons A3 (cons A2 (cons A1 empty))))  ;three ammo list
; 
; (define W1 (make-world T1 LOA1))
; (define W2 (make-world T2 LOA2))
; (define W3 (make-world T3 LOA3))
; (define W4 (make-world T4 LOA4))
; 
; (define (CURRENT-TANK t) (make-tank (tank-x (world-tank t)) (tank-y (world-tank t))))                         ;define current tank




