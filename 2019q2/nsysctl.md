## nsysctl 1.0 ##

Contact: Alfonso Sabato Siciliano, <alfonso.siciliano@email.com>  

Link:	 [gitlab.com/alfix/nsysctl](https://gitlab.com/alfix/nsysctl)  
Link:	 [sysutils/nsysctl port](https://www.freshports.org/sysutils/nsysctl/)  
Link:	 [Tutorial](https://alfix.gitlab.io/bsd/2019/02/19/nsysctl-tutorial.html)  

The `nsysctl` utility is a `/sbin/sysctl` clone, to get or set the kernel 
state, supporting `libxo` and extra options.

```
 nsysctl [--libxo=opts [-r tagname]] [-DdFGgIilmNpqTt[V|v[h[b|o|x]]]Wy]
         [-e sep] [-B <bufsize>] [-f filename] name[=value[,value]] ...
 nsysctl [--libxo=opts [-r tagname]] [-DdFGgIlmNpqTt[V|v[h[b|o|x]]]Wy]
         [-e sep] [-B <bufsize>] -A|a|X
```

You could use `nsysctl` to explore the sysctl MIB showing the value and the 
info of an object. The output is explicitly indicated by the options and is 
printed via `libxo` in human and machine readable formats, moreover some value 
is parsed to display it in a structured mode (e.g., `vm.phys_free`). 
The support for `efi_map_header` was added but it is untested, someone could 
help by trying it via `machdep.efi_map`.

Please refer to the tutorial for a more thorough description.
