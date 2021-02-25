(defpackage #:test-ql
  (:use #:cl))
(in-package test-ql)


(defun dists-dir ()
  (ql:qmerge (make-pathname :directory (list :relative "dists"))))


(defun find-distinfo (paths)
  (loop for path in paths
        for name = (pathname-name path)
        for type = (pathname-type path)
          thereis (and name
                       type
                       (string-equal name "distinfo")
                       (string-equal type "txt")
                       path)))

(defun find-distinfo-files ()
  "This function searches all distinfo.txt files in the dist/ subdirectory.

   It goes deeper until finds distinfo.txt file and thus works much
   faster than (directory (ql:qmerge \"dists/*/distinfo.txt\")) which
   has to traverse whole file tree."
  (loop with results = nil
        with queue = (list (dists-dir))
        for path = (car queue) then (car queue)
        while path
        do (let* ((listing (ql-impl-util::directory-entries path))
                  (distinfo (find-distinfo listing)))
             (if distinfo
                 (push distinfo results)
                 (setf queue
                       (append queue
                               (remove-if-not #'ql-impl-util::directoryp
                                              listing))))
             (setf queue
                   (cdr queue)))
        finally (return results)))
