## XFCE 4.14 update ##

Contact: Guido Falsi <xfce@FreeBSD.org>  

Link:	 [XFCE 4.14 announce](https://xfce.org/about/news/?post=1565568000)

On September 19th the XFCE desktop environment ports have been updated
to the recently released XFCE 4.14 version.

These updates include upgrades of all the main XFCE components to the
latest versions which have been migrated to GTK3, with few exceptions.
Base components still require and link to GTK2 in addition to GTK3 to
allow older GTK2 XFCE applications, for example panel plugins, to keep
working.

Due to this change the gtk-xfce-engine theme is deprecated since it only
supports GTK2. The XFCE metaport by default installs the greybird theme,
but it is not enabled by default.

This new version also includes now it's own xfce4-screensaver program
which is installed by default.

Finally the default Display Manager on which XFCE depends has been
changed to LightDM.

Some regressions were reported in bugzilla. In particular the one
affecting most users is a regression in the window manager: on specific
graphic display hardware the window manager fails to properly draw
window decorations, which appear black and blocky on affected systems.

This problem has also been reported in the upstream bug tracker and a
solution is being sought.

If anyone is experiencing this display glitch and is able to test,
please contact xfce@freebsd.org to help trying to figure out a solution.
