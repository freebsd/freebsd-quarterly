## FreeBSD on Power9 (ppc64) Parity ##

   - NMI semantics: NMIs need to be emulated by only soft disabling interrupts,
     disabling interrupts blocks all interrupts except machine check exceptions
     and system resets.

   - Superpage support is stable and on by default in the POWER9BSD staging branch

   - NUMA support: Parse OFW and set up appropriate structures for memory 
     to be allocated from the correct domain and interrupts to be bound to the
     correct socket.

   - LKPI support for POWER9, Drm-next supports radeonkms. Some additional big
     endian changes required for amdgpu.

  
   - Interrupt handling improvements resulting in up to a 10% reduction in
     buildkernel time.

      a) Cached XICS IPI vector

      b) Added XIVE exploitation mode driver

   - Rust support in review.

   - Successfully booted an LLVM compiled kernel.

   