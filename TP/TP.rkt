#lang racket

(define array-asoc-etiqueta 'array-asociativo)
(define (array-asoc-crea) (list array-asoc-etiqueta))
(define nil 'nil)

(define (agrega-reemplaza array clave valor)
    (define ParClaveValor (cons clave (cons valor '()))) ;Defino el par para agregar

    (define (reemplaza array ParClaveValor) ; Se ejecuta mas abajo si esta en el array
            (cond 
                ((null? array) '()) 
                ((not(list? (car array))) (cons (car array) (reemplaza (cdr array) ParClaveValor))) ; si no es una lista (osea el primer elemento) lo coloco y sigo
                ((not (equal? (caar array) clave))  ; cuando lo encuentra lo reemplaza por el nuevo par
                    (cons (car array) (reemplaza (cdr array) ParClaveValor))
                )
                (else (cons ParClaveValor (reemplaza (cdr array) ParClaveValor))); si es el que busca lo coloca y sigue buscando
            )
    )

    (if (incluye-clave? array clave)
        (reemplaza array ParClaveValor)
        (append array (cons ParClaveValor '()))
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

(define (claves array)
    (cond
       ((null? array) '()) ; si termino de recorrer el array cierra la lista
       ((not (list? (car array))) (claves (cdr array))); si no es lista lo salteo
       (else 
            (cons (caar array) (claves (cdr array))) ; pongo en la lista la clave
       )
    )
)

(define (valores array)
    (cond
       ((null? array) '()) ; si termino de recorrer el array cierra la lista
       ((not (list? (car array))) (valores (cdr array))); si no es lista lo salteo
       (else 
            (cons (cadr(car array)) (valores (cdr array))) ; pongo en la lista el valor
       )
    )
)

(define (incluye-clave? array clave)
        (define lista (claves array))
        (busqueda lista clave)
)

(define (incluye-valor? array valor)
        (define lista (valores array))
        (busqueda lista valor)
)

(define (busqueda lista elemento)
        (cond
            ((null? lista) #f)
            ((equal? (car lista) elemento) #t)
            (else (busqueda (cdr lista) elemento))
        )
)

(define (valor-en array clave)
    (cond 
        ((null? array) nil) ; si no encuentra la clave devuelve nil
        ((not (list? (car array))) (valor-en (cdr array) clave)) ; si no es lista (primer elemento) lo pone
        ((equal? (caar array) clave) (cadr(car array))); si es la clave que busco, devuelvo el valor
        (else (valor-en (cdr array) clave)) ; si no es la calve sigo buscando en el resto
    )
)

(define (selecciona array funcion)
    (define lista-valores (valores array))

    (define (select lista)
        (cond
            ((null? lista) '()) 
            ((funcion (car lista)) (cons (car lista) (select (cdr lista))))
            (else (select (cdr lista)))
        ) 
    )

    (select lista-valores)
)

(define (colecta array funcion)
    (define lista-valores (valores array))

    (define (colect lista)
        (if (null? lista) 
            '()
            (cons (funcion (car lista)) (colect (cdr lista)))
        ) 
    )

    (colect lista-valores)
)

(define (detecta array funcion)
    (define lista-valores (valores array))

    (define (detect lista)
        (cond
            ((null? lista) nil) 
            ((funcion (car lista)) (car lista))
            (else (detect (cdr lista)))
        ) 
    )
    (detect lista-valores)
)

(define (compone array1 array2)
    (cond
        ((pair? array1) (append array1 (compone '() array2)))
        ((null? array2) '()) 
        ((not(list? (car array2))) (compone array1 (cdr array2)))
        ((incluye-clave? array1 (caar array2)) (compone array1 (cdr array2)))
        (else (cons (car array2) (compone array1 (cdr array2))))        
    )
)
(define array-1
    (agrega-reemplaza
        (agrega-reemplaza (array-asoc-crea) 8.6 '(racket rkt))
            5.07 '(prolog pl))
)
(define array-2
    (agrega-reemplaza
      (agrega-reemplaza
        (agrega-reemplaza
            (agrega-reemplaza
(agrega-reemplaza (array-asoc-crea) #\a 97)
                        #t 'boolean)
                #f 'boolean)
            + "suma")
        '() "lista vacia")
)
(define array-3
    (agrega-reemplaza
        (agrega-reemplaza (array-asoc-crea) "impar" odd?)
            "ultimo" (lambda (lista) (car (reverse lista)))))
