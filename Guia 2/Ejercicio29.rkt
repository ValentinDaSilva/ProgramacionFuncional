#lang racket
(define (interna lista patron1 patron2)
                        (cond
                             ((and (null? lista) (null? patron2)) '())
                             ((and (null? lista) (pair? patron2)) (cons (car patron2) (interna lista patron1 (cdr patron2))))
                             ((pair? patron1) (interna (cdr lista) (cdr patron1) patron2))
                             ((and (null? patron1) (pair? patron2)) (cons (car patron2) (interna lista patron1 (cdr patron2))))
                             ((and (null? patron1) (null? patron2)) (cons (car lista) (interna (cdr lista) patron1 patron2)))
                        )
                    )
(define (sust lista patron1 patron2)
 (if(pair? lista)
  (if (equal? (car lista) (car patron1))
        ( ; si es igual
            if (estaElPatron lista patron1)
                ( ; si esta el patron
                    interna lista patron1 patron2
                )
                (; si no esta el patron
                    cons (car lista) (sust (cdr lista) patron1 patron2)
                )
            
        )
        (; si no es igual
         if(pair? lista)
            (cons (car lista) (sust (cdr lista) patron1 patron2))
            "fallo"
        )
    )
     
     "fallo"
     
  )
  
)

(define (estaElPatron lista patron)
    (cond
        ((null? patron) #t)
        ((estaElPatron (cdr lista) (cdr patron)) (equal? (car lista) (car patron)))
        (else #f)
    )
)