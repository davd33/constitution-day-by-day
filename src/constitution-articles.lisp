(in-package :constitution-articles)

(defun split-by-articles (constitution-title)
  "Split the entire CONSTITUTION-TITLE object (package CONSTITUTION-TITLES) at every article.
Return a list of instances of the CONSTITUTION-ARTICLES:ARTICLE defstruct."
  (let ((split-by-articles (cl-ppcre:split "Article ([0-9]+)."
                                           (constitution-titles:rest constitution-title)
                                           :with-registers-p t)))
    (loop
       for i from 0 to (rest)
       do (format t "Article ~A = ~%~A~%" ))))


(defstruct article
  name text)
