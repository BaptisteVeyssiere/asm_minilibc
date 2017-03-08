BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
	xor rcx, rcx
	mov rax, rdi
while:
	cmp rcx, rdx
	je end
	mov rbx, [rsi + rcx]
	mov [rdi + rcx], rbx
	inc rcx
	jmp while
end:
	ret
