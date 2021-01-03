## Xfce on FreeBSD ##

Link:	 [Xfce 4.16 Upstream Release Announcement](https://xfce.org/about/news/?post=1608595200)  
Link:	 [Xfce meta-port on FreshPorts](https://www.freshports.org/x11-wm/xfce4)  

Contact: Guido Falsi <xfce@FreeBSD.org>  

The FreeBSD Xfce team (xfce@) work to ensure the Xfce desktop environment
is maintained and fully functional on FreeBSD.

This quarter the Xfce team are pleased to welcome Xfce 4.16
to the FreeBSD ports tree!

Some of the highlights of this Xfce 4.16 release:
 * The panel now supports dark mode (enabled by default) and an animated autohide transition
 * A new panel plugin dubbed "statustray" which combines both StatusNotifier and legacy Systray items
 * Fractional scaling support was added to the display dialog (helpful on HiDPI displays)
 * A new tab in the "About Xfce" dialog shows basic system information like CPU or GPU type
 * The settings manager has improved search and filter capabilities
 * All settings dialogs now use window decorations drawn by Gtk (client side decorations)
 * The "Mime Settings" and "Preferred Applications" dialogs were merged into the "Default Applications" dialog
 * The Thunar file manager now supports pause for copy/move operations, and queued file transfer
 * Generating thumbnails for .epub (e-book format) was added to tumbler
 * A new default wallpaper and icon theme
 * The application finder now allows for sorting applications by "frecency" - a combination of frequency and recency
 * Dropped GTK2 support from all components and plugins

For further details, refer to the [Xfce 4.16 upstream release announcement](https://xfce.org/about/news/?post=1608595200).

Due to GTK2 and libxfce4gui support being removed, some panel plugins
and libraries will be removed since they no longer work with Xfce 4.16:
 * deskutils/orage
 * deskutils/xfce4-volumed
 * print/xfce4-print
 * science/xfce4-equake-plugin
 * x11/xfce4-embed-plugin
 * x11/xfce4-quicklauncher-plugin
 * x11/xfce4-wmdock-plugin
 * x11-toolkits/libxfce4gui

WARNING: Unfortunately this update can reveal a bug in pkg which can
cause files from the libexo package to be absent after upgrade.
To avoid the issue, upgrade the libexo package by itself before
the rest of the packages, as described in UPDATING entry 20210102.

Thanks also to riggs@, Olivier Duchateau <duchateau.olivier@gmail.com>,
woodsb02@, Sergey Dyatko <sergey.dyatko@gmail.com>, and ehaupt@ for their help and
contributions.
