#lang racket

(define (eliminarRepetidos lista)
    (eliminarRepetidosAux lista '())
)

(define (pertenece lista elemento)
    (if (null? lista)
         #f
         (
            if (equal? (car lista) elemento)
                #t
                (pertenece (cdr lista) elemento)
         )
    )
)

(define (eliminarRepetidosAux lista listaAux)
    (cond
        ((null? lista) '())
        ((pertenece listaAux (car lista))
            (eliminarRepetidosAux (cdr lista) listaAux)
        )
        (else (cons (car lista) (eliminarRepetidosAux (cdr lista) (cons (car lista) listaAux))))
    )
)
