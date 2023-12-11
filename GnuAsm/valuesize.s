.globl _start

_start:
    # bx = 16 bit register (root = rbx)
    # load decimal 50 to first 8 bit and load another decimal 50 to lower 8 bit
    # Hence we loaded 2 numbers that we need to add in one instruction
    movw $0b0011001000110010, %bx
    
    # Now we add both numbers and store it in bl register
    addb %bh, %bl
    
    # reset the bh (8 bits) to zero
    # so that we are sure that rbx register includes only the result of the addition
    movb $0, %bh

    # move the exit status as the sum of the above
    # echo $status to print the result
    movq %rbx, %rdi

    # exit system call
    movq $60, %rax
    syscall

# So why didn’t we do this operation directly in %di or %rdi? Why start with %bx
# and then move the result? If you remember, %rdi does not have the ability to access
# individual bytes (because mostly it has pointers to stack ?). Therefore, we used register %bx to do individual-byte manipulation
# and then moved the result to the place it needed to go to be used in the system call. A
# lot of assembly language winds up being shuffling between registers that have different
# functions or special instructions associated with them.
# While this may seem like a contrived example, the fact is that this is actually a
# faster way to load values. Notice that we were able to essentially load two registers
# (%bh and %bl) with a single instruction, because they are both part of %bx. The ability
# to conceptualize a value broken down into bits and then separated, or, alternatively,
# a series of small values joined together in a larger one, is actually key to being able to
# understand a lot of low-level code. Sometimes we will want to even treat a number as if it
# were a collection of individual, unconnected bits, where each bit has its own individual
# meaning.