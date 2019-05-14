## FUSE ##

Contact: Alan Somers, <asomers@FreeBSD.org>  

FUSE (File system in USErspace) allows a userspace program to
implement a file system.  It is widely used to support out-of-tree file
systems like NTFS, as well as for exotic pseudo file systems like
sshfs.  FreeBSD's fuse driver was added as a GSoC project in 2012.
Since that time, it has been largely neglected.  The FUSE software is
[buggy](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=__open__&known_name=fusefs&list_id=289348&query_based_on=fusefs&query_format=advanced&short_desc=%5Bfusefs%5D%20sysutils%2Ffusefs-&short_desc_type=anywordssubstr)
and out-of-date.  Our implementation is about 11 years behind.

The FreeBSD Foundation has agreed to fund a project to improve the state of the
FreeBSD FUSE driver.  So far I've written a test suite for the fusefs(5)
module, fixed 1 previously reported bug, discovered and fixed 6 new bugs, fixed
all of fusefs's Coverity CIDs, made some minor performance enhancements and
done some general cleanup.  During the next quarter I plan to continue fixing
bugs, and I'll also raise the driver's API level as high as I can before the
quarter runs out.  We're currently at 7.8; the highest defined level is 7.28.

Sponsor: The FreeBSD Foundation  
