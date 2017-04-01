#lang sicp

(define (average a b)
  (/ (+ a b) 2))

(define (make-point x y)
 (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point-inline p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-point p)
  (newline)
  (print-point-inline p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg)
  (let ((p1 (car seg))
        (p2 (cdr seg)))
    (if (<= (x-point p1) (x-point p2))
        p1
        p2)))

(define (end-segment seg)
  (let ((p1 (car seg))
        (p2 (cdr seg)))
    (if (> (x-point p1) (x-point p2))
        p1
        p2)))

(define (midpoint-segment seg)
  (let ((p1 (start-segment seg))
        (p2 (end-segment seg)))
    (make-segment (average (x-point p1)
                           (x-point p2))
                  (average (y-point p1)
                           (y-point p2)))))

(define (print-segment seg)
  (newline)
  (display "{")
  (print-point-inline (start-segment seg))
  (display ",")
  (print-point-inline (end-segment seg))
  (display "}"))

(define a (make-point 3.0 5.0))
(define b (make-point 12.0 7.0))
(print-point a)
(print-point b)

(define seg (make-segment a b))
(define start (start-segment seg))
(define end (end-segment seg))
(define mid (midpoint-segment seg))
(print-point start)
(print-point mid)
(print-point end)
(print-segment seg)
