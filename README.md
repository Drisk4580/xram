# xram
xram is a OS/Kernel for the x86_64 architecture. It is not a unix-like and 
doesn't aim to be.

xram also plans to "fake" POSIX compliance.

## building
You'll require a GNU or LLVM toolchain that compiles to x86_64-elf. Standart 
toolchains on Linux, Free- and OpenBSD work; The kernel is mainly developed on 
OpenBSD. 


To build the kernel, you'll need to first download limine, which you can obtain 
by running `deps.sh`
. Now run `gmake` to build the kernel.


There is also `build-iso.sh` which creates an image for testing in qemu.
