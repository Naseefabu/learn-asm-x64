.globl _start

# Notes 
# A conditional jump is a variant of the jmp instruction that only jumps based on certain conditions.
# To understand the conditions that are available for a jump instruction, we have to introduce a 
# new special-purpose register, the %eflags register.
# Rather than thinking about %eflags as holding a single value, you usually think about the different bits of %eflags separately. 
# Each bit holds a true/false status of a previous operation.
# Most of the bits of the %eflags register are for operating system usage and aren’t of extreme concern to us.

# However, there are two flags that come in useful continually:

# ZF: The zero flag is set to 1 if the result of the last arithmetic
# operation was zero, or 0 if it was not.

# CF: The carry flag is set to 1 if the result of the last arithmetic
# operation resulted in a “carry”—that is, the result was bigger than
# could be held in the destination register.

# What happens is that at the end of each arithmetic instruction (instructions like
# addX, mulX, but not movX), the processor sets the value of these status bits in the %eflags
# register and we use that for conditional jumps.

# common jump instructions

# jz: “Jump if Zero” (jump if the zero flag is set to 1).
# jnz: “Jump if Not Zero” (jump if the zero flag is set to 0).
# jc: “Jump if Carry” (jump if the carry flag is set to 1).
# jnc: “Jump if No Carry” (jump if the carry flag is set to 0).

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
    # doing the arithmetic so to set the %eflags register (by CPU) later we use that to jump to the exit loop
    # doing this arithmetic means CPU will set the %eflags register
    # what specific bit we are interested in the zero flag register  
    addq $0, %rcx

    # jump if zero flat register is set to zero because of above operation
    # that means we hit the 0 exponent then we no longer need to multiply it with base
    jz exitloop

    # multiply the base by itself and store the result inside the rax register
    mulq %rbx
    
    # decrease the number inside the rcx register by one
    decq %rcx

    # loop again
    jmp mainloop

exitloop:
    # mov the accumulated value to rdi to print the exit status
    # result should be : 2*2*2=8
    movq %rax, %rdi
    
    # exit system call
    movq $60, %rax
    syscall



