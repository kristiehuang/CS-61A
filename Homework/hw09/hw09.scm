
; Tail recursion

(define (replicate x n)
  (define (replicate-iter n lst)
    		(if (= n 0) lst
            (replicate-iter (- n 1) (append (list x) lst))
        )
  )
  (replicate-iter n nil)
)

(define (accumulate combiner start n term)
  (define (acc-iter index final)
      (if (> index n) (combiner final start)
          (acc-iter (+ 1 index) (combiner (term index) final))
      )
  )
  (acc-iter 2 (term 1))
)
(define (accumulate-tail combiner start n term)
  (define (acc-iter index final)
      (if (> index n) (combiner final start)
          (acc-iter (+ 1 index) (combiner (term index) final))
      )
  )
  (acc-iter 2 (term 1))
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))


(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ 3 x)) 
              multiples-of-three)
  )
)

(define (nondecreastream s)
    (define (inner-list ss)
      (cond ((null? (cdr-stream ss)) (list (car s))) 
            ((> (car ss) (car (cdr-stream ss))) (cons (car ss) nil))
            (else (cons (car ss) (inner-list (cdr-stream ss))))
      )
    )
    (define (rest-stream len ss)
      (if (<= len 0) ss
          (cdr-stream (rest-stream (- len 1) ss))
      )
    )
    (if (null? s) s
      (begin     
          (define inner (inner-list s))
          (cons-stream inner (nondecreastream (rest-stream (length inner) s)))
      )
    )
)

(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))