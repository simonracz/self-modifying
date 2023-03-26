# Code for the Self-Modifying Code video
Code created during recording the [Self-Modifying Code in Assembly](https://youtu.be/PhMZYrzJBC8) video.

# Build
```
nasm -f elf64 -o hello.o hello.asm
ld -o hello hello.o
nasm -f elf64 -o mod.o mod.asm
ld -o mod mod.o
# The W bit must be turned on in the mod binary for the text segment.
# I have no bash command for that.
# Check the video.
```
