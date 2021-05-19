;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


; Problem 1:
; 
; Consider the above data definition for the age of a person.
; 
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).


;; Age -> Boolean
;; Checks if person is a teenager (between ages 13 and 19)
(check-expect (teenager? 0)  false)
(check-expect (teenager? 12) false)
(check-expect (teenager? 13)  true)
(check-expect (teenager? 19)  true)
(check-expect (teenager? 20) false)

(define (teenager? a)
  (cond [(and (>= a 13) (<= a 19)) true]
        [else false]))



; Problem 2:
; 
; Design a data definition called MonthAge to represent a person's age
; in months.


;; MonthAge is Natural
;; interp. The age of a person in months

(define MA0 24) ; a person that is 2 years old (in months)
(define MA1 48) ; a person that is 4 years old (in months)

#;
(define (fn-for-age-in-months a)
  (... a))

;; Template rules used:
;;  - atomic non-distinct: Natural

; Problem 3:
; 
; Design a function called months-old that takes a person's age in years 
; and yields that person's age in months.
; 


;; Age -> MonthAge
;; converts a persons age to months (assuming no additional months in age)
(check-expect (months-old 0) 0)
(check-expect (months-old 2) 24)
(check-expect (months-old 4) 48)
(check-expect (months-old 65) (* 65 12))

(define (months-old a)
  (* a 12))


; Problem 4:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
;   - if they are dead (which is shockingly poor health)
;   - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character.  The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.



;; Health is one of:
;;    - false
;;    - Natural
;; interp. false means dead, number is x additional lives of player

(define H1 false)
(define H2 3) 

#;
(define (fn-for-health h)
  (cond [(false? h) (...)]
        [(number? h) (... h)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural


;; Health -> Health
;; if player is not dead, increases the lives by one, else return "player is dead"
(check-expect (increase-health false) "player is dead")
(check-expect (increase-health 50) 51)
(check-expect (increase-health  0)  1)
(check-expect (increase-health  3)  4)

(define (increase-health h)
  (cond [(false? h) "player is dead"]
        [(number? h) (+ 1 h)]))