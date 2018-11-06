## FreeBSD on Power9 (ppc64) Parity ##

Once Justin Hibbits largely stabilized the powerpc64 port on the POWER9
based Talos II I decided to procure one. I've been slowly working towards
taking powerpc64 to parity with amd64. I've been working in an out of tree
GitHub project - in part to eliminate the need to continue to support the 11 
year old in tree gcc4.

Progress so far:
  - Adapted lock_delay to use POWER's SMT scheduling hints rather than
    using the yield hint from an older ISA
  - Added ifunc support
  - Ported the amd64 pmap so FreeBSD can use POWER9's new radix tree
    page tables. This will give us superpages mostly for free.
  - Reduced the overhead of copyinout primitives for radix.
  - Converted the copyinout primitives to ifuncs to switch between the
    old and the new at initialization time.
  - Converted pmap to use ifuncs to eliminate the overhead of kobj dispatch.
  - Hot patch out trap handling paths only needed by the older hashed page
    table support.

Work in Progress:
   - NMI semantics: NMIs need to be emulated by only soft disabling interrupts,
     disabling interrupts blocks all interrupts except machine check exceptions
     and system resets.
   - Superpage support: Superpages work in the functional simulator running SMT4
     but currently crash on real hardware due to incomplete page walk cache /
     TLB invalidation.
   - Kernel minidump - with radix MMU enabled minidump support was a fairly
     straightforward port but time needs to be spent on test / debug.
   - EARLY_AP_STARTUP - preliminary patches exist, but this is more work on !x86
     architectures due to IPI setup not being tied to the CPU code.

A list of the other items needed to achieve kernel feature parity with a
(wishful) list of milestones can be found at:
https://github.com/POWER9BSD/freebsd/projects/1