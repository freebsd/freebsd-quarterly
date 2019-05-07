## sysctlmibinfo API 1.0 ##

Contact: Alfonso Sabato Siciliano, <alfonso.siciliano@email.com>  

Link:	 [gitlab.com/alfix/sysctlmibinfo](https://gitlab.com/alfix/sysctlmibinfo)    
Port:	 [devel/libsysctlmibinfo](https://www.freshports.org/devel/libsysctlmibinfo/)  

The _sysctl()_ system call can get or set the value of a 'property'
of the system. A 'property' has others info (description, type,
label, etc.), they are necessary to build an utility like _/sbin/sysctl_,
example:

```
% sysctl -d kern.ostype
kern.ostype: Operating system type
% sysctl -t kern.ostype
kern.ostype: string
```

Primarily **sysctlmibinfo** wraps the undocumented kernel interface
and provides an easy C API: *sysctlmif\_name()*,
*sysctlmif\_description()*, *sysctlmif_info()*, *sysctlmif\_label()*,
*sysctlmif\_nextnode()* and *sysctlmif\_nextleaf()*, to retrieve
the info of a 'property'.

Moreover **sysctlmibinfo** provides a high level API: defines a
*struct sysctlmif\_object* and has some function:
*sysctlmif\_filterlist()*, *sysctlmif\_grouplist()* and
*sysctlmif\_tree()*,  to build lists and trees of *objects*.

You can use this library to quickly build a custom _sysctl_ utility.
For example, the core of _deskutils/sysctlview_ (a graphical explorer
for the sysctl MIB Tree) is just a call to *sysctlmif\_tree()* and
a visit to the resulting tree to show its *sysctlmif\_object* nodes.

Note, actually a 'property' is an OID of the sysctl MIB, it is
implemented by a *struct sysctl\_oid* defined in *sys/sysctl.h*.
