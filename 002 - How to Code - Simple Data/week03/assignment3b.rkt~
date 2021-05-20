(require 2htdp/image)
(require 2htdp/universe)

;; #1 Simple Countdown

; 
; PROBLEM:
; 
; Design a world program that represents a countdown. The program should 
; display the number of seconds remaining and should decrease at each 
; clock tick. Upon reaching zero, it should stay there and not change.
; 
; To make your countdown progress at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, 
; (on-tick advance-countdown 1) then big-bang will wait 1 second between 
; calls to advance-countdown.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Once you are finished the simple version of the program, you can improve
; it by reseting the countdown to ten when you press the spacebar.
; 

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
;; start the world with (main1 10)
;; 
(define (main1 ti)
  (big-bang ti                     ; TI
            (on-tick   countdown)  ; TI -> TI
            (to-draw   render1)
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
(check-expect (render1 10) (place-image (text (number->string 10) TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))
(check-expect (render1 0) (place-image (text (number->string 0) TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))
(define (render1 ti)
  (place-image (text (number->string ti) TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))

;; TI KeyEvent -> TI
;; reset the countdown to 10 when the spacebar is pressed
(check-expect (handle-key 0 " ") 10)
(check-expect (handle-key 5 " ") 10)
(check-expect (handle-key 5 "left") 5)

(define (handle-key cd ke)
  (cond [(key=? ke " ") 10]
        [else cd]))


(require 2htdp/image)
(require 2htdp/universe)

;; #2 Traffic Light

; 
; PROBLEM:
; 
; Design an animation of a traffic light. 
; 
; Your program should show a traffic light that is red, then green, 
; then yellow, then red etc. For this program, your changing world 
; state data definition should be an enumeration.
; 
; Here is what your program might look like if the initial world 
; state was the red traffic light:
; .
; Next:
; .
; Next:
; .
; Next is red, and so on.
; 
; To make your lights change at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
; then big-bang will wait 1 second between calls to next-color.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles. 
; 


(require 2htdp/image)
(require 2htdp/universe)

;; Traffic Light Simulator

;; =================
;; Constants:
(define WIDTH2 600)
(define HEIGHT2 400)

(define CTR-X2 (/ WIDTH2 2))
(define CTR-Y2 (/ HEIGHT2 2))

(define REDL-IMG    .)
(define YELLOWL-IMG .)
(define GREENL-IMG  .)


;; =================
;; Data definitions:

;; TrafficLight is one of:
;;  - "red"
;;  - "yellow"
;;  - "green"
;; interp. the color of a traffic light

;; <examples are redundant for enumerations>
 
#;
(define (fn-for-light-state ls)
  (cond [(string=? "red" ls) (...)]
        [(string=? "yellow" ls) (...)]
        [(string=? "green" ls) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"

;; =================
;; Functions:

;; LightState -> LightState
;; display the various states of a traffic light
;; 
(define (main ls)
  (big-bang ls                                 ; LightState
            (on-tick   advance-light-state 1)    ; LightState -> LightState
            (to-draw   render)))               ; LightState -> Image

;; LightState -> LightState
;; produce the next light state
(check-expect (advance-light-state "red") "green")
(check-expect (advance-light-state "green") "yellow")
(check-expect (advance-light-state "yellow") "red")

(define (advance-light-state ls)
         (cond [(string=? ls "red") "green"]
               [(string=? ls "green") "yellow"]
               [(string=? ls "yellow") "red"]))


;; LightState -> Image
;; render LightState as an image
(check-expect (render "red")    REDL-IMG)
(check-expect (render "green")  GREENL-IMG)
(check-expect (render "yellow") YELLOWL-IMG)

(define (render ls)
  (cond [(string=? ls "red") REDL-IMG]
        [(string=? ls "green") GREENL-IMG]
        [(string=? ls "yellow") YELLOWL-IMG]))
