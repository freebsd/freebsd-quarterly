## FUSE ##

Contact: Alan Somers <asomers@FreeBSD.org>  

FUSE (File system in USErspace) allows a userspace program to
implement a file system.  It is widely used to support out-of-tree file
systems like NTFS, as well as for exotic pseudo file systems like
sshfs.  FreeBSD's fuse driver was added as a GSoC project in 2012.
Since that time, it has been largely neglected.  The FUSE software is
[buggy](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=__open__&known_name=fusefs&list_id=289348&query_based_on=fusefs&query_format=advanced&short_desc=%5Bfusefs%5D%20sysutils%2Ffusefs-&short_desc_type=anywordssubstr)
and out-of-date.  Our implementation is about 11 years behind.

I completed this work during Q3.  I fixed a few newly-introduced bugs, fixed a
long-standing sendfile bug that affects FUSE
([236466](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=236466)) and merged
everything to head and stable/12.  Then I fixed the resulting Coverity CIDs.
There have been no new FUSE-related bug reports, so I can only assume that
everything is working great.  Report any problems to asomers@FreeBSD.org.

Sponsor: The FreeBSD Foundation  
