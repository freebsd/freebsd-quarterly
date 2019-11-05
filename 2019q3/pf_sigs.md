## Signals delivered on unhandled Page Faults ##

Contact: Konstantin Belousov <kib@FreeBSD.org>

By necessity, handling of page faults is separated into two pieces.  The
first is the architecture-dependent low-level machine exception handler,
and the second is the architecture-independent `vm_fault()` function in
*sys/vm/vm\_fault.c*.

Machine-dependent code for page faults typically consists of three
components: a trampoline written in assembly which creates the C execution
environment and gathers hardware-supplied data about page fault reason, a
`trap()` function which is common C-level entry point to dispatch all
exceptions processing, and the `trap_pfault()` C function to specifically
handle page faults.  `trap_pfault()` calls `vm_fault()` when help from VM is
needed to resolve the situation.

If the fault was handled either by `trap()`/`trap_pfault()` or `vm_fault()`,
the faulting instruction is restarted.  If fault cannot be handled for
any reason, the next action depends on the mode in which the fault occured.
If it was in kernel, and the kernel installed a helper, then the helper is
called instead of returning to the faulting instruction.  Otherwise,
a kernel-mode page fault causes a panic.

If the unhandled fault occured in usermode, then all Unixes send a
signal to the thread whose execution caused the exception.  POSIX (or
Single Unix Specification) lists several cases where a signal should be
sent, and specifies the signal number and `si_code` from siginfo that
must be supplied with the signal.

Unfortunately, FreeBSD was rather non-compliant in this regard.  A long
time ago, to improve compliance, we changed the signal sent on access
to a page with permissions incompatible with the access mode.
That caused multiple problems with garbage collection (GC)-based runtimes
which incorporated knowledge of the FreeBSD quirks, so the
`machdep.prot_fault_translation` sysctl knob was added.  More cases of
incompatibility were identified recently.

Part of the problem is that code to calculate the signal and `si_code` from
the Mach error returned by `vm_fault()` was located in `trap_pfault()`.  In
other words, each architecture did that on its own, with a specific set
of bugs and non-compliance.  Sometimes code even mis-interpreted returned
Mach errors as `errno`.

A new helper function `vm_fault_trap()` was added, that does several
things for trap handlers: it creates ktrace points for faults, calls
`vm_fault()`, and then interprets the result in terms of the user-visible
error condition, returning precalculated signal number and `si_code` to
the caller.  Now `trap_pfault()` only needs to provide signal numbers
for truly machine-dependent errors.  For amd64, an example of such a
case is a protection key violation.

Besides compliance and bug fixes, we also provided some refinements to
userspace about the reason of the delivered signal.  For instance, on
SIGBUS caused by copy-on-write failure due to exceeding swap
reservation limit, we provide specific `si_code` `BUS_OOMERR`.

Sponsor: The FreeBSD Foundation
