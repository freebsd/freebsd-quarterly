## Potluck - Flavour & Image Repository for pot ##

Link:	 [Potluck Repository & Project](https://potluck.honeyguide.net/)  
Link:	 [Potluck on github](https://github.com/hny-gd/potluck)  
Link:  [pot project](https://pot.pizzamig.dev)

Contact: Stephan Lichtenauer <sl@honeyguide.eu>  

pot is a jail management tool that [also supports orchestration through nomad](https://www.freebsd.org/news/status/report-2020-01-2020-03.html#pot-and-the-nomad-pot-driver).

Potluck aims to be to FreeBSD and pot what Dockerhub is to Linux and Docker: A repository of pot flavours and complete images for usage with pot. 

In the last quarter, an initial set of Nomad, Consul and Traefik images has been created that are sufficient to run a simple virtual datacenter out of the box.    
[A three-part article series explaining how to set this up](https://honeyguide.eu/posts/virtual-dc1/) is also available now.

Furthermore, ready-made images suitable for scheduling via Nomad and Consul in such an environment have been created, e.g. a BackupPC or a Postfix Backup MX service.

Future plans include additional images and exposing more configuration options in the existing images to allow a more flexible usage.

Beside general feedback and tests, additional flavours and patches are very welcome!

Sponsors: Honeyguide GmbH & Honeyguide Group (Pty) Ltd
