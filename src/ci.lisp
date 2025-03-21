(defpackage #:cl-info-ci/ci
  (:use #:cl)
  (:import-from #:40ants-ci/jobs/run-tests)
  (:import-from #:40ants-ci/jobs/docs
                #:build-docs)
  (:import-from #:40ants-ci/steps/sh
                #:sh
                #:sections)
  (:import-from #:40ants-ci/workflow
                #:defworkflow))
(in-package #:cl-info-ci/ci)


(defworkflow linter
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((40ants-ci/jobs/linter:linter
          :asdf-systems ("cl-info"
                         "cl-info-docs"
                         "cl-info-tests")
          ;; Imports checking is disabled until somebody will implement
          ;; ignoring usages of ql-dist package in src/core.lisp
          ;; :check-imports t
          )))


(defworkflow docs
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((build-docs :asdf-system "cl-info-docs")))


(defclass run-tests (40ants-ci/jobs/run-tests:run-tests)
  ())


(defmethod 40ants-ci/jobs/job:steps ((job run-tests))
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
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((run-tests
          :os ("ubuntu-latest"
               "macos-latest")
          :quicklisp ("quicklisp"
                      "ultralisp")
          :lisp ("sbcl-bin"
                 "ccl-bin"
                 "allegro"
                 "ecl"
                 "allegro"
                 "clisp"
                 "cmucl")
          :exclude (;; Seems allegro is does not support 64bit OSX.
                    ;; Unable to install it using Roswell:
                    ;; alisp is not executable. Missing 32bit glibc?
                    (:os "macos-latest" :lisp "allegro")
                    ;; CLISP on OSX is built without support for threads,
                    ;; but Rove depends on bordeaux-threads and it fails to load
                    ;; https://github.com/roswell/roswell/issues/461
                    ;; Also see this issue declined by bordeaux-threads's maintainer:
                    ;; https://github.com/sionescu/bordeaux-threads/pull/86
                    (:os "macos-latest" :lisp "clisp")
                    ;; CMUCL is 32bit and cant' work on 64bit OSX:
                    ;; .roswell/impls/x86-64/darwin/cmu-bin/21d/bin/lisp
                    ;; is not executable. Missing 32bit glibc?
                    (:os "macos-latest" :lisp "cmucl")
                    ;; CLisp on Ubuntu can't be installed because of the error:
                    ;; #<FOREIGN-VARIABLE "rl_readline_state" #x00007FA93E698850> does not have
                    ;; the required size or alignment
                    (:os "ubuntu-latest" :lisp "clisp")
                    ;; Disabled because Rove does not work on this configuration:
                    ;; https://github.com/fukamachi/rove/issues/47
                    (:os "ubuntu-latest" :lisp "allegro")
                    ;; CMUCL on ubuntu is built without threading support
                    ;; but Rove depends on bordeaux-threads and it fails to load
                    ;; https://github.com/roswell/roswell/issues/461
                    (:os "ubuntu-latest" :lisp "cmucl")
                    ;; CCL is not supported on OSX with arch64 architecture:
                    (:os "macos-latest"  :lisp "ccl-bin"))
          
          :coverage t
          :qlfile "{% ifequal quicklisp_dist \"ultralisp\" %}
                   dist ultralisp http://dist.ultralisp.org
                   {% endifequal %}")))
