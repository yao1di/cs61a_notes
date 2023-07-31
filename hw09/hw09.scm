(define (ascending? asc-lst) 
 (cond ((null? asc-lst) #t)
    ((null? (cdr asc-lst)) #t)
    (else (if (> (car asc-lst) (car (cdr asc-lst)))
        #f
        (and #t (ascending? (cdr asc-lst)))))
    ))

(define (my-filter pred s) 
(cond ((null? s) ())  
(else (if (pred (car s))
    (cons (car s) (my-filter pred (cdr s)))
    (my-filter pred (cdr s)))))
)

(define (interleave lst1 lst2) 
(cond ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (cons (car lst1) (interleave lst2 (cdr lst1))))
    ))

(define (no-repeats lst) (cond 
    ((null? lst) ())
    (else (cons (car lst) (no-repeats (my-filter (lambda (x) (not (= x (car lst)))) (cdr lst)))))
    );;;此题简单来说就是将列表中剩下的等于第一个元素的项都删了然后载进行迭代
    )
