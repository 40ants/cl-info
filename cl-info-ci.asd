(defsystem "cl-info-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/cl-info/"
  :class :package-inferred-system
  :description "Provides CI settings for cl-info."
  :source-control (:git "https://github.com/40ants/cl-info")
  :bug-tracker "https://github.com/40ants/cl-info/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "cl-info-ci/ci"))
