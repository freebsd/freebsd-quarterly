## Kernel Mapping Protections ##

Contact: Mark Johnston <markj@FreeBSD.org>

Modern CPU architectures have the ability to flag memory mappings as
"no-execute" (NX), which prevents that memory from being executed by a
processor.  NX mappings are an important security mitigation since they help
segregate code and data, blocking unintentional execution of memory whose
contents is controlled by an attacker.  W^X (write XOR execute) is a security
policy which disallows the creation of mappings that are simultaneously
writeable and executable.  Under this policy, memory whose contents can be
modified must be mapped with the NX flag.  This policy makes harder to exploit
bugs that permit an attacker to arbitrarily overwrite data.

FreeBSD has long made use of the NX flag for userspace mappings whenever
possible, but only in the past several years has it been applied to kernel
mappings.  A recent project has sought to implement a W^X-by-default policy for
the amd64 kernel by completing an audit of the remaining executable mappings in
the kernel, and making modifications to either apply the NX bit to those
mappings or to make them read-only.  This work has landed in HEAD and will be
available in FreeBSD 13.0 and 12.2.  Similar work for other CPU architectures is
also planned.

To help audit kernel mapping protections, the vm.pmap.kernel_maps sysctl was
added; it dumps a snapshot of the kernel's page table entries and their
attributes.  This way, mappings violating the W^X policy can easily be
discovered and investigated, and the sysctl provides information useful to
anyone interested in kernel memory layout.

With a few rare exceptions, the only kernel mappings which require execute
permission are those of the kernel executable itself, and loadable kernel
modules.  A number of other regions of memory were unnecessarily being mapped
without NX, and these were identified and corrected first.  To address the
kernel code mappings, the amd64 kernel linker script was modified to pad the
.text segment to a 2MB boundary.  To improve performance, the kernel creates
superpage mappings of its .text segment, but this means that any data cohabiting
the final 2MB .text mapping is mapped with execute permissions.  The padding
allows executable code to be segregated from data which follows in the kernel
image, avoiding this problem and maintaining the superpage optimization at the
expense of some wasted RAM.

Enforcing W^X turned out to be somewhat trickier.  Unlike other CPU
architectures supported by FreeBSD, amd64 kernel modules are linked as
relocatable object files, i.e., .o files.  (On other architectures, they are
dynamically shared objects (DSOs, or .so files), as one might naively expect.)
The use of .o files means that amd64 kernel modules contain more efficient code
than they would if linked as DSOs, since DSOs inherently make use of certain
types of indirection which allow shared libraries to be loaded at arbitrary
addresses, and this indirection is useless in the kernel.  As part of this
project an attempt was made to switch amd64 to using DSOs as well, since the
cost of this indirection can largely be mitigated with modern toolchains, but it
was found that the use of DSOs would also force a change to the code model used
when compiling amd64 kernel code, resulting in a further performance penalty.

The main obstacle with the use of .o files is that sections are not page-aligned
by default; the segregation of sections with differing mapping protection
requirements is done by the static linker when linking a DSO or executable file.
Since mapping protections are applied at the granularity of the page size (4KB
on amd64), the overlap of sections within a page causes problems since, for
example, the end of the read-only .text section may overlap with the beginning
of the read-write .data section.  One possible solution is to perform any
required section reordering and padding at kernel module load time, but this
approach breaks debugging tools such as dtrace(1) and kgdb which assume that the
kernel linker does not modify the layout of loadable modules.  As a result, an
amd64 kernel module linker script is now used to insert padding for specific
sections.  Finally, the kernel linker was modified to restrict mapping
protections based on section flags.

As a result of all of this, amd64 kernels now boot without any writeable,
executable mappings.  Though some of the work was architecture-specific, much of
it can and will be leveraged to provide the same policy for our other supported
architectures.

Sponsor: Netflix
