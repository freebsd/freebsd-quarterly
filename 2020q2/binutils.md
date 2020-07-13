## Binutils Retirement ##

Link: [GPL in Base wiki page](https://wiki.freebsd.org/GPLinBase)

Contact: Ed Maste <emaste@FreeBSD.org>  

We have been working on migrating to a modern and copyfree or permissively
licensed toolchain for quite some time.  In the last quarter we retired two
obsolete GNU bintuils: objdump, and as.

Many uses of objdump can be replaced with readelf, and llvm-objdump is also
available in the base system.  Ports that depend on objdump have been updated
to rely on the GNU binutils port or package.

The GNU as utility was used by both the base system and by ports.  As with objdump, ports
that require GNU as have generally been updated to depend on binutils.  One
file in the base system (skein\_block\_asm.s) proved troublesome during earlier
attempts to migrate to using Clang's integrated assembler (IAS).  However,
after the update to Clang 10 (and with some trivial modifications to the
source) IAS can assemble the file.

Both GNU as and objdump have been removed from FreeBSD-CURRENT and will be
absent from FreeBSD 13.0.

### TODO ###

The final task in the binutils retirement project is to remove GNU GDB 6.1.
It is currently retained for crashinfo(8).

Sponsor: The FreeBSD Foundation
