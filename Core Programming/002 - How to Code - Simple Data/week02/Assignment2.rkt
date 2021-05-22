;; Assignment 2

 (require 2htdp/image)
 (require racket/format)

;; #1
;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are assigned to develop a system that will classify 
; buildings in downtown Vancouver based on how old they are. 
; According to city guidelines, there are three different classification levels:
; new, old, and heritage.
; 
; Design a data definition to represent these classification levels. 
; Call it BuildingStatus.
; 


;; BuildingStatus is one of:
;;  - "new"
;;  - "old"
;;  - "heritage"
;; interp. classification of building by age

;; <examples redundant for enumeration>

#;
(define (fn-for-building-status bs)
  (cond [(string=? "new" bs) (...)]
        [(string=? "old" bs) (...)]
        [(string=? "heritage" bs) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;   - atomic distinct: "new"
;;   - atomic distinct: "old"
;;   - atomic distinct: "heritage"

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; The city wants to demolish all buildings classified as "old". 
; You are hired to design a function called demolish? 
; that determines whether a building should be torn down or not.
; 


;; BuildingStatus -> Boolean
;; checks if building should be demolished
(check-expect (demolish? "old") true)
(check-expect (demolish? "new") false)
(check-expect (demolish? "heritage") false)

(define (demolish? bs)
  (cond [(string=? "old" bs) true]
        [(string=? "new" bs) false]
        [(string=? "heritage" bs) false]))

;; #2
;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are designing a program to track a rocket's journey as it descends 
; 100 kilometers to Earth. You are only interested in the descent from 
; 100 kilometers to touchdown. Once the rocket has landed it is done.
; 
; Design a data definition to represent the rocket's remaining descent. 
; Call it RocketDescent.
; 



;; RocketDescent is one of:
;; - Natural[0, 100]
;; - false
;; Interp. false if rocket's descent has ended, otherwise number of kilometers left to Earth
(define RD1 false)  ; rocket has reached descent
(define RD2  50)    ; middle of descent

#;
(define (fn-for-rocket-descent rd)
  (cond [(false? rd) (...)]
        [(and (number?) (< 0 rd)
              (< rd 100)) (... rd)]))

;; Template rules used:
;;  - one of: 2 cases
;;   - atomic distinct: false
;;   - atomic non-distinct: Natural[0, 100]

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that will output the rocket's remaining descent distance 
; in a short string that can be broadcast on Twitter. 
; When the descent is over, the message should be "The rocket has landed!".
; Call your function rocket-descent-to-msg.
; 


;; RocketDescent -> String
;; outputs a Twitter update on rocket's descent distance
(check-expect (rocket-descent-to-msg false) (text "The rocket has landed!" 24 "black"))
(check-expect (rocket-descent-to-msg 50) (text "rocket is 50 km from landing" 24 "black"))
(check-expect (rocket-descent-to-msg 100) (text "rocket is 100 km from landing" 24 "black"))

(define (rocket-descent-to-msg rd)
  (cond [(false? rd)  (text "The rocket has landed!" 24 "black")]
        [(number? rd) (text (string-append "rocket is" " " (number->string rd) " " "km from landing") 24 "black")]))


;; Assignment 2

 (require 2htdp/image)
 (require racket/format)

;; #1
;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are assigned to develop a system that will classify 
; buildings in downtown Vancouver based on how old they are. 
; According to city guidelines, there are three different classification levels:
; new, old, and heritage.
; 
; Design a data definition to represent these classification levels. 
; Call it BuildingStatus.
; 


;; BuildingStatus is one of:
;;  - "new"
;;  - "old"
;;  - "heritage"
;; interp. classification of building by age

;; <examples redundant for enumeration>

#;
(define (fn-for-building-status bs)
  (cond [(string=? "new" bs) (...)]
        [(string=? "old" bs) (...)]
        [(string=? "heritage" bs) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;   - atomic distinct: "new"
;;   - atomic distinct: "old"
;;   - atomic distinct: "heritage"

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; The city wants to demolish all buildings classified as "old". 
; You are hired to design a function called demolish? 
; that determines whether a building should be torn down or not.
; 


;; BuildingStatus -> Boolean
;; checks if building should be demolished
(check-expect (demolish? "old") true)
(check-expect (demolish? "new") false)
(check-expect (demolish? "heritage") false)

(define (demolish? bs)
  (cond [(string=? "old" bs) true]
        [(string=? "new" bs) false]
        [(string=? "heritage" bs) false]))

;; #2
;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are designing a program to track a rocket's journey as it descends 
; 100 kilometers to Earth. You are only interested in the descent from 
; 100 kilometers to touchdown. Once the rocket has landed it is done.
; 
; Design a data definition to represent the rocket's remaining descent. 
; Call it RocketDescent.
; 



;; RocketDescent is one of:
;; - Natural[0, 100]
;; - false
;; Interp. false if rocket's descent has ended, otherwise number of kilometers left to Earth
(define RD1 false)  ; rocket has reached descent
(define RD2  50)    ; middle of descent

#;
(define (fn-for-rocket-descent rd)
  (cond [(false? rd) (...)]
        [(and (number?) (< 0 rd)
              (< rd 100)) (... rd)]))

;; Template rules used:
;;  - one of: 2 cases
;;   - atomic distinct: false
;;   - atomic non-distinct: Natural[0, 100]

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that will output the rocket's remaining descent distance 
; in a short string that can be broadcast on Twitter. 
; When the descent is over, the message should be "The rocket has landed!".
; Call your function rocket-descent-to-msg.
; 


;; RocketDescent -> String
;; outputs a Twitter update on rocket's descent distance
(check-expect (rocket-descent-to-msg false) (text "The rocket has landed!" 24 "black"))
(check-expect (rocket-descent-to-msg 50) (text "rocket is 50 km from landing" 24 "black"))
(check-expect (rocket-descent-to-msg 100) (text "rocket is 100 km from landing" 24 "black"))

(define (rocket-descent-to-msg rd)
  (cond [(false? rd)  (text "The rocket has landed!" 24 "black")]
        [(number? rd) (text (string-append "rocket is" " " (number->string rd) " " "km from landing") 24 "black")]))


