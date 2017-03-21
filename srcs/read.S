BITS 64

SECTION .text

GLOBAL read

read:
	mov rax, 0
	syscall
	ret
