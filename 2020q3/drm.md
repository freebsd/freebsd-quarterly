## DRM Drivers Update ##

Link: [drm-kmod](https://github.com/freebsd/drm-kmod/)

Contact: Emmanuel Vadot <manu@FreeBSD.Org>

The drm drivers for FreeBSD 13-CURRENT have been updated to match Linux 5.4.62
THe graphics/drm-current-kmod have been updated to follow this LTS release of Linux.

For now graphics/drm-devel-kmod is also tracking this release but will be updated
to a later revision of Linux drm drivers in the near futur.

A lot of linuxkpi code was removed from the ports and either replaced with a BSD
licenced implementation or simply removed as it was unused.

Sponsor: The FreeBSD Foundation
