## FreeBSD Aarch64 under VMWare ESXi-ARM Fling ##

Link:	 [ESXi-ARM Fling](https://flings.vmware.com/esxi-arm-edition)
Link:	 [FreeBSD Under VMWare ESXi-ARM Fling](https://vincerants.com/freebsd-under-vmware-esxi-on-arm-fling/)
Link:	 [FreeBSD on ESXi-ARM Fling: Fixing Virtual Hardware](https://vincerants.com/freebsd-on-esxi-arm-fling-fixing-virtual-hardware/)
Link:	 [open-vm-tools for FreeBSD VMWare ESXi-ARM Fling](https://vincerants.com/open-vm-tools-on-freebsd-under-vmware-esxi-arm-fling/)

Contact:  Vincent Milum Jr <freebsd@darkain.com>

VMWare is a company that produces a commercial hypervisor known
as vSphere ESXi for AMD64 and i386. In early October, they
released a tech demo hypervisor for ARM Aarch64 which runs
on ARM ServerReady hardware as well as single board computers
such as the Raspberry Pi 4b (4GB and 8GB models). This new
hypervisor is known as VMWare ESXi-ARM Fling.

Since the release of ESXi-ARM Fling, work has been done on
both the hypervisor as well as FreeBSD, to make the two more
compatible with one another. Even though the work was
initially done to make these two work better together, the
work overall has been more general purpose for FreeBSD
in support of both bare-metal Aarch64 installations as well
as running FreeBSD under other hypervisors such as QEMU.

An example of others building off of this work is Twitter
user [astr0baby getting FreeBSD working under QEMU on a new
Apple M1 system](https://twitter.com/astr0baby/status/1343354762964717568).

When ESXi-ARM Fling first released, to get FreeBSD to work
under it, the process required taking the Aarch64 premade
VMDK file, uploading it to the hypervisor storage, and then
running a series of CLI commands to convert the disk image
to a supported file format. The initial work done was to
get the FreeBSD Aarch64 ISO bootable and with the required
drivers to complete the install process. With this, users
can do fresh installs of FreeBSD Aarch64 using the same
methods they would use for AMD64 or i386 under ESXi.

The CD-ROM driver's inclusion into FreeBSD 12 barely missed
the cut-off date for 12.2-RELEASE. However, the very first
12.2-STABLE build published for Aarch64 includes the CD-ROM
driver. FreeBSD 13-CURRENT also includes this driver. Due
to this, only 12-STABLE and 13-CURRENT support fresh CD ISO
installations.

The next step was getting the major pieces of virtual
hardware working. This included adding more USB controllers,
the vmxnet virtual network card, and pvscsi para-virtual
SCSI drivers added to Aarch64 GENERIC.

There is a known bug in ESXi-ARM Fling's virtual UEFI that
prevents booting from pvscsi, so for the time being the boot
device must be on a virtual disk attached to the SATA
controller inside the VM.

ESXi-ARM Fling uses a new virtual SVGA device which
currently does not have working drivers on any platform, as
the specifications are not finalized yet. Due to this, only
efi-fb/scfb is available for console and Xorg for the time
being.

The VMCI driver is currently not compiling at all. This
driver has sections of x86 assembly code that will need to be
converted over to ARM. This would be a great area for
anyone to look into that is experienced with converting assembly
language!

At ESXi-ARM Fling launch, there was a hypervisor bug
preventing more than 1 vCPU from working inside FreeBSD.
This has since been fixed, allowing up to 8 vCPUs. Going
beyond this requires a patch to FreeBSD, which was authored
by
[VMWare developer Cypou](https://github.com/freebsd/freebsd-src/compare/master...claplace:user/claplace/gicv3_mbi).


Things that are currently fixed/working:

  * Booting from CD ISO image
  * Virtual USB 2.0 controller
  * Virtual USB 3.1 controller
  * Virtual USB Keyboard
  * Virtual USB Mouse
  * vmxnet3 Virtual Network Card
  * pvscsi Para-Virtual SCSI Storage Controller
  * open-vm-tools Guest Virtual Machine Tools
  * Xorg Enhanced Mouse Driver (untested)
  * Multi-Core CPU (up to 8 vCPUs inside guest)

Things that are still broken:

  * Booting from pvscsi
  * Xorg SVGA Driver
  * vmci Virtual Machine Communication Interface
  * Multi-Core CPU (more than 8 vCPUs)


With all of this done, it has made working on the Aarch64 ports
collection easier by having a high quality virtualization
environment for development and testing. This environment
has already been used to update the ZeroTier port and
Facebook's RocksDB used in the MariaDB port.

FreeBSD now has a Discord chat! Discussion about FreeBSD
on Aarch64 in general takes place in our
[#embedded](https://discord.gg/KHtrpdqE4F) channel. Despite
the name, we discuss all levels of ARM development, from
large servers, to virtualized environments, all the way down
to single board computers.
