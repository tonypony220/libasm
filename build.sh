# -f elf64 option selects a 64 bit output format which is compatible with Linux and gee
# option selects the dwarf2 debugging format, which is essential for use with a debugger
## yasm -f x86 -g dwarf2 -l pr.lst pr.asm

# In the case of an assembly program with the _start function the linking needs to be done with ld:
## ld -o pr pr.o
#  

nasm -fmacho64 hello.o

ld -macosx_version_min 10.7.0 -lSystem hello.o
