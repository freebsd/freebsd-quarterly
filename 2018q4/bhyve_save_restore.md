## bhyve - Save/Restore ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>

Contact: Darius Mihai, <dariusmihaim@gmail.com>

Contact: Sergiu Weisz, <sergiu121@gmail.com>

Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github repository for the save/restore and migration features](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration)

Link:	[Github wiki - How to Save and Restore a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Save-and-Restore-a-virtual-machine-using-bhyve)

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

New features added:

   * Improve timers' save and restore state feature;
   * Fix syncronization issues related to the ahci device save and restore state feature;
   * Add suspend/resume support for Windows guests;
   * Refactor save and restore code - save component's state field by field

Future tasks:

   * Open ticket on Phabricator;
   * Add suspend/resume support for nvme;
   * Add suspend/resume support for virtio-console;
   * Add suspend/resume support for virtio-scsi;
   * Add TSC offseting for restore for AMD CPUs;

Sponsor: Matthew Grooms; iXsystems;
