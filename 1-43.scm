#lang sicp

(define (square x) (expt x 2))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated fn times)
  (if (= times 1)
      (lambda (x) (fn x))
      (compose fn (repeated fn (dec times)))))

((repeated square 2) 5)
