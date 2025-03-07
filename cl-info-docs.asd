(defsystem "cl-info-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/cl-info/"
  :class :package-inferred-system
  :description "Provides documentation for cl-info."
  :source-control (:git "https://github.com/40ants/cl-info")
  :bug-tracker "https://github.com/40ants/cl-info/issues"
  :pathname "docs"
  :depends-on ("cl-info"
               "cl-info-docs/index"))
