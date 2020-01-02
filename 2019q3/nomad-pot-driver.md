## Nomad pot driver - Orchestrating jails via nomad ##

Link:	 [Nomad pot driver](https://github.com/trivago/nomad-pot-driver)  
Link:	 [Pot project](https://github.com/pizzamig/pot)  

Contact: Luca Pizzamiglio <pizzamig@FreeBSD.org>  
Contact: Esteban Barrios <esteban.barrios@trivago.com>  

An experimental project has started to provide jail orchestration
based on `nomad` and the jail framework `pot`, similarly to how
orchestration works with docker.

This model allows us to split the jail creation and the jail deployment.
Jail images can be created and exported using the `pot` framework.
The images can be deployed and orchestrated using `nomad`.
A driver has been developed to allow `nomad` to interact with `pot`.

One of the goals of this project is to use non-persistent jails as
containers, allowing us to:
* define containers similar to Docker (but not identical, because
  the underlaying OS is different)
* identify potential missing features in FreeBSD to support
  such a computational model

In the next quarter, we will launch the first service based on this
project.

Next steps are:
* provide more guides and howtos
* improve stability, extending the tests suite
* improving tooling to create/manage images

Sponsor: trivago N.V.
