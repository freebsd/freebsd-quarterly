## pot and the nomad pot driver ##

Link:	 [Nomad pot driver](https://github.com/trivago/nomad-pot-driver)  
Link:	 [Pot project](https://github.com/pizzamig/pot)  
Link:    [minipot](https://github.com/pizzamig/minipot)

Contact: Luca Pizzamiglio <pizzamig@FreeBSD.org>  
Contact: Esteban Barrios <esteban.barrios@trivago.com>  

pot added support to private bridges: a group of jail can now use a dedicated bridge, instead of the public one, improving isolation.
Morever, several small bugs have been found and fixed, and support to pre/post start/stop hook script has been added.

the nomad pot driver received support for nomad restart without drain and improved configuration stability.

A new port called minipot has been added: this port will install configuration files and dependencies, converting a FreeBSD machine in a single node cluster. It will install nomad, consul, pot, the nomad pot driver and traefik, already configured and ready to use.

Experimental work has been done on a tool that allows to create and run pot images (FreeBSD jails) on other operating systems (Linux and Mac), adopting an approach similar to docker machine.
We hope to make this tool available soon.

Next steps:
* add dual IP stack support to pot
* add private bridge support to the nomad pot driver
* improve usability to create images

Sponsor: trivago N.V.
