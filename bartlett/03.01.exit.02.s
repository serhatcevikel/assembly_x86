# bartlett page 19
# page 46, remove int instruction
# the program counter tries to find the next instruction but it does not exist
# so it gives segmentation fault (core dump) error

.section .data

.section .text
.globl _start

_start:
movl $1, %eax # exit system call number
movl $2, %ebx # status number to be returned after exit
#int $0x80 # send the system call number at %eax to the kernel
