## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Earlier Linuxulator work focused on code cleanups and improving
diagnostic tools.
Work has now shifted from cleanups to fixing actual applications.
Current status is being tracked at
[Linux app status Wiki page](https://wiki.freebsd.org/LinuxApps).
Initial focus is on applications that don't involve X11, mostly
because they tend to be easier to test and debug, and the bug fixes
are not application-specific.

Example problems fixed include buggy madvise(2) handling, which could
break applications linked against jemalloc; uname(2) returning wrong
results for 32 bit apps, which caused problems for Steam; recvmsg(2)
and accept(2) being broken in some circumstances, which was breaking
Redis; and missing support for `SO_REUSEPORT`, `SO_SNDBUFFORCE`,
`SO_RCVBUFFORCE`, and `SO_PROTOCOL`, which spammed the log files when
running the Python regression test suite.  The default soft open files
limit is now automatically adjusted to 1024, as several Linux apps
iterate over all the file descriptors up to that limit instead of using
closefrom(2).

There's ongoing work on cleanups and the debugging framework for Linux
compatibility, such as logging warnings for unrecognized system call
parameters, or adding the `compat.linux.debug` sysctl to turn the warnings
off.

The Linux Test Project tests that are being run as part of the
the [FreeBSD Continuous Integration infrastructure](https://ci.FreeBSD.org)
has been upgraded to 20200605 snapshot.  This raised the number
of test cases from 3670 to 3749, and, predictably, also the number
of failures, from 583 to 647.

There's still a lot to do:

 - There are pending reviews for patches that add
   [extended attributes support](https://reviews.freebsd.org/D13209),
   and [fexecve(2) syscall](https://reviews.freebsd.org/D10275), and
   they require wrapping up and committing

 - There are over [500 failing LTP tests](https://ci.freebsd.org/job/FreeBSD-head-amd64-test_ltp/).
   Some of them are false positives, some are easy to fix bugs, and some require adding
   new system calls.  Any help is welcome.

Sponsor: The FreeBSD Foundation
