## The nosh project ##

Contact: Jonathan de Boyne Pollard, <J.deBoynePollard-newsgroups@NTLWorld.COM>

Link: [Introduction and blurb](http://jdebp.eu./Softwares/nosh/)
Link: [Guide](http://jdebp.eu./Softwares/nosh/guide.html)
Link: [FreeBSD binary packages](http://jdebp.eu./Softwares/nosh/freebsd-binary-packages.html)
Link: [Installation how-to](http://jdebp.eu./Softwares/nosh/timorous-admin-installation-how-to.html)
Link: [Roadmap](http://jdebp.eu./Softwares/nosh/roadmap.html)

### Background ###

The nosh project is a suite of system-level utilities for initializing, 
running, and shutting down BSD systems; and for managing daemons, 
terminals, and logging.

It supersedes BSD `init`, the Mewburn `rc` system, and OpenRC, drawing 
inspiration from 
[daemontools-encore](http://untroubled.org/daemontools-encore/) for 
service control/status mechanisms, 
[UCSPI](http://jdebp.eu./FGA/UCSPI.html) for networked services, Solaris 
SMF for named milestones, and IBM AIX for separated service and system 
management. It includes a range of compatibility mechanisms, including 
shims for familiar commands from other systems, and an automatic import 
mechanism that takes existing configuration data from `/etc/fstab`, 
`/etc/rc.conf{,.local}`, `/etc/ttys`, and elsewhere, applying them to 
its native service definitions and creating additional native services.

It is portable (including to Linux) and composable, it provides a 
migration path from the world of systemd Linux, and it does not require 
new kernel APIs. It provides clean service environments, has orderings 
and dependencies between services, has parallelized startup and shutdown 
(including `fsck`), provides strictly size-capped and autorotated 
logging, has the service manager as a "subreaper", provides per-user 
service management as well as system-wide, provides user-space virtual 
terminals, brings TTY login under the general service management 
umbrella, and uses `kevent`(2) for event-driven parallelism.

For more, see the aforelinked `introduction and blurb`, and the
`nosh Guide`.

### News ###

The project has seen a lot of development since the last status report 
in 2017.  To briefly touch upon just some of the things that have been 
worked on:

* There are several more packages for things like running Bruce Guenter's bcron, shims for OpenRC's `rc-update` and `rc-service` tools, and shims for portable substitutes for a couple of Linux's util-linux tools.

* There are quite a lot of new tools, including `getuidgid`, `userenv-fromenv`, `setgid-fromenv`, `envgid`, `printenv`, `setlogin`, `console-decode-ecma48`, `console-control-sequence`, `console-flat-table-viewer`, `console-input-method`, and `local-stream-socket-connect`.  To look at just two of these:

     * [printenv](http://jdebp.eu./Softwares/nosh/guide/printenv.html) as a built-in allows more convenient use in conjunction with `clearenv`.  It can also generate output in some additional formats.

     * [console-control-sequence](http://jdebp.eu./Softwares/nosh/guide/console-control-sequence.html) also responds to the name `setterm`, and can do most of what the non-portable util-linux tool by that name does; excluding the things that are specific to non-portable Linux `ioctl()`s and control codes (such as display adapter power management), but also including _extra_ standard DEC VT and ECMA-48 things that the util-linux tool does _not_ do (such as turning strikethrough, calculator keypad application mode, mouse reports, and the alternative screen buffer on and off).

* There are a lot of new service bundles for more services, too many to list here.  One can find them listed in the 1.37 and 1.38 + 1.39 release announcements.

* There are new chapters in the `nosh Guide`, on packages and ports, on resources for terminals such as keyboard maps, input methods, and fonts, and on how the `head0` user-space virtual terminal is structured.
   There are also new manual pages - in addition to the ones for all of the new commands, of course - on the subjects of the [TERM](http://jdebp.eu./Softwares/nosh/guide/TERM.html) environment variable and the [TerminalCapabilities](http://jdebp.eu./Softwares/nosh/guide/TerminalCapabilities.html) system.
  There are also [some replacements for some Linux manual pages](http://jdebp.eu./Proposals/linux-kvt-manual-pages.html) that have gone missing over the past decade.

* The external format configuration import subsystem has seen some major improvements in per-user service configuration.  The per-user service manager itself gained a control FIFO, addressing a long-standing bug.

A particular area of improvement since the last status report is the 
inclusion of input method capabilities in user-space virtual terminals.  
The input method mechanism uses the same CIN files as used by several 
other softwares, similar to how one can use existing SCO/FreeBSD 
keyboard maps and FreeBSD vt fonts.  It places a simple textual user 
interface on top of a user-space virtual terminal, can switch amongst 
multiple input methods on the fly, and responds to both the dedicated 
keys on a JIS 106/109-key keyboard or a Korean 103/106-key keyboard and 
the conventional keys used on other keyboards.  The blurb includes
[an example of how this works for a Japanese user](http://jdebp.eu./Softwares/nosh/japanese-input-methods.html),
and the virtual terminal chapters of the `nosh Guide` now incorporate
input methods into the doco.

Another area of work was eliminating Wide NCurses from almost all of the 
tools, apart from the one tool that by definition uses it 
(`console-ncurses-realizer`).  Wide NCurses has long been a porting 
difficulty for several operating systems, including Gentoo Linux and 
OpenBSD, and does not really model modern real world terminals and 
terminal emulators very well.  It has been replaced by a new 
TerminalCapabilities library, in conjunction with a library for handling 
ECMA-48 character sequence decoding and ECMA-48/DEC VT control sequence 
generation.  The decoder is the basis for the new 
`console-decode-ecma48` tool, for example, as well as being the decoder 
for terminal input in `console-termio-realizer` and in full-screen TUI 
tools like 
[chkservice](http://jdebp.eu./Softwares/nosh/guide/chkservice.html)
and the new 
[console-flat-table-viewer](http://jdebp.eu./Softwares/nosh/guide/console-flat-table-viewer.html).

The external formats import subsystem will also now make a replacement 
`/etc/system-control/convert/termcap/termcap.db` that one can use, which 
includes amongst other things the currently missing `teken` terminal type.

### Roadmap ###

In addition to what is on the aforelinked roadmap, several things are on 
the cards for forthcoming versions.  Tools that can feed the process 
table into `console-flat-table-viewer` in the proper vis(3) form.  The 
ability to have different keyboard maps for different keyboards if one 
has multiple keyboards.  A Linux shim for `login.conf`. Proper handling 
of CSI sub-parameters in SoftTerm.  A manual page for the CIN file 
format.  A `time-env-next-matching` tool.

### How you can help ###

* The Z shell completions now have extensive coverage of the toolset, 
but there are no completions for the Bourne Again shell or the Friendly 
Interactive shell.  Work on such completions would be welcome.  The 
users who use those shells would welcome it especially.

* The `system-manager` already recognizes a `-b` option for [emergency mode](http://jdebp.eu./FGA/emergency-and-rescue-mode-bootstrap.html).  Work to make the FreeBSD loader and kernel send such an option to process #1, in response to an additional emergency mode boot menu choice, would be very welcome.

* The `monitor-fsck-progress` and `monitored-fsck` tools stand ready to work with a `-C` option to `fsck` that makes it spit out progress information to an open file descriptor.  Another way to help is to add this capability to `fsck`.

* `teken` needs to be added to base termcap.  It was put into NCurses terminfo back in 2014.
