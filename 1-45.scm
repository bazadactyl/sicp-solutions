#lang sicp

(define (diff x y) (abs (- x y)))
(define (average x y) (/ (+ x y) 2))
(define tolerance 0.000000000000001)

(define (fixed-point fn first-guess)
  (define (close-enough? num1 num2)
    (< (diff num1 num2) tolerance))
  (define (try guess)
    (let ((next-guess (fn guess)))
      (if (close-enough? guess next-guess)
          next-guess
          (try next-guess))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform
         g transform guess)
  (fixed-point (transform g) guess))

(define (repeated fn times)
  (if (= times 1)
      (lambda (x) (fn x))
      (compose fn (repeated fn (dec times)))))

; find the largest power-of-two such that x >= 2^i, then return i
(define (power-of-two-floor x)
  (define (iterate i)
    (if (and (>= x (expt 2 i))
             (< x (expt 2 (inc i))))
        i
        (iterate (inc i))))
  (iterate 0))

(define (nth-root n x)
  (fixed-point-of-transform
   (lambda (y) (/ x (expt y (dec n))))
   (repeated average-damp (power-of-two-floor n))
   1.0))

(power-of-two-floor 2)
(power-of-two-floor 4)
(power-of-two-floor 8)
(power-of-two-floor 16)
(newline)
(nth-root 2 144)
(nth-root 3 1000)
(nth-root 4 625)
(nth-root 100 103901)