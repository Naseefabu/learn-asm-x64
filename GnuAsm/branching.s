.globl _start

# %rip register : Instruction Pointer
# The instruction pointer simply points to the next memory location that the
# processor is going to process an instruction from. This lets the CPU know where to pull
# the next instruction from when the next clock cycle runs. During each instruction, the
# CPU will increment the instruction pointer to point to the next instruction—the one
# immediately after the current instruction.
# This register can be manipulated through jump instructions. A jump instruction tells
# the computer to alter the flow of the program by setting the instruction pointer to a value
# that is different from where the CPU was going to set it to. The most basic form of this
# instruction is simply jmp, which tells the processor the address of the next instruction
# you want to execute.

_start:
    # setting exit status as 7
    movq $7, %rdi
    # jump to instruction memory address nextplace
    # altering the instruction pointer by us to jump to nextplace
    jmp nextplace
    # this instruction will be skipped
    # setting exit status as 8
    movq $8, %rdi
nextplace:
    # exit system call
    movq $60, %rax
    syscall
    # echo status will be printed 7 instead of 8 because that instruction got skipped