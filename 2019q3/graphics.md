## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>
Contact: Niclas Zeising, <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

LIST OF STUFF WE'VE DONE HERE

* Ports infra: USES=xorg and USES=xorg-cat + docs
* clean up of xorg ports.
	deprecated a number of ports:
	`x11-fonts/font-bitstream-speedo`
	`x11-drivers/xf86-input-acecad`
	`x11-drivers/xf86-input-fpit`
	`x11-drivers/xf86-input-hyperpen`
	`x11-drivers/xf86-input-mutouch`
	`x11-drivers/xf86-input-penmount`
	`x11/xprehashprinterlist`
	`x11/xrx`
	`x11/xsetmode`
	`x11/xsetpointer`
	`x11/libXevie`
	`x11/liboldX`
	`x11/libxkbui`
	`x11-fonts/libXfontcache`
	`x11/libXxf86misc`
	`grapics/libGLw`

	moved x11/luit to new upstream

We have also continued our regularly scheduled bi-weekly meetings.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
