## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Linuxulator improvements have been ongoing for the last two years,
with support from the FreeBSD foundation over a few distinct project
grants as well as contributions from the community.
The goal of this project is to improve FreeBSD's ability to execute
unmodified Linux binaries.
Current status is being tracked at [Linux app status Wiki page](https://wiki.freebsd.org/LinuxApps).
The work has now shifted from command-line apps to desktop applications.

There wasn't much Foundation-sponsored work done during this quarter,
apart from extending fuse(4) to make it possible to run Linux FUSE
servers, which is one of the things required to run AppImages.
The Foundation-sponsored effort will continue into the first quarter
of 2021 in order to make sure the 13.0-RELEASE ships with Linuxulator in a good shape.

There was a very significant contribution from Conrad Meyer in the form
of `SO_PASSCRED` setsockopt(2) support, `PR_SETDUMPABLE` and `PR_GETDUMPABLE`
prctl(2) flags, and also `CLONE_FS` and `CLONE_FILES` handling.  This,
along with some more cleanups and improvements, leads to working Linux
Chromium; it has been tested with Netflix and Spotify clients.  It still
requires three flags (`--no-sandbox --no-zygote --in-process-gpu`)
to be passed on the command line to work around missing functionality, though.  Also,
the name_to_handle_at(2) and open_by_handle_at(2) syscalls are now supported.
There are also much better debug messages for unrecognized socket options.

Sponsor: The FreeBSD Foundation
