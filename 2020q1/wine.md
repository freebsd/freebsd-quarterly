## Wine on FreeBSD ##

Link:	 [Wine homepage](https://www.winehq.org)  

Contact: Gerald Pfeifer <gerald@FreeBSD.org>  
Contact: Lorenzo Salvadore <salvadore@FreeBSD.org>  

The standard Wine port has moved from Wine 4.0.3 to Wine 5.0 which
represents over 7,400 individual changes including built-in modules in
PE format, multi-monitor support, Vulkan 1.1 support, and an XAudio2
re-implementation.
  
After our request for help in the last quarterly report the i386 wine
ports have been adopted by salvadore who immediately started resolving
existing bugs and improving the ports. Most of this work is ready and we
began committing first pieces in March. Since it takes more time than
initially expected, we will also update the i386-wine-devel port during
this process so that users needing a more recent version can easily get it
from the ports tree (or binary packages). On the other hand, we plan on
backporting  these improvements to i386-wine after i386-wine-devel is done
and only then update that port, so that we always guarantee a stable
version of i386-wine.
