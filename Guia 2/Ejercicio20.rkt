#lang racket

;dado una lista y un elemento, obtener una lista con todos los elementos mayores a el
; y otra lista con todos los elementos menos a el

(define (separarListas lista elemento)
    (define (mayores lista elemento)
        (cond 
            ((null? lista) '())
            ((> (car lista) elemento) (cons (car lista) (mayores (cdr lista) elemento)))
            (else (mayores (cdr lista) elemento))
        )
    )
    (define (menores lista elemento)
        (cond 
            ((null? lista) '())
            ((<= (car lista) elemento) (cons (car lista) (menores (cdr lista) elemento)))
            (else (menores (cdr lista) elemento))
        )
    )
    (display (menores lista elemento))
    (newline)
    (display (mayores lista elemento))
    
)
;