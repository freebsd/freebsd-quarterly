## Lua Usage in FreeBSD ##

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Kyle Evans <kevans@FreeBSD.org>  
Contact: Ryan Moeller <freqlabs@FreeBSD.org>

Lua is a small, efficient scripting language that FreeBSD imported before
FreeBSD 12.0 for use in the bootloader.  Since then, several projects
outside of the bootloader have gained some amount of traction in Lua usage:

 * /usr/libexec/flua is now installed for internal usage
 * makesyscalls.sh was rewritten in Lua
 * pkg has gained support for lua scripts

FreeBSD Lua ("flua") is a version of the lua interpreter that has several
modules built-in for convenient usage within the base system.  Work has
been done to, for example, add libucl and future libifconfig support to
flua.

People interested in working with Lua in FreeBSD are welcome to get in
contact to discuss other project ideas.  To name a couple of potential
projects, some interesting modules that have not been started but could
prove useful (in no particular order):

- libcrypt
- libexpat
- libjail
- libnv
- libxo
