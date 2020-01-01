## PowerPC on Clang ##

Contact: Justin Hibbits <jhibbits@freebsd.org>  
Contact: Brandon Bergren <bdragon@freebsd.org>  
Contact: Alfredo Dal'Ava Júnior <alfredo.junior@eldorado.org.br>

Shortly before the end of the year all 3 PowerPC targets (powerpc, powerpc64,
powerpcspe) switched to Clang as the base compiler.  This was an effort spanning
nearly the full year, with several people involved.  32-bit PowerPC platforms
(powerpc, powerpcspe) still require GNU ld, but powerpc64 uses LLD as the base
linker.  The other two platforms will migrate as soon as LLD is ready, which
should be in the next several months.

With the switch to Clang and LLD, powerpc64 also switched to ELFv2, a modern ABI
initially targeted for Linux powerpc64le (little endian), but the ABI itself is
endian agnostic; however, ELFv2 is binary incompatible with ELFv1.  FreeBSD is
still big endian on all powerpc targets.
