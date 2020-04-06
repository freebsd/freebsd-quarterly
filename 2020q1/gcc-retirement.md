## GCC 4.2.1 Retirement ##

Contact: Ed Maste, <emaste@freebsd.org>  
Contact: Warner Losh, <imp@freebsd.org>  

In 2007 the GNU Compiler Collection (GCC) migrated to GPLv3, which
prompted discussions about the future of the FreeBSD tool chain.  We held
a [Tool Chain Summit](https://wiki.freebsd.org/201005ToolchainSummit) at
BSDCan 2010.  Roman Divacky gave an update on the ClangBSD project, building
FreeBSD using the new and rapidly improving Clang compiler.

Since that time Clang was imported into the FreeBSD base system and was used
more and more widely - first being installed but not the default `cc`, then
used by default on i386 and amd64, and later used on more and more targets.
In the years since Dimitry Andric has been keeping our copy of Clang
up-to-date.

GCC 4.2.1 was kept in the tree for a few FreeBSD targets that hadn't migrated
to Clang, such as MIPS and Sparc64.  By early this year all remaning targets
had migrated to external toolchain (contemporary GCC from ports or packages),
or had been deprecated.

With no in-tree consumers remaining, GCC 4.2.1 was removed from FreeBSD in
[r358454](https://svnweb.freebsd.org/changeset/base/358454) on February 29,
2020.
