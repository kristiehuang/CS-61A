;; Scheme ;;

(define (over-or-under x y)
  (cond ((< x y) -1)
    ((= x y) 0)
    (else 1)
    )
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

(define (filter-lst f lst)
  (cond 
        ((null? lst) '())
        ((f(car lst))
          (cons (car lst) (filter-lst f(cdr lst)))
        )
        (else
          (filter-lst f (cdr lst))
        )
  )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

(define (make-adder num)
  (define (adder x) (+ x num))
  adder
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13

;; Extra questions

(define lst
  ;(list (list 1) 2 (list 3 4) 5)
  (cons (cons 1 '()) (cons 2 (cons (cons 3 (cons 4 '())) (cons 5 '()))))
)

(define (composed f g)
  (define (ahh x)
    (f (g x))
  )
  ahh
)

(define (remove item lst)
  'YOUR-CODE-HERE
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
  'YOUR-CODE-HERE
)

(define (substitute s old new)
  'YOUR-CODE-HERE
)


(define (sub-all s olds news)
  'YOUR-CODE-HERE
)