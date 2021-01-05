## ZSTD Compression in ZFS ##

Contact: Allan Jude <allanjude@freebsd.org>  

Zstandard (ZSTD) is a modern high-performance compression
algorithm designed to provide the compression ratios of gzip
while offering much better performance. ZSTD has been adopted
in FreeBSD for a number of other uses, including compressing
kernel crash dumps, as a replacement for gzip or bzip for
compressing log files, and for future versions of pkg(8).

This effort to complete the integration of ZSTD into ZFS is
funded by the FreeBSD Foundation.

During the four quarter the final tasks in the project to integrate
ZSTD into OpenZFS were completed.

Completed milestones in this project:

  * ZSTD integrated in the FreeBSD boot loader (Warner Losh <imp@freebsd.org>)
  * Added a section to the FreeBSD Handbook ZFS chapter explaining ZSTD
  * Wrote a FreeBSD Journal Article explaining considerations when selecting a suitable compression level
  * Monitored for bug reports after the changes were integrated into -CURRENT

With all of these changes in place, it is now possible to boot from pools
compressed with zstd or zstd-fast. For comparison, a standard installation of
FreeBSD 13 (without debug symbols) uncompressed is 1175 MB, and when compressed
with LZ4, is only 570 MB (2.15x) but when compressed with ZSTD's default level
of 3 is only 417 MB (3.00x), and with the maximum level, 19,
only 374 MB (3.36x).

Sponsor: The FreeBSD Foundation  
