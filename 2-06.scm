#lang sicp

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

;; Finding the representation of 1.
(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

;; Finding the represenation of 2.
(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; I couldn't solve this last part on my own.
;; I copied and studied the solution found at:
;; http://community.schemewiki.org/?sicp-ex-2.6
(define (+ a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))
