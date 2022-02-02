#lang racket

; (slist.count-value-sexp s sexp): S X SE -> N
; returns number of occurrences of s in sexp
(define slist.count-value-sexp
  (lambda (s sexp)
    (if (or (symbol? sexp) (number? sexp))
       (if (eq? sexp s)
           1
           0)
       (slist.count-value s sexp))))

; (slist.count-value s slist): S X SL -> N
; returns occurrences of s in slist
; : size(slist)=0 -> 0
; : else          -> (slist.count-value-sexp s lst[0]) + (slist.count-value s lst[1..end])
(define slist.count-value
  (lambda (s slist)
    (if (null? slist)
        0
        (+ (slist.count-value-sexp s (car slist)) (slist.count-value s (cdr slist))))))
