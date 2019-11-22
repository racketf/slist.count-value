#lang racket

; (count-occurrences.sexp s sexp): S X SE -> N
; returns number of occurrences of s in sexp
(define count-occurrences.sexp
  (lambda (s sexp)
    (if (or (symbol? sexp) (number? sexp))
       (if (eq? sexp s)
           1
           0)
       (count-occurrences s sexp))))

; (count-occurrences s slist): S X SL -> N
; returns occurrences of s in slist
; : size(slist)=0 -> 0
; : else          -> (count-occurrences.sexp s lst[0]) + (count-occurrences s lst[1..end])
(define count-occurrences
  (lambda (s slist)
    (if (null? slist)
        0
        (+ (count-occurrences.sexp s (car slist)) (count-occurrences s (cdr slist))))))
