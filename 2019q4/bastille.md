## Bastille ##

Link:	 [Bastille GitHub](https://github.com/BastilleBSD/bastille)  
Link:	 [Bastille Templates](https://gitlab.com/bastillebsd-templates)  
Link:    [Bastille Website](https://bastillebsd.org)

Contact: Christer Edwards <christer.edwards@gmail.com>  

### What is Bastille? ###

Bastille is an open-source system for automating deployment and management of
containerized applications on FreeBSD.  

Bastille uses FreeBSD jails as a container platform and adds template
automation to create a Docker-like collection of containerized software. The
template collection currently validates 30-40 applications from the ports tree,
and growing!  

Templates take care of installing, configuring, enabling and starting the
software providing an automated way of building containerized stacks.

Bastille is available in ports at `sysutils/bastille`.

### Q4 2019 Status ###

In Q4 2019 Bastille published three releases (for a total of ten releases in
2019). Highlights from these updates include:

  * support for "thin" (shared base) and "thick" (unique base) jails
  * support for INCLUDE and FSTAB in template system
  * upgrade support for shared and unique base jails
  * GitLab CI/CD testing for all official templates
  * automatic template validation and CVE scan
  * dedicated pf table for private IP jails

Bastille saw an increase in community contributions with six new GitHub
contributors. These people generously improved error checking, release
validation (sha256), firewall improvements, flexible networking and
initial support for resource limits!

We want to thank everyone that contributed to Bastille in 2019. Your support
has been amazing!
