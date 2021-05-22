; 
; PROBLEM:
; 
; Your friend has just given you a new pad, and it runs a prototype version of Racket. 
; 
; This is great, you can make it do anything. There's just one problem, this version of 
; racket doesn't include numbers as primitive data. There just are no numbers in it!
; 
; But you need natural numbers to write your next program.
; 
; No problem you say, because you remember the well-formed self-referential data definition 
; for Natural, as well as the idea that add1 is kind of like cons, and sub1 is kind of like
; rest. Your idea is to make add1 actually be cons, and sub1 actually be rest...
; 
; 


;; NATURAL is one of:
;;  - empty
;;  - (cons "!" NATURAL)
;; interp. a natural number, a number of "!" in the list is the number

(define N0 empty)         ;0
(define N1 (cons "!" N0)) ;1
(define N2 (cons "!" N1)) ;2
(define N3 (cons "!" N2)) ;3
(define N4 (cons "!" N3)) ;...
(define N5 (cons "!" N4))
(define N6 (cons "!" N5))
(define N7 (cons "!" N6))
(define N8 (cons "!" N7))
(define N9 (cons "!" N8))
  
(define (ZERO? n) (empty? n))     ;Any         -> Boolean
(define (ADD1  n) (cons "!" n))   ;NATURAL     -> NATURAL
(define (SUB1  n) (rest n))       ;NATURAL[>0] -> NATURAL

(define (fn-for-NATURAL n)
  (cond [(ZERO? n) (...)]
        [else
         (... n
              (fn-for-NATURAL (SUB1 n)))]))

;; NATURAL NATURAL -> NATURAL
;; produce a + b
(check-expect (ADD N2 N0) N2)
(check-expect (ADD N0 N3) N3)
(check-expect (ADD N3 N4) N7)

(define (ADD a b)
  (cond [(ZERO? b) a]
        [else
         (ADD (ADD1 a) (SUB1 b))]))

;; NATURAL NATURAL -> NATURAL
;; produce a - b
(check-expect (SUB N2 N0) N2)
(check-expect (SUB N3 N1) N2)
(check-expect (SUB N6 N2) N4)

(define (SUB a b)
  (cond [(ZERO? b) a]
        [else
         (SUB (SUB1 a) (SUB1 b))]))


(require 2htdp/image)

;; decreasing-image-starter.rkt

;  PROBLEM:
;  
;  Design a function called decreasing-image that consumes a Natural n and produces an image of all the numbers 
;  from n to 0 side by side. 
;  
;  So (decreasing-image 3) should produce .


;; Natural -> Image
;; produce an image of n, n-1, ... 0 side by side
(check-expect (decreasing-image 0) (text "0" 24 "black"))
(check-expect (decreasing-image 1) (beside (text "1" 24 "black")(text "0" 24 "black")))
(check-expect (decreasing-image 3) (beside (text "3" 24 "black")(text "2" 24 "black")(text "1" 24 "black")(text "0" 24 "black")))
 
(define (decreasing-image n)
  (cond [(= n 0) (text (number->string n) 24 "black")]
        [else (beside (text (number->string n) 24 "black")
                      (decreasing-image (sub1 n)))]))

;  PROBLEM:
;  
;  Design a function called odd-from-n that consumes a natural number n, and produces a list of all 
;  the odd numbers from n down to 1. 
;  
;  Note that there is a primitive function, odd?, that produces true if a natural number is odd.
;  


;; Natural -> ListOfNatural
;; Produce a list of all odd numbers counting down from n
(check-expect (odd-from-n 0) empty)
(check-expect (odd-from-n 1) (cons 1 empty))
(check-expect (odd-from-n 2) (cons 1 empty))
(check-expect (odd-from-n 9) (cons 9 (cons 7 (cons 5 (cons 3 (cons 1 empty))))))

(define (odd-from-n n)
  (cond [(= n 0) empty]
        [else (if (odd? n)
              (cons n (odd-from-n (sub1 n)))
              (odd-from-n (sub1 n)))]))

