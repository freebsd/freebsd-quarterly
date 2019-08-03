## BIO_DELETE support for the swap pager ##

Contact: Doug Moore, <dougm@FreeBSD.org>
Contact: Alan Cox, <alc@FreeBSD.org>
Contact: Mark Johnston, <markj@FreeBSD.org>

An ongoing project aims to teach the swap pager to send SCSI UNMAP or
ATA TRIM commands to the swap device when a block of swap space has been
freed, for example when the application owning that block is exiting.

SSDs have become commonplace and feature low latency for random I/O
requests.  This makes them appealing for use as swap devices, since
lower latencies mean that applications spend less time blocked while
waiting for a page-in from the swap device.  To maximize write
performance, some SSDs require the operating system to send a
notification to the disk when a sector is no longer in use; this helps
the disk optimize their usage of NAND flash cells.  In FreeBSD such a
notification is called a BIO_DELETE.

FreeBSD's UFS and ZFS filesystems have for a long time been able to
transmit BIO_DELETE requests to the devices backing the filesystem.  For
example, for UFS this support is enabled by specifying -t in newfs(8) or
tunefs(8)'s parameters.  However, FreeBSD has historically not had a
corresponding implementation for swap devices.

Thanks to Doug Moore, as of r349286 in -CURRENT and r349930 in stable/12
swapon(8) can send BIO_DELETE to all blocks on the specified device
immediately prior to configuring it as a swap device.  This is enabled
by specifying -E in the swapon(8) parameters, or by adding the
"trimonce" option to the swap device's /etc/fstab entry.  Some
in-progress work on the swap pager implements online block deletion, in
which BIO_DELETE is transmitted for blocks as they are freed by
applications; this will hopefully be implemented in FreeBSD 13.0.
