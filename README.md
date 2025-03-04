<a id="x-28CL-INFO-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# CL-INFO - Common Lisp Environment Reporter

[![](https://github-actions.40ants.com/40ants/cl-info/matrix.svg?only=ci.run-tests)][3904]

This is a small utility, useful to display information about you Common
Lisp environment. You might want to call it in the `CI` pipeline or
to use it when rendering a crash report in some client applications.

<a id="usage-from-common-lisp"></a>

## Usage from Common Lisp

It's main entry point is [`cl-info:get-cl-info`][5b06] function. It returns an object with
customized `PRINT-OBJECT` method. You can use it to output debug
information in your programs.

[`cl-info`][3d51] collects inforrmation about `OS`, Lisp Implementation, `ASDF`, installed
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

## Usage From Command-line

Also, you can use [`cl-info`][3d51] as a command-line utility. It is useful to
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

## [function](bcb8) `cl-info:get-cl-info`

Returns information about lisp implementation, asdf and quicklisp.

<a id="x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29"></a>

## [function](d0df) `cl-info:get-system-info` system-name

<a id="x-28CL-INFO-3ACL-INFO-20CLASS-29"></a>

## [class](9681) `cl-info:cl-info` ()

<a id="x-28CL-INFO-3AGET-ASDF-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](2e83) `cl-info:get-asdf-version` (cl-info) (= (asdf/upgrade:asdf-version))

Returns `ASDF` version.

<a id="x-28CL-INFO-3AGET-LISP-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](8c84) `cl-info:get-lisp-type` (cl-info) (= (lisp-implementation-type))

<a id="x-28CL-INFO-3AGET-LISP-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](24cc) `cl-info:get-lisp-version` (cl-info) (= (lisp-implementation-version))

<a id="x-28CL-INFO-3AGET-SOFTWARE-TYPE-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](bec5) `cl-info:get-software-type` (cl-info) (= (software-type))

<a id="x-28CL-INFO-3AGET-SOFTWARE-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ACL-INFO-29-29"></a>

## [reader](940b) `cl-info:get-software-version` (cl-info) (= (software-version))

<a id="x-28CL-INFO-3ASYSTEM-INFO-20CLASS-29"></a>

## [class](0285) `cl-info:system-info` ()

<a id="x-28CL-INFO-3AABSENT-P-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](18e8) `cl-info:absent-p` (system-info) (:absent = nil)

<a id="x-28CL-INFO-3AGET-NAME-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](eb32) `cl-info:get-name` (system-info) (:name)

<a id="x-28CL-INFO-3AGET-PATH-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](bab1) `cl-info:get-path` (system-info) (:path)

<a id="x-28CL-INFO-3AGET-VERSION-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20CL-INFO-3ASYSTEM-INFO-29-29"></a>

## [reader](ac3b) `cl-info:get-version` (system-info) (:version)


[3d51]: https://40ants.com/cl-info/#x-28CL-INFO-3ACL-INFO-20CLASS-29
[5b06]: https://40ants.com/cl-info/#x-28CL-INFO-3AGET-CL-INFO-20FUNCTION-29
[9306]: https://40ants.com/cl-info/#x-28CL-INFO-3AGET-SYSTEM-INFO-20FUNCTION-29
[3904]: https://github.com/40ants/cl-info/actions
[9681]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L137
[2e83]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L138
[8c84]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L141
[24cc]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L143
[bec5]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L145
[940b]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L147
[0285]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L159
[eb32]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L160
[ac3b]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L162
[bab1]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L164
[18e8]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L166
[bcb8]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L209
[d0df]: https://github.com/40ants/cl-info/blob/d25a9e5cdeb3153a9273aaa09e360f1c3f886ba5/src/core.lisp#L214

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
