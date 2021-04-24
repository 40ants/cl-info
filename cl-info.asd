#-asdf3.1 (error "cl-info requires ASDF 3.1")
(defsystem cl-info
  :version (:read-file-form "version.lisp-expr")
  :author "Alexander Artemenko"
  :license "BSD"
  :class :package-inferred-system
  :pathname "src"
  :depends-on ("cl-info/core")
  :homepage "https://40ants.com/cl-info"
  :bug-tracker "https://github.com/40ants/cl-info/issues"
  :source-control (:git "https://github.com/40ants/cl-info")
  :description "A helper to an answer a question about OS, Lisp and Everything."
  :perform (compile-op :before (o c)
                       #+ros.installing
                       (roswell:roswell '("install" "40ants/defmain")))
  :in-order-to ((test-op (test-op cl-info-test))))

