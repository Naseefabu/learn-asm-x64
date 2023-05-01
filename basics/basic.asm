section .data

;mybyte db 65

section .text
    global _main

_main:
    mov rax, 1
    mov rax, 60
    mov rdi, 0
    syscall
    