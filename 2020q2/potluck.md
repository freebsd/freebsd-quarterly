## Potluck - Flavour & Image Repository for pot ##

Link:	 [Potluck Repository & Project](https://potluck.honeyguide.net/)  
Link:	 [Potluck on github](https://github.com/hny-gd/potluck)  
Link:   [pot project](https://pot.pizzamig.dev)

Contact: Stephan Lichtenauer <sl@honeyguide.eu>  

pot is a jail management tool that [also supports orchestration through nomad](https://www.freebsd.org/news/status/report-2020-01-2020-03.html#pot-and-the-nomad-pot-driver).

Potluck aims to be to FreeBSD and pot what Dockerhub is to Linux and Docker: A repository of pot flavours and complete images for usage with pot. 

This should simplify setting up also complex software with many packages and ports in comparison to manual configuration: Potluck wants to provide the content library for the additional layer of abstraction on top of existing infrastructure like pkg that pot has to offer.

Pot "flavour" files are provided on [Github]((https://github.com/hny-gd/potluck)) and fed into a Jenkins instance. On the [Potluck Repository](https://potluck.honeyguide.net/), for each flavour, detailed descriptions as well as ready-made images to be imported by pot are provided.

The initial project has been set up and beside three simple flavours, [a complete Jitsi Meet instance in a jail](https://potluck.honeyguide.net/blog/jitsi-meet-nomad/) has been created as a Proof of Concept that should allow running a fully-fledged video conference system with just a few easy commands and within a few minutes.

As only the initial versions have been set up and implemented so far, general feedback, tests and also additional, useful flavours are very welcome!