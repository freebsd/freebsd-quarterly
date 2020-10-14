## FreeBSD Graphics Team status report ##

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

Contact: FreeBSD Graphics Team <x11@freebsd.org>  
Contact: Niclas Zeising <zeising@freebsd.org>  

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

There have been several updates to the FreeBSD graphics stack and related
libraries since the last report.

Most notably, MESA related ports were changed to use the meson build system,
instead of the autotools based one.
This was needed since mesa upstream has deprecated and removed the autotools
build system, and this paved the way for further mesa updates.
While there was a need for a few minor corrections after the initial update,
this update has been successful and made it possible to further update and
improve the FreeBSD mesa port.

There have also been several security fixes for `xorg-server` and `libX11`, so
these ports have been updated to fix these issues.

During the period, FreeBSD 12 was changed to improve the compatibility with
input devices using udev/evdev and libinput.
This change removes the need for local configuration and makes most mice,
touchpads and keyboards work out of the box.
This change will be in the upcoming FreeBSD 12.2 release.

There have also been several updates to various libraries, both in the graphics
and input stacks, and several userland drivers have been updated.
Libraries such as `libdrm` and `libevdev` which includes new FreeBSD support
developed by team members and added upstream.

There has also been ongoing work to keep the various drm-kmod ports and packages
up to date, mostly in response to changes in varios FreeBSD versions.

We have also continued our regularly scheduled bi-weekly meetings.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
