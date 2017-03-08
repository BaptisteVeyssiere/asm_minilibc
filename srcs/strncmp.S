BITS 64

SECTION .text

GLOBAL strncmp

strncmp:
	xor rcx, rcx
while:
	cmp byte [rdi], 0
	je end
	mov bh, byte [rsi]
	cmp byte [rdi], bh
	jne end
	inc rcx
	cmp rcx, rdx
	je end
	inc rdi
	inc rsi
	jmp while
end:
	mov bh, [rdi]
	sub bh, [rsi]
	mov rax, rbx
	ret
