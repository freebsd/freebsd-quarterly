## bhyve - Live Migration ##

Contact: Elena Mihailescu, <elenamihailescu22@gmail.com>

Contact: Darius Mihai, <dariusmihaim@gmail.com>

Contact: Sergiu Weisz, <sergiu121@gmail.com>

Contact: Mihai Carabas, <mihai@freebsd.org>

Link:	[Github wiki - How to Warm Migrate a bhyve guest](https://github.com/FreeBSD-UPB/freebsd/wiki/Virtual-Machine-Migration-using-bhyve)

Link:	[Github - Warm Migration branch](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration)

Link:	[Github - Live Migration branch](https://github.com/FreeBSD-UPB/freebsd/tree/projects/bhyve_migration_dev)

The Migration feature uses the Save/Restore feature to migrate a bhyve guest
from a FreeBSD host to another FreeBSD host. To migrate a bhyve guest,
one needs to start an empty guest on the destination host from a shared guest
image using the bhyve tool with the ```-R``` option followed by the source host
IP and the port to listen to migration request. On the source host, the
migration is started by executing the bhyvectl command with the ```--migrate```
or ```--migrate-live``` option, followed by the destination host IP and the
port to send to the messages.

__New features added__:

   * Prove that live migration cannot be implemented using the FreeBSD's Copy-on-Write mechanism;
   * Add ```--migrate-live``` option to bhyvectl;
   * Add additional message exchange between source and destination host to establish the migration type and the number of rounds;
   * Implement a dirty-bit approach for live migrating the guest's wired memory;

Sponsors: Matthew Grooms;

__Future tasks__:

   * Clear the dirty bit after each migration round;
   * Extend live migration to highmem segment;
   * Extend live migration to unwired memory;
