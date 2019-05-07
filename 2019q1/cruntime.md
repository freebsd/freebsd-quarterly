## C Runtime changes ##

Contact: Konstantin Belousov <kib@freebsd.org>

Several changes where made to the C runtime which generally improves
the environment provided to an application.

### Fix for libraries with initial exec TLS mode

Some libraries, most prominent of which is NVidia-provided and thus
binary-only libGL.so.1, use so called initial exec mode for TLS
variables access.  This is the fastest mode of TLS access, but its
drawback is that it only reliably work when the main binary is linked
against the library, i.e. dlopen-ing the library to load it at runtime
is not guaranteed to work.

This mode works by placing the TLS variables for objects in one area
allocated during the executable initialization, which somewhat
explains the name of the mode.  An obvious consequence is that if such
library is loaded later, there is no space in the TLS area for an
application to put its TLS variables.

The FreeBSD dynamic linker is aware of misbehaviour of the app
builders, and provides some amount of slack in the TLS area to give space
for such libraries.  But it appeared that the initial content of the
TLS segment from libraries was not distributed among the threads' TLS
areas, still breaking libraries which use initial exec mode for TLS.

Another issue that somewhat mitigates mis-use of the mode is the
`DF_STATIC_TLS` flag in the dynamic section.  This flag allows the
linker to check for the space earlier and avoid loading dependencies
if there is no total required space.  This linker flag was implemented
by the BFD ld linker, but not by the LLVM lld linker.

The FreeBSD dynamic linker was fixed to properly distribute TLS
initialization data to all threads' initial segments, which required
reasonably extensive per-architecture changes to libc and libthr.
Simultaneously, LLD was improved to mark libraries using initial exec
TLS mode with the appropriate flag.

These measures should make FreeBSD more resilent to improperly
linked libraries.  The most interesting fix is to users of the
nvidia libgl library, because it cannot be fixed by relinking.

### Use rtld malloc in libthr

The FreeBSD implementation of mutexes in libthr allocates some
memory to keep the mutex data needed for mutex initialization.  In
contrast, the malloc implementation used by FreeBSD, jemalloc(3),
requires working pthread mutexes for operation.

This creates chicken-and-egg problem during executable startup, and
requires jemalloc to provide fragile hacks to make it possible to
initialize mutexes.  This has been a constant source of mismatches on
imports of new versions of jemalloc.

The FreeBSD rtld implementation already contained a very light-weight
malloc implementation, suitable for limited use in pre-C-runtime
environments.  This seemed to be the ideal fit for an allocator for the
pthread private mutexes memory.  By using this allocator, a method
to address the cyclic dependencies between jemalloc and libthr could
finally be implmented.

The entry points in the rtld malloc.c were renamed to avoid a clash with
the libc exported symbols, and now the file is linked statically into
libthr, providing an allocator for private mutexes and pthread key
storage.  The later was already switched to direct use of mmap(2) for
similar reasons.  Now less memory is wasted when key storage requires
less than a page.

### Destructors order bug

Alexander Kabaev (kan@) noted that C++ destructors for the
static objects from the linked shared libraries are executed before
C++ destructors of the static objects from the main binary.  This was
verified both for clang++ and g++, but amusingly not for
`__attribute__(((destructor)))`.

The bug was introduced when init functions and init arrays for main
binary startup are called from the rtld instead of csu (C startup
code linked to the binary, typically from crt1.o).  The cause is
due to the somewhat complicated way of how destructors are called
both by fini/fini arrays and rtld-registered atexit(3) handler.

Solution is to register rtld atexit(3) handler before main binary init
functions are called, using new internal ABI `__libc_atexit()` function.

It is amusing that the bug was not noticed for so many years.

Sponsor: The FreeBSD Foundation
