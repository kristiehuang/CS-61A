;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond 
    ((> x 0) 1)
    ((< x 0) -1)
    (else 0)
  )
)

(define (square x) (* x x))

(define (pow b n)
  (cond 
    ((= n 0) 1)
    ((= n 1) b)
    ((= n 2) (square b))
    ((even? n) (* (square b) (pow b (quotient n 2))))
    ((odd? n) (* b (pow b (- n 1))))
  )
)

(define (unique s)
  (if 
    (<= (length s) 1)
    s
    (cons (car s) 
                (unique (filter (lambda (m) (not (eq? m (car s)))) (cdr s)   ) )
    )
  )
)