#lang racket

(define (Maximo LS) 
    (cond
        ((null? LS) 'Fallo)
        ((null? (cdr LS)) (car LS))
        (else (max (car LS) (Maximo (cdr LS))))
    )
)
