## amd64 Usermode Protection Keys ##

Contact: Konstantin Belousov, <kib@freebsd.org>

Link:	The patch https://reviews.freebsd.org/D18893

Skylake Xeons have a new feature in 4-level paging implementation
called Usermode Protection Keys.  It is a complementary page access
permission management mechanism, which provides very low-overhead
disabling of all accesses or only modifications, on per-page basis.

Each thread of execution gets 16 slots, called protection keys, while
each userspace page mapping is tagged with one key.  Processor
provides a new 32bit register PKRU, which holds access and
modification disable bits per key, the PKRU register is automatically
context-switched, and managed by userspace using RDPKRU and WRPKRU
instructions.  See Intel SDM rev. 68 Vol 3 4.6.2 Protection Keys for
further details.

Since a key index must be always specified, this makes the key zero a
default key, which permissions are tricky to modify without breaking
the process envirnment.  The rest 15 keys are usable, for instance
process might put some sensitive data like decoded private key into
the key protected area, and only enable access on as needed basis,
without issuing costly mprotect(2) syscall.  Note that permissions are
enforced even for kernel access, so sneaky read(2) from other thread
is subject to the same permission checks.

I implemented the support for the amd64 pmap and provided convenient
wrappers in libc both for 64bit and 32bit processes.  Prototypes for
the API are presented below and their use should be obvious from the
explanation.

int x86_pkru_get_perm(unsigned int keyidx, int *access, int *modify);
int x86_pkru_set_perm(unsigned int keyidx, int access, int modify);
int x86_pkru_protect_range(void *addr, unsigned long len, unsigned int keyidx,
    int flag);
int x86_pkru_unprotect_range(void *addr, unsigned long len);

Sponsor: The FreeBSD Foundation
