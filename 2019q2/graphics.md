## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>
Contact: Niclas Zeising, <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

In the last report, half a year ago, several updates and changes has been made
to the FreeBSD graphics stack.

To further improve the user experience, and to improve imput device handling,
evdev was enabled in the default configuration late 2018.  Building on that,
we have enabled IBM/Lenovo trackpoints, and elantech and synaptics touchpads by
default as well.

The input device library libinput has been updated, as the last in a series of
updates bringing the userland input stack up to date.  This is work that was
started in 2018.

We have made several improvements to the drm kernel drivers.
A longstanding memory leak in the Intel (i915) driver has been fixed, and
several other updates and improvements have been made to the various drm
kernel driver components.

A port of the drm kernel drivers using the 5.0 Linux kernel sources have been
created and committed to FreeBSD ports as `graphics/drm-devel-kmod`.
This driver requires a recent Linux KPI and is only available on recent
versions of FreeBSD CURRENT.

This version of the driver contains several development improvements.
The generic drm (`drm.ko`) driver as well as the i915 (`i915kms.ko`) driver
can now be unloaded and reloaded to ease in development and testing.
This causes issues with the virtual consoles, however, so a ssh connection is
recommended.
To improve debugging, `i915kms.ko` use of debugfs hsa been imporved.  Other
drivers are being worked on.  Limitations in how debugfs (which is based on
pseudofs) works might prevent a fully functional debugfs and we might have to
look into adding to pseudofs or use another framework.

The new in-kernel drm driver for VirtualBox, `vboxvideo.ko` has been proted from
Linux.
Virtual console won't update after loading the driver, but X and Wayland
based compositors are working.
This is experimental and still a work in progress.


Mesa has been updated to 18.3.2 and switched from using `devel/llvm60` to use
the Ports default version of llvm, currently `devel/llvm80`.

Several userland Xorg drivers, applications and libraries have been updated, and
other improvements to the various userland components that make up the Graphcis
Stack have been made.

Several meetings has been held over the course of the period.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
