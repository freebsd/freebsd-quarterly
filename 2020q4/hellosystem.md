## helloSystem ##

Link:	 [Documentation](https://hellosystem.github.io/docs/)

Contact: Simon Peter <probono@puredarwin.org>

Contact: `#helloSystem` on `irc.freenode.net`, mirrored to [`#helloSystem:matrix.org` on Matrix](https://matrix.to/#/%23helloSystem:matrix.org?via=matrix.org)

helloSystem is FreeBSD preconfigured as a desktop operating system 
with a focus on simplicity, elegance, and usability. 
Its design follows the “Less, but better” philosophy.
It is intended as a system for “mere mortals”, welcoming to switchers
from a world in which a global menu bar exists, the Command key is used
rather than Control, and applications are contained in .app bundles.

helloSystem grew out of frustration with [usability shortcomings](https://medium.com/@probonopd/make-it-simple-linux-desktop-usability-part-1-5fa0fb369b42) of existing open source
desktop environments. FreeBSD was chosen as the base because it offers
one consistent base system rather than a [fragmented landscape of distributions lacking a common platform](https://media.ccc.de/v/ASG2018-174-2018_desktop_linux_platform_issues).

helloSystem aims at providing a "it just works" out-of-the-box user experience
in which a non-technical user can just use the system without ever opening
the terminal, without having to configure anything, and without ever seeing
white text on a black background scroll by during system boot. Technologies embraced
include DNS-SD/Zeroconf (also known as Bonjour), IPP Everywhere (also known as AirPrint),
eSCL (also known as AirScan), etc.

Prerelease installable Live ISO images are available.

[Help is needed in a number of areas](https://github.com/helloSystem/hello/blob/master/CONTRIBUTING.md), especially:

  * FreeBSD/kernel: allowing to put the system into a read-only disk image with a writable overlay, e.g., using unionfs
  * Qt, Python: writing various easy-to use frontends for FreeBSD/OpenZFS functionality, e.g., Disk Utility.app
  * Testing and bugfixing
