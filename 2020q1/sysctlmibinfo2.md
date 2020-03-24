## sysctlmibinfo2 API ##

Link:	 [gitlab.com/alfix/sysctlmibinfo2](https://gitlab.com/alfix/sysctlmibinfo2)  

Contact: Alfonso Sabato Siciliano <alfonso.siciliano@email.com>  

In the previous third and fouth quarterly status reports 2019, the sysctlinfo
interface and an extension to improve the sysctlbyname() syscall were described.
They can access to the sysctl MIB and get the properties of an object, but both
are quite low level and kernel related.

The sysctlmibinfo2 library provides an API to explore the sysctl MIB, to convert
an object name in its corresponding Object Identifier and to find an object to
get its properties; therefore it is useful to handle an object correctly and to
build a sysctl-like utility.

Primarily sysctlmibinfo2 wraps the low level interface to provide an easy API,
example: sysctlmif\_desc() retrieves the description on an object,
sysctlmif\_type() gets its type (like string or integer), sysctlmif\_fmt()
specifies the format (an integer could represent a deciKelvin or milliKelvin) so
it is possible to print properly a value.

Moreover sysctlmibinfo2 provides a high level API: a struct sysctlmif\_object
definition and functions to build data structures of objects.
Example, let say, you would need to manage the sound system,
sysctlmif\_grouplistbyname("hw.snd") returns the list of the Sound Driver
objects and sysctlmif\_treebyname("dev.pcm") returns a tree where _dev.pcm_ is
the root node and each subtree represents an audio device.

Obviously sysctlmibinfo2 benefits of the features of sysctlinfo: handles nodes
up to CTL\_MAXNAME levels, supports _capability mode_, seeking a node by its name
(avoiding to explore the MIB just to find the corresponding OID), gets all info
about a node in a time, manages a name with a NULL level or expanded with an
input for the sysctl handler.

The library can be installed via the devel/sysctlmibinfo2 port, a manual page
and examples in the Public Domain for getting started your projects are available.
