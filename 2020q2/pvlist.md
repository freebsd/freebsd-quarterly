## amd64 pmap Fine-grained pv lists locking ##

Link:	 [Patch](https://reviews.freebsd.org/D24217)  

Contact: Konstantin Belousov <kib@FreeBSD.org>  

FreeBSD kernel Virtual Memory subsystem handles 'normal' application
memory, i.e. anonymous or file-backed shared and private mappings,
with so called managed pages.  Managed page is fully controlled by VM,
which tracks it status.  In particular, managed page can be made
read-only for write-back to the file, or unmapped for reuse (paging).

Machine-dependent VM layer, pmap, must support managed pages, for
instance provide operations pmap_remove_write() to downgrade all
mappings to read-only, or pmap_remove_all() to unmap the page from all
address spaces.  To implement this kind of operations, while not
causing the overhead of scanning all page tables, pmap must track
existing mappings of the page.  The tracking is done by allocating a
small data structure 'pv entry' per mapping, and linking all pv
entries for the given page into pv list.

Since pv entries come from context of different address spaces, pmap
must provide synchronization to guarantee correctness of the list
structures.  Current pmap allocates one mutex per one 2M physical
superpage in NUMA configuration, and MAXCPU == 256 locks hashed by the
page physical address for non-NUMA.  The end result is often
undeserved lock aliasing causing pv list locks contention, since all
4k pages in the 2M superpage share the same lock, and reservations
typically cause adjasted pages to come from the same superpage.

Proposed patch creates new kernel synchronization primitive OBM (one
byte mutex), which is embedded into the currently unused padding in
machine-dependent portion of the struct vm_page.  This way each page
gets dedicated pv list lock.  In the ever-imprortant buildkernel
benchmark on non-NUMA config, this change provides 2x reduction of the
system time.

One complication is that old locking distribution scheme made a
natural fit for superpages promotion and demotion, since all embedded
small pages shared the same pv list lock, and the operations basically
fold/unfold corresponding pv entries.  Now the promotion and demotion
operations require taking all locks for constituent small pages, which
provides small but measurable impact on them.  It is possbile to
optimize it further by providing the 'superlock' on the first page
from the superpage run, but the affected operations are relatively
rare so that it is not even obvious that implementing the optimization
would not slow down other pathes.

Another important nuance of the pv entries handling is that sometimes
pv entries allocator must not fail.  Typically this is required when
kernel makes a call to pmap_enter() which must establish new mapping,
and for managed page this includes allocating the pv entry if existing
cannot be reused.  If allocator cannot get a fresh page from the
vm_page_alloc(9), it opts to destroy some other managed mapping to
either get a reusable pv entry from current pmap, or destroy enough
managed mappings from some other pmap to free whole page.

To do the reclamation, currently all pages from which with pv entries
are allocated, are linked in the global pv chunk list, which is
protected by global (per-NUMA domain) mutex.  Any allocation or free
of pv entry has to lock the mutex, which is apparently a contention
point for large machines.

Patch removes the global list of chunks, instead linking all pmaps in
the global list like it is done on i386 (but for different reason).
Now the global lock is only taken for pmap creation and free, which
corresponds to fork/exec and exit of a process, and when pv allocator
starts reclaiming from other pmaps (which is normally does not
happen).

Sponsor: The FreeBSD Foundation  
