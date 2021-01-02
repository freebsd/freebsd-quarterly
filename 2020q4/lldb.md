## LLDB Debugger Improvements ##

Link:	 [Moritz Systems Project Description](https://www.moritz.systems/blog/lldb-debugger-improvements-for-freebsd/)  
Link:	 [FreeBSD Foundation Blog](https://freebsdfoundation.org/blog/guest-blog-foundation-sponsors-freebsd-lldb-improvements/)
Link:	 [Git Repository](https://github.com/moritz-systems/llvm-project)  

Contact: Kamil Rytarowski <kamil@moritz.systems>  
Contact: Michał Górny <mgorny@moritz.systems>  

The LLDB project builds on libraries provided by LLVM and Clang to provide a
great modern debugger. It uses the Clang ASTs and the expression parser, LLVM
JIT, LLVM disassembler, etc so that it provides an experience that “just
works”. It is also blazing fast and more permissively licensed than GDB, the
GNU Debugger.

LLDB is the default debugger in Xcode on macOS and supports debugging C,
Objective-C, and C++ on the desktop and iOS devices and the simulator.

FreeBSD includes LLDB in the base system. At present, it has some limitations
in comparison with the GNU GDB debugger, and does not yet provide a complete
replacement. It used to rely on an obsolete plugin model in LLDB that was a
growing technical debt. This project aimed to bring LLDB closer to a fully
featured replacement for GDB, and therefore for FreeBSD to feature a modern
debugger for software developers.

The legacy monolithic target support executed the application being debugged in
the same process space as the debugger. The modern LLDB plugin approach, used
on other supported targets, executes the target process under a separate
lldb-server process. This improves reliability and simplifies the process /
thread model in LLDB itself. In addition, remote and local debugging is now
performed using the same approach.

After the migration to the new process model on 32 and 64-bit x86 CPUs, the
project focused on reviewing the results of LLDB’s test suite and fixing tests
as time permits.

During the Moritz Systems work, the FreeBSD Project gained numerous important
improvements: in the kernel, userland base libraries (the dynamic loader) and
the LLVM toolchain FreeBSD support.

The introduced changes are expected to be shipped with LLDB 12.0, and where
applicable in FreeBSD 13.0.

The overall experience of FreeBSD/LLDB developers and advanced users on this
rock solid Operating System reached the state known from other environments.
Furthermore, the FreeBSD-focused work also resulted in generic improvements,
enhancing the LLDB support for Linux and NetBSD.


Sponsor: The FreeBSD Foundation  
