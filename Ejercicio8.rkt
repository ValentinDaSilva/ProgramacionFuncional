#lang racket
; determinar si una lista es sublista de otra

(define (esSubLista? lista sublista)
    (cond
        ((null? lista) #f)
        ( (list? (car lista))
              (if (esSubLista? (car lista) sublista)
                  #t
                  (esSubLista? (cdr lista) sublista)
                  )
         )
        ((equal? (car sublista) (car lista)) (if (esSubListaAux lista sublista)
                                                  #t
                                                  (esSubLista? (cdr lista) sublista)
                                              )
              
        )
        (else (esSubLista? (cdr lista) sublista))
    )
)

(define (esSubListaAux lista sublista)
    (cond
        ((null? sublista) #t)
        ((null? lista) #f)
        ((equal? (car sublista) (car lista)) (esSubListaAux (cdr lista) (cdr sublista)))
        (else #f)
    )
)

