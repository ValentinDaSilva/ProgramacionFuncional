#lang racket

(define (funcionSimple lista)
    (cond
      ((and (not (list? (cadr lista))) (not (list? (caddr lista)))) ((car lista) (cadr lista) (caddr lista)))
      ((and (list? (cadr lista)) (not (list? (caddr lista)))) ((car lista) (funcionSimple (cadr lista)) (caddr lista)))  
      ((and (not (list? (cadr lista))) (list? (caddr lista))) ((car lista) (cadr lista) (funcionSimple (caddr lista))))
      ((and (list? (cadr lista)) (list? (caddr lista))) ((car lista) (funcionSimple (cadr lista)) (funcionSimple (caddr lista))))
    )
)
;((car lista) (cadr lista) (caddr lista))
(define (funcion  funcion1 elemento)
    (funcionSimple  
     (if (list? (cadr funcion1))
         (cons
              (car funcion1)
              (cons (funcion (cadr funcion1) elemento)
                    (if (not (list? (caddr funcion1)))
                        (if (symbol? (caddr funcion1))
                            (cons elemento '())
                            (list(caddr funcion1))
                        )
                        (cons (funcion  (caddr funcion1) elemento) '())
                    )
               )
          )
         (append (list(car funcion1))
                 (if (symbol? (cadr funcion1)) (list elemento) (list(cadr funcion1)))
                 (if (not (list? (caddr funcion1)))
                    (if (symbol? (caddr funcion1)) (list elemento) (list(caddr funcion1)))
                    (funcion  (caddr funcion1) elemento)
                 )
         
         )
       )
    )     
 )

(define (FuncionImpar funcionAevaluar lista)
   (if (null? lista)
        #t
        (if (equal? (funcion funcionAevaluar (car lista)) (- (funcion funcionAevaluar (- (car lista)))))
            (FuncionImpar funcionAevaluar (cdr lista))
            #f
        )
    )
)