## LLVM 7.0 - Sanitizers support improvements / Static code analysis ##

Contact: David Carlier <devnexen@gmail.com>

Link:	 [Release notes](http://releases.llvm.org/7.0.0/docs/ReleaseNotes.html)

In order to increase the FreeBSD tooling to uncover
code bugs in the userland, further compiler-rt components 
support and static code analysis improvements had been added
since the last 6.0 version.

Starting with the sanitizers, Memory Sanitizer (for amd64) mainly to
detect unitialized pointers. There is also a simple W^X paging
requests detection available from most of sanitizers.

Also libFuzzer support finally had been possible. Basically,
it allows to test code with random values from corpus inputs.
Mutation and combination algorithms of those random inputs 
can be overwritten. Can also be used in addition to ubsan,
 asan, msan and so on.

At last, the X-Ray instrumentation feature is also supported.
It is mainly about performance profiling purposes for a
reasonable performance runtime cost.

In the static code analysis department, reliable strlcpy (unfortunately strlcat
did not get merged in due time for the release) wrong usage
cases are now covered and W^X code detection tooling had been added.

At the moment, this 7.0 version is imported by Dimitry Andric, within
its own git branch available only for FreeBSD after 12 releases.
