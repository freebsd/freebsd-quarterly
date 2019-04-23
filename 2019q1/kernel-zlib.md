## Kernel ZLIB Update ##

Contact: Yoshihiro Ota, <ota@j.email.ne.jp>

Link:	(https://reviews.freebsd.org/D19706)

FreeBSD kernel still uses over 20 year-old version of zlib
version 1.0.4. FreeBSD kernel zlib has special enhancements
only applicable to netgraph.  Further more, there is unzip 5.12
based code to inflate gzip files in kernel which can also be replaced
with zlib.
  More detailed information is written in sys/modules/zlib/README in the review.

In order to use the latest zlib, version 1.2.11, I'm revisiting all
of existing zlib users.  Most of code works as they are.
Unzip users need some conversion work to use zlib.
Few callers will be simler by using few other APIs.
There are some zombie programs that have been broken and I'd like to delete.

This will clean up zombie programs and duplicated zlib code.
This will also make future zlib version up easier.

This change touches very sensitive areas such as kernel loading,
architecture specific like armv6/armv7, and also legacy code like
kgzip+kgzldr on i386.  Testers and active users of these legacy zlib code
are welcomed.

  * armv elf_trampoline
      Arm up to v5 can boot from gzipped kernel.  This code is modified
    to use newer API for simplicity.  Please verify gzipped kernel
    still boots with new code (Current code has fall back to legacy
    zlib in case of failure).
      Please also elaborate how to link such kernel, too.  I'm still
    trying to figure that out.
  * i386 kgzip + kgzldr
      This looks dead code already.  If anyone uses, please teach me how
    to boot gzipped kernel; otherwise, I'd like to delete this.
  * netgraph compression/decompression
      Please help testing and/or teach how to test.  Netgraph compiles
    in the FreeBSD zlib version inside.
  * gzipped a.out
      Does anyone use gzipped a.out executables, still?  If so, does
    someone have an easy and safe program to run? 
      Is a.out format i386 only?
  * zfs boot
      Can we boot from gzipped file system today?
  * CTF
      Checking how I can test.
