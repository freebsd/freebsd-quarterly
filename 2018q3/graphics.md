## FreeBSD Graphics Team status report ##

Contact: FreeBSD Graphics Team, <x11@freebsd.org>, Niclas Zeising <zeising@freebsd.org>

Link:	 [Project GitHub page](https://github.com/FreeBSDDesktop)

The FreeBSD X11/Graphics team is responsible for the lower levels of the FreeBSD
grpahics stack.  This includes graphics drivers, graphics libraries such as the
MESA OpenGL implementation, the X.org xserver with related libraries and
applications, and Wayland with related libraries and applications.

There has been a lot of changes since the last report.  The most important one
is the change of driver distribution and updates.  On FreeBSD 11.2 and later
modern graphics drivers using the Linux KPI subsystem are found in ports.  These
give much improved support for Intel and AMD graphics hardware, however, they
are currently only available for amd64.

The legacy drivers available in the FreeBSD base system are also available in
the ports tree, since they cause issues with the new drivers.  They will remain
in tree for 11.2 and 12, but work is on-going to have them removed for 13,
except for arm.

The easiest way to install the new drivers is to install graphics/drm-kmod which
will install the correct driver depending on your architecture and FreeBSD
version.

There have been changes to the ports as well.  Most notably is the changed
handling of OpenGL dependencies, which has moved to USES instead of being
handled directly in bsd.port.mk.  Other big infrastructure changes is the move
from individual \*proto packages to xorgproto, and turning that into a build
time dependency.  Many thanks to portmgr for help with exp-runs for these
changes.

There have also been updates to applications and libraries as needed.

On the project management side, there is ongoing work to set up a more efficient
way of working, including bi-weekly conference calls to discuss the current
works in progress.  Notes from these conference calls will be posted on the
mailing list.

Looking forward, the current major works in progress is to update the graphics
driver to be on pair with Linux 4.17.  The code is merged, but patching and bug
fixing is ongoing.

There is also work to port the VMware guest graphics driver, vmwgfx, to FreeBSD
and to the Linux KPI, to get better graphics support in VMware.

Lastly on the driver side is to get the new graphics drivers to work on i386 as
well.  Experimental support for this exists in the code repository, but is not
yet merged to the FreeBSD ports tree.

In userland, the biggest things happening is the update of the input stack,
including libinput and supporting libraries.

Work is also ongoing on updating MESA libraries.

On the project management side, the most important tasks is to continue to work
on the team, and how we work internally.

We are also working on setting up a list of requirements for testing, so that we
can be resonably assured that updates won't cause regressions.

People who are interested in helping out can find us on the x11@FreeBSD.org
mailing list, or on our gitter chat: https://gitter.im/FreeBSDDesktop/Lobby.  We
are also available in #freebsd-xorg on EFNet.

We also have a team area on GitHub where our work repositories can be found:
https://github.com/FreeBSDDesktop
