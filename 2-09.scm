#lang sicp

(define (diff x y) (abs (- x y)))

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (let ((a (- (upper-bound y)
              (lower-bound x)))
        (b (- (lower-bound y)
              (upper-bound x))))
    (if (< a b)
        (make-interval a b)
        (make-interval b a))))

(define (interval-width x)
  (/ (diff (upper-bound x)
           (lower-bound x))
     2))

;; Simple example to show that the width of an interval sum
;; is a function of the widths of the intervals being added.
(let ((a (make-interval 1 3))
      (b (make-interval 5 7)))
  (= (interval-width (add-interval a b))
     (+ (interval-width a) (interval-width b))))

;; Simple example to show that the width of an interval difference
;; is a function of the widths of the intervals being subtracted.
(let ((a (make-interval 14 30))
      (b (make-interval 5 17)))
  (= (interval-width (sub-interval a b))
     (+ (interval-width a) (interval-width b))))

;; I haven't completed the multiplication and division parts of the exercise.