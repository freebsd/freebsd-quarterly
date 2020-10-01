## DRM Drivers Update ##

Link: [drm-kmod](https://github.com/freebsd/drm-kmod/)

Contact: Emmanuel Vadot <manu@FreeBSD.Org>

The drm drivers for FreeBSD 13-CURRENT have been updated to match Linux 5.4.62
Then graphics/drm-current-kmod have been updated to follow this LTS release of Linux.

For now graphics/drm-devel-kmod is also tracking this release but will be updated
to a later revision of Linux drm drivers in the near future.

A lot of linuxkpi code was removed from the ports or replaced with a BSD
licenced implementation.

Sponsor: The FreeBSD Foundation
