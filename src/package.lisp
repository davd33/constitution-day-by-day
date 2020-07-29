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
  (:use #:cl #:lquery)
  (:export #:extract-article-constitution))

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

(defpackage #:jsons
  (:use #:cl)
  (:export #:get-in
           #:add-value
           #:type-compatible-p))

(defpackage #:resources
  (:use #:cl)
  (:export #:*profile*
           #:*system*
           #:resource))

(defpackage #:api
  (:use #:cl #:snooze #:jsons #:alexandria #:resources)
  (:export #:start
           #:stop))

(defpackage #:html
  (:use #:cl #:spinneret #:alexandria)
  (:export #:article-today))

(defpackage #:web-site
  (:use #:cl #:snooze #:jsons #:alexandria)
  (:export #:home))
