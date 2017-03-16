BITS 64

SECTION .text

GLOBAL strncmp

strncmp:
	cmp rdi, 0
	je null
	cmp rsi, 0
	je null
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
	xor rax, rax
	mov bh, byte [rdi]
	sub bh, byte [rsi]
	mov al, bh
	ret
null:
	xor rax, rax
	ret
