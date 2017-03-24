BITS 64

SECTION .text

GLOBAL memcpy:function

memcpy:
	xor rcx, rcx
	mov rax, rdi
	cmp rdi, 0
	je end
	cmp rsi, 0
	je end
while:
	cmp rcx, rdx
	je end
	mov bh, byte [rsi + rcx]
	mov [rdi + rcx], bh
	inc rcx
	jmp while
end:
	ret
