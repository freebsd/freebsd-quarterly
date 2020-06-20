## Run-Time Dynamic Linker improvements ##

Contact: Konstantin Belousov <kib@FreeBSD.org>    

Rtld gets some number of small bug fixes and improvements.

RTLD_DEEPBIND dlopen(3) flag was implemented, despite being a strange
and even dangerous idea, for compatibility with glibc.

Several improvements to the direct execution mode were made.  Most
interesting are perhaps the '-v' switch to report some configuration
parameters for rtld, the ability to specify argv0 different from the
executed binary name, and fixes to properly set osrel/ABI for the
directly executed binary.

The link_map structure that is used by tools that need to know the
list of loaded shared objects was made more compatible with glibc,
while keeping existing FreeBSD ABI intact.

In the course of the link_map work, it become apparent that rtld sometimes
needs to report presence of features that cannot be deduced by just a
runtime test for symbol presence or for function behavior.  For that,
a scheme of reporting features with uniformingly named symbols was
designed - see the rtld(1) man-page (in CURRENT) for an explanation.

Position-independent (PIE) binaries on FreeBSD are now marked with the
DF_1_PIE DT_FLAG1 flag.  Otherwise, such binaries are just ET_DYN
objects and it is quite hard to distinguish proper dynamically shared
object (DSO) from PIE binary.  The problem is that for binaries, the static
linker strips some information which is required for proper loading as a
DSO, and additonally, binaries contains relocations like copy-relocations
that cannot be handled for non-main binaries at all.

With the flag addition, rtld properly detects binaries and refuses to
load the with dlpen() or as DT_NEEDED dependency. ldd(1) also
misdetected PIE vs. DSO, and required a fix to parse dynamic segments
to not try to dlopen() them.

Sponsor: The FreeBSD Foundation
