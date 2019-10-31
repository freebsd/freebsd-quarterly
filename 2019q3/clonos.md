## ClonOS: virtualization platform on top of FreeBSD Operating System ##

Contact: Oleg Ginzburg <olevole@olevole.ru>

Link:	[ClonOS 19.09](https://clonos.tekroutine.com/download.html)
Link:	[CBSD](https://www.bsdstore.ru/)

### What is ClonOS? ###

ClonOS is a turnkey open-source platform based on FreeBSD and the CBSD
framework. ClonOS offers a complete web UI for an easy control, deployment
and management of FreeBSD jails containers and bhyve/Xen hypervisor virtual
environments.

ClonOS is currently the only available platforms which allow both Xen and bhyve
hypervisors to coexist on the same host. Since ClonOS is a FreeBSD-based
platform, it has the ability to create and manage jails natively, allowing
you to run FreeBSD applications without losing performance.

### ClonOS/CBSD 2019Q3 Status Report ###

- Added support for cloud-init (Linux/BSD VMs) and cloudbase-init
(Windows VMs). It gives the ability to use FreeBSD as IaaS platform
for instant deployment and usage of virtual machines based on bhyve
hypervisor.

- Project started to use own cloud images for better stability and
resiliency.

- New mirrors in France, US and Canada were added for
distributing ISO/cloud-init images in addition to Russia, Latvia and
Ukraine.

- Now we're using Jenkins CI for testing regular ClonOS builds:
  [Update clonos packages](https://jenkins.ircdriven.net/job/Update%20clonos%20packages./) (Thanks to Daniel Shafer)

- New pkg repository was deployed to support ClonOS installation
  from packages (at this moment only FreeBSD-12 packages are available)
  [ClonOS package repo](https://pkg.ircdriven.net/packages/12amd64-clonos/)  (Thanks to Daniel Shafer)

Open issues and tasks:

- Volunteers, contributors and testers are urgently needed to
distribute ClonOS on FreeBSD environments.

-  We'd like to expand our mirrors number geographically, your help
and contribution will be much appriciated.

- We're urgently looking for hosting sponsorship for various
developing and testing activities.
