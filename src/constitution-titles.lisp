(in-package :constitution-titles)

(defun split-by-titles (constitution-1958-selected-html-elements)
  "From a list of elements comprising texts (for titles and articles)
as well as 'p' and 'ul' HTML tags;
Retun a list of instances of CONSTITUTION-TITLES:TITLE."
  (let ((preambule-title-re-str "PRÉAMBULE")
        (title-re-str "Titre *([A-Z]*( bis)?) *-[^A-Za-z]*")
        (article-re-str "Article ([0-9-]+)."))
    (labels ((title? (txt)
               "Return T if TXT represents a title in the constitution of 1958."
               (and (stringp txt)
                    (not (null (cl-ppcre:scan title-re-str txt)))))
             (preambule? (txt)
               "Return T if TXT represents the preambule."
               (and (stringp txt)
                    (not (null (cl-ppcre:scan preambule-title-re-str txt)))))
             (article? (txt)
               "Return T if TXT represents an article in the constitution of 1958."
               (and (stringp txt)
                    (not (null (cl-ppcre:scan article-re-str txt)))))
             (article-premier? (txt)
               "Return T if TXT represents the first article of the constitution."
               (and (stringp txt)
                    (string= txt "Article premier.")))
             (split-title (txt)
               "Apply split regex for titles of the constitution-1958.
Returns a list of 3 values: latin-number, if it's a 'bis' and the name of the title."
               (rest (cl-ppcre:split title-re-str txt :with-registers-p t)))
             (split-article (txt)
               "Apply split regex for articles of the constitution-1958.
Returns an article number, that's it."
               (cadr (cl-ppcre:split article-re-str txt :with-registers-p t)))
             (assert-title-list-not-empty (title-list)
               (assert (not (null title-list)) (title-list)
                       "The list of titles is still empty so we can't add an article in none of them."))
             (assert-phase-is (current-phase expected-phase)
               (assert (eq current-phase expected-phase) nil
                       "The current phase ~A should equal ~A" current-phase expected-phase)))
      (let (;; the result list of title sections
            (title-list (list))
            ;; 3 phases: :in-title :in-article :not-started :in-preambule
            (current-iteration-phase :not-started))
        (loop for e in constitution-1958-selected-html-elements
              do
                 (format t ". ~A~%" e)
                 (cond
                   ;; add a title
                   ((title? e)
                    (destructuring-bind (latin-number bis? name)
                        (split-title e)
                      ;; add a new title
                      (setf title-list
                            (cons (make-title :index latin-number
                                              :name name
                                              :bis-p bis?)
                                  title-list))
                      (setf current-iteration-phase :in-title)))
                   ;; add preambule
                   ((preambule? e)
                    (setf title-list
                          (cons (make-title :name "PRÉAMBULE")
                                title-list))
                    (setf current-iteration-phase :in-preambule))
                   ;; add article premier
                   ((article-premier? e)
                    (assert-title-list-not-empty title-list)
                    (assert-phase-is current-iteration-phase :in-preambule)
                    (let ((latest-title (first title-list)))
                      ;; add the only article premier to the preambule title
                      (setf (title-articles latest-title)
                            (cons (make-article :index "Premier")
                                  (title-articles latest-title)))
                      (setf current-iteration-phase :in-article)))
                   ;; add articles
                   ((article? e)
                    (assert-title-list-not-empty title-list)
                    (assert-phase-is current-iteration-phase :in-title)
                    (let ((article-number (split-article e))
                          (latest-title (first title-list)))
                      ;; add an new article to the latest title
                      (setf (title-articles latest-title)
                            (cons (make-article :index article-number)
                                  (title-articles latest-title)))
                      (setf current-iteration-phase :in-article)))
                   ((eq :in-title current-iteration-phase)
                    (assert-title-list-not-empty title-list))
                   (t :nothing-to-do)))
        title-list))))

(defstruct title
  index
  name
  (bis-p nil)
  articles
  contents)

(defstruct article
  index contents)
