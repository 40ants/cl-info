(defsystem cl-info-test
  :author "Alexander Artemenko"
  :license "BSD"
  :class :package-inferred-system
  :pathname "t"
  :depends-on ("hamcrest"
               "cl-info-test/core")
  :description "Test system for cl-info"

  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
