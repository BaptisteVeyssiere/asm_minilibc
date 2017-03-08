BITS 64

SECTION .text

GLOBAL strcmp

strcmp:
while:
	cmp byte [rdi], 0
	je end
	mov bh, byte [rsi]
	cmp byte [rdi], bh
	jne end
	inc rdi
	inc rsi
	jmp while
end:
	mov bh, byte [rdi]
	sub bh, byte [rsi]
	mov rax, rbx
	ret
