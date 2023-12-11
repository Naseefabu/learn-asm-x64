.globl _start

_start:
    # exit system call
    movq $60, %rax

loop:
    movq $8, %rdi
    jmp loop
    # this will never gets called and hence runs infinitely
    syscall