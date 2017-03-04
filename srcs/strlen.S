BITS 64

SECTION .text

GLOBAL strlen

strlen:
	xor rax, rax
	cmp rdi, 0
	je end
while:
	cmp byte [rdi + rax], 0
	je end
	inc rax
	jmp while
end:
	ret
