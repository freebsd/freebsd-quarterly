## sysctlmibinfo2 API ##

Link:	 [sysctlmibinfo2](https://gitlab.com/alfix/sysctlmibinfo2)  

Contact: Alfonso Sabato Siciliano <alfonso.siciliano@email.com>  

In the previous third and fouth quarterly status reports 2019, the sysctlinfo
interface and an extension to improve the sysctlbyname() syscall were described,
they can access to the sysctl MIB and pass the properties of an object to the
userland, but both are quite low level and kernel related.

The sysctlmibinfo2 library provides an API to explore the sysctl MIB, to convert
an object name in its corresponding Object Identifier and to find an object to
get its properties, therefore it is useful to handle an object correctly and to
build a sysctl-like utility.

Primarily sysctlmibinfo2 wraps the low level interface to provide an easy API,
some example: sysctlmif\_desc() retrieves the description of an object,
sysctlmif\_kind() gets the type (string, integer, etc) and sysctlmif\_fmt()
specifies the format (an integer could represent a deciKelvin, milliKelvin,
etc), then it is possible to print properly an object value.

Moreover sysctlmibinfo2 provides a high level API: a struct sysctlmif\_object
definition and functions to build data structures of objects.
Example, let's say we want to manage the sound system,
sysctlmif\_grouplistbyname("hw.snd") returns the list of the Sound Driver
objects and sysctlmif\_treebyname("dev.pcm") returns a tree where "dev.pcm" is
the root node and each subtree represents an audio device.

Obviously sysctlmibinfo2 benefits of the features of sysctlinfo: handles OIDs
up to CTL\_MAXNAME levels, supports capability mode, can seek an object by its
name (avoiding to explore the MIB just to find the corresponding OID), gets all
info about an object in a time, manages a name with a NULL level or expanded
with an input for the sysctl handler.

The library can be installed via the devel/libsysctlmibinfo2 port, a manual page
and examples in the Public Domain are available for getting started your
projects.
