;;;; constitution-day-by-day.lisp

(in-package #:constitution-day-by-day)

(defparameter constitution-1958-url
  "https://www.legifrance.gouv.fr/Droit-francais/Constitution/Constitution-du-4-octobre-1958")

(defun extract-article-constitution ()
  "Download and html-parse all the french constitution."
  (let* ((constitution-1958-str (dex:get constitution-1958-url))
         (constitution-1958-doc (elt (parse-html constitution-1958-str) 2)))
    ))
