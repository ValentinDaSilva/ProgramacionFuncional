#lang racket

(define (moverHaciaAtras lista posiciones)
    (define (inicio lista posiciones)
        (if (equal? posiciones 0)
            '()
            (cons (car lista) (inicio (cdr lista) (- posiciones 1)))
        )
    )
    (define (resto lista posiciones)
         (cond
            ((null? lista) '())
            ((equal? posiciones 0) (cons (car lista) (resto (cdr lista) posiciones)))
            (else (resto (cdr lista) (- posiciones 1)))
        )
      )
   (append (resto lista posiciones) (inicio lista posiciones))
)