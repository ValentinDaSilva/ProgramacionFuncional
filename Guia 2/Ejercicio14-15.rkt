#lang racket
; determinar si una lista es prefijo de otro y despues sufijo

(define (prefijo lista1 lista2)
    (cond
        ((null? lista2) #t)
        ((null? lista1) #f)
        ((not(equal? (car lista1) (car lista2))) #f)
        ((equal? (car lista1) (car lista2))
            (prefijo (cdr lista1) (cdr lista2))
        )
    )
)

(define (sufijo lista1 lista2)
    (cond 
        ((null? lista2) #t)
        ((null? lista1) #f)
        ((not (equal? (ultimoElemento lista1) (ultimoElemento lista2))) #f)
        ((equal? (ultimoElemento lista1) (ultimoElemento lista2))
            (sufijo (eliminarUltimoElemento lista1) (eliminarUltimoElemento lista2))
        )
    )
)
;esta no es necesaria pero para practicar, y tambien podria usarse para otra implementacion distinta de sufijo    
(define (invertir lista)
    (if (null? lista)
        '() 
        (append (invertir (cdr lista)) (list (car lista)))
    )
)

(define (ultimoElemento lista)
    (if (null? (cdr lista)) 
        (car lista)
        (ultimoElemento (cdr lista))
    )
)

(define (eliminarUltimoElemento lista)
    (if (null? (cdr lista)) 
        '()
        (append (list (car lista)) (eliminarUltimoElemento (cdr lista)))
    )
)