## Signals delivered on unhandled Page Faults ##

Contact: Konstantin Belousov, <kib@FreeBSD.org>

Due to the obvious neccessity, handling of the page faults is
separated into two pieces.  First one is the architecture-dependent low
level machine exceptions handler, and the second one is the
architecture-independent vm_fault() function in sys/vm/vm_fault.c.
Typically machine-dependent code for page faults consists of three
components, one is a trampoline written in assembly, which creates the
C execution environment and gathers hardware-supplied data about page
fault reason, second is common trap() function which is common C-level
entry point to dispatch all exceptions processing, and the third if
trap_pfault() C function to specifically handle page faults.
trap_pfault() calls vm_fault() when the help from VM is needed to
resolve the situation.

If the fault was handled either by trap()/trap_pfault() or vm_fault(),
the faulting instruction is restarted.  If fault cannot be handled for
any reason, next action depends on the mode where the fault occured.
If it was in kernel, and kernel installed a helper, then instead of
return to the faulting instruction, the helper is called.  Otherwise,
kernel-mode page fault causes the panic.

If the unhandled fault occured in usermode, then all Unixes send a
signal to the thread which execution caused the exception.  POSIX (or
Single Unix Specification) lists several cases where signal should be
send, and specifies the signal number and si_code from siginfo that
must be supplied with the signal.

Unfortunately, FreeBSD was rather incompliant in this regard.  Long
time ago, we already changed for compliance, a signal sent on access
to the page which has permissions incompatible with the access mode.
That caused multiple problems with GC-based runtimes which were
already knowledgable of the FreeBSD quirks there, so
machdep.prot_fault_translation knob was added.  More cases of
incompatibility were identified recently.

Part of the problem is that code to calculate signal and si_code from
Mach error returned by vm_fault() was located in trap_pfault().  In
other words, each architecture did that on its own, with specific set
of bugs and incompliance.  Sometimes code even mis-interpreted
returned Mach errors as errno.

New helper function vm_fault_trap() was added, that does several
things for trap handlers: it creates ktrace points for faults, calls
vm_fault(), and then interpret result in term of the user-visible
error condition, returning precalculated signal number and si_code to
the caller.  Now trap_pfault() only need to decide for signal numbers
for truly machine-depended errors.  For amd64, an example of such
case is protection key violation.

Besides compliance and bug fixes, we also provided some refinements to
userspace about the reason of the delivered signal.  For instance, on
SIGBUS caused by copy-on-write failure due to exceeding swap
reservation limit, we provide specific si_code BUS_OOMERR.

Sponsor: The FreeBSD Foundation
