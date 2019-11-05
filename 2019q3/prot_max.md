## PROT\_MAX mmap/mprotect maximum protections API ##

Contact: Brooks Davis <brooks@freebsd.org>

A new macro `PROT_MAX()` adds a facility for specifying the maximum possible
permissions to `mmap(2)` and `mprotect(2)` calls.  Protection values provided
to the `PROT_MAX()` macro are OR'd with regular protection values.

While these flags are non-portable, they can be used in portable code with
simple ifdefs to expand `PROT_MAX()` to 0.

This change allows (e.g.) a region that must be writable during run-time
linking or JIT code generation to be made permanently read+execute after
writes are complete.  This complements W^X protections allowing more precise
control by the programmer.


For example, to request memory that cannot be made executable:
```
mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_MAX(PROT_READ | PROT_WRITE),
    MAP_ANON, -1, 0);
```

and to request memory that may have execute permission enabled later on, but
is currently writeable:

```
mmap(NULL, size,
    PROT_READ | PROT_WRITE | PROT_MAX(PROT_READ | PROT_WRITE | PROT_EXECUTE),
    MAP_ANON, -1, 0);
```

This change alters mprotect argument checking and returns an error when
unhandled protection flags are set.  This differs from POSIX (in that POSIX
only specifies an error), but is the documented behavior on Linux and more
closely matches historical mmap behavior.

In addition to explicit setting of the maximum permissions, an experimental
sysctl `vm.imply_prot_max` causes mmap to assume that the initial permissions
requested should be the maximum when the sysctl is set to 1.  This behavior is
known to break code that uses `PROT_NONE` reservations before mapping contents
into part of the reservation.  A later version of this work is expected to
provide per-binary and per-process opt-in/out options and this sysctl may be
removed in its current form.  As such it is undocumented.
