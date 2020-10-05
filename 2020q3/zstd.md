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

During the third quarter the integrating of ZSTD into OpenZFS
was completed in the upstream OpenZFS repository, and the new
OpenZFS 2.0 codebase was imported into 13-CURRENT.
Completed milestones in this project:

  * Importing ZSTD 1.4.5 into OpenZFS, using the recent upstream zstd features that make it easier to embed zstd in other projects,
  * Changing the way compression levels are tracked and inherited,
  * Save and restore the compression level via an embedded block header,
  * Also store the version of zstd used in the embedded block header, for future proofing. The checksum of a block may not match if zstd is upgraded, since it may compress the block more,
  * Add tests to ensure zstd compression and metadata survive ZFS replication,
  * Resolve possible negative interactions with L2ARC and ZFS Native Encryption,
  * Fix bug with L2ARC if the Compressed ARC feature is disabled,
  * Improve the ZFS feature activation code, so that zstd cannot create pools that will panic older versions of ZFS.

With these changes, upgraded pools can compress data with zstd
or zstd-fast, across a wide range of different compression levels.
This will allow the storage administrator to select the
performance-vs-compression tradeoff that best suits their needs.

Tasks remaining to be completed:

  * Add a section to the FreeBSD Handbook ZFS chapter about zstd
  * Create more documentation around selecting a suitable compression level
  * Finish support for ZSTD in the FreeBSD boot loader (Warner Losh <imp@freebsd.org>)

Sponsor: The FreeBSD Foundation  
