## i386 PAE Pagetables ##

Contact: Konstantin Belousov, <kib@freebsd.org>

Link:	 (https://reviews.freebsd.org/D18894)

The i386 architecture (in modern terms, x86 architecture in 32bit
protected mode), has supported hardware execute-disable since early
200x.  The only problem preventing the i386 FreeBSD kernel from using
it was that default page table format used by the kernel is 2-level
paging, while nx bit is only available for PAE (2.5 levels) page table
structures.  PAE option is too intrusive, it changes both vm_paddr_t
and bus_addr_t to 64bit, which is not too friendly to many drivers.

I tried to provide PAE_PAGETABLES kernel option which only changed
page table format, without affecting vm_paddr_t or bus_addr_t, thus
keeping kernel/driver interfaces intact.  But I was not able to make
i386 releases carry two kernels, one to support relic hardware which
cannot use PAE pagetables, and another for newer machines.

So I finally did a merge which makes single i386 kernel carry two pmap
modules, one for PAE and one for old two-level paging structures.
Also I did not find a reason to not expand vm_paddr_t, while I have
to keep bus_addr_t at 32bit.

With a single boot-time knob, i386 kernel can now also utilize up to
24G or memory, if drivers correctly use busdma(9).  I tried to fix
iflib(4) and ahci(4) so that the most common hardware work, but I
cannot do the pass over the whole tree.

Hopefully, together with earlier 4/4G split work, this gives enough
life for i386 kernel.

Sponsor: The FreeBSD Foundation
