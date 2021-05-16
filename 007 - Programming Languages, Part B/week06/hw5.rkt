;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0

;; a closure is not in "source" programs; it is what functions evaluate to
(struct closure (env fun) #:transparent) 

;; Problem 1

(define (racketlist->mupllist l)
  (cond [(null? l) (aunit)]
        [else (apair (car l) (racketlist->mupllist (cdr l)))]))

(define (mupllist->racketlist l)
  (cond [(aunit? l) null]
        [else (cons (apair-e1 l) (mupllist->racketlist (apair-e2 l)))]))

;; Problem 2

;; lookup a variable in an environment
;; Do NOT change this function
(define (envlookup env str)
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

;; Do NOT change the two cases given to you.  
;; DO add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though
;; "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond [(var? e) 
         (envlookup env (var-string e))]
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))]
        [(int? e) e]
        [(closure? e) e]
        [(fun? e) (closure env e)]
        [(call? e) 
         (let ([v1 (eval-under-env (call-funexp e) env)]
               [v2 (eval-under-env (call-actual e) env)])
           (cond [(closure? v1)
                  (let*
                     ([f1 (closure-fun v1)]
                      [f2 (closure-env v1)]
                      [fx (cons (fun-nameopt f1) v1)]
                      [f  (cons (fun-formal f1) v2)])
                 (eval-under-env (fun-body f1)
                  (if (eq? (car fx) #f)
                      (cons f f2)
                      (cons f (cons fx f2)))))]
                [else (error "MUPL call applied to non-closure")]))]
         [(ifgreater? e) 
         (let ([v1 (eval-under-env (ifgreater-e1 e) env)]
               [v2 (eval-under-env (ifgreater-e2 e) env)])
           (cond [(and (int? v1)(int? v2)) (if (> (int-num v1)(int-num v2))
                                               (eval-under-env (ifgreater-e3 e) env)
                                               (eval-under-env (ifgreater-e4 e) env))]
                 [else (error "MUPL ifgreater applied to non-number")]))]
        [(mlet? e)
         (let ([v1 (eval-under-env (mlet-e e) env)])
           (eval-under-env (mlet-body e) (cons (cons (mlet-var e) v1) env)))]
        [(apair? e)
         (apair (eval-under-env (apair-e1 e) env)(eval-under-env (apair-e2 e) env))]
        [(fst? e)
         (let ([v1 (eval-under-env (fst-e e) env)])
           (cond [(apair? v1) (apair-e1 v1)]
                 [else (error "MUPL fst applied to non-pair")]))]
        [(snd? e)
         (let ([v1 (eval-under-env (snd-e e) env)])
           (cond [(apair? v1) (apair-e2 v1)]
                 [else (error "MUPL snd applied to non-pair")]))]
        [(aunit? e) e]
        [(isaunit? e) 
         (cond [(aunit? (eval-under-env (isaunit-e e) env)) (int 1)]
               [else (int 0)])]
        [#t (begin (print e) (error "bad MUPL expression"))]))


;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))

(eval-exp (call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1)))
        
;; Problem 3

(define (ifaunit e1 e2 e3) (if (eq? aunit e1) e2 e3))

(define (mlet* lstlst e2) 
  (cond [(null? lstlst) e2]
        [else (mlet (car (car lstlst)) (cdr (car lstlst)) (mlet* (cdr lstlst) e2))]))

(define (ifeq e1 e2 e3 e4) 
  (mlet* (list (cons "x1" e1) (cons "x2" e2))
         (ifgreater (var "x1") (var "x2")
                    e4
                    (ifgreater (var "x2") (var "x1") e4 e3))))

;; Problem 4

(define mupl-map
  (fun #f "f" (fun "loop" "xs" (ifgreater 
                    (isaunit (var "xs")) 
                    (int 0) (aunit)
                    (apair (call (var "f") (fst (var "xs"))) (call (var "loop") (snd (var "xs"))))))))

(define mupl-mapAddN 
  (mlet "map" mupl-map
        (fun #f "i" (call (var "map") (fun #f "x" (add (var "x") (var "i")))))))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))