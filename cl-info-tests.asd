(defsystem "cl-info-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/cl-info/"
  :class :package-inferred-system
  :description "Provides tests for cl-info."
  :source-control (:git "https://github.com/40ants/cl-info")
  :bug-tracker "https://github.com/40ants/cl-info/issues"
  :pathname "t"
  :depends-on ("hamcrest"
               "cl-info-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
