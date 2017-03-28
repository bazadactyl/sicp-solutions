#lang sicp

(define (diff x y) (abs (- x y)))
(define (average x y) (/ (+ x y) 2))

(define (iterative-improve good-enough? improve)
  (define (iterate guess)
    (let ((next-guess (improve guess)))
      (if (good-enough? guess next-guess)
          next-guess
          (iterate next-guess))))
  iterate)

(define (fixed-point fn first-guess tolerance)
  (define (close-enough? num1 num2)
    (< (diff num1 num2) tolerance))
  (define (improve guess)
    (fn guess))
  ((iterative-improve close-enough? improve) first-guess))

(define (sqrt x)
  (let ((first-guess 1.0)
        (tolerance 0.00000001)
        (sqrt-fn (lambda (y) (average y (/ x y)))))
    (fixed-point sqrt-fn first-guess tolerance)))

(sqrt 1)
(sqrt 4)
(sqrt 25)
(sqrt 42)
(sqrt 100)
(sqrt 1729)
