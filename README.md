torconf
=======
If you're on Linux, you may be encountering memory fragmentation bugs in glibc's malloc implementation.
That is, when Tor releases memory back to the system, the pieces of memory are fragmented so they're hard to reuse.
The Tor tarball ships with OpenBSD's malloc implementation, which doesn't have as many fragmentation bugs
(but the tradeoff is higher CPU load). You can tell Tor to use this malloc implementation instead:
./configure --enable-openbsd-malloc
If you're running a fast relay, meaning you have many TLS connections open, you are probably losing a lot of memory to
OpenSSL's internal buffers (38KB+ per socket). We've patched OpenSSL to release unused buffer memory more aggressively.
If you update to OpenSSL 1.0.0 or newer, Tor's build process will automatically recognize and use this feature.
If you're running on Solaris, Tor is probably forking separate processes for each CPUWorker rather than using threads.
Try explicitly configuring Tor with --enable-threads, but be ready for the lockups some people reported back in 2005.
Also consider running your relay on an operating system where Tor works better.
If you still can't handle the memory load, consider reducing the amount of bandwidth your relay advertises.
Advertising less bandwidth means you will attract fewer users, so your relay shouldn't grow as large.
See the MaxAdvertisedBandwidth option in the man page.
