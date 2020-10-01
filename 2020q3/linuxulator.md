## Linux compatibility layer update ##

Contact: Edward Tomasz Napierala, <trasz@FreeBSD.org>

Earlier Linuxulator work focused on code cleanups and improving
diagnostic tools.
Work has now shifted from cleanups to fixing actual applications.
Current status is being tracked at
[Linux app status Wiki page](https://wiki.freebsd.org/LinuxApps).
Initial focus was on applications that don't involve X11, mostly
because they tend to be easier to test and debug, and the bug fixes
are not application-specific.

Foundation-sponsored work during this quarter included implementing
a devfs(5) workaround to fix gettynam(3) inside jail/chroot, and
workaround for the missing splice(2) syscall, which caused problems
for grep and autotools. The Linux version reported to userspace was bumped
to 3.10.0, which matches the kernel shipped with RHEL 7 and is neccessary
for DB2 installation to succeed.  The BLKPBSZGET ioctl neccessary for
Oracle is supported now.  There were also more cleanups, including moving
some Linuxulator-specific functionality related to error handling off
from the syscall's fast code paths.  The sysutils/debootstrap was updated
to a newer version; finally there were some improvements
to [documentation](https://wiki.freebsd.org/LinuxJails).

Most of those changes have been merged to FreeBSD 12-STABLE, in order
to ship with 12.2-RELEASE.

There is increased involvement from other developers; this includes termios
performance fixes, improved memfd support, implementing `CLOCK_MONOTONIC_RAW`
required for Steam, madvise improvements, or new `compat.linux.use_emul_path`
sysctl; support for kcov, neccessary for syzcaller, and fixes to problems
found with syzcaller related to futex locking.  There is also ongoing work
on tracking down the causes of failures related to Steam and WebKit, with
fixes being first implemented in
[linuxulator-steam-utils](https://github.com/shkhln/linuxulator-steam-utils/wiki/Compatibility).

Sponsor: The FreeBSD Foundation
