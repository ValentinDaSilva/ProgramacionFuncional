#lang racket

(define array-asoc-etiqueta 'array-asociativo)
(define (array-asociativo-crea) (list array-asoc-etiqueta))
(define nil 'nil)

(define (agrega-reemplaza array clave valor)
    (define ParClaveValor (cons clave (cons valor '()))) ;Defino el par para agregar

    (define (reemplaza array ParClaveValor) ; Se ejecuta mas abajo si esta en el array
            (cond 
                ((null? array) '()) 
                ((not(list? (car array))) (reemplaza (cdr array) ParClaveValor)) ; si no es una lista (osea el primer elemento) lo saltea
                ((not (equal? (caar array) clave))  ; cuando lo encuentra lo reemplaza por el nuevo par
                    (cons (car array) (reemplaza (cdr array) ParClaveValor))
                )
                (else (cons ParClaveValor (reemplaza (cdr array) ParClaveValor))); si es el que busca lo coloca y sigue buscando
            )
    )

    (if (estaEnElArray array clave)
        (reemplaza array ParClaveValor)
        (append array (cons ParClaveValor '()))
    )
)

(define (estaEnElArray array clave)
        (cond
            ((null? array) #f) ; si esta vacio no lo encontra y devuelve false
            ((not(list? (car array))) (estaEnElArray (cdr array) clave)) ; si no es lista lo saltea (primer elemento)
            ((equal? (caar array) clave) #t) ; si lo encutra retorna verdadero
            (else 
                (estaEnElArray (cdr array) clave) ; si no es el primer sigue buscando en el resto
            )
        )
)

(define (elimina array clave)
    (cond 
        ((null? array) '()) ; si termino de recorrer el array lo cierra
        ((not (list? (car array))) (cons (car array) (elimina (cdr array) clave))) ; si no es lista (primer elemento) lo pone
        ((equal? (caar array) clave) (elimina (cdr array) clave)); si es el elemento se lo saltea
        (else (cons (car array) (elimina (cdr array) clave))) ; coloca los elementos hasta que se cumpla alguna de las condiciones anteriores
    )
)

(define array (agrega-reemplaza (agrega-reemplaza (agrega-reemplaza (array-asociativo-crea) '(1) 2) "Nombre" "Valentin") "edad" "19"))