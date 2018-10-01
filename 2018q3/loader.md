## Boot Loader 2018Q4 Update

Contact: Warner Losh <imp@freebsd.org>, Kyle Evans <kevans@freebsd.org>, Toomas Soome <tsoome@Freebsd.org>

The FreeBSD boot loader lives in src/stand. It covers all the code
that the project provides that interacts with the hardware before the
kernel starts.

The LUA interpreter we added earlier in the year was made default this
quarter. Due to undiagnosed booting issues, however, it has been
disabled on sparc64 and all powerpc. The LUA interpreter is scheduled
to replace the FORTH interpreter entirely in FreeBSD 13, although the
FORTH interpreter will remain available as a build option in FreeBSD
12. The plans are not to remove the FORTH loader for about a year
after 12.0 release, or approximately January 2020. Platforms not
currently working have until that date to resolve the issues.

At this point, the LUA scripts implement everything that FORTH scripts
did. Where there was ambiguity in the spec, or where the FORTH scirpts
were more forgiving that was strictly documented, every effort has
been made to improve the documentation and follow the old FORTH
behavior, or document the new behavior where the old behavior was
clearly a bug.

It's anticpated that no further changes to the FORTH loader or the
FORTH scripts will happen. They are quite mature and bullet proof at
tnhis point and it's unlikely that an undiscovered bug will need to be
fixed before retirement.

Other work in progress includes Toomas Soome's port to OpenIndiana. In
addition to porting, he's enhanced the code in a number of ways (both
in the block layer, and UEFI). Many of his improvements have been
committed to FreeBSD, though a few remain and hopefully will be
entering the tree soon after the freeze lifts.

UEFI booting has been greatly enhanced. However, there's still some
machines that have issues with the default BootXXXX variables or
something else in the environemnt that are being investigated. We hope
to understand the problems well enough to provide a fix for FreeBSD
12.0.

There's also efforts underway to bring signed image support, improved
crypto booting options and implement Multiboot 2.0.

