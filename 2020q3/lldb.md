## LLDB Debugger Improvements ##

Link:	 [Moritz Systems Project Description](https://www.moritz.systems/blog/lldb-debugger-improvements-for-freebsd/)  
Link:	 [Git Repository](https://github.com/moritz-systems/llvm-project)  

Contact: Kamil Rytarowski <kamil@moritz.systems>  
Contact: Michał Górny <mgorny@moritz.systems>  

FreeBSD includes LLDB, the debugger in the LLVM family, in the base
system. At present it has some limitations in comparison with the GNU
GDB debugger, and does not yet provide a complete replacement. It
relies on an obsolete plugin model in LLDB that causes growing
technical debt. This project aims to bring LLDB closer to a fully
featured replacement for GDB, and therefore for FreeBSD to feature a
modern debugger for software developers.

The legacy monolithic target supports the executed application being
debugged in the same process space as the debugger. The modern LLDB
plugin approach, used on other supported targets, executes the
target process under a separate lldb-server process. This improves
reliability and simplifies the process / thread model in LLDB itself.
In addition, remote and local debugging will both be performed using
the same approach.

After the migration to the new process model is complete, the project
will include reviewing the results of LLDB's test suite and fixing
tests as time permits. The work is expected to be complete in 2020.

The project schedule is divided into three milestones, each taking approximately
one month:

 1. Introduce new FreeBSD Remote Process Plugin for x86_64 with basic support and upstream to LLVM,
 2. Ensure and add the mandated features in the project (process launch, process attach (pid), process attach (name), userland core files, breakpoints, watchpoints, threads, remote debugging) for FreeBSD/amd64 and FreeBSD/i386,
 3. Iterate over the LLDB tests. Detect, and as time permits, fix bugs. Ensure bug reports for each non-fixed and known problem. Add missing man pages and update the FreeBSD Handbook.

We are nearing the completion of the first milestone. The new plugin is getting into
shape, and it can already run simple single-threaded programs. The supported features
include single-stepping, breakpoints, memory and register I/O on amd64.
Both plugins are supported simultaneously. The new plugin is used if
FREEBSD_REMOTE_PLUGIN environment variable is set to any value, or if lldb-server is
spawned directly. Otherwise, the old plugin is used for compatibility. Once the new
plugin matures, we are planning to enable it unconditionally on the architectures that
it is ported to.

Sponsor: The FreeBSD Foundation  
