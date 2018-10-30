## SMAP ##
Contact: Konstantin Belousov, <kib@freebsd.org>
Link:	 None

Support for SMAP, which stands for supervisor-mode access prevention,
was added to amd64 kernels.  SMAP makes faulting any access from the
supervisor mode to the pages accessible to user mode, unless the
%eflags.AC bit is set.

SMAP implementation uses the ifunc framework to avoid checking for the
SMAP capability of hardware on each call for the copyout(9) and other
functions.

On amd64, we have the common address space between kernel and user.
Enabling SMAP virtually splits the it into two disjoint address
spaces, providing relatively low-overhead way of catching direct
accesses from kernel to usermode, without using the copyout(9) family
of functions.

It is interesting that not much bugs were found in our kernel after
the SMAP was enabled.  One issue existed in the pci(9) user driver.
On the other hand, at least two ports, VBox and acpi_call, appeared to
access userspace in unsafe manner.

The work was sponsored by The FreeBSD Foundation.
