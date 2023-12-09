.globl _start


_start:
    # If you wish, you can actually write
    # numbers directly in binary. The assembler, though, needs to know that the number is
    # a binary number; otherwise, it couldn’t distinguish between 10 meaning “ten” and 10
    # as a binary number, which means “two” in decimal. Therefore, when writing in binary,
    # we prefix the number with 0b (that’s a zero and then a lowercase “b”).
    # So here we are storing 1101 binary which is 13 in decimal to rdi register which
    # will be used for exit status
    movq $0b1101, %rdi

    # exit the program
    movq $60, %rax
    syscall