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
           #:title-index
           #:title-name
           #:title-bis-p
           #:title-articles))

(defpackage #:constitution-articles
  (:use #:cl #:lquery)
  (:export #:split-by-articles
           #:article
           #:make-article
           #:article-index
           #:article-text))
