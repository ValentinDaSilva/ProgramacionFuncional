#lang racket
; factorial de un numero

(define (factorial x) 
    (if (> x 2)
        (* x (factorial (- x 1)))
        2
    )
) 
