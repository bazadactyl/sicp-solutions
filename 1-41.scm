#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((lambda (x) ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) x))) inc) 5)
((double (double (double (double inc)))) 5)
