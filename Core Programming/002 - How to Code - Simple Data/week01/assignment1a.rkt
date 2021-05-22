;; Assignment 1a

 (require 2htdp/image)

; 
; PROBLEM:
; 
; Assume that the two short sides of a right triangle have length 3 and 4.
; What is the length of the long side? Recall that the Pythagorean Theorem
; tells us that:
; 
; .
; Write a BSL expression that produces the the value of ? for this triangle 
; where the other two sides have lengths 3 and 4.
; 


; #1
(sqrt (+ (sqr 3) (sqr 4)))

; 
; PROBLEM:
; 
; Write two expressions that multiply the numbers 3, 5 and 7. 
; The first should take advantage of the fact that * can accept more than 2 arguments. 
; The second should build up the result by first multiplying 3 times 5 and then multiply the result of that by 7. 
; 


; #2
(* 3 5 7)
(* 3 (* 5 7))

; PROBLEM: 
; 
; Write the BSL expression that represents the arithmetic expression:     
; (6 + 3) * (9 - 7)
; which equals 18.  Do not just write 18! Instead, write a BSL expression that clearly 
; mirrors the arithmetic expression.
; 


; #3
(* (+ 6 3) (- 9 7))

; 
; PROBLEM:
; 
; Write the BSL expression that represents the arithmetic expression (7 - 2) * 4 which equals 20. 
; Do not just write 20! Instead write BSL expression that clearly mirrors  (7 - 2) * 4.
; 


; #4
(* (- 7 2) 4)

; 
; PROBLEM:
; 
; Write out the step-by-step evaluation for the following expression: 
; 
; (+ (* 2 3) (/ 8 2))
; 


; #5
(+ (* 2 3) (/ 8 2))
(+ 6 (/ 8 2))
(+ 6 4)
10


; 
; PROBLEM:
; 
; Write out the step-by-step evaluation for the following expression: 
; 
; (* (string-length "foo") 2)
; 


; #6
(* (string-length "foo") 2)
(* 3 2)
6


; 
; PROBLEM:
; 
; Use the DrRacket square, beside and above functions to create an image like this one:
; 
; .
; 
; If you prefer to be more creative feel free to do so. You can use other DrRacket image 
; functions to make a more interesting or more attractive image.
; 


; #7

(define (square-piece c)
        (square 40 "solid" c))

(define (square-beside fst-c snd-c)
        (beside (square-piece fst-c)
                (square-piece snd-c)))

(above (square-beside "blue" "yellow")
       (square-beside "yellow" "blue"))

; 
; PROBLEM:
; 
; Based on the two constants provided, write three expressions to determine whether: 
; 
; 1) IMAGE1 is taller than IMAGE2
; 2) IMAGE1 is narrower than IMAGE2
; 3) IMAGE1 has both the same width AND height as IMAGE2
; 


; #8

(define IMAGE1 (rectangle 10 15 "solid" "red"))
(define IMAGE2 (rectangle 15 10 "solid" "red"))

(> (image-height IMAGE1) (image-height IMAGE2))
(> (image-width IMAGE1) (image-width IMAGE2))

(and (= (image-height IMAGE1) (image-height IMAGE2))
     (= (image-width IMAGE1) (image-width IMAGE2)))

; PROBLEM:
; 
; Given the following function definition:
; 
; (define (foo n)
;   (* n n))
; 
; Write out the step-by-step evaluation of the expression: 
; 
; (foo (+ 3 4))
; 
; Be sure to show every intermediate evaluation step.
; 


; #9
(define (foo n)
  (* n n))

(foo (+ 3 4))
(foo 7)
(* 7 7)
49


; 
; PROBLEM:
; 
; Write a function that consumes two numbers and produces the larger of the two. 
; 


; #10

(define (eval-greater x y)
        (if (> x y)
            x
            y))

(eval-greater 1 2)
(eval-greater 10 2)


; 
; PROBLEM:
; 
; Given the following function definition:
; 
; (define (foo s)
;   (if (string=? (substring s 0 1) "a")
;       (string-append s "a")
;       s))
; 
; Write out the step-by-step evaluation of the expression: 
; 
; (foo (substring "abcde" 0 3))
; 
; Be sure to show every intermediate evaluation step.
; 


; #11

(define (foo2 s)
  (if (string=? (substring s 0 1) "a")
      (string-append s "a")
      s))

(foo2 (substring "abcde" 0 3))

(foo2 "abc")

(if (string=? (substring "abc" 0 1) "a")
      (string-append "abc" "a")
      "abc")

(if (string=? "a" "a")
      (string-append "abc" "a")
      "abc")

(if   true
      (string-append "abc" "a")
      "abc")

(string-append "abc" "a")

"abca"



