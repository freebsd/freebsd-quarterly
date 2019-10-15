## Nomad pot driver - Orchestrating jails via nomad ##

Contact: Luca Pizzamiglio, <pizzamig@FreeBSD.org>  
Contact: Esteban Barrios, <esteban.barrios@trivago.com>  

Link:	 [Nomad pot driver](https://github.com/trivago/nomad-pot-driver)  
Link:	 [Pot project](https://github.com/pizzamig/pot)  

An experimental project has started to provide jail orchestration
based on `nomad` and the jail framework `pot`, similarly on how
orchestration works with docker.

This model allows to split the jail creation and the jail deployment.
Jail images can be created and exported using the `pot` framework.
The images can be deployed and orchestrated using `nomad`.
A driver has been developed to allow `nomad` to interact with `pot`.

One of the goal of this project is to use not persistent jails as
containers, allowing to:
* define containers similar to Docker, but still different, because
  the underlaying OS is different
* identify potential missing features in FreeBSD to support
  such computational model

In the next quarter, we would launch the first service based on this
project.

Next steps are:
* provide more guides and howtos
* improve stability, extending the tests suite
* improving tooling to create/manage images

Sponsor: trivago N.V.
