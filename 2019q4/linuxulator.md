## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Linux binaries of Linux Test Projects tests are now part
of the [FreeBSD Continuous Integration infrastructure](https://ci.FreeBSD.org).
This makes it easy to track progress in improving the Linux
compatibility layer, and to detect regressions.

There was a fair number of all kinds of improvements to the layer,
ranging from updated linux(4) man page, to a new `linux` rc script,
which now takes care of eg mounting Linux-specific filesystems
or setting ELF fallback brand, to new syscalls, to tiny improvements
such as making ^T work for Linux binaries.

From the user point of view, when running 13-CURRENT, Linux jails
are now in a mostly working state: you can SSH into a jail with
CentOS 8 binaries, run screen(1), Emacs, Postgres, OpenJDK 11,
use `yum upgrade`...
Of course there's still a bunch of things that need work:

 - There is a patch from chuck@ that makes core dumps work for
   Linux binaries; this will make debugging much easier

 - There are pending reviews for patches that add
   [extended attributes support](https://reviews.freebsd.org/D13209),
   [fexecve(2) syscall](https://reviews.freebsd.org/D10275),
   [sendfile](https://reviews.freebsd.org/D19917); they require wrapping
   up and committing

 - There are over [400 failing LTP tests](https://ci.freebsd.org/job/FreeBSD-head-amd64-test_ltp/).
   Some of them are false positives, some are easy to fix bugs, some require adding
   new system calls.  Any help is welcome.

Sponsor: FreeBSD Foundation
