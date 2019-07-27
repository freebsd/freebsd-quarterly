## Kernel ZLIB Update ##

Contact: Yoshihiro Ota, <ota@j.email.ne.jp>  

Link:	[Review D19706](https://reviews.freebsd.org/D19706)  

Kernel zlib upgrade is in progress.

Xin ( delphij ) and I have been working closely for zlib upgrade.  We relocated contrib/zlib to sys/contrib/zlib in order for kernel code to access zlib in the tree.  We also deleted dead code that depended on zlib and inflate - inflate is a fork of unzip to uncompress gzip files.  We also renamed crc.h to avoid conflicts with zlib/crc.h.

Next goal is to compile both old zlib and new zlib into the kernel allowing to switch each zlib user independently.
