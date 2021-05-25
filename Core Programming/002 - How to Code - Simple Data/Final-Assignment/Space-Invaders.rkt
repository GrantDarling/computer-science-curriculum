(require 2htdp/universe)
(require 2htdp/image)

;; SPACE INVADERS: (main (make-world TANK-START LOA-START LOI-START))

;; =======================
;; Constants:

;; =================
;; canvas
(define WIDTH  200)
(define HEIGHT 400)
(define MTS (rectangle WIDTH HEIGHT "solid" "black"))

;; =================
;; tank functionality
(define TANK-SPEED 40)
(define TANK-SIZE 30)
(define TANK-L-EDGE 0)  
(define TANK-R-EDGE WIDTH) 
(define (CURRENT-TANK t)
  (make-tank (tank-x (world-tank t))
             (tank-y (world-tank t)))) 

;; tank design
(define TANK-COLOR "green")
(define TANK-OUTLINE "solid")
(define TANK-IMG (above 
                  (triangle (/ TANK-SIZE 3) TANK-OUTLINE TANK-COLOR)
                  (rectangle TANK-SIZE (/ TANK-SIZE 3) TANK-OUTLINE TANK-COLOR)))

;; tank start position
(define TANK-X                (/ WIDTH 2))
(define TANK-Y (- HEIGHT (/ TANK-SIZE 2)))

;; =================
;; ammo functionality
(define AMMO-SPEED 5)
(define AMMO-SIZE  8)

;; ammo design
(define AMMO-COLOR1 "orange")
(define AMMO-COLOR2 "red")
(define AMMO-OUTLINE "solid")
(define AMMO-IMG (overlay
                  (circle (/ AMMO-SIZE   2.2) AMMO-OUTLINE AMMO-COLOR1)
                  (circle (/ AMMO-SIZE   2) AMMO-OUTLINE AMMO-COLOR2)
                  (circle (/ AMMO-SIZE 1.6) AMMO-OUTLINE AMMO-COLOR1)
                  (circle (/ AMMO-SIZE 1.4) AMMO-OUTLINE AMMO-COLOR2)
                  (circle AMMO-SIZE AMMO-OUTLINE AMMO-COLOR2)))                            

;; ammo start position
(define AMMO-X      TANK-X)
(define AMMO-Y (/ WIDTH 2))

;; =================
;; invader functionality
(define INVADER-SPEED 4)
(define INVADER-DIRECTION 1)
(define INVADER-SIZE 15)
(define RADIUS 10)

;; invader design
(define INVADER-COLOR "white")
(define INVADER-OUTLINE "outline")
(define INVADER-SOLID "solid")
(define INVADER-IMG (overlay/align "center" "bottom"
                     (ellipse (* 2 INVADER-SIZE) INVADER-SIZE INVADER-SOLID INVADER-COLOR)
                     (ellipse INVADER-SIZE(* 1.67 INVADER-SIZE) INVADER-OUTLINE INVADER-COLOR)))

;; =======================
;; Data Definitions:

(define-struct invader (x y b d))
;; Invader is (make-invader Natural[0, WIDTH] Natural[0, HEIGHT] Boolean Integer)
;; interp. some invader at position x, y, a boolean b for end-game and an integer d for direction (1 or -1)

(define I1 (make-invader (random WIDTH) 0 #false 1))            ;start
(define I2 (make-invader (random WIDTH) (/ HEIGHT 2) #true 1))  ;remove
(define I3 (make-invader (random WIDTH) HEIGHT #false 1))       ;game over
(define I4 (make-invader WIDTH 0 #false 1))                     ;right edge
(define I5 (make-invader 0 0 #false 1))                         ;left edge

#;
(define (fn-for-invader i)
  (... (invader-x i)     ;Natural[0, WIDTH]
       (invader-y i)     ;Natural[0, HEIGHT]
       (invader-b i)     ;Boolean
       (invader-b i)))   ;Integer

;; Template rules used:
;;  - compound: 4 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic non-distinct: Integer[0, HEIGHT]
;;  - atomic distinct: "false"
;;  - atomic distinct: Integer

;; ListOfInvader is one of:
;;  - empty
;;  - (cons Invader ListOfInvader)
;; interp. a list of invaders currently invading

(define LOI0 empty)                                ;no invaders
(define LOI1 (cons I1 empty))                      ;one invader
(define LOI2 (cons I2 (cons I1 empty)))            ;two invaders
(define LOI3 (cons I1 (cons I2 (cons I1 empty))))  ;three invaders (one true)

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]                       ;BASE CASE
        [else (... (first loi)                     ;Invader
                   (fn-for-loi (rest loi)))]))     ;NATURAL RECURSION

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Invader ListOInvader)
;;  - self-reference: (rest loa) is ListOInvader

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

(define LOA0 empty)                                ;empty ammo
(define LOA1 (cons A1 empty))                      ;one ammo list
(define LOA2 (cons A2 (cons A1 empty)))            ;two ammo list
(define LOA3 (cons A3 (cons A2 (cons A1 empty))))  ;three ammo list
(define LOA4 (cons A4 (cons A1 empty)))            ;four ammo list (one false)

#;
(define (fn-for-loa loa)
  (cond [(empty? loa) (...)]                      ;BASE CASE
        [else (... (first loa)                    ;Ammo
                   (fn-for-loa (rest loa)))]))    ;NATURAL RECURSION

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Ammo ListOAmmo)
;;  - self-reference: (rest loa) is ListOfAmmo

(define-struct tank (x y))
;; Tank is (make-tank Natural[0, WIDTH] Natural[TANK-Y])
;; interp. a tank at position x, y

(define T1 (make-tank 0 TANK-Y))           ;start (edge case)
(define T2 (make-tank (/ WIDTH 2) TANK-Y)) ;middle 
(define T3 (make-tank WIDTH TANK-Y))       ;end
(define T4 (make-tank (- WIDTH 1) TANK-Y)) ;past end (edge case)

(define (fn-for-tank t)
  (... (tank-x t)        ;Natural[0, WIDTH]
       (tank-y t)))      ;Natural[TANK-Y]

;; Template rules used:
;;  - compound: 2 fields
;;  - atomic non-distinct: Integer[0, WIDTH]
;;  - atomic distinct: Integer[TANK-Y]

(define-struct world (tank loa loi))
;; World is (make-world Tank ListOfAmmo ListOfInvaders)
;; interp. the world that exists for Space Invaders

(define W0 (make-world T1 LOA0 LOI0))
(define W1 (make-world T1 LOA1 LOI1))
(define W2 (make-world T2 LOA2 LOI1))
(define W3 (make-world T3 LOA3 LOI1))
(define W4 (make-world T4 LOA4 LOI2))

#;
(define (fn-for-world w)
  (... (fn-for-tank (world-tank w))
       (fn-for-loa (world-loa w))
       (fn-for-loi (world-loi w))))

;; Template rules used:
;;  - compound: 2 fields
;;  - reference: tank field is Tank
;;  - reference: loa field is ListOfAmmo
;;  - reference: loi field is ListOfInvader

;; Starting Definitions
(define TANK-START  (make-tank TANK-X TANK-Y))
(define LOA-START empty)
(define LOI-START (cons (make-invader (random WIDTH) 0 #false 1) empty))

;; =======================
;; Functions:

;; Space-Invadors -> Space-Invadors
;; start the world with initial state w: (main (make-world TANK-START LOA-START LOI-START))

(define (main w)
  (big-bang w                    ; World
    (on-tick   update-world)     ; World -> World
    (to-draw   render-world)     ; World -> Image Image
    (on-key    world-gamepad)))  ; World KeyEvent -> World

;; World -> World
;; produce all images for Space Invaders 

(define (render-world w)
  (place-images (append (cons TANK-IMG empty)
                        (list-to-img AMMO-IMG (world-loa w))
                        (list-to-img INVADER-IMG (world-loi w)))
                (append (cons (make-posn (tank-x (world-tank w)) (tank-y (world-tank w))) empty)
                        (render-imgs w (world-loa w))
                        (render-invaders w (world-loi w)))
                MTS))

;; Render World Helpers

;; Ammo -> (make-posn (Ammo-x) (Ammo-y))
;; gets the current position of the ammo
(check-expect (render-ammo A1) (make-posn (ammo-x A1) (ammo-y A1)))
(check-expect (render-ammo A2) (make-posn (ammo-x A2) (ammo-y A2)))
(check-expect (render-ammo A3) (make-posn (ammo-x A3) (ammo-y A3)))
(define (render-ammo a) (make-posn (ammo-x a) (ammo-y a)))

;; Invader -> (make-posn (Invader-x) (Invader-y))
;; gets the current position of the invader
(check-expect (render-invader I1) (make-posn (invader-x I1) (invader-y I1)))
(check-expect (render-invader I2) (make-posn (invader-x I2) (invader-y I2)))
(define (render-invader i) (make-posn (invader-x i) (invader-y i)))

;; ListOf"X" -> Image (x ListOf"X")
;; returns a "AMMO-IMG" for each Ammo in LOA and one tank
(check-expect (list-to-img AMMO-IMG LOA0) empty)                                                  ;empty
(check-expect (list-to-img AMMO-IMG LOA2) (cons AMMO-IMG (cons AMMO-IMG empty)))                  ;two ammo images
(check-expect (list-to-img AMMO-IMG LOA3) (cons AMMO-IMG (cons AMMO-IMG (cons AMMO-IMG empty))))  ;three ammo images
(check-expect (list-to-img INVADER-IMG LOI2) (cons INVADER-IMG (cons INVADER-IMG empty)))         ;three invader images

(define (list-to-img img lox)
  (cond [(empty? lox) empty]
        [else (cons img
                    (list-to-img img (rest lox)))]))

;; ListOfImage -> ((make-posn x y) (x ListOfImage)
;; grabs the x and y positions of images
(check-expect (render-imgs W0 (world-loa W0)) empty)             ;checks empty ammo list
(check-expect (render-imgs W0 (world-loi W0)) empty)             ;checks empty invader list 
(check-expect (render-imgs W1 (world-loa W1))                    ;checks one ammo list
              (cons (render-ammo (first (world-loa W1))) empty))
(check-expect (render-invaders W4 (world-loi W4))                ;checks two invader list
              (cons (render-invader (first (world-loi W4)))
                    (cons (render-invader (second (world-loi W4))) empty)))
; !!!
(define (render-imgs w loa)
  (cond [(empty? loa) empty]
        [else (cons (render-ammo (first loa))           
                    (render-imgs w (rest loa)))]))

(define (render-invaders w loi)
  (cond [(empty? loi) empty]
        [else (cons (render-invader (first loi))      
                    (render-invaders w (rest loi)))]))

;; Ammo -> Ammo
;; produce the next ammo position
(check-expect (advance-ammo A1) (make-ammo (ammo-x A1) (-(ammo-y A1) AMMO-SPEED) (ammo-b A1))) ;start
(check-expect (advance-ammo A2) (make-ammo (ammo-x A2) (-(ammo-y A2) AMMO-SPEED) (ammo-b A2))) ;middle
(check-expect (advance-ammo A3) (make-ammo (ammo-x A3) 0 false))                               ;end (remove)

(define (advance-ammo a)
  (cond [(<= (ammo-y a) 0) (make-ammo (ammo-x a) 0 false)]
        [else (make-ammo (ammo-x a) (-(ammo-y a) AMMO-SPEED) (ammo-b a))]))

;; Invader -> Invader
;; produce the next invader position
(check-expect (advance-invader I1) (make-invader (+(invader-x I1) (* (invader-d I1) INVADER-SPEED)) (+(invader-y I1) INVADER-SPEED) (invader-b I1) (invader-d I1))) ;start
(check-expect (advance-invader I3) (make-invader (invader-x I3) HEIGHT true 1)) ;end (remove)
(check-expect (advance-invader I4) (make-invader (-(invader-x I4) INVADER-SPEED) (+(invader-y I4) INVADER-SPEED) (invader-b I4) (* -1 (invader-d I4)))) ;right edge
(check-expect (advance-invader I5) (make-invader (+(invader-x I5) INVADER-SPEED) (+(invader-y I5) INVADER-SPEED) (invader-b I5) (* -1 (invader-d I5)))) ;left edge

(define (advance-invader i)
  (cond [(>= (invader-y i) HEIGHT) (make-invader (invader-x i) HEIGHT true 1)]
        [(>= (invader-x i) WIDTH) (make-invader (-(invader-x i) INVADER-SPEED) (+(invader-y i) INVADER-SPEED) (invader-b i) (* -1 (invader-d i)))]
        [(<= (invader-x i) 0) (make-invader (+(invader-x i) INVADER-SPEED) (+(invader-y i) INVADER-SPEED) (invader-b i) (* -1 (invader-d i)))]
        [else (make-invader (+(invader-x i) (* (invader-d i) INVADER-SPEED)) (+(invader-y i) INVADER-SPEED) (invader-b i) (invader-d i))]))


;; ListOfAmmo -> ListOfAmmo
;; advance all ammo within the list of ammo
(check-expect (advance-all-ammo LOA0)  empty)                                                  ;empty list
(check-expect (advance-all-ammo LOA1) (cons (advance-ammo A1) empty))                          ;one ammo list
(check-expect (advance-all-ammo LOA2) (cons (advance-ammo A2) (cons (advance-ammo A1) empty))) ;two ammo list
(check-expect (advance-all-ammo LOA4) (cons (advance-ammo A1) empty))                          ;false ammo

(define (advance-all-ammo loa)
  (cond [(empty? loa) empty]
        [else (if (ammo-b (first loa))
                  (cons (advance-ammo (first loa))             
                        (advance-all-ammo (rest loa)))
                  (advance-all-ammo (rest loa)))]))

;; ListOfInvader -> ListOfInvader
;; advance all ammo within the list of ammo
(check-expect (advance-all-invaders LOI0)  empty)                              ;empty list
(check-expect (advance-all-invaders LOI1) (cons (advance-invader I1) empty))   ;one ammo list

(define (advance-all-invaders loi)
  (cond [(empty? loi) empty]
        [else (if (false? (invader-b (first loi)))
                  (cons (advance-invader (first loi))            
                        (advance-all-invaders (rest loi)))
                  (advance-all-invaders (rest loi)))]))

(check-expect (update-world W0) (make-world (CURRENT-TANK W0) empty (world-loi W0)))
(define TANK-LOST (make-tank (- HEIGHT 1) (- HEIGHT 1)))

(define (update-world w)
  (if (end-game? w (world-loi w))
      (make-world TANK-LOST '() '())
      (make-world (CURRENT-TANK w)  (check-all-invaders (world-loi w) (advance-all-ammo (world-loa w))) (check-all-ammo (advance-all-ammo (world-loa w)) (add-invader (advance-all-invaders (world-loi w)))))))

  
;; game-over?
;; return true if game is over
(check-expect (end-game? W4 '()) false)

(define (end-game? w l)
  (cond [(equal? (world-tank w) TANK-LOST) true]
        [(empty? l) false]                   ;BASE CASE
        [else (if (invader-hit-bottom? (first l))
                  true
                  (end-game? w (rest l)))])) ;NATURAL RECURSION

(define (invader-hit-bottom? l) (>= (invader-y l) HEIGHT))

;; Add invader
(define (add-invader w)
  (if (= (random 20) 5) (cons (make-invader (random WIDTH) 0 #false 1) w)
      w))

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

(define (check-all-ammo loa loi)
  (cond [(empty? loa) loi]           
        [else (check-all-ammo (rest loa) (remove-hit-invader loi (first loa)))]))

(define (check-all-invaders loi loa)
  (cond [(empty? loi) loa]           
        [else (check-all-invaders (rest loi) (remove-ammo loa (first loi)))]))


;; World -> World
;; Tank key events (shooting and moving)

(check-expect (world-gamepad W1 "left")                                                           (make-world (make-tank TANK-L-EDGE TANK-Y) LOA1 (world-loi W1))) ;left edge case
(check-expect (world-gamepad W2 "left")                                            (make-world (make-tank (- (tank-x T2) TANK-SPEED) TANK-Y) LOA2 (world-loi W2))) ;left half of map
(check-expect (world-gamepad W2 "right")                                           (make-world (make-tank (+ (tank-x T2) TANK-SPEED) TANK-Y) LOA2 (world-loi W2))) ;right half of map
(check-expect (world-gamepad W4 "right")                                                          (make-world (make-tank TANK-R-EDGE TANK-Y) LOA4 (world-loi W4)));right edge case
(check-expect (world-gamepad W3   "up")                                                                                                         W3) ;improper key pressed                                                                                                       W3) ;improper key pressed

(define (world-gamepad w a-key)
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