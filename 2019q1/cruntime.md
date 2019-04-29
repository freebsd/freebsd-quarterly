## C Runtime changes ##

Contact: Konstantin Belousov <kib@freebsd.org>

Several changes where made to the C runtime which generally improves
the environment provided to the application.

== Fix for libraries with initial exec TLS mode

Some libraries, most prominent of which is NVidia-provided and thus
binary-only libGL.so.1, use so called initial exec mode for TLS
variables access.  This is the fastest mode of TLS access, but its
drawback is that it only reliably work when the main binary is linked
against the library, i.e. dlopen-ing the library to load it at runtime
is not guaranteed to work.

The mode works by placing the TLS variables for objects in one area
allocated during the executable initialization, which somewhat
explains the name of the mode.  Obvious consequence is that if such
library is loaded later, there is no space in the TLS area where to
put its TLS variables.

In fact, FreeBSD dynamic linker is aware of misbehaviour of the app
builders, and provides some amount of slack in the area to give space
for such libraries.  But it appeared that the initial content of the
TLS segment from libraries was not distributed among the threads TLS
areas, still breaking libraries which use initial exec mode for TLS.

Another thing that somewhat mitigates mis-use of the mode is the
DF_STATIC_TLS flag in the dynamic section, which allows the linker to
check for the space earlier and e.g. avoid loading depencies if there
is no total required space.  This flag was implemented by BFD ld, but
not by LLVM lld.

FreeBSD dynamic linker was fixed to properly distribute TLS
initialization data to all threads' initial segments, which required
somewhat extensive per-architecture changes to libc and libthr.
Simultaneously LLD was improved to mark libraries using initial exec
TLS mode, with the flag.

The measures should make FreeBSD more resilent to the improperly
linked libraries, most interesting to users is the nvidia libgl case,
because it cannot be fixed by relinking.

== Use rtld malloc in libthr

FreeBSD implementation of mutexes in libthr allocates some memory to
keep the mutex data on the mutex initialization.  On the other hand,
the malloc implementation used by FreeBSD, jemalloc, needs working
pthread mutexes for operation.

This creates chicken-and-egg problem during executable startup, and
requires jemalloc to provide fragile hacks to make it possible to
initialize mutexes.  This is the constant source of mismatches on
imports of new versions of jemalloc.

On the other hand, our rtld already contains very light-weight malloc
implementation, suitable for limited use in pre-C-runtime
environments.  It seems to be the ideal fit for allocator of the
pthread private mutexes memory.  If used, it solves the cyclic
dependencies between jemalloc and libthr.

The entry points in the rtld malloc.c were renamed to avoid clash with
the libc exported symbols, and now the file is linked statically into
libthr, providing allocator for private mutexes and pthread key
storage.  The later was already switched to direct use of mmap(2) for
similar reasons.  Now less memory is wasted when key storage requires
less than a page.

== Destructors order bug

Alexander Kabaev (kan@) noted that apparently C++ destructors for the
static objects from the linked shared libraries are executed before
C++ destructors of the static objects from the main binary.  This was
verified both for clang++ and g++, but amusingly not for
__attribute__(((destructor))).

Apparently, the bug was introduced when init functions and init arrays
for main binary started called from the rtld instead of csu (C startup
code linked to the binary, typically from crt1.o).  The cause is
somewhat complicated way how destructors are called both by fini/fini
arrays and rtld-registered atexit(3) handler.

Solution is to register rtld atexit(3) handler before main binary init
functions are called, using new internal ABI __libc_atexit() function.

It is amusing that the bug was not noticed for so many years.

Sponsor: The FreeBSD Foundation
