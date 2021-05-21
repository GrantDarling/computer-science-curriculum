
;; #1 
;; Data definitions:

; 
; Remember the data definition for a list of numbers we designed in Lecture 5f:
; (if this data definition does not look familiar, please review the lecture)
; 


;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;; =================
;; Functions:

; 
; PROBLEM:
; 
; Design a function that consumes a list of numbers and doubles every number 
; in the list. Call it double-all.
; 


;; ListOfNumber -> ListOfNumber
;; Doubles every number in list
(check-expect (double-all empty) empty)
(check-expect (double-all LON2) (cons  120 (cons 84 empty)))
(check-expect (double-all (cons 10 (cons 20 (cons 50 empty))))
              (cons 20 (cons 40 (cons 100 empty))))

(define (double-all lon)
  (cond [(empty? lon) empty]
        [else (cons (* 2 (first lon))
                 (double-all (rest lon)))]))


;; #2
;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of booleans. Call it ListOfBoolean. 
; 


;; ListOfBoolean is one of:
;;  - empty
;;  - (cons Number ListOfBoolean)
;; interp. a list of booleans
(define LOB1 empty)
(define LOB2 (cons true (cons false empty)))
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Boolean ListOfBoolean)
;;  - self-reference: (rest lob) is ListOfBoolean

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of boolean values and produces true 
; if every value in the list is true. If the list is empty, your function 
; should also produce true. Call it all-true?
; 



;; ListOfBooleans -> Boolean
;; Returns true if all list values return true
(check-expect (all-true? empty) true)
(check-expect (all-true? (cons true empty)) true)
(check-expect (all-true? (cons false empty)) false)
(check-expect (all-true? (cons false (cons false empty))) false)
(check-expect (all-true? (cons true (cons true empty))) true)

(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (cond [(false? (first lob)) false]
               [else (all-true? (rest lob))])]))


;; #3
;; =================
;; Data definitions:

; 
; Remember the data definition for a list of numbers we designed in Lecture 5f:
; (if this data definition does not look familiar, please review the lecture)
; 


;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON3 empty)
(define LON4 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;; =================
;; Functions:

; 
; PROBLEM:
; 
; Design a function that consumes a list of numbers and produces the largest number 
; in the list. You may assume that all numbers in the list are greater than 0. If
; the list is empty, produce 0.
; 


;; ListOfNumber -> Number
;; Returns the highest number
(check-expect (highest-number empty) 0)
(check-expect (highest-number (cons 10 empty)) 10)
(check-expect (highest-number (cons 8 (cons 100 empty))) 100)
(check-expect (highest-number (cons 99 (cons 8 (cons 100 empty)))) 100)

(define (highest-number lon)
  (cond [(empty? lon) 0]
        [else
         (cond [(empty? (rest lon))
                (first lon)]
               [(> (first lon) (first (rest lon)))
                (highest-number (cons (first lon) (rest (rest lon))))]
               [else (highest-number (rest lon))])]))

(require 2htdp/image)

;; #4

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of images. Call it ListOfImage. 
; 


;; ListOfImage is one of:
;;  - empty
;;  - (cons String ListOfImage)
;; interp. a list of images

(define LOI-1 empty)
(define LOI-2 (cons (rectangle 20 40 "solid" "red") empty))
(define LOI-3 (cons (rectangle 30 30 "solid" "blue") (cons (rectangle 10 20 "solid" "pink") empty)))
(define LOI-4 (cons (rectangle 30 30 "solid" "blue") (cons (rectangle 30 30 "solid" "blue") (cons (rectangle 10 20 "solid" "pink") empty))))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]                   ;BASE CASE
        [else (... (first loi)                 ;Image
                   (fn-for-loi (rest loi)))])) ;NATURAL RECURSION
;;             /
;;            /
;;       COMBINATION
;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Image ListOfImage)
;;  - self-reference: (rest loi) is ListOfImage


;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of images and produces a number 
; that is the sum of the areas of each image. For area, just use the image's 
; width times its height.
; 


;; ListOfImage -> Number
;; Sum of the area of each image
(check-expect (sum-images LOI-1) 0)
(check-expect (sum-images LOI-2) 800)
(check-expect (sum-images LOI-3) 1100)
(check-expect (sum-images LOI-4) 2000)

(define (sum-images loi)
  (cond [(empty? loi) 0]                   
        [else (+ (* (image-width (first loi)) (image-height (first loi)))                 
                   (sum-images (rest loi)))])) 


(image-width (first LOI-2))





