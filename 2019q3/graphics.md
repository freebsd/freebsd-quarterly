## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team <x11@freebsd.org>  
Contact: Niclas Zeising <zeising@freebsd.org>  

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

During the last period, several changes have been made, but most of them has
been behind the scene.
We have also worked on general clean up of old xorg ports that have been
deprecated upstream.

The ports infrastructure for xorg ports and ports that depend on xorg ports have
been updated.
We have switched `USE_XORG` and `XORG_CAT` to use the `USES` framework, instead
of the old way of including `bsd.xorg.mk` from `bsd.port.mk`.
This infrastructure work has been fairly substantial, and new ports depending on
xorg ports should add `USES=xorg` to their makefiles.
As part of this `bsd.xorg.mk` was split up, and the `XORG_CAT` part was split
out to `USES=xorg-cat`.
This is used for the xorg ports themselves, and sets up a common environment for
building all xorg ports.
In addition, framework for pulling xorg ports directly from freedesktop.org
gitlab was added, which will make improve development and testing, since it
makes it possible to create ports of unreleased versions.
Further improvements in this area includes framework for using meson instead of
autotools for building xorg ports.
This is still a work in progress.

We have also worked to clean up and deprecate several old xorg ports and
libraries.
Some of these ports have already been removed, and some are still waiting on
removal after a sufficient deprecation period.
Most notably amongst the deprecations are `x11/libXp`, which required to fix
several dependencies.
Several other old libraries have also been deprecated, such as `x11/Xxf86misc`,
`x11-fonts/libXfontcache` and `graphics/libGLw`.
Some applications and drivers have also been deprecated during the period.
With the remaining removals in this area, we should be up to speed with
deprecations upstream.
We are currently investigating if there are new software added upstream that we
need to port to FreeBSD.

We have also continued our regularly scheduled bi-weekly meetings.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
