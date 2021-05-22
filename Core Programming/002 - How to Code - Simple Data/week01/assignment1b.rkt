;; Assignment 1b

 (require 2htdp/image)


; Problem:
; 
; Design a function that pluralizes a given word. (Pluralize means to convert the word to its plural form.)
; For simplicity you may assume that just adding s is enough to pluralize a word.



; #1

;; String -> String
;; pluralize the given word
(check-expect (pluralize "hat") "hats")

(define (pluralize s)
        (string-append s "s"))


; 
; PROBLEM:
; 
; DESIGN function that consumes a string and determines whether its length is
; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
; of the stub and template.
; 


; #2

;; String -> Boolean
;; Checks if string has less than 5 characters

(check-expect (less-than-5? "foo") true)
(check-expect (less-than-5? "foobar") false)
(check-expect (less-than-5? "fooey") false)

; (define (less-than-5? s) 0) ; stub

(define (less-than-5? s)
        (< (string-length s) 5))

; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes an image, 
; and appears to put a box around it. Note that you can do this by creating an "outline" 
; rectangle that is bigger than the image, and then using overlay to put it on top of the image. 
; For example:
; 
; (boxify (ellipse 60 30 "solid" "red")) should produce .
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 



; #3

;; Image -> Image
;; Add a box around given image
(check-expect (boxify (ellipse 60 30 "solid" "red")) (overlay (rectangle 60 30 "outline" "green")
                                                              (ellipse 60 30 "solid" "red")))

(define (boxify shape)
  (overlay (rectangle (image-width shape) (image-height shape) "outline" "green")
            shape))

; PROBLEM:
; 
; There may be more than one problem with this function design. Uncomment 
; the function design below, and make the minimal changes required to 
; resolve the error that occurs when you run it.
; 


; #4

;; Number -> Number
;; Multiply n by 2
(check-expect (double 0) 0)
(check-expect (double 4) 8)
(check-expect (double 3.3) (* 2 3.3))
(check-expect (double -1) -2)


;(define (double n) 0) ; stub

(define (double n)
  (* 2 n))
