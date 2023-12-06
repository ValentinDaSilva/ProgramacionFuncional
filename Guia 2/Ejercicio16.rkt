(define vacio '())

(define (hoja x)
  (cons x
        (cons vacio
               (cons vacio vacio) )
        )
)

(define (vacio? x) (equal? x vacio))

(define (hoja? x)
      (if (and (vacio? (cadr x)) (caddr x)) #t #f)
  )

(define (aux funcion)
     funcion
  )

(define (crear-arbol raiz izq der)
       (list raiz izq der)
)

(define (der lista)
      (caddr lista)
)

(define (izq lista)
      (cadr lista)
)

(define (pertenece arbol elemento)
    (cond 
        ((vacio? arbol) #f)
        ((equal? (car arbol) elemento) #t)
        (else 
            (or (pertenece (izq arbol) elemento) (pertenece (der arbol) elemento))
        )
    )
)
(define arbol (crear-arbol 1 (crear-arbol 2 (hoja 4) (hoja 5)) (crear-arbol 3 (hoja 6) (hoja 7))))