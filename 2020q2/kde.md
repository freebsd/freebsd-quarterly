## KDE on FreeBSD ##

Link:    [KDE FreeBSD](https://freebsd.kde.org/)  
Link:    [KDE Community FreeBSD](https://community.kde.org/FreeBSD)  

Contact: Adriaan de Groot <kde@FreeBSD.org>  

The *KDE on FreeBSD* project packages the software produced by
the KDE Community for FreeBSD. The software includes a
full desktop environment KDE Plasma, IDE [KDevelop](https://www.kdevelop.org/),
a PIM suite [Kontact](https://kontact.kde.org/)
and hundreds of other applications that can be used on
any FreeBSD desktop machine.

This quarter has been an ever-so-peculiar one. While we are used
to working remotely, collaborating over the internet to update the ports
tree, it's *qualitatively* different when
the whole world locks down. Software continues to be released,
so this quarter the kde@ team:

- Restored a patch that closes down a remote TCP held by X11 applications
  that use the ICE library. Thanks to Colin Percival for reporting it.
  It went missing in one of the port updates, but now
  rhe patch has now been upstreamed. PR 229772.
- Chased KDE-adjacent software like CMake, Cutelyst, Latte-dock and Nheko
  through new releases. In particular CMake takes a lot of effort every
  time because it is a build-time dependency of over 2000 ports.
- graphics/poppler was updated to the latest upstream release. This
  is a low-level dependency for many document-viewing applications,
  and like CMake requires chasing a lot of other software.
- KDE Frameworks release like clockwork, reaching KDE Frameworks 5.70 mid-may.
- KDE Applications -- the KDE release service, really, which delivers
  libraries, applications, and add-ons -- had one large release,
  with [20.04.1](https://kde.org/announcements/changelog-releases.php?version=20.04.1)
  landing in the ports tree also mid-may.
- Some new Wayland support for KDE Plasma -- we have not tested this on FreeBSD --
  has appeared and has been duly packaged.
- A great deal of preparation has gone into Qt 5.15. Many ports have been
  pre-emptively patched for this new -- and last -- LTS release of Qt 5.
  The update itself has not yet landed, pending a few last bits of fallout.
  
kde@ would like to thank Antoine for many exp-runs, Mikael for useful tips,
Swills for patience and Kai for dealing with WebEngine.
