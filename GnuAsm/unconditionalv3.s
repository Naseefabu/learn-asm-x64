.globl _start

# Notes 
# A conditional jump is a variant of the jmp instruction that only jumps based on certain conditions.
# To understand the conditions that are available for a jump instruction, we have to introduce a 
# new special-purpose register, the %eflags register.
# Rather than thinking about %eflags as holding a single value, you usually think about the different bits of %eflags separately. 
# Each bit holds a true/false status of a previous operation.
# Most of the bits of the %eflags register are for operating system usage and aren’t of extreme concern to us.

# Given the command cmpq ARG1, ARG2
# je will jump if ARG2 equals ARG1.
# jne will jump if ARG2 does not equal ARG1.
# ja will jump if ARG2 is above (greater than) ARG1.
# jae will jump if ARG2 is above (greater than) or equal to ARG1.
# jb will jump if ARG2 is below (less than) than ARG1.
# jbe will jump if ARG2 is below (less than) or equal to ARG1.


# Example : Write a program that calculates this 2^3

_start:

    # store your base number to multiply with
    movq $2, %rbx

    # store the exponent to multiply it with    
    movq $3, %rcx

    # store the accumulated value
    # we need to store 1 in rax register because remember that mulq instruction multiplies it with rax register and
    # store it in rax register
    movq $1, %rax
    
mainloop:
    # multiply the base by rax register (1) store the result inside the rax register
    mulq %rbx
    
    # decrements %rcx go back to main loop label if %rcx is not yet zero
    loopq mainloop

    # hence we got down the instruction in the main loop down to 2 compared to unconditionalv2.s

exitloop:
    # mov the accumulated value to rdi to print the exit status
    # result should be : 2*2*2=8
    movq %rax, %rdi
    
    # exit system call
    movq $60, %rax
    syscall