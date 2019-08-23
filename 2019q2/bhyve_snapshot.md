## bhyve - Save/Restore ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>
Contact: Darius Mihai, <dariusmihaim@gmail.com>
Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github repository for the snapshot feature for bhyve](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_snapshot)
Link:	[Github wiki - How to Save and Restore a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Save-and-Restore-a-virtual-machine-using-bhyve)
Link:	[Github wiki - Suspend/resume test matrix](https://github.com/FreeBSD-UPB/freebsd/wiki/Suspend-Resume-test-matrix)
Link:	[Phabricator review - bhyve Snapshot Save and Restore](https://reviews.freebsd.org/D19495)

The Save/Restore for bhyve feature is a suspend and resume facility added to the
FreeBSD/amd64's hypervisor, bhyve. The bhyvectl tool is used to save the guest
state in three files (a file for the guest memory, a file for the states of
various devices and the state of the CPU, and another one for some metadata that
is used in the restore process).
To suspend a bhyve guest, the bhyvectl tool must be run with the `--suspend <state_file_name>`
option followed by the guest name.

To restore a bhyve guest from a checkpoint, one simply has to add the `-r` option
followed by the main state file (the same file that was given to the `--suspend`
option for bhyvectl) when starting the VM.

New features added:

   * Open ticket on Phabricator;
   * Apply feedback received from community

Future tasks:

   * Add suspend/resume support for nvme;
   * Add suspend/resume support for virtio-console;
   * Add suspend/resume support for virtio-scsi;
   * Add TSC offsetting for restore for AMD CPUs;

Sponsor: Matthew Grooms;
