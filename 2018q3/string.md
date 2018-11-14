## String functions on the amd64 architecture ##

Functions like memset, memmove and memcpy are very frequently used by virtually
all programs. They can be optimized in various ways, but FreeBSD uses very
rudimentary implementations using rep movsq/stosq. rep prefix has high startup
latency which is overly expensive when dealing with small sizes.

Short term goal of this project is to implement faster variants for the kernel
and import them into libc. The main speed up comes from not using rep for small
sizes (< 256) and from aligning target buffers to 16 bytes when rep is used.
On top of that runtime detection of the Enhanced REP MOVSB/STOSB extention can
be used to only use rep movsb/stosb.

Mid term goal extends userspace. SIMD extensions can be used to make these functions
faster. They can't easily be used in the kernel: SIMD registers are not saved on
transitions user<->kernel for performance reasons. Thus any use would have to
take care of saving these registers, which can consume any win from using them in
the first place. This is not a concern for userspace code.

There is a BSD-licensed implementation in bionic:
https://android.googlesource.com/platform/bionic/+/master/libc/arch-x86_64/string/

which with some modifications can be used in libc later on.

See the Intel Optimization Manual for reference:
https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf
