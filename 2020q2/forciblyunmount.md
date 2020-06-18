## Forcible Unmount of UFS/FFS Filesystems on Disk Failure ##

Link:	 [Phabricator Details](https://reviews.freebsd.org/D24088)  

Contact:  Chuck Silvers <chs@freebsd.org>
Contact:  Kirk McKusick <mckusick@mckusick.com>

Commit -r361491 on May 25, 2020 enables a UFS file system to do a
forcible unmount when the underlying media fails or becomes
inaccessible. For example when a USB flash memory card hosting a
UFS file system is unplugged.

The rest of this report describes in more detail how forcible
unmounts are done. Suprisingly, less than 500 lines of file
system code were added or changed.

The strategy for handling disk I/O errors when soft updates are
enabled is to stop writing to the disk of the affected file system
but continue to accept I/O requests and report that all future
writes by the file system to that disk actually succeed. Then
initiate an asynchronous forced unmount of the affected file system.

There are two cases for disk I/O errors:

   - ENXIO, which means that this disk is gone and the lower layers
     of the storage stack already guarantee that no future I/O to
     this disk will succeed.

   - EIO (or most other errors), which means that this particular
     I/O request has failed but subsequent I/O requests to this
     disk might still succeed.

For ENXIO, we can just clear the error and continue, because we
know that the file system cannot affect the on-disk state after we
see this error. For EIO or other errors, we arrange for the geom_vfs
layer to reject all future I/O requests with ENXIO just like is
done when the geom_vfs is orphaned. In both cases, the file system
code can just clear the error and proceed with the forcible unmount.

This new treatment of I/O errors is needed for writes of any buffer
that is involved in a dependency. Most dependencies are described
by a structure attached to the buffer's b_dep field, but some are
created and processed as a result of the completion of the dependencies
attached to the buffer.

Clearing of some dependencies require a read. For example if there
is a dependency that requires an inode to be written, the disk block
containing that inode must be read, the updated inode copied into
place in that buffer, and the buffer then written back to disk.

Often the needed buffer is already in memory and can be used. But
if it needs to be read from the disk, the read will fail, so we
fabricate a buffer full of zeroes and pretend that the read succeeded.
This zero'ed buffer can be updated and "written" back to disk.

The only case where a buffer full of zeros causes the code to do
the wrong thing is when reading an inode buffer containing an inode
that still has an inode dependency in memory that will reinitialize
the effective link count (i_effnlink) based on the actual link count
(i_nlink) that we read. To handle this case we now store the i_nlink
value that we wrote in the inode dependency so that it can be
restored into the zero'ed buffer thus keeping the tracking of the
inode link count consistent.

Because applications depend on knowing when an attempt to write
their data to stable storage has failed, the fsync(2) and msync(2)
system calls need to return errors if data fails to be written to
stable storage. So these operations return ENXIO for every call
made on files in a file system where we have otherwise been ignoring
I/O errors.

Sponsor:  Netflix
