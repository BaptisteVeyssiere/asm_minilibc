BITS 64

SECTION .text

GLOBAL write:function

write:
	mov rax, 1
	syscall
	ret
