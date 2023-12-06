#lang racket
; sumar elementos de una lista

(define (suma-elementos lista)
    (if (null? lista)
        0
        (+ (car lista) (suma-elementos (cdr lista)))
    )
)