<a id="x-28CL-INFO-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# CL-INFO - Common Lisp Environment Reporter

[![](https://github-actions.40ants.com/40ants/cl-info/matrix.svg?only=ci.run-tests)][3904]

This is a small utility, useful to display information about you Common
Lisp environment. You might want to call it in the `CI` pipeline or
to use it when rendering a crash report in some client applications.

<a id="usage-from-common-lisp"></a>

## Usage from Common Lisp

It's main entry point is [`cl-info:get-cl-info`][b41e] function. It returns an object with
customized `PRINT-OBJECT` method. You can use it to output debug
information in your programs.

[`cl-info`][45fe] collects inforrmation about `OS`, Lisp Implementation, `ASDF`, installed
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
Also, you can gather information about separate systems using [`cl-info:get-system-info`][a6b6]
function:

```text
CL-USER> (cl-info:get-system-info :hamcrest)
System: HAMCREST 0.4.2
       /Users/art/common-lisp/cl-hamcrest/src/
```
<a id="usage-from-command-line"></a>

## Usage From Command-line

Also, you can use [`cl-info`][45fe] as a command-line utility. It is useful to
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
<a id="api-reference"></a>

## API Reference

<a id="x-28CL-INFO-3AGET-CL-INFO-20FUNCTION-29"></a>

## [function](0871) `get-cl-info`

Returns information about lisp implementation, asdf and quicklisp.

<a id="x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29"></a>

## [function](9d26) `get-system-info` system-name

<a id="x-28CL-INFO-3ACL-INFO-20CLASS-29"></a>

## [class](87df) `cl-info` ()

<a id="x-28CL-INFO-3AGET-ASDF-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](604f) `get-asdf-version` (cl-info) (= (asdf/upgrade:asdf-version))

Returns `ASDF` version.

<a id="x-28CL-INFO-3AGET-LISP-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](3140) `get-lisp-type` (cl-info) (= (lisp-implementation-type))

<a id="x-28CL-INFO-3AGET-LISP-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](68cd) `get-lisp-version` (cl-info) (= (lisp-implementation-version))

<a id="x-28CL-INFO-3AGET-SOFTWARE-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](1410) `get-software-type` (cl-info) (= (software-type))

<a id="x-28CL-INFO-3AGET-SOFTWARE-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](ab66) `get-software-version` (cl-info) (= (software-version))

<a id="x-28CL-INFO-3ASYSTEM-INFO-20CLASS-29"></a>

## [class](c471) `system-info` ()

<a id="x-28CL-INFO-3AABSENT-P-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](5a35) `absent-p` (system-info) (:absent = nil)

<a id="x-28CL-INFO-3AGET-NAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](f8c2) `get-name` (system-info) (:name)

<a id="x-28CL-INFO-3AGET-PATH-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](af5f) `get-path` (system-info) (:path)

<a id="x-28CL-INFO-3AGET-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](3c96) `get-version` (system-info) (:version)


[45fe]: #x-28CL-INFO-3ACL-INFO-20CLASS-29
[b41e]: #x-28CL-INFO-3AGET-CL-INFO-20FUNCTION-29
[a6b6]: #x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29
[3904]: https://github.com/40ants/cl-info/actions
[87df]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L137
[604f]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L138
[3140]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L141
[68cd]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L143
[1410]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L145
[ab66]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L147
[c471]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L159
[f8c2]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L160
[3c96]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L162
[af5f]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L164
[5a35]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L166
[0871]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L209
[9d26]: https://github.com/40ants/cl-info/blob/eaa4a792e98b1c4c9b52444061eedf61869a6147/src/core.lisp#L214