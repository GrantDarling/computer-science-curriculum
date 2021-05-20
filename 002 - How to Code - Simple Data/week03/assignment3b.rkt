
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






