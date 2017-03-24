BITS 64

SECTION .text

GLOBAL strlen:function

strlen:
	xor rax, rax
	xor rcx, rcx
	cmp rdi, 0
	je end
while:
	cmp byte [rdi + rcx], 0
	je end
	inc rcx
	jmp while
end:
	mov rax, rcx
	ret
