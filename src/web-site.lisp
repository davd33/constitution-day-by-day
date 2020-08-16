(in-package #:web-site)

(defmacro build-spinneret-html-response (&body body)
  `(with-output-to-string (out)
     (let ((spinneret:*html* out))
       ,@body)))

(defvar *constitution-1958* nil)

(defun set-constitution-1958 (constitution-1958)
  (setf *constitution-1958* constitution-1958))

;;; HOME OF WEBSITE
(defroute random-article
  (:get "text/html")
  (build-spinneret-html-response
    (let* ((title-i (random (length *constitution-1958*)))
           (chosen-title (nth title-i *constitution-1958*))
           (title-name (constitution-titles:title-name chosen-title))
           (title-articles (constitution-titles:title-articles chosen-title))
           (article-i (random (length title-articles)))
           (chosen-article (nth article-i title-articles)))
      (html:article-today title-name chosen-article))))
