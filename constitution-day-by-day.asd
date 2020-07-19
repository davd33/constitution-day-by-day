;;;; constitution-day-by-day.asd

(asdf:defsystem #:constitution-day-by-day
  :description "Read every day an article of the french constitution."
  :author "David Rueda <davd33@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :serial t
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "constitution-day-by-day")))))

(asdf:defsystem #:constitution-day-by-day
  :author "David Rueda"
  :licence "GPLv3"
  :depends-on ("constitution-day-by-day"
               "rove")
  :components ((:module
                "tests"
                                        ;:components
                                        ;(())
                ))
  :perform (test-op (op c) (symbol-call :rove :run c)))
