#lang racket

(define (reversa lista)
 (if (null? (cdr lista))
     lista
     (cons (ultimoElemento lista) (cons (reversa (eliminarUltimoElemento lista)) '()))
  )
)

(define (ultimoElemento lista)
     (if (null? (cdr lista))
         (car lista)
         (ultimoElemento (cadr lista))
     )
)

(define lista '(3(1(2))))

(define (eliminarUltimoElemento lista)
(if (null? (cdr lista))
    '()
  (if (null? (cdr (cadr lista)))
         (cons (car lista) '())
         (cons (car lista) (cons (eliminarUltimoElemento (cadr lista)) '()))
     )
  )
)

