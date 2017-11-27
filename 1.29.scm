(load "/Users/jinzhan/Desktop/dev/practiceProject/SICP/utility.scm")
;procedure as arguments
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	     (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (factor k)
  	(cond ((or (= 0 k) (= n k)) 1)
          ((odd? k) 4)
          (else 2)))
  (define (term k)
    (* (factor k) (y k)))
  (define (next k)
    (+ k 1))
  (if (not (even? n))
      (error "n can't be odd")
      (* (/ h 3)  
      	 (sum term (exact->inexact 0) next n))))

(simpson cube 0 1 100)

(simpson cube 0 1 10000)

