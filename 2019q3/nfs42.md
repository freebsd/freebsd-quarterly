## NFS Version 4.2 implementation ##

Contact: Rick Macklem <rmacklem@freebsd.org>

RFC-7862 describes a new minor revision to the NFS Version 4 protocol.
This project implements this new minor revision.

The NFS Version 4 Minor Version 2 protocol adds several optional
features to NFS, such as support for SEEK_DATA/SEEK_HOLE, file
copying done on the server that avoids data transfer over the wire
and support for posix_fallocate(), posix_fadvise().
Hopefully these features can improve performance for certain applications.

The implementation is now nearing completion and recent work has been
mostly testing. A cycle of interoperability testing with Linux has
just been completed. The main area that still needs testing is use
of the pNFS server with NFSv4.2 and that should start soon.
Once testing of pNFS is completed, I believe the code is ready to
be incorporated into FreeBSD head/current.

Testing by others would be appreciated. The modified kernel can be
found at https://svn.freebsd.org/base/projects/nfsv42/sys and should
run with a recent FreeBSD head/current system. Client mounts need the
"minorversion=2" mount option to enable this protocol.
