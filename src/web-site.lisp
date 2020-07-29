(in-package #:web-site)

(defmacro build-spinneret-html-response (&body body)
  `(with-output-to-string (out)
     (let ((spinneret:*html* out))
       ,@body)))

(defvar *constitution-1958* nil)

(progn
  (format t "Retrieve Constitution from Legifrance...")
  (setf *constitution-1958* (constitution-day-by-day:extract-article-constitution)))

;;; HOME OF WEBSITE
(defroute home
  (:get "text/html")
  (build-spinneret-html-response
    (let* ((title-i (random (length *constitution-1958*)))
           (chosen-title (nth title-i *constitution-1958*))
           (title-name (constitution-titles:title-name chosen-title))
           (title-articles (constitution-titles:title-articles chosen-title))
           (article-i (random (length title-articles)))
           (chosen-article (nth article-i title-articles)))
     (html:article-today title-name chosen-article))))
