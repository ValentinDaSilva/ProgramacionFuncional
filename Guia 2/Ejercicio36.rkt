#lang racket

(define (funcion lista)
    (if (not (list? (cadr lista)))
        ((car lista) (cadr lista) (caddr lista))
        ((car lista) (funcion (cadr lista)) (caddr lista))
    )
)

;y ni ganas de seguir con el ejercicio completo xd