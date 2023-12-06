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