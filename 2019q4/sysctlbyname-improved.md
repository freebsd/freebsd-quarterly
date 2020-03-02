## sysctlbyname-improved ##

Link:	 [gitlab.com/alfix/sysctlbyname-improved](https://gitlab.com/alfix/sysctlbyname-improved)  

Contact: Alfonso Sabato Siciliano <alfonso.siciliano@email.com>  

The FreeBSD kernel maintains a Management Information Base (MIB) where a 
component (object) represents a parameter of the system. The sysctl() system 
call explores the MIB to find an object by its Object Identifier (OID) and 
calls its handler to get or set the value of the parameter.

The sysctlbyname() syscall (or the old function) accepts the name of the object 
(instead of its OID) to identify it. The purpose of this project is to allow 
sysctlbyname() to handle:

 - a CTLTYPE_NODE with a no-NULL handler, example "kern.proc.pid.\<pid\>";
 - an object with some level-name equals to the '\0' character, example
   "security.jail.param.allow.mount.";

A sysctlbyname() clone is provided: sysctlbyname\_improved(), the 
implementation core is a new sysctl internal node to get the OID of a node 
by its name eventually expanded with an input for its handler; both, can be 
installed via _sysutils/sysctlbyname-improved-kmod_.  
The internal node is also used by the sysctlmif\_oidinputbyname() function of 
the _devel/libsysctlmibinfo2_ userland library and can be handled by the 
SYSCTLINFO\_BYNAME macro of the sysctlinfo interface (described in the previous 
quarterly status report). 
