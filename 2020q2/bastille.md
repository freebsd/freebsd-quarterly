## Bastille ##

Link:	 [Bastille GitHub](https://github.com/bastillebsd/bastille)  
Link:	 [Bastille Templates](https://gitlab.com/bastillebsd-templates)  
Link:	 [Bastille Website](https://bastillebsd.org)  

Contact: Christer Edwards <christer.edwards@gmail.com>

### What is Bastille? ###

Bastille is an open-source system for automating deployment and management of
containerized applications on FreeBSD.

Bastille Templates automate container setup allowing you to easily reproduce
containers as needed.

Bastille is available in ports at `sysutils/bastille`.

### Q2 2020 Status ###

In Q2 2020 Bastille merged some exciting new features into GitHub. Changes include:

  * experimental support for new `Bastillefile` template syntax
  * added `mount` and `umount` sub-commands
  * added a default `Vagrantfile` for simple testing
  * experimental support for empty containers
  * improvements to VNET DHCP support
  * cosmetic bugfixes in error output
  * extended config file documentation
  * updated `bastille help` output
  * option to `(-f)` force destroy container

`sysutils/bastille` was updated to `0.6.20200414` (latest).

New Bastille templates added this quarter include:

  * Percona database server
  * Asterisk SIP server
  * dnsmasq DNS/DHCP server (VNET required)
  * nginx pkg server for poudriere

Everything mentioned here was done under covid-19 quarantine. Special thanks to
everyone that contributed during this time.
