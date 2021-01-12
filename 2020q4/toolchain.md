## Tool Chain ##

Contact: Dimitry Andric <dim@FreeBSD.org>
Contact: Ed Maste <emaste@FreeBSD.org>

Link: [ELF Tool Chain homepage](https://sourceforge.net/p/elftoolchain)

In October Clang/LLVM was updated to 11.0.0, followed by a number of bug fixes
from upstream, including improvements for a number of Tier-2 architectures.
We also enabled the `-fstack-clash-protection` flag to enable compiler
mitigation for the "stack clash" vulnerability and are coordinating with
upstream.

Upstream LLDB support for FreeBSD improved substantially over the last quarter,
as detailed elsewhere in this report.  These improvements will make it into the
FreeBSD base system early in 2021 when LLVM is next updated to 12.0.  As also
mentioned elsewhere, we removed the obsolete copy of GDB 6.1.1.

The ELF Tool Chain received a number of bug fixes, as well as support for
`readelf -z` (handling compressed ELF debug sections) and an improvement
to addr2line to report based on labels when other debug information is not
available.  We are working to upstream these changes to the ELF Tool Chain
project.

There are a number of open issues and opportunities for improvements in various
ELF Tool Chain components.  Contributions in these areas are very welcome,

Sponsor: The FreeBSD Foundation (in part)
