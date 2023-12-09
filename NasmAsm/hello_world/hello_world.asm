section .data ; data section where all data is defined before compilation
	text db "Hello, world!",10 ; Defines bytes ("db") "Hello, world!\n" (each character has its own bytes!) and labels the memory address "text"
	; 10 denotes new line 
section .text ; where actual code goes
	global _main ;where code run starts executing from top to bottom

_main:
	mov rax, 1 ; 
	mov rdi, 1 ; 1 denotes std::out : which means print to the console
	mov rsi, text ; Memory address of the text
	mov rdx, 14 ; hello world text total bytes length
	syscall ; system call to the kernel using above arguments

	mov rax, 60 ; for exit of the program
	mov rdi, 0
	syscall

	movq $60, %rax
	movq $3, %rdi
	syscall

