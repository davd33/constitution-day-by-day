;;;; constitution-day-by-day.lisp

(in-package #:constitution-day-by-day)

(defvar *constitution-1958* nil)

(defparameter *debug* nil)

(defparameter constitution-1958-url
  "https://www.legifrance.gouv.fr/Droit-francais/Constitution/Constitution-du-4-octobre-1958")

(defun is-title-id (id)
  "Return T if ID represents a title or chapter in the constitution."
  (cl-ppcre:scan (cl-ppcre:create-scanner "^ancre[0-9]_[0-9]_[0-9]$")
                 id))

(defun is-article-id (id)
  "Return T if ID represents an article (set of paragraphs)."
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
  (let* (;; http get the 1958 constitution
         (constitution-1958-html (elt (parse-html (dex:get constitution-1958-url)) 2))
         ;; retrieve the right div
         (constitution-1958 (elt ($ constitution-1958-html ".content-article" (text)) 0))
         ;; split text by title/articles
         (c-by-title (constitution-titles:split-by-titles constitution-1958)))
    (when *debug* (setf *constitution-1958* constitution-1958))
    c-by-title))
