## NFS Version 4.2 implementation ##

Contact: Rick Macklem, <rmacklem@freebsd.org>

RFC-7862 describes a new minor revision to the NFS Version 4 protocol.
This project implements this new minor revision.

The NFS Version 4 Minorversion 2 protocol adds several optional
features to NFS, such as support for SEEK_DATA/SEEK_HOLE, file
copying done on the server that avoids data transfer over the wire
and support for posix_fallocate(), posix_fadvise().
Hopefully these features can improve performance for certain applications.

This project has basically been completed.  The code changes have now
all been committed to head/current and should be released in FreeBSD 13.

Testing by others would be appreciated. To do testing, an up to date
head/current system is required.  Client mounts need the
"minorversion=2" mount option to enable this protocol.
The NFS server will have NFSv4.2 enabled by default.
