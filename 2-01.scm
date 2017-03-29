#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (cond ((and (negative? n) (negative? d))
           (cons (/ (- n) g)
                 (/ (- d) g)))
          ((and (positive? n) (negative? d))
           (cons (/ (- n) g)
                 (/ (- d) g)))
          (else
           (cons (/ n g)
                 (/ d g))))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat  6  14))
(print-rat (make-rat -6  14))
(print-rat (make-rat  6 -14))
(print-rat (make-rat -6 -14))