## ELF Tool Chain ##

Contact: Ed Maste, <emaste@freebsd.org>  

A number of performance and functional improvements were committed to ELF
Tool Chain tools over the last quarter.

FreeBSD Foundation intern Tiger Gao added DWARF Debug Information Entry
(DIE) caching to addr2line which provided a substantial improvement when
translating many entries (even surpassing GNU addr2line with a large list).

Tiger also rebased and updated an upstream ELF Tool Chain submission to
handle _DW\_AT\_ranges_ and addressed two elfcopy/objcopy bugs: setting the
OS/ABI field correctly when converting a binary file to ELF, and correctly
adding new sections when there is no _.shstrtab_ section.

Ed committed several readelf improvements, including decoding the
_PROTMAX\_DISABLE_, _STKGAP\_DISABLE_, and _WXNEEDED_ ELF feature control
flags, decoding Xen and GNU Build-ID ELF notes, and improved input
validation.

Mark Johnston addressed many memory and file descriptor leaks and similar
issues reported by Coverity Scan.

Sponsor: The FreeBSD Foundation
