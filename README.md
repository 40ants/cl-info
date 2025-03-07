<a id="x-28CL-INFO-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# CL-INFO - Common Lisp Environment Reporter

<a id="cl-info-asdf-system-details"></a>

## CL-INFO ASDF System Details

* Description: A helper to an answer a question about `OS`, Lisp and Everything.
* Licence: Unlicense
* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>
* Homepage: [https://40ants.com/cl-info][c5b1]
* Bug tracker: [https://github.com/40ants/cl-info/issues][eaff]
* Source control: [GIT][c2be]

[![](https://github-actions.40ants.com/40ants/cl-info/matrix.svg?only=ci.run-tests)][3904]

![](http://quickdocs.org/badge/cl-info.svg)

This is a small utility, useful to display information about you Common
Lisp environment. You might want to call it in the `CI` pipeline or
to use it when rendering a crash report in some client applications.

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

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
<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

<a id="usage-from-common-lisp"></a>

### Usage from Common Lisp

It's main entry point is [`cl-info:get-cl-info`][5b06] function. It returns an object with
customized `PRINT-OBJECT` method. You can use it to output debug
information in your programs.

`cl-info` ([`1`][047c] [`2`][32e1]) collects inforrmation about `OS`, Lisp Implementation, `ASDF`, installed
Quicklisp distributions:

```text
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
```
Also, you can gather information about separate systems using [`cl-info:get-system-info`][9306]
function:

```text
CL-USER> (cl-info:get-system-info :hamcrest)
System: HAMCREST 0.4.2
       /Users/art/common-lisp/cl-hamcrest/src/
```
<a id="usage-from-command-line"></a>

### Usage From Command-line

Also, you can use `cl-info` ([`1`][047c] [`2`][32e1]) as a command-line utility. It is useful to
output information about common lisp environment running on `CI` server.

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
<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40API-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## API

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40CL-INFO-3FPACKAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CL-INFO

<a id="x-28-23A-28-287-29-20BASE-CHAR-20-2E-20-22CL-INFO-22-29-20PACKAGE-29"></a>

#### [package](1f80) `cl-info`

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-7C-40CL-INFO-3FClasses-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Classes

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40CL-INFO-24CL-INFO-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### CL-INFO

<a id="x-28CL-INFO-3ACL-INFO-20CLASS-29"></a>

###### [class](fcb3) `cl-info:cl-info` ()

**Readers**

<a id="x-28CL-INFO-3AGET-ASDF-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](90ab) `cl-info:get-asdf-version` (cl-info) (= (asdf/upgrade:asdf-version))

Returns `ASDF` version.

<a id="x-28CL-INFO-3AGET-LISP-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](9a54) `cl-info:get-lisp-type` (cl-info) (= (lisp-implementation-type))

<a id="x-28CL-INFO-3AGET-LISP-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](fad8) `cl-info:get-lisp-version` (cl-info) (= (lisp-implementation-version))

<a id="x-28CL-INFO-3AGET-QL-DISTS-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](3ce0) `cl-info:get-ql-dists` (cl-info) (= (ql-dist:all-dists))

<a id="x-28CL-INFO-3AGET-SOFTWARE-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](2f5e) `cl-info:get-software-type` (cl-info) (= (software-type))

<a id="x-28CL-INFO-3AGET-SOFTWARE-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

###### [reader](581f) `cl-info:get-software-version` (cl-info) (= (software-version))

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-40CL-INFO-24SYSTEM-INFO-3FCLASS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

##### SYSTEM-INFO

<a id="x-28CL-INFO-3ASYSTEM-INFO-20CLASS-29"></a>

###### [class](2317) `cl-info:system-info` ()

**Readers**

<a id="x-28CL-INFO-3AABSENT-P-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

###### [reader](ff90) `cl-info:absent-p` (system-info) (:absent = nil)

<a id="x-28CL-INFO-3AGET-NAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

###### [reader](7f1c) `cl-info:get-name` (system-info) (:name)

<a id="x-28CL-INFO-3AGET-PATH-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

###### [reader](d327) `cl-info:get-path` (system-info) (:path)

<a id="x-28CL-INFO-3AGET-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

###### [reader](d5e0) `cl-info:get-version` (system-info) (:version)

<a id="x-28CL-INFO-DOCS-2FINDEX-3A-3A-7C-40CL-INFO-3FFunctions-SECTION-7C-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

#### Functions

<a id="x-28CL-INFO-3AGET-CL-INFO-20FUNCTION-29"></a>

##### [function](4676) `cl-info:get-cl-info`

Returns information about lisp implementation, asdf and quicklisp.

<a id="x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29"></a>

##### [function](d3e8) `cl-info:get-system-info` system-name


[c5b1]: https://40ants.com/cl-info
[047c]: https://40ants.com/cl-info/#x-28-23A-28-287-29-20BASE-CHAR-20-2E-20-22CL-INFO-22-29-20PACKAGE-29
[32e1]: https://40ants.com/cl-info/#x-28-23A-28-287-29-20BASE-CHAR-20-2E-20-22cl-info-22-29-20ASDF-2FSYSTEM-3ASYSTEM-29
[5b06]: https://40ants.com/cl-info/#x-28CL-INFO-3AGET-CL-INFO-20FUNCTION-29
[9306]: https://40ants.com/cl-info/#x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29
[c2be]: https://github.com/40ants/cl-info
[3904]: https://github.com/40ants/cl-info/actions
[1f80]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L1
[fcb3]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L21
[90ab]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L22
[9a54]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L25
[fad8]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L27
[2f5e]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L29
[581f]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L31
[3ce0]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L34
[2317]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L43
[7f1c]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L44
[d5e0]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L46
[d327]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L48
[ff90]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L50
[4676]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L93
[d3e8]: https://github.com/40ants/cl-info/blob/35a54b7a2f2ae8a277db9cb35767d609c88b0d40/src/core.lisp#L98
[eaff]: https://github.com/40ants/cl-info/issues

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
