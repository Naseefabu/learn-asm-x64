.globl _start

# llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -iterations=1 -timeline branchlessdiff.s

# algorithm in branchles.cpp

# diff function := abs(x,y) 

_start:
    movq $3, %rsi # x
    movq $5, %rdi # y
    
    # cached
    # storing duplicate of 3 to RAX
    movq %rdi, %rax

    subq %rsi, %rdi # y - x
    
    # This instruction will also set some combination of flags (ZF=0,CF=OF) to
    # determine whether rsi is greater than rax or not
    # cmpq also does set the those flags but it wont return the diff it will 
    # only update the flags, since we need the result and flags we will use this
    subq %rax, %rsi # x - y 

    # what if it doesnt wait for the above to run ?
    # If previous comparison (x > y) results in greater than condition then only move the
    # result from rsi(x-y) to rdi
    # Else we will return the old rdi result (y - x) because at this point that will be the real result 
    # cmov has a dependency on the status flags written by the last arithmetic instruction(s). 
    # So the processor will only resolve its final result once the flags are "known" of the last instruction.
    # stackoverflow link : https://stackoverflow.com/questions/77680642/seeking-clarification-on-the-execution-order-in-an-assembly-algorithm-utilizing?noredirect=1#comment136953677_77680642 
    cmovgq %rsi, %rdi 
    
    # exit system call
    movq $60, %rax
    syscall

    