## NUMA awareness in the FreeBSD kernel ##

Contact: Jeff Roberson, <jeff@FreeBSD.org>
Contact: Andrew Gallatin, <gallatin@FreeBSD.org>
Contact: Mark Johnston, <markj@FreeBSD.org>

A set of patches to improve the state of NUMA awareness in the FreeBSD
kernel are being developed and refined.  This work also aims to
generally improve the performance of FreeBSD's memory management
subsystem on systems with many CPUs.

FreeBSD 12.0 featured a number of large changes which improve its
performance on systems with a non-uniform memory architecture.  That is,
systems in which memory access latency for a given address varies
depending on the CPU.  Another round of improvements is being developed
and will soon be available in FreeBSD-CURRENT.  Short descriptions of
some of these patches follow; a few have already been committed to
FreeBSD-CURRENT.

In FreeBSD terminology, a memory page whose contents may not be evicted
is referred to as "wired."  Pages may be wired under different
circumstances: for instance, all kernel memory is wired, and userland
applications may request that ranges of memory be wired using the
mlock(2) and mlockall(2) system calls.  FreeBSD has historically defined
a system-wide limit on the number of wired pages so as to avoid
deadlocks that may arise when too much of a system's memory cannot be
reclaimed to satisfy new memory allocations.  This limit was applied
only to userland wiring requests, but kernel wirings were counted
against the limit, so a large source of kernel wirings could cause
mlock(2) failures.  This occurs frequently with a large ZFS ARC, for
example.  In FreeBSD-CURRENT this limit has been changed such that only
userland wirings are counted against the limit; the kernel contains a
number of mechanisms to apply back-pressure to kernel memory usage, so
the use of a global limit on all wirings did not provide much benefit.
This fixes a common problem on large ZFS systems, and helps enable some
other architectural improvements to the code which manages page wirings.

FreeBSD has historically maintained two separate reference counters in
the structure which describes a single physical page of memory.  These
counters initially had quite different properties, but have over time
become more and more similar.  Some work to merge the two counters has
landed in FreeBSD-CURRENT.  This does not have any user-visible effects,
but it simplifies the page management code and removes a large amount of
code which existed solely to transform references of one type to the
other.  Such code also made use of heavily contended locks, so the
simplification improved kernel scalability for some workloads and has
enabled further scalability improvements.

UMA is the slab allocator used in FreeBSD's kernel.  It is the backend
which services virtually all dynamic memory allocations performed in the
kernel.  The first round of NUMA improvements added NUMA awareness to
the "keg" layer of UMA, which allocates and manages slabs.  However, the
frontend of UMA, which provides several layers of caching for objects,
did not provide domain-aware caching, so over time the caches would
become "polluted" with objects from different memory domains.  However,
this caching layer is being modified to ensure that objects from
different memory domains are partitioned, helping ensure that consumers
can perform domain-local allocations and frees efficiently.  This will
enable a global "first-touch" allocation policy for UMA-managed objects.

During boot, the FreeBSD kernel allocates a number of static data
structures to track physical memory.  These structures have historically
lived in the lowest available range of physical memory, so they many not
inhabit the same NUMA domain as the memory that they track.  This is
suboptimal when one tries to affinitize a workload to a particular NUMA
domain: if while executing the workload the kernel frequently accesses
page structures for local memory, and the page structures themselves
are not placed in local memory, the kernel will perform many remote
memory accesses.  Some in-progress work for the amd64 platform creates
multiple arrays of page tracking structures, one per NUMA domain, and
ensures that each array is local to its domain.  This complicates the
task of initializing kernel data structures during boot, but can
substantially reduce the amount of cross-domain communication that
occurs while the kernel is performing useful work.  Similarly, some
patches to affinitize per-CPU structures are being developed; while
most per-CPU memory allocations already return CPU-local memory, some
structures allocated during boot are not yet properly placed with
respect to the accessing CPU's memory domain.

Sponsor: Netflix
