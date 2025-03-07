(uiop:define-package #:cl-info-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:cl-info-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "DEFMAIN"
                              "README"
                              "ASDF/PLAN:SYSTEM-OUT-OF-DATE"
                              "HTTP"))
  (0.4.1 2021-05-08
         "Roswell script was fixed to work with latest DEFMAIN.")
  (0.4.0 2019-07-19
         "
Now cl-info is able to work without Quicklisp client.

Also:

* `make-cl-info` was renamed to `get-cl-info`.
* `make-system-info` was renamed to `get-system-info`.
")
  (0.3.0 2018-06-17
         "Fixed handling of ASDF/PLAN:SYSTEM-OUT-OF-DATE error, when
displaying information about installed systems.

Added normal README file with examples.
")
  (0.2.0 2018-06-04
         "* System now explicitly requires ASDF >= 3.1.")
  (0.1.0 2018-06-03
         "* Initial version."))
