## Locking changes for vnodes during execve(2) ##

Contact: Konstantin Belousov, <kib@freebsd.org>

The execve(2) family of syscalls replaces the executing image in the
current process.  The file containing the program text, data, and
arbitrary other pre-initialized segments for the newly activated image
is usually called the text file.  FreeBSD marks the text file as such,
the mark is mutually exclusive with any opening of the file for write.
In other words, file opened for write cannot be executed, and text
file cannot be opened for write.

During the execve(2) syscall processing, kernel needs to lock the text
file' vnode.  This is done both to satisfy the VFS calls protocol, and
to ensure that there is no incompatible parallel changes occuring to
the text vnode.  A vnode can be locked either in exclusive mode, which
is mutually incompatible with any other lock acquisition, or in shared
mode, which is only incompatible with exclusive requests, but allows
other shared owners.

In principle, there is no reason why would execve(2) need an exclusive
vnode lock, since it does not modify neither content nor metadata for
the text vnode.  The only exception is the marking of the vnode as
text, which was done using VV_TEXT flag in v_vflag and protected by
the vnode lock.  Since we modify v_vflag, the vnode lock protecting
the modification should be taken exclusive.

The end result is that execve(2)'s of the same file are serialized.  For
instance, if user runs parallel build, which executes more than one
job for compiling, all invocation of the compiler are serialized
during execve(2).

The count of opens for write is contained in other struct vnode member
named v_writecount, which was protected by the vnode lock as well.
Since text is mutually exclusive with an open for write, I reused
v_writecount to indicate text references.  Now, negative v_writecount
counts the number of text references.  The v_writecount content is
literally protected by the vnode interlock, but normally all mutators
also own vnode lock at least in the shared mode.

This way, we no longer need to acquire exclusive text vnode lock
during execve(2), removing the serializing point.  Additional positive
effect is that we started to account the precise number of text
references on the vnode.  Before, we cleared VV_TEXT on the last unmap
of the text vnode, potentially allowing obscure DoS where mapping the
text file while it is executed prevented writes until the mapping is
destroyed.  Now we mark the mappings for text explicitly in the
vm_map_entry and dereference v_writecount by +1 when such entry is
unmapped.

Sponsor: The FreeBSD Foundation
