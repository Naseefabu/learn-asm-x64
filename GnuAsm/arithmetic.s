.globl _start

_start:
    # exit the program
    movq $2, %rax
    movq $3, %rdi

    # Adds the source and the destination together and store it in destination
    # rdi = 2 + 3 = 5
    addq %rax, %rdi

    # multiply rdi register by rax register and store in rax register
    # remember that rax register is the destination that we cant change on multiple and division instruction
    # we can only change the source
    # rdi(5) * rax(2) = 10 == rax 
    mulq %rdi
    
    
    # mov 10 to rdi for the exit status
    movq %rax, %rdi

    # exit system call with returning 10 from rdi register as exit status
    # remember that number in rdi should be <= 255 because thats only the exit statuses available ?
    movq $60, %rax
    syscall