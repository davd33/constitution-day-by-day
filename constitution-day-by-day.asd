;;;; constitution-day-by-day.asd

(asdf:defsystem #:constitution-day-by-day
  :description "Read every day an article of the french constitution."
  :author "David Rueda <davd33@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :serial t
  :depends-on (#:spinneret
               #:hunchentoot
               #:snooze
               #:quri
               #:dexador
               #:lquery
               #:cl-ppcre
               #:cl-json
               #:clack
               #:fset
               #:str
               #:mito
               #:sxql
               #:unix-opts
               #:trivia
               #:alexandria
               #:closer-mop)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "mop")
                 (:file "constitution-day-by-day"))))
  :in-order-to ((test-op (test-op "constitution-day-by-day/tests"))))

(asdf:defsystem "constitution-day-by-day/tests"
  :author "David Rueda"
  :licence "GPLv3"
  :depends-on ("constitution-day-by-day"
               "rove")
  :description "Test system for constitution-day-by-day"
  :components ((:module "tests"
                                        ;:components
                                        ;(())
                        ))
  :perform (test-op (op c) (symbol-call :rove :run c)))
