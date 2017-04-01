#lang sicp

(define (average a b)
  (/ (+ a b) 2))

(define (make-point x y)
 (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (point-distance p1 p2)
  (let ((x1 (x-point p1))
        (x2 (x-point p2))
        (y1 (y-point p1))
        (y2 (y-point p2)))
    (abs (/ (- y2 y1)
            (- x2 x1)))))

(define (print-point-inline p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-point p)
  (newline)
  (print-point-inline p))

(define (make-rect-relative point angle length height)
  (cons point (cons angle (cons length height))))

(define (rect-relative-length rect) (caddr rect))
(define (rect-relative-height rect) (cdddr rect))
(define (rect-relative-angle rect) (cadr rect))

(define (make-rect-absolute upper-left-point upper-right-point
                            lower-left-point lower-right-point)
  (cons upper-left-point
        (cons upper-right-point
              (cons lower-left-point lower-right-point))))

(define (rect-absolute-upper-left rect) (car rect))
(define (rect-absolute-upper-right rect) (cadr rect))
(define (rect-absolute-lower-left rect) (caddr rect))
(define (rect-absolute-lower-right rect) (cdddr rect))

(define (rect-absolute-length rect)
  (point-distance (rect-absolute-upper-left rect)
                  (rect-absolute-upper-right rect)))
(define (rect-absolute-height rect)
  (point-distance (rect-absolute-upper-left rect)
                  (rect-absolute-lower-left rect)))

(define (rect-perimeter rect length-fn height-fn)
  (+ (* 2 (length-fn rect))
     (* 2 (height-fn rect))))

(define (rect-area rect length-fn height-fn)
  (* (length-fn rect) (height-fn rect)))

(define rect-rel (make-rect-relative (make-point 0 5) 0 8 5))
(define rect-abs (make-rect-absolute (make-point 0 5) (make-point 8 5)
                                     (make-point 0 0) (make-point 8 0)))

(rect-perimeter rect-rel
                rect-relative-length
                rect-relative-height)
(rect-perimeter rect-abs
                rect-absolute-length
                rect-absolute-height)
(rect-area rect-rel
           rect-relative-length
           rect-relative-height)
(rect-area rect-abs
           rect-absolute-length
           rect-absolute-height)
