# find max number
# bartlett page 31
# pg 46, find minimum instead

# %edi holds data index
# %ebx holds largest data found
# %eax current data item
# in data_items 0 terminates

.section .data
data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:
    movl $0, %edi                       # move 0 onto index register
    movl data_items(,%edi,4), %eax      # load the first byte of data
    movl %eax, %ebx                     # move the first item as current max

start_loop:
    cmpl $0, %eax                       # compare current data with 0
    je loop_exit                        # if %eax is equal to 0, exit
    incl %edi                           # increment %edi
    movl data_items(,%edi,4),%eax       # load next data item
    cmpl %ebx, %eax                     # compare current and max values
    jge start_loop                      # if %eax is greater than or equal to %ebx, nothing to do, jump to start_loop
    movl %eax, %ebx                     # if not, move the current value at %eax to %ebx as new max value
    jmp start_loop                      # unconditional jump to start_loop

loop_exit:
    movl $1, %eax                       # load exit system call (1) to %eax
    int $0x80                           # exit and return status code with echo $? from %ebx as max value
    
