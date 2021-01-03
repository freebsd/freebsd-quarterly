## Bastille ##

Link:	 [Bastille GitHub](https://github.com/bastillebsd/bastille)  
Link:	 [Bastille Templates](https://gitlab.com/bastillebsd-templates)  
Link:	 [Bastille Website](https://bastillebsd.org)  

Contact: Christer Edwards <christer.edwards@gmail.com>

### What is Bastille? ###

Bastille is an open-source system for automating deployment and management of
containerised applications on FreeBSD.

Bastille Templates automate container setup allowing you to easily reproduce
containers as needed.

Bastille is available in ports as `sysutils/bastille`.

### Q4 2020 Status ###

In Q4 2020 Bastille merged some exciting new features. Changes include:

  * full adoption of the previously experimental Bastillefile format
  * new `config` sub-command
  * default templates included and applied by default
  * support for -CURRENT jails on -CURRENT hosts
  * support for 32bit containers on 64bit hosts
  * support in templates for dynamic arguments & defining variables
  * over two dozen bug fixes and general improvements

More details about [Bastille Releases](https://github.com/BastilleBSD/bastille/releases).

upstream was updated to `0.8.202010101` (latest).
ports (`sysutils/bastille`) was updated to `0.7.20200414`.
