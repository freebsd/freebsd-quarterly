## Bluetooth Support ##

Contact: Marc Veldman <marc@bumblingdork.com>

Bluetooth is a wireless technology for creating personal networks, 
connecting peripherals like keyboards and mice but also speakers and
heart rate monitors.

FreeBSD has limited Bluetooth Basic Rate (BR) support and no functional 
Bluetooth Low Energy (LE) support.

During this quarter many small improvements have been made to help the 
development of Bluetooth LE support. A number of commands have been added to 
hccontrol(8), mainly to do LE functions. It is now possible to scan for LE
devices within range using hccontrol.
A panic that occurred when enabling LE support has also been fixed.

Work is still needed to add Attribute Protocol (ATT) and Generic Attribute
Profile (GATT) support. 