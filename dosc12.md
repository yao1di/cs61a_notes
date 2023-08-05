### Q1: Counting Eval and Apply

* ` scm> (+ 1 2)`

> 4 1

* ` scm> (+ 2 4 6 8)`

> 6 1

* ` scm> (+ 2 (* 4 (- 6 8)))` 

> 10 3

* ` scm> (and 1 (+ 1 0) 0)`

> 7 1

* ` scm> (and (+ 1 0) (< 1 0) (/ 1 0))`

> 9 2 

### Q2：From Pair to Calculator

` >>> Pair('+', Pair(1, Pair(2, Pair(3, Pair(4, nil)))))`

> (+ 1 2 3 4)

` >>> Pair('+', Pair(1, Pair(Pair('*', Pair(2, Pair(3, nil))), nil)))`

>(+ 1 (* 2 3) )

` >>> Pair('and', Pair(Pair('<', Pair(1, Pair(0, nil))), Pair(Pair('/', Pair(1, Pair(0, nil))), nil)))`

> (and (< 1 0) (/ 1 0))

## SQL

### Q3：Oliver Employees

> SELECT * FROM records WHERE supervisor="Oliver Warbucks";

### Q4:Self SUpervisor

> SELECT * FROM records WHERE supervisor="Oliver Warbucks"

### Q5: Rich Employees

> SELECT name FROM records WHERE salary > 50000;

### Q6: Rasie

> SELECT name FROM salaries ORDER BY (salary2023-salary2022) desc;

## Q7 Longest increasing subsequence

```scheme
; helper function
; returns the values of lst that are bigger than x
; e.g., (larger-values 3 '(1 2 3 4 5 1 2 3 4 5)) --> (4 5 4 5)
(define (larger-values x lst)
    (filter (lambda (item) (> item x)) lst)
)

(define (longest-increasing-subsequence lst)
    (if (null? lst)
        nil
        (begin
            (define first (car lst))
            (define rest (cdr lst))
            (define large-values-rest
                (larger-values first rest))
            (define with-first
                (cons first (longest-increasing-subsequence large-values-rest)))
            (define without-first
                (longest-increasing-subsequence rest))
            (if (> (length with-first) (length without-first))
                with-first
                without-first))))

(expect (longest-increasing-subsequence '()) ())
(expect (longest-increasing-subsequence '(1)) (1))
(expect (longest-increasing-subsequence '(1 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 8 7 6 5 4 3 2 3)) (1 2 3))
(expect (longest-increasing-subsequence '(1 9 8 7 2 3 6 5 4 5)) (1 2 3 4 5))
(expect (longest-increasing-subsequence '(1 2 3 4 9 3 4 1 10 5)) (1 2 3 4 9 10))
```