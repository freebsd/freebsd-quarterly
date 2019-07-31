## FUSE ##

Contact: Alan Somers, <asomers@FreeBSD.org>  

FUSE (File system in USErspace) allows a userspace program to
implement a file system.  It is widely used to support out-of-tree file
systems like NTFS, as well as for exotic pseudo file systems like
sshfs.  FreeBSD's fuse driver was added as a GSoC project in 2012.
Since that time, it has been largely neglected.  The FUSE software is
[buggy](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=__open__&known_name=fusefs&list_id=289348&query_based_on=fusefs&query_format=advanced&short_desc=%5Bfusefs%5D%20sysutils%2Ffusefs-&short_desc_type=anywordssubstr)
and out-of-date.  Our implementation is about 11 years behind.

During Q2 I nearly finished the FUSE overhaul that I begain in Q1.  I raised
the protocol level from 7.8 to 7.23, fixed many bugs (see
[199934](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=199934),
[216391](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=216391),
[233783](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=233783),
[234581](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=234581),
[235773](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=235773),
[235774](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=235774),
[235775](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=235775),
[236226](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236226),
[236231](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236231),
[236236](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236236),
[239291](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=239291),
[236329](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236329),
[236379](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236379),
[236381](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236381),
[236405](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236405),
[236327](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236327),
[236466](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236466),
[236472](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236472),
[236473](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236473),
[236474](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236474),
[236530](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236530),
[236557](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236557),
[236560](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236560),
[236647](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236647),
[236844](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236844),
[237052](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=237052),
[237181](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=237181),
[237588](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=237588), and
[238565](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=238565)), and added
the following features:

* Optional kernel-side permissions checks (`-o default_permissions`)
* Implement `VOP_MKNOD`, `VOP_BMAP`, and `VOP_ADVLOCK`
* Allow interrupting FUSE operations
* Support named pipes and unix-domain sockets in fusefs file systems
* Forward `UTIME_NOW` during `utimensat(2)` to the daemon
* `kqueue` support for `/dev/fuse`
* Allow updating mounts with `mount -u`
* Allow exporting fusefs file systems over NFS
* Server-initiated invalidation of the name cache or data cache
* Respect `RLIMIT_FSIZE`
* Try to support servers as old as protocol 7.4

I also added the following performance enhancements:

* Implement FUSE's `FOPEN_KEEP_CACHE` and `FUSE_ASYNC_READ` flags
* Cache file attributes
* Cache lookup entries, both positive and negative
* Server-selectable cache modes: writethrough, writeback, or uncached
* Write clustering
* Readahead
* Use `counter(9)` for statistical reporting

All that remains is to finish merging the branch, and deal with any newly
introduced bugs.

Sponsor: The FreeBSD Foundation  
