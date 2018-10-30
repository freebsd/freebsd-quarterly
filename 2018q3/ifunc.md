## ifuncs ##
Contact: Konstantin Belousov, <kib@freebsd.org>,
	Ed Maste <emaste@freebsd.org>, Mark Johnston <markj@freebsd.org>,
	Mateusz Guzik <mjg@freebsd.org>
Link:	 None

Ifunc is a special construct in the ELF infrastructure, which allows
the selection of the implementation for the given symbol at the
runtime, when the ELF module gets the final relocations applied.  The
selection is governed by the small piece of user provided code,
attached to the symbol, so called resolver function.  Ifuncs provide
the very convenient way to select machine-specific implementation of
the parts of the code, without uglyness and unsafety of the
alternative approach, which is runtime patching.

Ifuncs require support both from the static linker ld(1), and from the
runtime linker for the corresponding execution environment.  On
FreeBSD, with the switch from the ancient GPLv2 licensed BFD-based
ld(1) to either in-tree LLD or external modern BFD ld, the use of
ifuncs become possible.  Runtime linkers for i386, amd64, and arm64
kernels, usermode dynamic linker ld-elf.so.1 on i386 and amd64, and
static binaries startup code for i386 and amd64 currently support
ifuncs.

ifunc were already applied for optimization of the following areas of
amd64 kernel:

- context switching code, instead of huge number of runtime checks
  (PTI vs non-PTI, PCID or not, is INVPCID instruction supported for
  PCID) now uses set of mode-specific routines, see
  pmap_activate_sw().  Besides removing checks at runtime, it also
  makes the code much more cleanly structured and readable.

- TLB and cache flush implementation.

- memcpy/memmove, copyin/copyout variants selection for ERMS and SMAP.

- FPU state save and restore, depending on the support for AVX or not,
  this is also used on i386.

For amd64 userspace, we currently use ifunc for optimization of the
TLS base set and get arch-depended functions.

The work was sponsored by The FreeBSD Foundation.
