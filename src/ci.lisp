(defpackage #:cl-info/ci
  (:use #:cl)
  (:import-from #:40ants-ci/jobs/linter
                #:linter)
  (:import-from #:40ants-ci/jobs/run-tests
                #:run-tests)
  (:import-from #:40ants-ci/jobs/docs
                #:build-docs)
  (:import-from #:40ants-ci/steps/sh
                #:sh
                #:sections)
  (:import-from #:40ants-ci/workflow
                #:defworkflow))
(in-package cl-info/ci)


(defworkflow docs
  :on-push-to ("workflow-generator"
               "master")
  :by-cron "0 10 * * 1"
  :cache t
  :jobs ((build-docs)))


(defclass run-tests-with-additional-steps (run-tests)
  ())


(defmethod 40ants-ci/jobs/job:steps ((job run-tests-with-additional-steps))
  (append
   (call-next-method)
   (list
    (sh "Run Command Line Version"
        (sections
         ("Help Argument"
          "qlot exec cl-info --help")
         ("Version Argument"
          "qlot exec cl-info --version")
         ("Lisp Systems Info"
          "qlot exec cl-info cl-info defmain"))))))


(defworkflow ci
  :on-push-to ("workflow-generator"
               "master")
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((linter)
         (run-tests-with-additional-steps
          :os ("ubuntu-latest"
               ;; "macos-latest"
               )
          :quicklisp ("quicklisp"
                      ;; "ultralisp"
                      )
          :lisp ("sbcl-bin"
                 ;; "ccl-bin"
                 ;; "allegro"
                 )
          ;; :exclude (:os "macos-latest" :lisp "allegro")
          
          :coverage t
          :qlfile "{% ifequal quicklisp_dist \"ultralisp\" %}
                   dist ultralisp http://dist.ultralisp.org
                   {% endifequal %}

                   github mgl-pax svetlyak40wt/mgl-pax :branch mgl-pax-minimal")))
