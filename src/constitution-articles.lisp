(in-package :constitution-articles)

(defun split-by-articles (constitution-title-text)
  "Split the entire CONSTITUTION-TITLE-TEXT object (package CONSTITUTION-TITLES) at every article.
Return a list of instances of the CONSTITUTION-ARTICLES:ARTICLE defstruct."
  (let ((split-by-articles (rest (cl-ppcre:split "Article ([0-9-]+)."
                                                 constitution-title-text
                                                 :with-registers-p t))))
    (loop
       for i from 0 below (length split-by-articles) by 2
       collect (let ((index (nth i split-by-articles))
                     (text (nth (1+ i) split-by-articles)))
                 (make-article :index index
                               :text text)))))


(defstruct article
  index text)
