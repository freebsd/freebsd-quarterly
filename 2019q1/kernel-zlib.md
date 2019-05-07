## Kernel ZLIB Update ##

Contact: Yoshihiro Ota, <ota@j.email.ne.jp>

Link:	(https://reviews.freebsd.org/D19706)

The FreeBSD system still uses an ancient (over 20 year-old) version
of zlib (version 1.0.4).  The FreeBSD kernel zlib implementation
has special enhancements only used by netgraph.  There is a separate
version of code derived from unzip 5.12 used to inflate gzip files
in the kernel which could be replaced with a more modern zlib.
More detailed information is written in sys/modules/zlib/README in
the review.

In order to use the latest zlib, version 1.2.11, work has been done
to revisit all existing zlib uses in the system.  Most of code works
as with the newer version of zlib as is.  The unzip code will need
some conversion work to use the newer zlib.  A few callers will be
made simplier by using some newer APIs available in the updated zlib.
There are some zombie programs that have been broken and I would
like to delete.

This will clean up zombie programs and duplicated zlib code.
This will also make future zlib version updates easier.

These changes touch some very sensitive areas of the system, such
as kernel loading, or are architecture specific like armv6/armv7,
and also touch some legacy code like kgzip+kgzldr on i386.  Testers
and active users of these legacy zlib code are welcomed.

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
