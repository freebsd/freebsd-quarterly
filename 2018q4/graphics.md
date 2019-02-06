## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>, Niclas Zeising <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

In the forth quarter, the team focused on stablizing the graphics drivers and
ports for the FreeBSD 12.0 release.
The graphics drivers have been updated with new versions for both FreeBSD 11.2
and FreeBSD 12.0.
The ports have been renamed in order to make it clearer which version of a port
runs on which version on FreeBSD.
We also created a new meta port, `graphics/drm-kmod`, which will install the
correct driver based on FreeBSD version and architecture.
Moving forward this is the recommended way to install the FreeBSD graphics
drivers.

The DRM drivers themselves are named `graphics/drm-current-kmod` and
`graphics/drm-fbsd12.0-kmod` for CURRENT and 12.0 respectively, both of which
have been updated to use the 4.16 Linux Kernel source.
For FreeBSD 11.2 we have `graphics/drm-fbsd11.2-kmod` which uses the 4.11 Linux
Kernel source.
Finally, we created `graphics/drm-legacy-kmod`, which works on FreeBSD 12.0 and
CURRENT.
This is a copy of the legacy drivers from the FreeBSD base system.
This work will make it possible for us to remove the drm2 code from CURRENT,
something we are planning to do in early February.
A remnant of the drm2 code will remain in the base after this due to an
unresolved dependency for arm TEGRA.
Plans for its migration are expected to be finalized in first quarter in 2019.

Support for i386 and PowerPC 64 has been added to the drm kernel drivers.
This is currently in an alpha state.

Wayland has been enabled by default in the ports tree, meaning that all packages
are build with Wayland support enabled.
This makes it much easier to use and test Wayland.

Support for VMware graphics pass through has been added to the kernel driver.
Support for this is still missing in `graphcs/mesa-dri` though, so it currently
does not work out of the box.

The input stack has been updated and is now for the most part current with
upstream.
Evdev headers were split off from `multimedia/v4l_compat` into their own port,
`devel/evdev-proto`.
This makes it easier to update those headers and keep them current with
upstream, as needed.
The input stack is still an area where more work needs to be done to make it
easier to use various input devices with X and Wayland on FreeBSD.

Several meetings has been held over the course of the period.
Meeting notes have been sent out to the public `x11@FreeBSD.org` mailing list.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: https://gitter.im/FreeBSDDesktop/Lobby.  We
are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
https://github.com/FreeBSDDesktop
