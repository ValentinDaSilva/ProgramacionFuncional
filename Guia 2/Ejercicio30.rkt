#lang racket

;PUTPROP es una lista BasedeDatos, si al incorporar una (objeto atributo) ya existe debe sobreponerse y si no crearse

(define (PUTPROP BaseDeDatos objeto atributo valor) 
    (if (null? BaseDeDatos)
        (cons (list objeto atributo valor) '())
        (if (and (equal?(caar BaseDeDatos) objeto) (equal?(cadr (car BaseDeDatos)) atributo))
            (cons (list objeto atributo valor) (cdr BaseDeDatos))
            (cons (car BaseDeDatos) (PUTPROP (cdr BaseDeDatos) objeto atributo valor))
        )
    )
)