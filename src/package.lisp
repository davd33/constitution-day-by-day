;;;; package.lisp

(defpackage #:mop
  (:use #:cl #:alexandria)
  (:export #:make-mapper
           #:find-class-slots
           #:class-slots
           #:defprintobj
           #:with-computed-slot
           #:with-mapped-slot
           #:with-renamed-slot))

(defpackage #:constitution-day-by-day
  (:use #:cl #:lquery))

(defpackage #:constitution-titles
  (:use #:cl #:lquery)
  (:export #:split-by-titles
           #:title
           #:index
           #:name
           #:bis-p
           #:rest))

(defpackage #:constitution-articles
  (:use #:cl #:lquery)
  (:export #:split-by-articles
           #:article
           #:name
           #:text))
