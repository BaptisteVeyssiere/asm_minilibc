BITS 64

SECTION .text

GLOBAL read:function

read:
	mov rax, 0
	syscall
	ret
