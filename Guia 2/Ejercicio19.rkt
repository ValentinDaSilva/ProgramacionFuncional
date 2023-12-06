#lang racket

(define (reemplazar lista X Y)
    (if (null? lista)
        '()
        (if (equal? (car lista) X)
            (cons Y (reemplazar (cdr lista) X Y))
            (cons (car lista) (reemplazar (cdr lista) X Y))
        )
    )
)