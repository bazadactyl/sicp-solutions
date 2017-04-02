#lang sicp

(define (cons a b)
  (lambda (m) (m (expt 2 a)
                 (expt 3 b))))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 2 2))
(cdr (cons 2 2))
(car (cons 3 3))
(cdr (cons 3 3))
