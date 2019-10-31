## Randomized Top of Stack pointer ##

Contact: Konstantin Belousov <kib@FreeBSD.org>

After the ASLR so useful addition, next in the series of the
buzzword-compliant checkboxes is the stack addresses randomization.

The main userspace thread stack on FreeBSD is traditionally allocated
from the top of the user address space and grows down.  Besides the
initial pointer for the stack on userspace entry, this area also
contains structures for program arguments and environment (so called
strings), and aux vector data for ELF images.

Considering the goal of randomizing the addresses of strings and main
thread initial frame, moving the main stack area in the address space
is not feasible.  It would cause significant ABI breakage, invalidates
the knowledge already coded into many introspection tools, and causes
unneeded additional fragmentation of the user address space.

Instead a typical approach of adding a gap of randomized size between
top of stack and a place for strings was used.  It is done in a way
which preserves the stack alignment requirement.  Stack gap is only
enabled if ASLR is enabled (not default) and stack gap itself is
enabled (default if ASLR is enabled).  Stack gap is specified in
percentage of the total stack size that can be used for maximum gap.

The main drawback of the gap approach was shortly identified.  Since
gap is cut from the normal stack area, attempts of the programs to
reduce stack size using rlimit(RLIMIT_STACK) could cut the active stack
region if new limit happens to be smaller than the gap.  E.g. on amd64
with its default 512M main thread stack, even one percent of the max
gap gives approximately 5M of unused stack, that can blow up the limit
of several KBs.

Typical reason for using rlimit(2) this way is for programs that wire
all of its address space with mlockall(2), trying to reduce potential
wired stack size to avoid exceeding RLIMIT_MEMLOCK.

First victim of that issue was ntpd, which resets the stack limit
after start for a really small value.  Currently the wiring was removed
from ntpd, because apparently it does not make the timekeeping better
by any means, contrary to popular belief.

My opinion is that the problem is more in the user interface area than
in the gap approach itself.  We should make it easy to specify small
gap sizes, which cannot be done with integral percentage interface.
So far I did not formulated a way to do this which I would like, and
since nobody looked for a good solution because after ntpd was fixed, 
the severity of the issue seems very low.

Sponsor: The FreeBSD Foundation
