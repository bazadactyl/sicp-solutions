#lang sicp

(define (square x) (expt x 2))

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)
