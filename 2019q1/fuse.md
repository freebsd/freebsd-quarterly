## FUSE ##

Contact: Alan Somers, <asomers@FreeBSD.org>  

FUSE (File system in USErspace) allows a userspace program to
implement a file system.  It is widely used to support out-of-tree file
systems like NTFS, as well as for exotic pseudo file systems like
sshfs.  FreeBSD's fuse driver was added as a GSoC project in 2012.
Since that time, it has been largely neglected.  The FUSE software is
[buggy](https://bugs.freebsd.org/bugzilla/buglist.cgi?bug_status=__open__&known_name=fusefs&list_id=289348&query_based_on=fusefs&query_format=advanced&short_desc=%5Bfusefs%5D%20sysutils%2Ffusefs-&short_desc_type=anywordssubstr)
and out-of-date.  Our implementation is about 11 years behind.

The FreeBSD Foundation has agreed to fund a project to improve the
state of the FreeBSD FUSE driver.  So far I've written a test suite
for the fusefs(5) module and fixed several bugs. [XXX - discovered
from the test suite or already reported?] During the next quarter
I plan to continue fixing bugs, and I'll also raise the driver's
API level [XXX - to a newer version?  The current version?].

Sponsor: The FreeBSD Foundation  
