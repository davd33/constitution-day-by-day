(in-package #:resources)

(defvar *profile* :dev
  "Takes either :dev or :exe.")

(defvar *system* :constitution-day-by-day
  "System being loaded.")

(eval-when
    (:compile-toplevel
     :load-toplevel
     :execute)
  (defmacro resource (path)
    "Returns the actual path, whether for development or compiling executable."
    (case *profile*
      (:dev (asdf:system-relative-pathname *system*
                                           (str:concat "./src/resources/" path)))
      (:exe (str:concat "./resources/" path))
      (otherwise path))))
