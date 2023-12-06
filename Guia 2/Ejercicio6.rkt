#lang racket
; concatenar dos listas

(define (concatenar lista1 lista2)
    (cond 
        ((not (null? lista1)) (cons (car lista1) (concatenar (cdr lista1) lista2)))
        ((not (null? lista2)) (cons (car lista2) (concatenar lista1 (cdr lista2))))
        (else '())
    )
)
