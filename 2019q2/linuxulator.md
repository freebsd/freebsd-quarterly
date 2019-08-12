## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

The project aims to improve the Linux compatibility layer, to make
it more compatible with recent Linux releases, and also to lower
the bar for potential developers who want to start contributing to it.

The initial effort focused on tooling, to make it easier to debug
problems and to prevent future regressions.  The first part involved
making it possible to use Linux strace(1) utility and providing it
as `linux-c7-strace` package.  The reason is that while FreeBSD
`truss(1)` and `ktrace(1)` can trace Linux binaries, they cannot
decode Linux-specific flags and structures.

The second part involved providing Linux Test Project binaries as
`linux-ltp` package.  There is ongoing work to hook it up to the
FreeBSD CI infrastructure (http://ci.FreeBSD.org).

There was also a number of improvements and fixes to bugs discovered
in the process.  One of them (not yet committed) fixes binaries
linked against newer version of libc, effectively unbreaking binaries
from recent Ubuntu releases.

Sponsor: FreeBSD Foundation
