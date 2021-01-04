## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

The goal of the Linuxulator project is to improve compatibility
with Linux binaries.
Current status is being tracked at [Linux app status Wiki page](https://wiki.freebsd.org/LinuxApps).
The work has now shifted from command-line apps to desktop applications.

There wasn't much Foundation-sponsored work done during this quarter,
apart from extending fuse(4) to make it possible to run Linux FUSE
servers, which is required for AppImage.
The project got extended to cover the first quarter of 2021, to focus
on making sure the 13.0-RELEASE ships with Linuxulator in a good shape.

There was a very significant contribution from Conrad Meyer in the form
of `SO_PASSCRED` setsockopt(2) support, `PR_SETDUMPABLE` and `PR_GETDUMPABLE`
prctl(2) flags, and also `CLONE_FS` and `CLONE_FILES` handling.  This,
along with some more cleanups and improvements, leads to working Linux
Chromium; it has been tested with Netflix and Spotify clients.  It still
requires three flags to be passed on the command line, though.  Also,
the name_to_handle_at(2) and open_by_handle_at(2) syscalls are now supported.
There are also much better debug messages for unrecognized socket options.

Sponsor: The FreeBSD Foundation
