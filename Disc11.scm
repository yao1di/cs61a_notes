
CS61A Scheme Web Interpreter
--------------------------------------------------------------------------------
Welcome to the 61A Scheme web interpreter! 
The source for this interpreter is restricted, but you'll build it yourself as your Scheme Project!

To visualize a list, call (draw <list>).
To draw list visualizations automatically, call (autodraw).
To view an environment diagram of your entire program, call (visualize).
To launch an editor associated with your console, call (editor).
To run a doctest, call (expect <expr> <output>).

scm> (define a 1)
a
scm> a
1
scm> (define b a)
b
scm> b
1
scm> (define c 'a)
c
scm> c
a
scm> (- 1 1)
0
scm> (* (+ 1 2) (+ 1 2))
9
scm> (define a (+ 1 2))
a
scm> a
3
scm> (define b (- (+ (*3 3) 2) 1))
Traceback (most recent call last):
 0	(define b (- (+ (*3 3) 2) 1))
 1	(- (+ (*3 3) 2) 1)
 2	(+ (*3 3) 2)
 3	(*3 3)
 4	*3
Error: unknown identifier: *3
scm> (define b (- (+ (* 3 3) 2) 1))
b
scm> (+ a b)
13
scm> (= (modulo b a) (quotient 5 3))
#t
scm> (if (or #t (/ 1 0)) 1 (/ 1 0))
1
scm> ((if (< 4 3) + -) 4 100)
-96
scm> scm> (cond
        ((and (- 4 4) (not #t)) 1)
        ((and (or (< 9 (/ 100 10)) (/ 1 0)) #t) -1)
        (else (/ 1 0))
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
...>     )
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
-1
scm> scm> (cond
        ((and (- 4 4) (not #t)) 1)
        ((and (or (< 9 (/ 100 10)) (/ 1 0)) #t) -1)
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
...>         (else (/ 1 0))
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
...> 
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
...> 
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
...> )
Traceback (most recent call last):
 0	scm>
Error: unknown identifier: scm>
-1
scm> (let ( (a (- 3 2)) (b (+ 5 7))) (* a b) (if (< (+ a b) b ) (/ a b) (/ b a)))
12
scm> (begin        (if (even? (+ 2 4))            (print (and 2 0 3))            (/ 1 0)        )        (+ 2 2)        (print 'lisp)        (or 2 0 3)    )
3
lisp
2
scm> (= #f 0)
Traceback (most recent call last):
 0	(= #f 0)
Error: operand 0 (False) is not a number
scm> nil
()
scm> (define lst (cons 1 (cons 2 (cons 3 nil))))
lst
scm> lst
(1 2 3)
scm> (car lst)
1
scm> (cdr lst)
(2 3)
scm> (list 1 2 3)
(1 2 3)
scm> (define a 61)
a
scm> a
61
scm> (quote a)
a
scm> 'a
a
scm> (quote (1 x 3))
(1 x 3)
scm> '(1 x 3)
(1 x 3)
scm> (define a 1)
a
scm> (define b 2)
b
scm> (list a b 3)
(1 2 3)
scm> '(a b 3)
(a b 3)
scm> (list 'a 'b 3)
(a b 3)
scm> (define a '(1 2 3))
a
scm> (= a a)
Traceback (most recent call last):
 0	(= a a)
Error: operand 0 ((1 2 3)) is not a number
scm> (equal? a '(1 2 3))
#t
scm> (eq? a '(1 2 3))
#f
scm> (cons 1 (cons 2 nil))
(1 2)
scm> (car (cons 1 (cons 2 nil)))
1
scm> (cdr (cons 1 (cons 2 nil)))
(2)
scm> (list 1 2 3)
(1 2 3)
scm> '(1 2 3)
(1 2 3)
scm> (cons 1 '(list 2 3))
(1 list 2 3)
scm> '(cons 4 (cons (cons 6 8) ()))
(cons 4 (cons (cons 6 8) ()))
scm> (cons 1 (list (cons 3 nil) 4 5))
(1 (3) 4 5)
scm> 

;;;-------------------------------------------------------------------------------

;;; Q2 List Making
;使用 `list`
(define with-list
    (list
        (list 'a 'b) 'c 'd (list 'e)
    )
)
(draw with-list)

;使用 `quote`
(define with-quote
    '(
        (a b) c d (e)
    )

)
(draw with-quote)

;使用 `cons`
(define helpful-list
   (cons 'a (cons 'b nil)))
(draw helpful-list)

(define another-helpful-list
    (cons 'c (cons 'd (cons (cons 'e nil) nil))))
(draw another-helpful-list)

(define with-cons
    (cons
        helpful-list another-helpful-list
    )
)
(draw with-cons)
;Q4 List Concatenation
(define (list-concat a b)
    (if (null? a)
         b
        (cons (car a) (list-concat (cdr a) b))
)
)

(expect (list-concat '(1 2 3) '(2 3 4)) (1 2 3 2 3 4))
(expect (list-concat '(3) '(2 1 0)) (3 2 1 0))

;; Q4:Remove
(define (remove item lst)
  (cond ((null? lst) '())
    ((equal? item (car lst)) (remove item (cdr lst)))
    (else (cons (car lst) (remove item (cdr lst)) ) ))
)



(expect (remove 3 nil) ())
(expect (remove 2 '(1 3 2)) (1 3))
(expect (remove 1 '(1 3 2)) (3 2))
(expect (remove 42 '(1 3 2)) (1 3 2))
(expect (remove 3 '(1 3 3 7)) (1 7))


;;Q5 List Duplicator
(define (duplicate lst)
    (if (null? lst)
        '()
        (cons (car lst)  (cons (car lst) (duplicate (cdr lst)))))
)

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))
(expect (duplicate '(1 1)) (1 1 1 1))