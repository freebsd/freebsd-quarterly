## FAT / msdosfs support for makefs(8) ##

Contact: Ed Maste <emaste@FreeBSD.org>  

In order to streamline the process of creating install or virtual
machine system images we needed FAT filesystem support in makefs(8).
Makefs was originally developed in NetBSD, and FAT support was added
there not much later, but after the tool was ported to FreeBSD.

Siva Mahadevan, one of the FreeBSD Foundation's interns from the
University of Waterloo, worked on porting FAT support from NetBSD.
I [rebased and updated](https://reviews.freebsd.org/D16438) Siva's
work, and [committed](https://reviews.freebsd.org/rS351273) it during
this quarter.  After a few follow-up fixes we are able to build FAT
filesystem images without using md(4) and without requiring root.

Sponsor: The FreeBSD Foundation  
