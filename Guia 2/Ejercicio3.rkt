#lang racket
; longitud de una lista

(define (longitud lista)
    (if (null? lista)
        0
        (+ 1 (longitud (cdr lista)))
    )
)