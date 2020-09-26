## Update to grub-bhyve ##

Link:	 [grub-bhyve Git Repository](https://gitlab.com/ctuffli/grub)  

Contact: Chuck Tuffli <chuck@freebsd.org>  

bhyve is the hypervisor included in FreeBSD and other operating systems
used to run virtual machines. When not using a boot ROM (i.e. UEFI), the
user must load the guest operating system for bhyve. For non-FreeBSD
guests, the loader is a version of GNU GRUB (a.k.a the GNU GRand Unified
Bootloader) modified to interface with bhyve. This work is an effort to
both update the base GRUB code to the latest version as well as improve
the usability on FreeBSD.

The current [grub-bhyve](https://www.freshports.org/sysutils/grub2-bhyve/)
is based on an older version of GRUB (circa 2015) and thus is missing
more recent additions such as XFS file system and
[syslinux](https://www.syslinux.org/) support. With the update,
installing CentOS, for example, now does not require the extra step of
changing the default file system to something other than XFS.

Internally, the code has been restructured to be its own "platform"
which should make it easier to keep in sync with upstream development.
The major improvement is the ability to automatically find and load the
GRUB configuration file from the guest disk image. With this change, it
is not necessary to create a device map file or specify which Linux
kernel or initrd image to use. More importantly, if the guest image
updates its GRUB configuration, for example after updating the kernel,
no changes are needed when invoking grub-bhyve. Note, this feature
requires a new "disk" option:

    # grub-bhyve --disk=/zroot/vms/u18-mini/disk0.img --vm=u18-mini

The automatic configuration file detection works with both GRUB
configuration files (e.g. CentOS, Ubuntu) as well as syslinux
configuration (e.g. Alpine). For the adventurous, there is experimental
support for Fedora's BootLoaderSpec (a.k.a. `blscfg`) on the blscfg
branch of this Git repository.

The code has been tested on a few Linux variants, but it would benefit
from wider testing (and bug reports!). The new version does not have a
Port but is easily built on FreeBSD. After cloning / downloading the
source, run:

    $ PYTHON=python3.7 ./bootstrap
    $ MAKE=gmake ./configure --with-platform=bhyve
    $ gmake

The resulting binary, `grub-bhyve`, will be in the `grub-core/`
directory. If you have success or troubles with it, please let me know.
