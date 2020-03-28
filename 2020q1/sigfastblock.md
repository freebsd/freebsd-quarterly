## sigfastblock(2) ##

Contact: Konstantin Belousov <kib@FreeBSD.org>

Rtld services need to be async signal safe.  This is needed, for
instance, to provide working symbol bindings in signal handlers.

For threaded processes, libthr interposes all user-installed signal
handlers and saves the signals and related context if signal is
delivered while rtld or libthr are in protected section of code.

In non-threaded processes, the async safety is provided by changing
signal mask for the thread.  It is actually better than the
interposing done by libthr, since signals are delivered in the right
context, instead of libthr attempt of recreate it later.  But the
unfortunate side-effect is that each rtld entry requires two syscalls,
one to set mask, and one to restore it.  Typically this adds around 40
or more syscalls on each process startup.  Worse, rtld services used
by typical language runtime exception handling systems also have the
cost of signal mask manipulation.

The new sigfastblock(2) syscall was added that allows thread to
designate a memory location as fast signal block.  If this word
contains non-zero value, kernel interprets the thread state same as if
all blockable signals are blocked.  The facility drastically improves
exception handling speed on FreeBSD.

Since signals might abort interruptible sleeps, initial implementation
read the blocking word on each syscall entry.  This is needed to
ensure that userspace does not see spurious EINTR/ERESTART if the
signals are blocked by the word.  Since if kernel cached outdated
value for the block word, it would abort sleep, but then ast sees the
correct mask and does not deliver the pending signal.

There were concerns that this read of the word causes slowdown in
syscalls microbenchmarks, esp. on machines with SMAP.  The reason is
that SMAP requires all userspace access bracketed by STAC/CLAC pair of
instructions, which are de-facto serializing (this is not
architectural, but all current microarchitectures do it).  The
decision was made to eliminate the word read, but the cost of possibly
returning spurious EINTR.  The impact should be minimal, since
sigfastblock(2) is not supposed to be the service available to users,
it is only assumed for rtld and libthr implementations.

Sponsor: The FreeBSD Foundation 
