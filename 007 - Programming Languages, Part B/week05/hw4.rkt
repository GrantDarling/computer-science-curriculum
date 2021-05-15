#lang racket
(provide (all-defined-out))

; #1
(define (sequence low high stride)
    (cond
      [(<= low high) (cons low (sequence (+ low stride) high stride))]
      [else null ]))

; #2
(define (string-append-map xs suffix)
        (map (lambda (x) (string-append x suffix)) xs))

; #3
(define (list-nth-mod  xs n)
        (cond [(< n 0) (error "list-nth-mod: negative number")]
              [(null? xs)  (error "list-nth-mod: empty list")]
              [else (car (list-tail xs
                         (remainder n (length xs))))]))
; #4
(define (stream-for-n-steps s n)
        (cond [(= n 0) null]
              [else (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))]))

; #5
(define (funny-number-stream)
        (letrec ([f (lambda (x) (cons x (lambda ()
                                        (cond [(= 0 (modulo (car (f (+ x 1))) 5)) (f (* -1 (+ x 1)))]
                                              [(< x 0) (f (+ (* x -1) 1))]
                                              [else    (f (+ x 1))]))))])
                                        (f 1)))
; #6
(define (dan-then-dog)
        (letrec ([f (lambda (x)
                    (cons x (lambda () 
                            (cond [(string=? (car (f x)) "dan.jpg")(f "dog.jpg")]
                                  [else   (f "dan.jpg")]))))])
                            (f "dan.jpg")))
; #7
(define (stream-add-zero s)
        (letrec ([f (lambda (x)
                      (cons (cons 0 (car (x)))
                            (lambda () (f (cdr (x))))))])
          (lambda () (f s))))

; # 8
(define (cycle-lists xs ys)
  (letrec ([f (lambda(n) (cons (cons
                       (list-nth-mod xs n)
                       (list-nth-mod ys n))
                       (lambda () (f (+ 1 n)))))])
  (lambda () (f 0))))

; #9
(define (vector-assoc v vec)
         (define (f n) (cond  [(equal? (vector-length vec) n) n]
                              [(not(pair? (vector-ref vec n))) (f (+ 1 n))]
                              [(= (car (vector-ref vec n)) v) (vector-ref vec n)]
                              [else (f (+ 1 n))]))
   (f 0))

; #10
(define (cached-assoc xs n) (assoc n xs))

; #11
(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (let ([n e1])
       (letrec ([loop (lambda (it)
                        (if (>= it n)
                            #t
                            (loop e2)))])
         (loop e2)))]))