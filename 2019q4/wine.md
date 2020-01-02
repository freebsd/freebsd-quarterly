Wine on FreeBSD

Link:	 [Wine homepage](https://www.winehq.org)  

Contact: Gerald Pfeifer <gerald@FreeBSD.org>  

A lot has happened since our last quarterly report.  The Wine 4
release series has been in our tree for nearly a year and proven
rather stable.  Both that port and wine-devel, which tracks
bi-weekly development releases, have seen regular adjustments to
infrastructure changes and small improvements, in particular also
around non-default options.

Now we need help!

WoW64 (or Wine on Wine 64) allows running both 32-bit and 64-bit
Windows applications in one installation.  A volunteer has proposed

 * a general framework for lib32- companion libraries
   (https://reviews.freebsd.org/D16830)
 * an approach directly using our Wine ports
   (https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=242625)

to make this work and we do not have the expertise nor facilities to
properly review, test, and maintain those ourselves.

If you can facilitate getting (at least one of) these into the tree,
please help!  And if you'd like to assume co-maintainership or sole
maintainership of emulators/wine*, that is an option, too.
