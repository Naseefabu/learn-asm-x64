# any line that starts with (.) is an instruction to the assembler (directive) doesn’t usually generate code on its own
.globl _start # tells the assembler entry point of the program

# predefined memory to put in code
.section .text

_start:
    
# The dollar sign before the 60 means that we are treating 60 as a value, not
# an address, or anything else. If we had left off the dollar sign, it would try to load a value
# from memory address 60 into the register, which is not what we want (possible segfault)
    
# The number 60 refers to the system call number of the command we want the
# operating system to run (which will be the exit system call). Each operating system
# function is assigned a system call number, and 60 is the one for exit.
  
    movq $60, %rax # mov quad word (64bit)(8 byte) to 64 bit register
# In the exit system call, the %rdi register holds the exit status of the program.
# If the system call uses additional data (the exit system call takes a
# value for the exit status), this is placed in %rdi. Other system calls require even more
# data, and each piece of data has a defined register that it should be in.
    movq $255, %rdi
# In this case, we are telling the operating system that we are done executing. The
# operating system will then clean up any resources it has allocated for us, stop our code
# from running any further, and return our exit status code back to the command that
# called us (usually our shell)
    syscall
# Note that syscall instruction does not care in what order the registers were set. We
# could have set %rdi first and %rax second, and it would not have changed the meaning of
# the program. It only matters what the values are at the time that the syscall instruction
# is issued.
