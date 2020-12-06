## OpenBSM Synchronisation ##

Link:	 [TrustedBSD / OpenBSM](http://www.trustedbsd.org/openbsm.html)  
Link:	 [OpenBSM Github Sources](https://github.com/openbsm/openbsm)
Link:	 [Synchronisation with macOS Catalina](https://github.com/openbsm/openbsm/commit/54a0c07cf8bac71554130e8f6760ca68e5f36c7f)
Link:	 [Apple OpenSource](https://opensource.apple.com)

Contact: Gordon Bergling <gbe@FreeBSD.org>  

OpenBSM is a crucial part of FreeBSD, which provides auditing features for
the operating system. OpenBSM is incorporated into FreeBSD and macOS.
Both Apple and FreeBSD have currently made changes to the OpenBSM framework,
which weren't be upstreamed. This small project aims to consolidated
these changes and upstream them to the OpenBSM github repository, so that
both development efforts can be merged to FreeBSD later on. The tricky part
of this project is the manual comparison, since Apple doesn't provide any
changelogs.

I am currently working on on the macOS Catalina sources and hopefully Apple 
will release the sources of macOS Big Sur in time for FreeBSD 13.
