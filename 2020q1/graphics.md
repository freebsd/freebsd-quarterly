## FreeBSD Graphics Team status report ##

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

Contact: FreeBSD Graphics Team <x11@freebsd.org>  
Contact: Niclas Zeising <zeising@freebsd.org>  

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

The biggest highlight by far during the previous quarter was the long awaited
update of `xorg-server` to version 1.20.
After years of work by many people, this update finally landed in the form of
`xorg-server` 1.20.7.
With this update came a couple of new things, most notably, FreeBSD 12 and later
was switched to use the udev/evdev backend by default for handling input
devices, such as mice and keyboards.
Together with this release, the OpenGL library implementation `mesa` was
switched to use DRI3 by default, instead of the older DRI2.

These updates caused some fallout when they first were comitted, most notably
issues with keyboards.
But with help from Michael Gmelin and others on the mailing lists, most issues
were sorted fast.
Unfortunately version 304 of the nVidia graphics driver is no longer supported
as of this release.

Since this update, xorg-server has also been bumped to 1.20.8, which is the
latest upstream release.

Apart from this update, there has also been ongoing work to keep the various
drm-kmod ports and packages up to date, mostly in response to changes in FreeBSD
CURRENT and to security issues found in the Intel i915 driver.

We have also done updates as needed to keep the graphics and input stack up to
date and working, and deprecated and removed several old and no longer used
drivers, applications and libraries.

We have also continued our regularly scheduled bi-weekly meetings.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
