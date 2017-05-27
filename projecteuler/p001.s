# projecteuler problem 001


.section .data

.section .text
.globl _start


_start:
    movl $1000, %rcx    # move value to %rdi, last iteration
    movl $1, %rdi       # current iteration
    
    compl %rdi, %rcx    # compare two iteration values
    je loop_exit        # if max value if equal to current, exit
    movl %rdi, %rax     # move current value to %rax for division
    movl $3, %rbx       # move 3 to rbx for division
    div %rbx            # divide %rax to %rbx, put remainder to %rdx, quotient to %rax
    
    
     

