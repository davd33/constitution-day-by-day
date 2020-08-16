;;;; constitution-day-by-day.lisp

(in-package #:constitution-day-by-day)

(defvar *constitution-1958* nil)

(defparameter *debug* nil)

(defparameter constitution-1958-url
  "https://www.legifrance.gouv.fr/Droit-francais/Constitution/Constitution-du-4-octobre-1958")

(defun extract-constitution-1958 ()
  "Download and html-parse all the french constitution."
  (format t "~%Retrieving Constitution from Legifrance...")
  (let* (;; http get the 1958 constitution
         (constitution-1958-html (elt (parse-html (dex:get constitution-1958-url)) 2))
         ;; retrieve the right elements
         (constitution-1958 ($ constitution-1958-html
                              ".content-article > *"
                              #'(lambda (found-elts)
                                  (loop for elt across found-elts
                                        collect
                                        (cond ((or (string= "ul" (plump-dom:tag-name elt))
                                                   (string= "p" (plump-dom:tag-name elt)))
                                               elt)
                                              (t (plump-dom:text elt)))))))
         ;; split text by title/articles
         (c-by-title (constitution-titles:split-by-titles constitution-1958)))
    (when *debug* (setf *constitution-1958* constitution-1958))
    c-by-title))
