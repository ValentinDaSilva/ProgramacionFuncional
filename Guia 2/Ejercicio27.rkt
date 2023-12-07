#lang racket

(define cuadrado (lambda ( y ) (* y y ) ))

(define (repetir funcion argumento veces)
    (if (equal? veces 1)
        (funcion argumento)
        (funcion (repetir funcion argumento (- veces 1)))
    )
)

(display (repetir cuadrado 5 2))