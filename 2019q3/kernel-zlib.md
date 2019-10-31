## Kernel ZLIB Update ##

Contact: Xin Li <delphij@FreeBSD.org>
Contact: Yoshihiro Ota <ota@j.email.ne.jp>

The ZLIB is a compression library is widely used in various software.
  The FreeBSD system had used an ancient (over 20 year-old) version
of zlib (version 1.0.4) and total of 3 versions, one in user-land,
one in ZFS, and one in kernel.
  Xin and Yoshihiro upgraded zlib to the latest and eliminated 2 extra copies.
Along the efforts, zlib version was upgraded to 1.2.11, netgraph's ppp is
re-implemented to use the standard zlib, and removed unmaintained code.
  We now only have one and the latest version of zlib in FreeBSD code base,
new compress, compress2, and uncompress APIs exposed in the kernel,
and importing changes from zlib will be simple.

Kernel zlib changes
- [sys/crc32.h is split to avoid object file name conflict with ZLIB's](https://reviews.freebsd.org/D20193)
- [contrib/zlib is moved to sys/contrib/zlib](https://reviews.freebsd.org/D20191)
- [Kernel started switching to sys/contrib/zlib and ZFS copy dropped](https://reviews.freebsd.org/D19706)
- [Kernel zcalloc is introduced and compress, compress2, and uncompress APIs are exposed to kernel](https://reviews.freebsd.org/D21156)
- [Removed zlib 1.0.4 from kernel](https://reviews.freebsd.org/D21375)

Kernel zlib user updates
- [kern_ctf.c updated](https://reviews.freebsd.org/D21176)
- [opencryptodeflate updated](https://reviews.freebsd.org/D20222)
- [geom_uzip updated](https://reviews.freebsd.org/D20271)
- [subr_compressor updated](https://reviews.freebsd.org/D21408)
- [if_mxge updated](https://reviews.freebsd.org/D20272)
- [bxe updated](https://reviews.freebsd.org/D21175)
- [ng_deflate updated](https://reviews.freebsd.org/D21186)

Legacy code removals
- [Removed MIPS zlib elf trampoline](https://reviews.freebsd.org/D20190)
- [Removed kgzip and kgzldr](https://reviews.freebsd.org/D20248)
- [Removed gzip'ed a.out support](https://reviews.freebsd.org/D21099)
- [Removed ArmvX elf_trampoline.c](https://reviews.freebsd.org/D21072)
