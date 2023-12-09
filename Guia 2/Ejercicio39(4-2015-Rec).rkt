#lang racket

(define personas '(("Cervantes" "Literatura" 1547 1616)
 ("Velazquez" "Pintura" 1599 1660)
 ("Picasso" "Pintura" 1881 1973)
 ("Beethoven" "Musica" 1770 1823)
 ("Poincare" "Ciencia" 1854 1912)
 ("Quevedo" "Literatura" 1580 1654)
 ("Goya" "Pintura" 1746 1828)
 ("Einstein" "Ciencia" 1879 1955)
 ("Mozart" "Musica" 1756 1791)
 ("Botticelli" "Pintura" 1445 1510)
 ("Borromini" "Arquitectura" 1599 1667)
 ("Bach" "Musica" 1685 1750)
 )
)

(define (nombres bd) 
    (if (null? bd)
        '()
        (cons (car(car bd)) (nombres (cdr bd)))
    )
)
(define (pintores bd) 
    (cond 
        ((null? bd) '())
        ((equal? (cadr(car bd)) "Pintura" ) (cons (car(car bd)) (pintores (cdr bd))))
        (else (pintores (cdr bd)))
    )
)

(define (selecciona bd)
  (define (seleccionaAux Actividad) 
    (cond 
        ((null? bd) '())
        ((equal? (cadr(car bd)) Actividad) (cons (car(car bd)) (pintores (cdr bd))))
        (else (selecciona (cdr bd)))
    )
  )
  seleccionaAux
)

(define (vivas bd a) 
    (cond 
        ((null? bd) '())
        ((and (>= a (caddr(car lista)) (< a (cadddr(car lista))))) (cons (car(car bd)) (vivas (cdr bd) a)))
        (else (vivas (cdr bd) a))
    )
)
