BITS 64

SECTION .text

GLOBAL write

write:
	mov rax, 1
	syscall
	ret
