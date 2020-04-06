## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Work during this quarter focused on source code cleanup and making
it easier to debug missing functionality.  There were, however,
some user-visible changes: added support for `TCP_CORK` as required by Nginx,
added support `MAP_32BIT` flag, which fixes Mono binaries from Ubuntu Bionic,
and a fix for DNS resolution with glibc newer than 2.30, which affected
CentOS 8.

The Linux Test Project tests that are being run as part of the
the [FreeBSD Continuous Integration infrastructure](https://ci.FreeBSD.org)
now include the Open POSIX test suite.

There's still a lot to do:

 - There are pending reviews for patches that add
   [extended attributes support](https://reviews.freebsd.org/D13209),
   and [fexecve(2) syscall](https://reviews.freebsd.org/D10275), and
   they require wrapping up and committing

 - There are over [400 failing LTP tests](https://ci.freebsd.org/job/FreeBSD-head-amd64-test_ltp/).
   Some of them are false positives, some are easy to fix bugs, and some require adding
   new system calls.  Any help is welcome.

Sponsor: The FreeBSD Foundation
