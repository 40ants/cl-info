(uiop:define-package #:cl-info
   (:nicknames #:cl-info/core)
   (:use #:cl)
   (:import-from #:40ants-doc
                 #:defsection
                 #:defsection-copy)
   (:import-from #:docs-config
                 #:docs-config)
   (:export #:cl-info
            #:get-cl-info
            #:get-system-info
            #:get-software-version
            #:get-software-type
            #:get-lisp-version
            #:get-lisp-type
            #:get-asdf-version
            #:get-version
            #:get-name
            #:absent-p
            #:get-path
            #:system-info
            #:get-ql-dists))
(in-package cl-info/core)


(defmethod docs-config ((system (eql (asdf:find-system "cl-info"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  (uiop:symbol-call :ql :quickload :40ants-doc-theme-40ants)
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS"))))


(defclass cl-info ()
  ((asdf-version :initform (asdf:asdf-version)
                 :reader get-asdf-version
                 :documentation "Returns ASDF version.")
   (lisp-type :initform (lisp-implementation-type)
              :reader get-lisp-type)
   (lisp-version :initform (lisp-implementation-version)
                 :reader get-lisp-version)
   (software-type :initform (software-type)
                  :reader get-software-type)
   (software-version :initform (software-version)
                     :reader get-software-version)
   #+quicklisp
   (ql-dists :initform (ql-dist:all-dists)
             :reader get-ql-dists)))


#-quicklisp
(defun get-ql-dists (obj)
  nil)


(defclass system-info ()
  ((name :initarg :name
         :reader get-name)
   (version :initarg :version
            :reader get-version)
   (path :initarg :path
         :reader get-path)
   (absent :initarg :absent
           :initform nil
           :reader absent-p)))


(defmethod print-object ((info cl-info) stream)
  (format stream
          "OS:   ~A ~A
Lisp: ~A ~A
ASDF: ~A
"
          (get-software-type info)
          (get-software-version info)
          (get-lisp-type info)
          (get-lisp-version info)
          (get-asdf-version info))
  #-quicklisp
  (format stream
          "QL:   is not available~%")
  #+quicklisp
  (format stream
          "QL:   ~{~A~^~%~}~%"
          (loop for dist in (get-ql-dists info)
                for idx upfrom 0
                collect (format nil "~:[~;      ~]~A ~A"
                                (> idx 0)
                                (ql-dist:name dist)
                                (ql-dist:version dist)))))


(defmethod print-object ((info system-info) stream)
  (if (absent-p info)
      (format stream
              "System: ~A is not available~%"
              (get-name info))
      (format stream
              "System: ~A ~A
        ~A~%"
              (get-name info)
              (get-version info)
              (get-path info))))


(defun get-cl-info ()
  "Returns information about lisp implementation, asdf and quicklisp."
  (make-instance 'cl-info))


(defun get-system-info (system-name)
  (let ((system (block search-for-system
                  (handler-bind ((asdf:missing-component
                                  (lambda (c)
                                    (declare (ignorable c))
                                    (return-from search-for-system nil)))
                                 (asdf:system-out-of-date
                                  (lambda (c)
                                    (declare (ignorable c))
                                    (invoke-restart 'continue))))
                    (asdf:find-system system-name)))))
    
    (if system
        (make-instance 'system-info
                       :name system-name
                       :version (asdf:component-version system)
                       :path (asdf:component-pathname system))
      (make-instance 'system-info
                     :name system-name
                     :absent t
                     :version nil
                     :path nil))))
