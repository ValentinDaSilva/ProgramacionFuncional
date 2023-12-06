#lang racket
; n-esima posicion de una lista

(define (posicion lista posicionElemento)
    (if (null? lista)
        "Fallo"
        (if (equal? posicionElemento 1)
            (car lista)
            (posicion (cdr lista) (- posicionElemento 1))
        )
    )
)
