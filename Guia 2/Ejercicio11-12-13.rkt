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

(define (preorden arbol)
    (cond
        ((vacio? arbol) '())
        ((hoja? arbol) (list (car arbol)))
        (else (append (list (car arbol)) (preorden (izq arbol)) (preorden (der arbol))))
    )
)   

(define (postorden arbol)
    (cond
        ((vacio? arbol)  '())
        ((hoja? arbol) (list (car arbol)))
        (else (append (postorden (izq arbol)) (postorden (der arbol)) (list (car arbol))))
    )
)

(define (inorden arbol)
    (cond
        ((vacio? arbol)  '())
        ((hoja? arbol) (list (car arbol)))
        (else (append (inorden (izq arbol)) (list (car arbol)) (inorden (der arbol))))
    )
)   


(define arbol (crear-arbol 1 (crear-arbol 2 (hoja 4) (hoja 5)) (crear-arbol 3 (hoja 6) (hoja 7))))