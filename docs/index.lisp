(uiop:define-package #:cl-info-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:cl-info-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:import-from #:40ants-doc/autodoc
                #:defautodoc)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:cl-info-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "cl-info-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS"))))


(defsection @index (:title "CL-INFO - Common Lisp Environment Reporter"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "TODO"
                                   "API"
                                   "OS"
                                   "CI"
                                   "Unlicense"
                                   "REPL"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"
                                   "API"
                                   "URL"
                                   "URI"
                                   "RPC"
                                   "GIT"))
  (cl-info system)
  "
[![](https://github-actions.40ants.com/40ants/cl-info/matrix.svg?only=ci.run-tests)](https://github.com/40ants/cl-info/actions)

![Quicklisp](http://quickdocs.org/badge/cl-info.svg)

This is a small utility, useful to display information about you Common
Lisp environment. You might want to call it in the CI pipeline or
to use it when rendering a crash report in some client applications.
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :cl-info)
```

Or you can install the script using Roswell:

```
ros install 40ants/cl-info
```
""")


(defsection @usage (:title "Usage")
  "
## Usage from Common Lisp

It's main entry point is CL-INFO:GET-CL-INFO function. It returns an object with
customized PRINT-OBJECT method. You can use it to output debug
information in your programs.

CL-INFO collects inforrmation about OS, Lisp Implementation, ASDF, installed
Quicklisp distributions:

    CL-USER> (cl-info:get-cl-info)
    OS:   Darwin 15.6.0
    Lisp: SBCL 1.4.8
    ASDF: 3.3.1.1
    QL:   ceramic github-e0d905187946f8f2358f7b05e1ce87b302e34312
          cl-prevalence github-c163c227ed85d430b82cb1e3502f72d4f88e3cfa
          log4cl-json github-c4f786e252d89a45372186aaf32fb8e8736b444b
          log4cl github-6a857b0b41c030a8a3b04096205e221baaa1755f
          quicklisp 2018-04-30
          slynk github-3314cf8c3021cb758e0e30fe3ece54accf1dcf3d
          weblocks-lass github-1b043afbf2f3e84e495dfeae5e63fe67a435019f
          weblocks-parenscript github-8ef4ca2f837403a05c4e9b92dcf1c41771d16f17
          weblocks-ui github-5afdf238534d70edc2447d0bc8bc63da8e35999f
          weblocks-websocket github-b098db7f179dce3bfb045afd4e35e7cc868893f0
          weblocks github-282483f97d6ca351265ebfebb017867c295d01ad
          websocket-driver github-a3046b11dfb9803ac3bff7734dd017390c2b54bb
    CL-USER>

Also, you can gather information about separate systems using CL-INFO:GET-SYSTEM-INFO
function:

    CL-USER> (cl-info:get-system-info :hamcrest)
    System: HAMCREST 0.4.2
           /Users/art/common-lisp/cl-hamcrest/src/


## Usage From Command-line

Also, you can use CL-INFO as a command-line utility. It is useful to
output information about common lisp environment running on CI server.

Here is how to do it:

```shell
# Here we use a Roswell, to install utility
[art@art-osx:~]% ros install 40ants/cl-info
   
# And now request information about lisp and some systems
[art@art-osx:~]% cl-info weblocks clack jonathan some-other-system
OS:   Darwin 15.6.0
Lisp: Clozure Common Lisp Version 1.11.5/v1.11.5  (DarwinX8664)
ASDF: 3.3.1.1
QL:   org.borodust.bodge 20180214223017
      quicklisp 2017-10-23
System: weblocks 0.31.1
        /Users/art/common-lisp/weblocks/src/
System: clack 2.0.0
        /Users/art/common-lisp/clack/
System: jonathan 0.1
        /Users/art/.roswell/lisp/quicklisp/dists/quicklisp/software/jonathan-20170630-git/
System: some-other-system is not available
```

")


(defautodoc @api (:system "cl-info"))
