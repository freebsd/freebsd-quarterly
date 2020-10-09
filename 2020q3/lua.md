## Lua usage in FreeBSD ##

Contact: Ed Maste <emaste@FreeBSD.org>  
Contact: Kyle Evans <kevans@FreeBSD.org>  
Contact: Ryan Moeller <freqlabs@FreeBSD.org>

During this quarter, flua (FreeBSD Lua) [was taught](https://svnweb.freebsd.org/base/?view=revision&revision=r364182)
where to find base .lua modules in order to support `require` of .lua modules
to be provided by the base system.  flua also [gained support](https://svnweb.freebsd.org/base/?view=revision&revision=r364222)
for `require` of binary modules.

A review for [libjail bindings](https://reviews.freebsd.org/D26080) has also
been submitted, pending review.  libjail is an essential component if one wants
to be able to write jail management utilities in flua.

People interested in working with Lua in FreeBSD are welcome to get in
contact to discuss other project ideas.  To name a couple of potential
projects, some interesting modules that have not been started but could
prove useful (listed in no particular order):

  * libcrypt
  * libexpat
  * libnv
  * libxo

There is also a small list of scripts that would do well with a port to flua:

  * certctl(8)
