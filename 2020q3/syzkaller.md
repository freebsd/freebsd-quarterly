## syzkaller on FreeBSD ##

Contact: Mark Johnston <markj@FreeBSD.org>  

See the syzkaller entry in the 2019q1 quarterly report for an
introduction to syzkaller.

syzkaller, especially the public syzbot instance, continues to find bugs
in the FreeBSD kernel.  A number of these bugs have been fixed in
subsystems such as the VFS name cache, the TCP and SCTP stacks, pf(4),
the unix domain socket implementation and the Linuxulator.

The FreeBSD Foundation sponsored some work to enable cross-OS fuzzing.
This makes it possible to fuzz the Linuxulator using syzkaller's Linux
target.  This effort quickly found several bugs; once the support is
committed upstream we will hopefully be able to leverage syzbot to gain
continuous testing of the Linux system call interface in addition to the
native and 32-bit compatibility interfaces.

Some work was also done to enable running syzkaller in a FreeBSD jail,
with the eventual aim of making it easy to distribute binary images
containing everything required to immediately start running syzkaller on
a new host.  Currently a number of setup steps are required, making
deployment somewhat painful.

Sponsor: The FreeBSD Foundation
