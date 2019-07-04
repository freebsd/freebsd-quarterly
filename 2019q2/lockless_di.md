## Lock-less delayed invalidation for amd64 pmap ##

Contact: Konstantin Belousov, <kib@freebsd.org>

The Virtial Memory machine-dependent layer (pmap) on amd64 needs to
track all mappings for the managed physical memory pages, to be able
to either destroy all of them (for page-out), or change them from
writeable to read-only (e.g. to sync the page content to file, without
racing with modifications through user writes).  The mappings are
accounted by creating pv_entry which records the address space
(implicitly, by linking the pv entry to pmap) and the virtual address
of the mapping.

Previous work split the lock protecting the pv entries lists from
other VM locks into the pvh_global_lock lock, which was global for all
address spaces.  You can see it in i386 pmap.c still.  Later, hashed
per-page pv lists locks were introduced, which would reduce contention
on pv lists maninulations for different pages, but unfortunately the
pvh_global_lock was still needed to guarantee the safety of some
operations.

Problem arises because amd64 pmap uses pmap lock to protect page
tables and TLB consistency, which is per-pmap locks different from pv
lists locks.  When updating page table entry, we never drop pmap lock
until the necessary TLB invalidation is done globally, including
signalling other CPUs with IPI.  But pv list locks can be unlocked
before the necessary invalidation is done.  So for instance when pmap
is asked to remove all mappings of the specific page
(pmap_remove_all(9)), it checks pv list of the page to find the
mappings.  The list might appear empty despite other CPUs TLB were not
yet invalidated.  If such page is reused, other CPUs might change its
content using cached TLB entries.  Allowing that means allowing both
silent data corruption and opening security hole.

So the global pvh lock was held until all pmaps invalidated their
TLBs.  This mechanism has obvious scalability issues, and instead a
generation-count based scheme for handling delayed invalidation (DI)
was developed, where each thread that might remove entry from pv list
acquired a generation number and marked the page with it, see
pmap_delayed_invl_page(9).  Then, on e.g. pmap_remove_all(9) or
pmap_remove_write(9), pmap code waits for the maximum current thread's
invalidation generation number to pass the page's generation, which
guarantees that all required TLB invalidations are done.

Original implementation of DI allowed to get rid of pvh_global_lock,
and only used a private mutex to handle sequential queueing of the
coming and leaving threads, protecting a bounded region.  A problem
with that appeared e.g. in scalability benchmarks which did massive
parallel unmaps, causing most of the threads to contend on DI
queueing.

Current implementation of DI switched to lock-less queue algorithm
using the approach proposed by T.L. Harris and relying on double-CAS
to coalesce generation count and queueing.  It uses ifuncs to select
either previous locked DI or current lock-less implementation, only
old AMD Athlons which did not implemented the CMPXCHG16B instruction
falls to the locked implementation by default.  Lock-less
implementation still blocks the waiting thread on turnstile to avoid
priority-inversion issues, but practically the wait occur very rare,
typical parallel buildworld generates single-digit number of the
events.

The patch got a lot of testing from Peter Holm, continuos reviews by
Mark Johnston while I worked out bugs and live-lock problems in the
implementation, and additional testing by Mateusz Guzik who helped to
identify a priority inversion bug with the wait.

Sponsor: The FreeBSD Foundation
