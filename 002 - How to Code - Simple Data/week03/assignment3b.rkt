(require 2htdp/image)
(require 2htdp/universe)


(define-struct pos (x y))

;; Constructors
(define POS-1 (make-pos 3 6))
(define POS-2 (make-pos 2 8))

;; Selectors
(pos-x POS-1)
(pos-y POS-2)

;; Predicates
(pos? POS-1)
(pos? "Hello")

;; #1

; 
; PROBLEM:
; 
; Design a data definition to represent hockey players, including both 
; their first and last names.
; 


(define-struct player (fn ln))
;; Player is (make-player String String)
;; interp. (make-player fn ln) is a hockey player with
;;         fn as first name
;;         ln as last name
(define P1 (make-player "Bobby" "Orr"))
(define P2 (make-player "Wayne" "Gretzky"))

(define (fn-for-player p)
  (... (player-fn p)    ;String
       (player-ln p)))  ;String

;; Template rules used:
;;  - Compound: 2 fields

;; #2

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a movie, including  
; title, budget, and year released.
; 
; To help you to create some examples, find some interesting movie facts below: 
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
; 
; However, feel free to resarch more on your own!
; 


(define-struct movie (title budget release-year))
;; Movie is (make-movie String Number Natural)
;; interp. a movie with a title, budget and release year

(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "Avengers" 220000000 2012))

#;
(define (fn-for-movie t b ry)
  (... (movie-title t)      ;String
       (movie-budget b)     ;Number
       (movie-release ry))) ;Natural
;; Template rules used:
;;  - compound: 3 fields


;; =================
;; Functions:

; 
; PROBLEM B:
; 
; You have a list of movies you want to watch, but you like to watch your 
; rentals in chronological order. Design a function that consumes two movies 
; and produces the title of the most recently released movie.
; 
; Note that the rule for templating a function that consumes two compound data 
; parameters is for the template to include all the selectors for both 
; parameters.
; 


;; Movie Movie -> Movie-Title
;; Takes two movies and produces the title of the most recent movie
(check-expect (most-recent-movie M1 M2) (movie-title M2))
(check-expect (most-recent-movie M2 M3) (movie-title M3))
(check-expect (most-recent-movie M3 M1) (movie-title M3))

(define (most-recent-movie m1 m2)
  (cond [(> (movie-release-year m1) (movie-release-year m2)) (movie-title m1)]
        [else (movie-title m2)]))


;; #3

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to help a teacher organize their next field trip. 
; On the trip, lunch must be provided for all students. For each student, track 
; their name, their grade (from 1 to 12), and whether or not they have allergies.
; 


(define-struct student (name grade allergies?))
;; Student is (make-student String Natural[1,12], Boolean)
;; interp. a student with a name, grade and allergies?
(define S1 (make-student "Gawy" 6 true))
(define S2 (make-student "John" 3 false))
(define S3 (make-student "Daryl" 7 true))
(define S4 (make-student "Kevin" 1 true))

#;
(define (fn-for-student s)
  (... (student-name s)           ;String
       (student-grade s)          ;Natural[1,12]
       (student-allergies? s)))   ;Boolean

;; Template rules used:
;;  - compound: 3 fields

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; To plan for the field trip, if students are in grade 6 or below, the teacher 
; is responsible for keeping track of their allergies. If a student has allergies, 
; and is in a qualifying grade, their name should be added to a special list. 
; Design a function to produce true if a student name should be added to this list.
; 


;; Student -> Boolean
;; Takes a students name and states if their allergies should be tracked
(check-expect (track-student-allergies S1) true)
(check-expect (track-student-allergies S2) false)
(check-expect (track-student-allergies S3) false)
(check-expect (track-student-allergies S4) true)

(define (track-student-allergies s)
  (and (<= (student-grade s) 6) (student-allergies? s)))

; 
; PROBLEM:
; 
; As we learned in the cat world programs, cats have a mind of their own. When they 
; reach the edge they just keep walking out of the window.
; 
; Cows on the other hand are docile creatures. They stay inside the fence, walking
; back and forth nicely.
; 
; Design a world program with the following behaviour:
;    - A cow walks back and forth across the screen.
;    - When it gets to an edge it changes direction and goes back the other way
;    - When you start the program it should be possible to control how fast a
;      walker your cow is.
;    - Pressing space makes it change direction right away.
;    
; To help you here are two pictures of the right and left sides of a lovely cow that 
; was raised for us at Brown University.
; 
; .     .
; 
; Once your program works here is something you can try for fun. If you rotate the
; images of the cow slightly, and you vary the image you use as the cow moves, you
; can make it appear as if the cow is waddling as it walks across the screen.
; 
; Also, to make it look better, arrange for the cow to change direction when its
; nose hits the edge of the window, not the center of its body.
; 


;; =================
;; Constants

(define WIDTH 400)
(define HEIGHT 200)

(define CTR-Y (/ HEIGHT 2))

(define RCOW . )
(define LCOW .)

(define MTS (empty-scene WIDTH HEIGHT))

;; =================
;; Data Definition

(define-struct cow(x dx))
;; Cow is (make-cow Natural[0, WIDTH], Integer)
;; Interp. (make-cow c dx) is a cow with a x coordinate x and velocity dx
;;         the x is the center of the cow
;;         x is in screen coordinates (pixels_
;;         dx is in pixels per tick
;;
(define C1 (make-cow 10  3)) ; at 10, moving left -> right
(define C2 (make-cow 20 -3)) ; at 20, moving right -> left

(define (fn-for-cow c)
  (... (cow-x c)    ;Natural[0, WIDTH]
       (cow-dx c))) ;Integer

;; Template rules used:
;;  - compound: 2 fields


;; =================
;; Functions:

;; Cow -> Cow
;; called to make the cow go for a walk; start with (main (make-cow 0 3))
;; no tests for main function
(define (main c)
  (big-bang c
            (on-tick next-cow)       ; Cow -> Cow
            (to-draw render-cow)     ; Cow -> Image
            (on-key  handle-key)))   ; Cow KeyEvent -> Cow



;; Cow -> Cow  
;; increase cow x by dx; when gets to edge, change dir and move off by 1
(check-expect (next-cow (make-cow 20           3)) (make-cow (+ 20 3)  3)) ;away from edges
(check-expect (next-cow (make-cow 20          -3)) (make-cow (- 20 3) -3))

(check-expect (next-cow (make-cow (- WIDTH 3)  3)) (make-cow WIDTH     3)) ;reaches edge
(check-expect (next-cow (make-cow 3           -3)) (make-cow 0        -3))

(check-expect (next-cow (make-cow (- WIDTH 2)  3)) (make-cow WIDTH    -3)) ;tries to pass edge
(check-expect (next-cow (make-cow 2           -3)) (make-cow 0         3)) 

;(define (next-cow c) c)      ;stub

(define (next-cow c)
  (cond [(> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow WIDTH (- (cow-dx c)))]
        [(< (+ (cow-x c) (cow-dx c)) 0)     (make-cow 0     (- (cow-dx c)))]
        [else
         (make-cow (+ (cow-x c) (cow-dx c))
                   (cow-dx c))]))


;; Cow -> Image
;; place appropriate cow image on MTS at (cow-x c) and CTR-Y
(check-expect (render-cow (make-cow 99 3))
              (place-image RCOW 99 CTR-Y MTS))
(check-expect (render-cow (make-cow 33 -3))
              (place-image LCOW 33 CTR-Y MTS))

(define (render-cow c)
  (place-image (choose-image c) (cow-x c) CTR-Y MTS))

;; Cow -> Image
;; produce RCOW or LCOW depending on the direction cow is going
(check-expect (choose-image (make-cow 10  3)) RCOW)
(check-expect (choose-image (make-cow 11 -3)) LCOW)
(check-expect (choose-image (make-cow 11  0)) LCOW)

(define (choose-image c)
  (if (> (cow-dx c) 0)
      RCOW
      LCOW))



; PROBLEM:
; 
; In this problem, we will design an animation of throwing a water balloon.  
; When the program starts the water balloon should appear on the left side 
; of the screen, half-way up.  Since the balloon was thrown, it should 
; fly across the screen, rotating in a clockwise fashion. Pressing the 
; space key should cause the program to start over with the water balloon
; back at the left side of the screen. 
; 
; NOTE: Please include your domain analysis at the top in a comment box. 
; 
; Use the following images to assist you with your domain analysis:
; 
; ** already copied **
; 
; Here is an image of the water balloon:
; (define WATER-BALLOON.)
; 
; 
; 
; NOTE: The rotate function wants an angle in degrees as its first 
; argument. By that it means Number[0, 360). As time goes by your balloon 
; may end up spinning more than once, for example, you may get to a point 
; where it has spun 362 degrees, which rotate won't accept. 
; 
; The solution to that is to use the modulo function as follows:
; 
; (rotate (modulo ... 360) (text "hello" 30 "black"))
; 
; where ... should be replaced by the number of degrees to rotate.
; 
; NOTE: It is possible to design this program with simple atomic data, 
; but we would like you to use compound data.



;; Problem Domain

; 
; 
; 1)
; 2).
; .
; 3)
; .
; 4)
; 
; .
; 
; Constants:
; WIDTH
; HEIGHT
; Y-CTR
; SPEED
; ROTATION
; BALLOON_IMG
; 
; Changing:
; ballon-rotation
; balloon-position
; 
; Events:
; on-tick
; on-render
; on-key
; 
;     


;; Toss a balloon program

;; =================
;; Constants

(define WIDTH2 600)
(define HEIGHT2 400)

(define CTR-Y2 (/ HEIGHT 2))
(define MTS2 (empty-scene WIDTH2 HEIGHT2))

(define SPEED2 3)
(define ROTATION2 10)
(define BALLOON-IMG  .)

;; =================
;; Data Definitions

(define-struct balloon (position rotation))
;; Balloon is (make-balloon Number Number[0, 360])
;; interp. a balloon with a x-position and rotaion

(define B1 (make-balloon 0 270))
(define B2 (make-balloon (/ WIDTH2 2) 180))

#;
(define (fn-for-balloon b)
  (... (balloon-position b)     ;Number
       (balloon-rotation b)))   ;Number[0, 360]
;; Template rules used:
;;  - compound: 2 fields

;; =================
;; Functions:

;; Balloon -> Balloon
;; start the world with (main2 (make-balloon 0 0)) 
;; 
(define (main2 b)
  (big-bang b                            ; Balloon
            (on-tick   advance-balloon)  ; Balloon -> Balloon
            (to-draw   render)           ; Balloon -> Image
            (on-key    handle-key)))     ; Balloon KeyEvent -> Balloon

;; Balloon -> Balloon
;; produce the next balloon being tossed
(check-expect (advance-balloon (make-balloon  0 270)) (make-balloon (+ SPEED2 0) (+ ROTATION2 270)))
(check-expect (advance-balloon (make-balloon 50 360)) (make-balloon (+ SPEED2 50) (+ ROTATION2 0)))

(define (advance-balloon b)
  (make-balloon (move-balloon b) (rotate-balloon b)))

;; Balloon -> Number[0, 360]
;; rotates the balloon, not surpassing 360 by ROTATION2
(check-expect (rotate-balloon (make-balloon  0 360))  (+ 0 ROTATION2))
(check-expect (rotate-balloon (make-balloon  0 330))                0)

(define (rotate-balloon b) (modulo (+ (balloon-rotation b) ROTATION2) 360))

;; Balloon -> Number
;; Move the balloon by adding SPEED2
(check-expect (move-balloon (make-balloon  0 360))    (+   0 SPEED2))
(check-expect (move-balloon (make-balloon  570 330))  (+ 570 SPEED2))

(define  (move-balloon b) (+ (balloon-position b) SPEED2))

;; Balloon -> Image
;; render the balloon image
(check-expect (render (make-balloon 0 0))
              (place-image (rotate ROTATION2 BALLOON-IMG) SPEED2 CTR-Y2 MTS2))
(check-expect (render (make-balloon 330 50))
              (place-image (rotate (+ 50 ROTATION2) BALLOON-IMG) (+ 330 SPEED2) CTR-Y2 MTS2))

(define (render b)
  (place-image (rotate (rotate-balloon b) BALLOON-IMG) (move-balloon b) CTR-Y2 MTS2))

(rotate 40 BALLOON-IMG)

;; Balloon KeyEvent -> Balloon
;; Restart the balloon toss
(check-expect (handle-key (make-balloon 50 360) " ") (make-balloon 0 0))
(check-expect (handle-key (make-balloon 50 360) "a") (make-balloon 50 360))
(define (handle-key b ke)
  (cond [(key=? ke " ") (make-balloon 0 0)]
        [else b]))


