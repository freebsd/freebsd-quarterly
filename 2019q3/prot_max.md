## PROT\_MAX mmap/mprotect maximum protections API ##

Contact: Brooks Davis <brooks@freebsd.org>  

Link: [PROT\_MAX commit](https://reviews.freebsd.org/rS349240)

Unix-like systems provide the `mmap(2)` system call to allocate memory or
map files or devices into memory with specified access protection, and the
`mprotect(2)` system call to change protections on mapped memory.  Protection
flags specify whether the memory may be read, written, and/or executed
(`PROT_READ`, `PROT_WRITE`, `PROT_EXEC` respectively).  Traditionally,
`mprotect(2)` can be used to set any desired protections (except that a
shared mapping of a file opened read-only cannot have `PROT_WRITE` set).

A new macro `PROT_MAX()` adds a facility for specifying the maximum possible
protection flags for `mmap(2)` and `mprotect(2)` calls.  The program can then
specify whether a mapping may be changed in the future to allow a given access
protection.  For example, a memory mapping can be set such that it can have
read and write protections set, but may never be made executable.

Maximum protection values are provided to the `PROT_MAX()` macro, and are
OR'd with regular protection values.

This change allows (e.g.) a region that must be writable during run-time
linking or JIT code generation to be made permanently read+execute after
writes are complete.  This complements Write-XOR-Execute (W^X) protections
available on other operating systems, allowing more precise control by the
programmer.

For example, to request memory that cannot be made executable:
```
mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_MAX(PROT_READ | PROT_WRITE),
    MAP_ANON, -1, 0);
```

and to request memory that may have execute permission enabled later on, but
is not currently executable:

```
mmap(NULL, size,
    PROT_READ | PROT_WRITE | PROT_MAX(PROT_READ | PROT_WRITE | PROT_EXECUTE),
    MAP_ANON, -1, 0);
```

This change alters mprotect argument checking and returns an error when
unhandled protection flags are set.  This differs from POSIX (in that POSIX
only specifies an error if a valid permission can not be set), but is the
documented behavior on Linux and more
closely matches historical mmap behavior.

In addition to explicit setting of the maximum permissions, an experimental
sysctl `vm.imply_prot_max` causes mmap to assume that the initial permissions
requested should be the maximum when the sysctl is set to 1.  This behavior is
known to break code that uses `PROT_NONE` reservations before mapping contents
into part of the reservation.  A later version of this work is expected to
provide per-binary and per-process opt-in/out options and this sysctl may be
removed in its current form.  As such it is undocumented.

While these flags are non-portable, they can be used in portable code with
simple ifdefs to expand `PROT_MAX()` to 0.

Sponsors: DARPA, AFRL
