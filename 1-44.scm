#lang sicp

(define (cube x) (expt x 3))
(define (average3 x y z) (/ (+ x y z) 3))
(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (dec n)))))

(define (smooth f)
  (lambda (x) (average3 (f (- x dx))
                        (f x)
                        (f (+ x dx)))))

(define (n-smooth f n)
  ((repeated smooth n) f))

(define (func x) (+ (* 7 (cube x))
                    (- (* 10 x))
                    (- 10)))
(define smoothed-func (n-smooth func 1))

(func 0.6)
(smoothed-func 0.6)