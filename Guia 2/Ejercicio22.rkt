#lang racket

; obtener todos los atomos de una lista

(define (listarAtomos lista)
    (cond
        ((null? lista) '())
        ((list? (car lista))
            (append (listarAtomos (car lista)) (listarAtomos (cdr lista)))
        )
        (else
            (append (list (car lista)) (listarAtomos (cdr lista)))
        )   
    )
)