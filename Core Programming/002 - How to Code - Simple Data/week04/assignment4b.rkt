;; #1

; 
; Consider the following alternative type comment for Eva's school tuition 
; information program. Note that this is just a single type, with no reference, 
; but it captures all the same information as the two types solution in the 
; videos.
; 
; (define-struct school (name tuition next))
; ;; School is one of:
; ;;  - false
; ;;  - (make-school String Natural School)
; ;; interp. an arbitrary number of schools, where for each school we have its
; ;;         name and its tuition in USD
; 
; (A) Confirm for yourself that this is a well-formed self-referential data 
;     definition.
; 
; (B) Complete the data definition making sure to define all the same examples as 
;     for ListOfSchool in the videos.
; 
; (C) Design the chart function that consumes School. Save yourself time by 
;     simply copying the tests over from the original version of chart.
; 
; (D) Compare the two versions of chart. Which do you prefer? Why?
; 


;; #1 a) has a self-reference case and a base case

;; #1 b)

(define-struct school (name tuition next))
;; School is one of:
;;  - false
;;  - (make-school String Natural School)
;; interp. an arbitrary number of schools, where for each school we have its
;;         name and its tuition in USD

(define S1 false)
(define S2 (make-school "School1" 27797 
                        (make-school "School2" 23300 
                                     (make-school "School3" 28500 false))))
#;
(define (fn-for-school s)
  (cond [(false? s) (...)]
        [else 
         (...(school-name s)
             (school-tuition s)
             (fn-for-school(school-next s)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: false
;;  - compound: (make-school String Natural School)
;;  - atomic non-distinct: (school-name s) is String
;;  - atomic non-distinct: (school-tuition s) is Natural
;;  - self-reference: (school-next s) is School

;; #1 c)

;; Constants:

;; Font
(define FONT-SIZE 24)
(define FONT-COLOR "black")

;; Bar
(define Y-SCALE   1/200)
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")

;; Schools -> Image
;; produce bar chart showing names and tuitions of consumed schools
(check-expect (chart false) (square 0 "solid" "white"))
(check-expect (chart (make-school "S1" 8000 false))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "S1" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "solid" BAR-COLOR))
                            (square 0 "solid" "white")))

(check-expect (chart (make-school "S2" 12000 (make-school "S1" 8000 false))) 
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "S2" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH (* 12000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 12000 Y-SCALE) "solid" BAR-COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "S1" FONT-SIZE FONT-COLOR))
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 8000 Y-SCALE) "solid" BAR-COLOR))
                            (square 0 "solid" "white")))

(define (chart s)
  (cond [(false? s) (square 0 "solid" "white")]
        [else
         (beside/align "bottom" 
                       (overlay/align "center" "bottom"
                                      (rotate 90 (text (school-name s) FONT-SIZE FONT-COLOR))
                                      (rectangle BAR-WIDTH (* (school-tuition s) Y-SCALE) "outline" "black")
                                      (rectangle BAR-WIDTH (* (school-tuition s) Y-SCALE) "solid" BAR-COLOR))
                       (chart (school-next s)))]))


;; #2


(require 2htdp/image)
(require 2htdp/universe)

; PROBLEM:
; 
; In this problem you will design another world program. In this program the changing 
; information will be more complex - your type definitions will involve arbitrary 
; sized data as well as the reference rule and compound data. But by doing your 
; design in two phases you will be able to manage this complexity. As a whole, this problem 
; will represent an excellent summary of the material covered so far in the course, and world 
; programs in particular.
; 
; This world is about spinning bears. The world will start with an empty screen. Clicking
; anywhere on the screen will cause a bear to appear at that spot. The bear starts out upright,
; but then rotates counterclockwise at a constant speed. Each time the mouse is clicked on the 
; screen, a new upright bear appears and starts spinning.
; 
; So each bear has its own x and y position, as well as its angle of rotation. And there are an
; arbitrary amount of bears.
; 
; To start, design a world that has only one spinning bear. Initially, the world will start
; with one bear spinning in the center at the screen. Clicking the mouse at a spot on the
; world will replace the old bear with a new bear at the new spot. You can do this part 
; with only material up through compound. 
; 
; Once this is working you should expand the program to include an arbitrary number of bears.
; 
; Here is an image of a bear for you to use: .


;; Spinning Bears

;; =================
;; Constants:

(define WIDTH 400)
(define HEIGHT 600)

(define SPEED 3)

(define MTS (empty-scene WIDTH HEIGHT))

(define BEAR-IMG .)

;; =================
;; Data definitions:

(define-struct bear (x y r))
;; Bear is (make-bear Number[0,WIDTH] Number[0,HEIGHT] Integer)
;; interp.  (make-bear x y r) is the state of a bear, where
;;  x is the x coordinate in pixels,
;;  y is the y coordinate in pixels, and
;;  r is the angle of rotation in degrees

(define B1 (make-bear 0 0 0)) ; bear in the upper left corner
(define B2 (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90)) ; sideways bear in the middle

#;
(define (fn-for-bear b)
  (... (bear-x b)     ; Number[0,WIDTH]
       (bear-y b)     ; Number[0,HEIGHT]
       (bear-r b)))   ; Integer

;; Template Rules Used:
;; - compound: 3 fields


;; ListOfBear is one of:
;; - empty
;; - (cons Bear ListOfBear)
(define LB0 empty)
(define LB1 (cons B1 empty))
(define LB2 (cons B1 (cons B2 empty)))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else 
         (... (fn-for-bear (first lob))
              (fn-for-lob (rest lob)))]))

;; Template Rules Used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: 2 fields
;; - reference: (first lob) is Bear
;; - self-reference: (rest lob) is ListOfBear

;; =================
;; Functions:

;; ListOfBear -> ListOfBear
;; start the world with (main empty)
;; 
(define (main lob)
  (big-bang lob                         ; ListOfBear
            (on-tick   spin-bears)      ; ListOfBear -> ListOfBear
            (to-draw   render-bears)    ; ListOfBear -> Image
            (on-mouse  handle-mouse)))  ; ListOfBear Integer Integer MouseEvent -> ListOfBear

;; ListOfBear -> ListOfBear
;; spin all of the bears forward by SPEED degrees

(check-expect (spin-bears empty) empty)
(check-expect (spin-bears 
               (cons (make-bear 0 0 0) empty))
              (cons (make-bear 0 0 (+ 0 SPEED)) empty))
(check-expect (spin-bears 
               (cons (make-bear 0 0 0)
                     (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) 
                           empty)))
              (cons (make-bear 0 0 (+ 0 SPEED))
                    (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) (+ 90 SPEED)) empty)))               

(define (spin-bears lob)
  (cond [(empty? lob) empty]
        [else
         (cons (spin-bear (first lob))
               (spin-bears (rest lob)))]))


;; Bear -> Bear
;; spin a bear forward by SPEED degrees

(check-expect (spin-bear (make-bear 0 0 0)) (make-bear 0 0 (+ 0 SPEED)))
(check-expect (spin-bear (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90)) 
              (make-bear (/ WIDTH 2) (/ HEIGHT 2) (+ 90 SPEED)))

(define (spin-bear b)
  (make-bear (bear-x b)
             (bear-y b)
             (+ (bear-r b) SPEED)))


;; ListOfBear -> Image
;; render the bears onto the empty scene

(check-expect (render-bears empty) MTS)
(check-expect (render-bears (cons (make-bear 0 0 0) empty))
              (place-image (rotate 0 BEAR-IMG) 0 0 MTS))
(check-expect (render-bears 
               (cons (make-bear 0 0 0)
                     (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) 
                           empty)))
              (place-image (rotate 0 BEAR-IMG) 0 0 
                           (place-image (rotate 90 BEAR-IMG) (/ WIDTH 2) (/ HEIGHT 2)
                                        MTS)))               

(define (render-bears lob)
  (cond [(empty? lob) MTS]
        [else 
         (render-bear-on (first lob) (render-bears (rest lob)))]))

;; Bear Image -> Image
;; render an image of the bear on the given image

(check-expect (render-bear-on (make-bear 0 0 0) MTS) (place-image (rotate 0 BEAR-IMG) 0 0 MTS))
(check-expect (render-bear-on (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) MTS)
              (place-image (rotate 90 BEAR-IMG) (/ WIDTH 2) (/ HEIGHT 2) MTS))

(define (render-bear-on b img)
  (place-image (rotate (modulo (bear-r b) 360) BEAR-IMG) (bear-x b) (bear-y b) img))

;; ListOfBear Integer Integer MouseEvent -> ListOfBear
;; On mouse-click, adds a bear with 0 rotation to the list at the x, y location
(check-expect (handle-mouse empty 5 4 "button-down") (cons (make-bear 5 4 0) empty))
(check-expect (handle-mouse empty 5 4 "move") empty)

(define (handle-mouse lob x y mev)
  (cond [(mouse=? mev "button-down") (cons (make-bear x y 0) lob)]
        [else lob]))