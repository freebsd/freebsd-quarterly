## GPL in Base ##

Link:	 [GPL Software in the Base System](https://wiki.freebsd.org/GPLinBase)  

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Kyle Evans <kevans@FreeBSD.org>  
Contact: Baptiste Daroussin <bapt@FreeBSD.org>

A long-standing goal of the FreeBSD project is for the base system to migrate
to modern, copyfree or more permissively licensed components.  In this quarter,
the following components have been successfully removed or replaced:

  * gdb ([removed](https://cgit.freebsd.org/src/commit/?id=1c0ea326aa6d) in favor of lldb in base or devel/gdb in ports)
  * gnugrep ([replaced](https://cgit.freebsd.org/src/commit/?id=b82a9ec5f53e) with bsdgrep)
  * libgnuregex ([removed](https://cgit.freebsd.org/src/commit/?id=8aff76fb37b5))

The following component(s) have yet to be claimed.  Some replacement prospects
may be listed on the above-linked wiki page. Interested parties are welcome to
evaluate the options to restart the discussion:

  * dialog
  * gcov (kernel)

The following component(s) have a principal investigator to coordinate work.
Note that partial completion likely means that a component is partially
compatible, but could use evaluation and patches to bring parity with the
component that it is replacing.

  * diff3 (Contact bapt@ if interested)
