;;;; package.lisp

(defpackage #:alists
  (:use #:cl #:alexandria)
  (:export #:aconses
           #:deep-acons
           #:merge-acons))

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
  (:export #:extract-constitution-1958))

(defpackage #:constitution-titles
  (:use #:cl #:lquery)
  (:export #:split-by-titles
           #:title
           #:title-index
           #:title-name
           #:title-bis-p
           #:title-articles
           #:title-contents
           #:article
           #:article-index
           #:article-contents))

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
  (:export #:home
           #:set-constitution-1958))
