(uiop:define-package #:cl-info-test/core
  (:use #:cl)
  (:import-from #:cl-info)
  (:import-from #:hamcrest/rove
                #:contains
                #:assert-that)
  (:import-from #:rove
                #:testing
                #:ok
                #:deftest))
(in-package cl-info-test/core)


(deftest test-system-info
    (testing "Checking if we can get system info and it will have the version from ASDF"
             (let ((info (cl-info:get-system-info :cl-info))
                   (system (asdf:find-system :cl-info)))
               (ok (not (null info)))
               (ok (equal (cl-info:get-version info)
                          (asdf:component-version system))))))


(deftest test-lisp-implementation
  (testing "Checking if we can get system info and it will have the version from ASDF"
    (ok (not (string-equal (lisp-implementation-type)
                           "sbcl")))))
