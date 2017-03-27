# find max number
# bartlett page 31
# page 46, ending address rather than the number to stop

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
    #movl $0, %edi                       # move 0 onto index register
    movl $data_items, %edx              # move address of first data to %edx
    movl %edx, %ecx                     # copy the address to %ecx
    addl $48, %ecx                      # add 4*12 to the last address at %ecx
    movl (%edx), %eax                   # indirect addressing, load the first word of data from the address at %edx
    movl %eax, %ebx                     # move the first item as current max

start_loop:
    cmpl %ecx, %edx                     # compare the addresses of the current (%edx) and last items (%ecx)
    je loop_exit                        # if the adresses are equal, exit
    addl $4, %edx                       # increment %edx, current address by 4
    movl (%edx), %eax                   # indirect addressing, load the next word of data from the address at %edx
    cmpl %ebx, %eax                     # compare current and max values
    jle start_loop                      # if %eax is less than or equal to %ebx, nothing to do, jump to start_loop
    movl %eax, %ebx                     # if not, move the current value at %eax to %ebx as new max value
    jmp start_loop                      # unconditional jump to start_loop

loop_exit:
    movl $1, %eax                       # load exit system call (1) to %eax
    int $0x80                           # exit and return status code with echo $? from %ebx as max value
    
