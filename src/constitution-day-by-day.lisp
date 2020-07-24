;;;; constitution-day-by-day.lisp

(in-package #:constitution-day-by-day)

(defparameter constitution-1958-url
  "https://www.legifrance.gouv.fr/Droit-francais/Constitution/Constitution-du-4-octobre-1958")

(defun is-title-id (id)
  "Return T if ID has the regexp form: /ancre[0-9]_[0-9]_[0-9]/"
  (cl-ppcre:scan (cl-ppcre:create-scanner "^ancre[0-9]_[0-9]_[0-9]$")
                 id))

(defun is-article-id (id)
  "Return T if ID has the regexp form: /ancre[0-9]_[0-9]_[0-9]_[0-9]/"
  (cl-ppcre:scan (cl-ppcre:create-scanner "^ancre[0-9]_[0-9]_[0-9]_[0-9]$")
                 id))

(defun anchor-type-by-id (id)
  "Return the content type of id.
It can be one of:
 - :title
 - :article
 - :preambule
 - :paragraph"
  (cond ((is-title-id id) :title)
        ((is-article-id id) :article)))

(defun extract-article-constitution ()
  "Download and html-parse all the french constitution."
  (let* ((constitution-1958-str (dex:get constitution-1958-url))
         (constitution-1958-doc (lquery:$ (elt (parse-html constitution-1958-str) 2)
                                          ".content-article")))
    ))
