## elfctl utility ##

Contact: Ed Maste <emaste@freebsd.org>  

In [r340076](https://reviews.freebsd.org/rS340076) Ed added the
_NT\_FREEBSD\_FEATURE\_CTL_ ELF note, used to allow binaries to opt out of,
or in to, vulnerability mitigation and other features.  FreeBSD Foundation
intern Bora Özarslan later added a tool to decode and modify the ELF note,
but it had yet to be installed by default.

In the previous quarter Ed renamed the tool to _elfctl_, and installed it
in /usr/bin.  Ed also committed a number of minor bug fixes, code style
improvements, etc.

Usage examples - list known feature flags:
```
$ elfctl -l
Known features are:
aslr            Disable ASLR
protmax         Disable implicit PROT_MAX
stackgap        Disable stack gap
wxneeded        Requires W+X mappings
```

List feature tags set on a binary:
```
$ elfctl /bin/ls
File '/bin/ls' features:
aslr            'Disable ASLR' is unset.
protmax         'Disable implicit PROT_MAX' is unset.
stackgap        'Disable stack gap' is unset.
wxneeded        'Requires W+X mappings' is unset.
```

Indicate that a binary requests to opt-out of address randomization:
```
$ elfctl -e +aslr binary
```

Sponsor: The FreeBSD Foundation
