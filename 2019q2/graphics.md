## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>
Contact: Niclas Zeising, <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team maintains the lower levels of the FreeBSD graphics
stack.
This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

INSERT STUFF HERE
* synaptics, trackpad, elantech default
* drm 5.0
* drm driver updates
* lkpi changes?
* meetings

#### drm drivers general
* An old hidden memory leak in i915kms has been fixed.

#### drm 5.0 news
* drm.ko and i915kms.ko can now be unloaded for development and testing purposes. A visible virtual console won't return so ssh connection is recommended.
* i915kms debugfs has been improved. Other drivers are being worked on. Limitations in how debugfs (based on pseudofs) works might prevent fully functional debugfs and we might have to look into adding to pseudofs or another framework. A blogpost on how to use debugfs will come soon.
* The new in-kernel drm vboxvideo.ko driver has been ported from Linux. Virtual console won't update after kldload but X and Wayland based compositors are working. Still WIP.


Several meetings has been held over the course of the period.
Meeting notes have been sent out to the public `x11@FreeBSD.org` mailing list.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: (https://gitter.im/FreeBSDDesktop/Lobby).
We are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
(https://github.com/FreeBSDDesktop)
