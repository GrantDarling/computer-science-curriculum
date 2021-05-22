(require 2htdp/image)

;; #1

; 
; PROBLEM:
; 
; Design a function that consumes a BST and produces the sum of all
; the keys in the BST.
; 


;; Constants

;; Data definitions:

(define-struct node (key val l r))
;; A BST (Binary Search Tree) is one of:
;;  - false
;;  - (make-node Integer String BST BST)
;; interp. false means no BST, or empty BST
;;         key is the node key
;;         val is the node val
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;     key is > all keys in its l(eft)  child
;;     key is < all keys in its r(ight) child
;;     the same key never appears twice in the tree

(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42 
  (make-node 42 "ily"
             (make-node 27 "wit" (make-node 14 "olp" false false) false)
             false))
(define BST10 (make-node 10 "why" BST3 BST42))

; .

#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)    ;Integer
              (node-val t)    ;String
              (fn-for-bst (node-l t))
              (fn-for-bst (node-r t)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic-distinct: false
;;  - compound: (make-node Integer String BST BST)
;;  - self reference: (node-l t) has type BST
;;  - self reference: (node-r t) has type BST


(check-expect (sum-bst-keys BST4) 11)
(check-expect (sum-bst-keys BST3) 15)
(check-expect (sum-bst-keys BST42) 83)

;; BST -> Natural
;; sums all keys of a BST
(define (sum-bst-keys t)
  (cond [(false? t) 0]
        [else
         (+ (node-key t)
            (sum-bst-keys (node-l t))
            (sum-bst-keys (node-r t)))]))


;; #2

;; Integer String BST -> BST
;; produce new BST in which key, val pair have been inserted in proper place

(check-expect (insert 2 "b" false) 
              (make-node 2 "b" false false))
(check-expect (insert 1 "a" 
                      (make-node 2 "b" false false))
              (make-node 2 "b" (make-node 1 "a" false false) false))
(check-expect (insert 3 "c" 
                      (make-node 2 "b" (make-node 1 "a" false false) false))
              (make-node 2 "b" 
                         (make-node 1 "a" false false)
                         (make-node 3 "c" false false)))

(define (insert key val bst)
  (cond [(false? bst) (make-node key val false false)]
        [else
         (if (< key (node-key bst))
             (make-node (node-key bst) 
                        (node-val bst) 
                        (insert key val (node-l bst))
                        (node-r bst))
             (make-node (node-key bst) 
                        (node-val bst) 
                        (node-l bst)
                        (insert key val (node-r bst))))]))



