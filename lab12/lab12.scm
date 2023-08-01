(define (substitute s old new) (cond 
((null? s) ())
((pair? (car s)) (cons  (substitute (car s) old new) (substitute (cdr s) old new)))
  ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
  (else (cons (car s) (substitute (cdr s) old new)))
  ))

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s)
  (if (null? s)
    0
    (if (eq? x (car s))
    (+ 1 (count x (cdr s)))
    (count x (cdr s))))
)

(define (unique s) 
(cond ((null? s) ())
  (else  (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))))
)

(define (tally names) 
(map 
(lambda (name) (list name (count name names)))
(unique names))
)
