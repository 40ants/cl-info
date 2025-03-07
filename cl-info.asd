#-asdf3.1 (error "cl-info requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "cl-info"
  :description "A helper to an answer a question about OS, Lisp and Everything."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/cl-info"
  :source-control (:git "https://github.com/40ants/cl-info")
  :bug-tracker "https://github.com/40ants/cl-info/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("cl-info/core")
  :perform (compile-op :before (o c)
                       #+ros.installing
                       (roswell:roswell '("install" "40ants/defmain")))
  :in-order-to ((test-op (test-op "cl-info-tests"))))
