## Vectored AIO ##

Contact: Alan Somers <asomers@FreeBSD.org>

POSIX AIO is a facility for asynchronous I/O to files and devices.  FreeBSD's
implementation is efficient, especially when writing to disk files.  But a
long-standing defect in the standard API is a lack of vectored functions.  That
is, there is no asynchronous equivalent of `pwritev(2)` and `preadv(2)`.  A
common workaround is to use `lio_listio(2)` instead.  However, that has several
drawbacks.  It's more effort for the programmer, it might return early with
only a subset of the operations completed, it requires more total syscalls, and
there is no guarantee that the operations will complete in-order.

This quarter I added two new syscalls: `aio_writev(2)` and `aio_readv(2)`.
They work just like their non-vectored counterparts, but they take an array of
`iovec` elements, just like `pwritev` and `preadv`.  You can't use them in
combination with `lio_listio`, but that could be added in the future.
