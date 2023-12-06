#lang racket
; verificar si un elemento pertence a la lista

(define (miembro? lista elemento)
    (if (null? lista)
        #f
        (if (equal? (car lista) elemento)
            #t
            (miembro? (cdr lista) elemento)
        )
    )
)