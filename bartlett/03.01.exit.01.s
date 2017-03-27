# bartlett page 19

.section .data

.section .text
.globl _start

_start:
movl $1, %eax # exit system call number
movl $2, %ebx # status number to be returned after exit
int $0x80 # send the system call number at %eax to the kernel
