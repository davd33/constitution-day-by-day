(in-package :constitution-titles)

(defun split-by-titles (constitution-1958)
  "Split the entire constitution string at every title.
Return a list of instances of the CONSTITUTION-TITLES:TITLE defstruct."
  (let* ((re-res (cl-ppcre:split "Titre *([A-Z]*( bis)?) *-[^A-Za-z]*"
                                 constitution-1958
                                 :with-registers-p t))
         (re-first (first re-res))
         (re-rest (rest re-res)))
    (cons
     (make-title :index 0
                 :articles (constitution-articles:make-article :text re-first))
     (let ((title+articles nil))
       (loop
          for i from 0 below (1- (length re-res)) by 3
          do (setf title+articles
                   (let ((title+text (cl-ppcre:split "^([A-Z ÉÈÀ',-]+)(Article)"
                                                     (nth (+ 2 i) re-rest)
                                                     :with-registers-p t)))
                     (list (second title+text) (str:concat (third title+text)
                                                           (fourth title+text)))))
          collect (make-title :index (nth i re-rest)
                              :name (first title+articles)
                              :bis-p (not (null (nth (1+ i) re-rest)))
                              :articles (constitution-articles:split-by-articles
                                         (second title+articles))))))))

(defstruct title
  index
  name
  (bis-p nil)
  articles)
