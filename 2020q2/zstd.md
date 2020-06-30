## ZSTD Compression in ZFS ##

Contact: Allan Jude <allanjude@freebsd.org>  

Zstandard (ZSTD) is a modern high-performance compression
algorithm designed to provide the compression ratios of gzip
while offering much better performance. ZSTD has been adopted
in FreeBSD for a number of other uses, including compressing
kernel crash dumps, as a replacement for gzip or bzip for
compressing log files, and for future versions of pkg(8).

This effort to complete the integration of ZSTD into ZFS is
sponsored by the FreeBSD Foundation.

Integrating ZSTD into ZFS will further extend the transparent
compression feature of ZFS by offering higher compression
ratios without the performance penalty associated with gzip.
ZSTD offers compression levels ranging from 1 (low compression)
to 22 (maximum compression), plus ZSTD-Fast levels that offer
less compression but even greater speed. This will allow the
storage administrator to select the performance-vs-compression
tradeoff that best suits their needs.

Tasks remaining to be completed:

  * Extend ZFS to support compression algorithms with large numbers of levels
  * Solve issues around the inheritence of compression settings
  * Restore compression level when reading blocks from disk
  * Create a future-proofing scheme to handle changing versions of ZSTD
  * Extend ZFS replication to handle backwards compatibility with pools that do not yet support ZSTD
  * Resolve issues around backwards compatibility when ZSTD is configured but not used

Sponsor: The FreeBSD Foundation  
