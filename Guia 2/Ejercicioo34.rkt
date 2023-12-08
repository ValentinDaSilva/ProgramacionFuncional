#lang racket

(define matriz '((10 0 0 10 0) (0 20 0 0 0) (30 0 0 0 30) (40 0 0 0 0) (50 0 0 0 50)))

(define (leerFila lista fila columna)
    (cond 
        ((null? lista) '())
        ((not(equal? (car lista) 0)) (cons (list fila columna (car lista)) (leerFila (cdr lista) fila (+ 1 columna))))
        (else (leerFila (cdr lista) fila (+ 1 columna)))
    )
)

(define (convertir matriz)
    (define (convertirAux matriz fila columna)
        (if (null? matriz)
            '()
            (append (leerFila (car matriz) fila columna) (convertirAux (cdr matriz) (+ 1 fila) columna))
        )
    )
    (convertirAux matriz 1 1)
)