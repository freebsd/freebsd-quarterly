## Security-Related changes ##

Contact: Konstantin Belousov <kib@freebsd.org>

== ASLR

The ASLR (Address Space Layour Randomization) patch from D5603 was
committed into svn.  While debate continues about the current and
forward-looking value ASLR provides, having an implementation in
the FreeBSD source tree makes it easily available to those who wish
to use it.  This also moves the conversation past the relative
merits to more comprehensive security controls.

== KPTI per-process control

The KPTI (Kernel Page Table Isolation) implementation was structured
so that most selections of page isolation mode were local to the
current address space.  In other words, the global control variable
pti was almost unused in the code paths, instead the user/kernel
%cr3 values were directly loaded into registers or compared to see
if the user page table was trimmed.  Some missed bits of code were
provided by Isilon, and then bugs were fixed and last places of
direct use of pti were removed.

Now when the system starts in the pti-enabled mode, proccontrol(1) can
be used by root to selectively disable KPTI mode for children of a
process.  The motivation is that if you trust the program that you
run, you can get the speed of non-pti syscalls back, but still run
your normal user session in PTI mode.  E.g., firefox would be properly
isolated.

== Feature-control bits

Every FreeBSD executable now contains a bit mask intended for
enabling/disabling security-related features which makes sense for the
binary.  This mask is part of the executable segments loaded on image
activation, and thus is part of any reasonable way to authenticate the
binary content.

For instance, the ASLR compatibility is de-facto the property of the
image and not of the process executing the image.  The first (zero)
bit in the mask controls ASLR opt-out.  Other OSes (e.g. Solaris) used
an OS-specific dynamic flag, which has the same runtime properties
but leaves less bits to consume in the feature-control mask.

The feature-control mask is read both by kernel and by rtld during
image activation.  It is expected that more features will be added
to FreeBSD and the mask can be used for enabling/disabling those
features..

It is expected that a tool to manipulate the mask will be provided
shortly, see https://reviews.freebsd.org/D19290 .

Sponsor: The FreeBSD Foundation
