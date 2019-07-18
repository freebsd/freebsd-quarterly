## nsysctl 1.0 ##

Contact: Alfonso Sabato Siciliano, <alfonso.siciliano@email.com>  

Link:	 [gitlab.com/alfix/nsysctl](https://gitlab.com/alfix/nsysctl)  
Port:	 [sysutils/nsysctl](https://www.freshports.org/sysutils/nsysctl/)  
Documentation:	 [Tutorial](https://alfix.gitlab.io/bsd/2019/02/19/nsysctl-tutorial.html)  

The **nsysctl** utility is a _/sbin/sysctl_ clone, to get or set the kernel 
state, supporting _libxo_ and extra options.

```
 nsysctl [--libxo=opts [-r tagname]] [-DdFGgIilmNpqTt[V|v[h[b|o|x]]]Wy]
         [-e sep] [-B <bufsize>] [-f filename] name[=value[,value]] ...
 nsysctl [--libxo=opts [-r tagname]] [-DdFGgIlmNpqTt[V|v[h[b|o|x]]]Wy]
         [-e sep] [-B <bufsize>] -A|a|X
```

You could use **nsysctl** to explore the sysctl MIB showing the value and the 
info of an object. The output is explicitly indicated by the options and is 
printed via _libxo_ in human and machine readable formats, moreover some value 
is parsed to display it in a structured mode (e.g., _vm.phys\_free_). 
The support for _efi\_map\_header_ was added but it is untested, someone could 
help by trying it via _machdep.efi\_map_.

Please refer to the tutorial for a more thorough description.
