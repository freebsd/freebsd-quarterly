## ClonOS: virtualization platform on top of FreeBSD Operating System ##

Contact: Oleg Ginzburg, <olevole@olevole.ru>

Link:	 [ClonOS Main Site](https://clonos.tekroutine.com)

### What is ClonOS? ###

ClonOS is a turnkey open-source platform based on FreeBSD and the CBSD
framework. ClonOS offers a complete web UI for an easy control, deployment
and management of FreeBSD jails containers and bhyve/Xen hypervisor virtual
environments.

ClonOS is currently the only available platform which allows both Xen and bhyve
hypervisors to coexist on the same host. Since ClonOS is a FreeBSD-based
platform, it has the ability to create and manage jails natively, allowing
you to run FreeBSD applications without losing performance.

Features:

- easy management via web UI interface
- bhyve management (create, delete VM)
- Xen management (create, delete VM) [coming soon, roadmap]
- connection to the "physical" guest console via VNC from the browser or
  directly
- real time system monitoring
- access to load statistics through SQLite3 and beanstalkd
- support for ZFS features (cloning, snapshots)
- import/export of virtual environments
- public repository with virtual machine templates
- puppet-based helpers for configuring popular services

### ClonOS 2018Q4 Status Report ###

During this period, work was carried out to:

- implement real-time graph for jail/bhyve based on RACCT statistics
- test bhyve live migration, support live migration in CBSD
- prepare ClonOS 19.01-RELEASE

Open task:

- ClonOS roadmap: https://clonos.tekroutine.com/roadmap.html
- FreeNAS/XigmaNAS or any other NAS integration
- I would like to see ClonOS in real-world use. In this regard, I am interested
  in finding more people and companies that use FreeBSD for vm/jail services.
