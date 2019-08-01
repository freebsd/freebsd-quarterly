## NFSv4.2 client/server implementation for FreeBSD ##

Contact: Rick Macklem, <rmacklem@freebsd.org>  

Link: [current sources](https://svnweb.freebsd.org/base/projects/nfsv42)  

NFSv4.2 is a newer minor version of NFSv4, made up of a set of optional
operations/features.  A majority of these operations are related to
the POSIX operations posix_fadvise(2), posix_fallocate(2) and lseek(2)'s
support for SEEKHOLE/SEEKDATA.  There is also a Copy operation that allows
a byte range of a file to be copied to another file locally on the NFS
server, avoiding data transfer over the wire in both directions.
FreeBSD-current now has a Linux compatible copy_file_range(2) syscall
that will invoke this Copy operation on NFSv4.2 mounts.
There is also support for MAC labelling, but it requires changes to the
RPCSEC_GSS implementation to add V3 support and, as such, may not happen
soon.

The implementation of NFSv4.2 (RFC-7862) is progressing nicely.
At this time, the LayoutError, IOAdvise, Allocate and Copy operations
have been implemented.  There is still work to be done on Copy, to add
asynchronous support, so that large copies do not result in a long delay
for the RPC's reply.

The major operation that will be implemented next is Seek, so that
lseek(SEEKHOLE/SEEKDATA) will work for the NFSv4.2 mounts.

It is hoped that this implementation will be ready for FreeBSD-current/head
in time for the FreeBSD-13 release.

Testing is always appreciated and can be done by downloading the modified
kernel from the svn repository in base/rojects/nfsv42 and then building
and testing it on a couple of recent FreeBSD-current systems.

If anyone is conversant with Kerberos and wants to take on the challenge
of adding RPCSEC_GSS_V3 support to the kernel RPC, a patch that does
that would also be greatly appreciated.
