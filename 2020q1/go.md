## Go on freebsd/arm64 ##

Link:	 [Go 1.14 Release Notes ](https://golang.org/doc/go1.14#freebsd)  

Contact: Mikaël Urankar <mikael@FreeBSD.org>  
Contact: Dmitri Goutnik <dmgk@FreeBSD.org>  

Starting from the recently released version 1.14, Go now officially supports
64-bit ARM architecture on FreeBSD 12.0 or later.
This porting effort was initially started by Greg V (aka myfreeweb) and resumed
by Shigeru Yamamoto, Dmitri Goutnik and Mikaël Urankar.
Dmitry has set up a CI builder to catch regression on FreeBSD aarch64 (it's
required by the golang policy for adding a new port to the main Go repository)

Work in progress:
  * a lot of ports use an old version of golang.org/x/sys or golang.org/x/net
  (to name a few) that doesn't contain the FreeBSD aarch64 bits,
  work is being done to fix these ports (details are in the [bug tracker entry](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=242312))
