#lang racket

;dada una lista y dos elementos determinar si son consecutivos

(define (consecutivos? lista elemento1 elemento2)
    (cond
        ((null? (cdr lista)) #f)
        ((and (equal? (car lista) elemento1) (equal? (cadr lista) elemento2)) #t)
        (else 
            (consecutivos? (cdr lista) elemento1 elemento2)
        )
    )
)