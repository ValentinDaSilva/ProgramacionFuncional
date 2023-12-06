#lang racket
; crear un arbol binario

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

(define (perfecto arbol) (perfectoAux arbol (profundidad arbol)))

(define (profundidad arbol)
    (if (or (vacio? arbol) (hoja? arbol)) 
         0
         (+ 1 (max (profundidad (izq arbol)) (profundidad (der arbol))))
    )
)

(define (perfectoAux arbol profundidad)
  (if (> profundidad 1) 
     (cond
      ((vacio? (der arbol)) #f)
      ((vacio? (izq arbol)) #f)
      (else 
        (and (perfecto (der arbol) (- profundidad 1)) (perfecto (izq arbol) (- profundidad 1)))
      )
    )
    #t
  ) 
)
(define arbol (crear-arbol 1 (crear-arbol 2 (hoja 4) (hoja 5)) (crear-arbol 3 (hoja 6) (hoja 7))))