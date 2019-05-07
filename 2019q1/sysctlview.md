## sysctlview 1.0 ##

Contact: Alfonso Sabato Siciliano, <alfonso.siciliano@email.com>

Link:	 [gitlab.com/alfix/sysctlview](https://www.gitlab.com/alfix/sysctlview)  
Port:	 [deskutils/sysctlview](https://www.freshports.org/deskutils/sysctlview/)

The FreeBSD's kernel maintains a _Management Information Base_ where
the _objects_ are properties to tuning the system using the
_sysctl()_ syscall and the _/sbin/sysctl_ utility. The **sysctlview**
utility is a "graphical sysctl MIB explorer", it depends on *gtkmm*
(to build a GUI) and *sysctlmibinfo* (to retrieve the info from the
kernel).

The version 1.0 provides two "TreeView": 

 - "Main" to show 'name', 'description', 'type', 'format' and 'value'
 - "Flags" to show 'name' and a column for each 'flag' defined in *sys/sysctl.h*

The rows are "clickable" to display others info (e.g., 'label').
Currently _sysctlview_ can show _numeric_ and _string_ values, the
support for some _opaque_ value will be added in the future.
