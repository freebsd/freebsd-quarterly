FreeBSD 12 saw the introduction of a number of performance improvements:
   - the introduction of the new synchronization primitive epoch to replace the
     use of reader locks for providing existence guarantees for data structures
   - epoch was used to provide an 85+% reduction in the overhead of pcb lookup
     in high core count systems
   - It was used to provide an 85+% reduction in UDP send overhead on high core
     count systems see the link for a bit more detail: 
       http://scalebsd.org/blog/2018/06/16/UDP-and-epoch-for-liveness-guarantees

   - System call overhead is now half that of 11
   - UNIX sockets now scale near linearly (previously maxed out at 3-4 threads)
   - The NUMA work has lead to a 20x-80x improvement in the scalability of page
     fault handling
