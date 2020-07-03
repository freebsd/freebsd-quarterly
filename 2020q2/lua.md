## Lua Usage in FreeBSD ##

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Kyle Evans <kevans@FreeBSD.org>  
Contact: Ryan Moeller <freqlabs@FreeBSD.org>

Lua is a small, efficient scripting language that FreeBSD imported before
FreeBSD 12.0 for use in the bootloader.  Since then, several projects
outside of the bootloader have gained some amount of traction with Lua usage:

 * /usr/libexec/flua is now installed for internal usage
 * makesyscalls.sh was rewritten in Lua
 * pkg has gained support for lua scripts
 * lldb in the base system now supports lua scripting

FreeBSD Lua ("flua") is a version of the lua interpreter that has several
modules built-in for convenient usage within the base system.  flua is
installed with a non-standard name and in a location not included in $PATH
so that it is not accidentally found by third-party software or configure
scripts.  The FreeBSD project makes no guarantees about upgrade cadence or
module stability.  That said, it is available for use by downstream projects
and FreeBSD users aware of those limitations.

Previous work with flua includes, for example, adding libucl support and
future work includes libifconfig support for scripting usage.

People interested in working with Lua in FreeBSD are welcome to get in
contact to discuss other project ideas.  To name a couple of potential
projects, some interesting modules that have not been started but could
prove useful (listed in no particular order):

- libcrypt
- libexpat
- libjail
- libnv
- libxo
