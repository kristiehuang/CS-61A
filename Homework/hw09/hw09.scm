
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


(define (filter-stream f s)
  (if (null? s))
  )

(define (nondecreastream s)
    (define rest-stream asdlfa)
    (cons-stream (filter (lambda (x) (x > (car (cdr-stream s)))) s) 
              (nondecreastream rest-stream)
    )
    ; if (car (cdr-stream s)) < (car s)  IF NEXT NUMBER SMALLER THAN CURRENT NUMBER
    ;   START NEW LIST

    ; (filter (lambda (x) (x > (car (cdr-stream s)))) s)
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