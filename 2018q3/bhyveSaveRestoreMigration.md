## bhyve - Save/Restore/Migration ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>

Contact: Darius Mihai, <dariusmihaim@gmail.com>

Contact: Sergiu Weisz, <sergiu121@gmail.com>

Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github repository for the save/restore and migration features](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration)

Link:	[Github wiki - How to Save and Restore a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Save-and-Restore-a-virtual-machine-using-bhyve)

Link:	[Github wiki - How to Migrate a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Virtual-Machine-Migration-using-bhyve)

Link:	[Github wiki - Suspend/resume test matrix](https://github.com/FreeBSD-UPB/freebsd/wiki/Suspend-Resume-test-matrix)


The Save/Restore for bhyve feature is a suspend and resume facility added to the
FreeBSD/amd64's hypervisor, bhyve. The bhyvectl tool is used to save the guest
state in three files (a file for the guest memory, a file for devices' and CPU's
state and another one for some metadata that are used in the restore process).
To suspend a bhyve guest, the bhyvectl tool must be run with the ```--suspend <state_file_name>```
option followed by the guest name.

To restore a bhyve guest from a checkpoint, one simply has to add the ```-r``` option
followed by the main state file (the same file that was given to the ```--suspend```
option for bhyvectl) when starting the VM.

The Migration feature uses the Save/Restore feature to migrate a bhyve guest
from a FreeBSD host to another FreeBSD host. To migrate a bhyve guest,
one needs to start an empty guest on the destination host from a shared guest
image using the bhyve tool with the ```-R``` option followed by the source host
IP and the port to listen to migration request. On the source host, the
migration is started by executing the bhyvectl command with the ```--migrate```
option, followed by the destination host IP and the port to send to the messages.

__New features added__:

  * Create the socket connection between source and destination hosts;
  * Migrate the guest state via sockets;
  * Separate the suspend/resume/migration code from the bhyverun.c and bhyvectl.c and added two new files for them: migration.c and migration.h;
  * Added save/restore state for xhci;
  * Added save/restore state for fbuf;
  * Fix vhpet restore state issues (timers related);
  * Add partially support for suspending and resuming a Linux guest;


Sponsors: Matthew Grooms; iXsystems;

__Future tasks__:

   * Check if live migration can be implemented using the FreeBSD's Copy-on-Write mechanism;
   * Add live migration support by using EPT (Intel);
   * Add live migration support by using NPT (AMD);
   * Add suspend/resume support for nvme;
   * Add suspend/resume support for virtio-console;
   * Add suspend/resume support for virtio-scsi;
   * Fix restore timers issues;
   * Fix suspending bhyve - threads issues;
   * Fix suspending bhyve - mutexes issues;
   * Add suspend/resume support for Windows guests.


