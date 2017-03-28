#lang sicp

(define (square x) (expt x 2))
(define (cube x) (expt x 3))
(define (diff x y) (abs (- x y)))

(define dx 0.00001)
(define tolerance 0.00001)

(define (fixed-point fn first-guess)
  (define (close-enough? num1 num2)
    (< (diff num1 num2) tolerance))
  (define (try guess)
    (let ((next-guess (fn guess)))
      (if (close-enough? guess next-guess)
          next-guess
          (try next-guess))))
  (try first-guess))

(define (derivative g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((derivative g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

(newtons-method (cubic 2 5 3) 1)
(newtons-method (cubic 16 3 9) 1)
(newtons-method (cubic 3 3 -15) 1)
