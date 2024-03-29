BITS 64

SECTION .text

GLOBAL memmove:function

memmove:
	mov rax, rdi
	cmp rsi, rdi
	je end
	cmp rsi, rdi
	jg greater
	cmp rsi, rdi
	jle lower
greater:
	cmp rdx, 0
	je end
	mov bh, byte [rsi]
	mov [rdi], bh
	dec rdx
	inc rdi
	inc rsi
	jmp greater
lower:
	add rdi, rdx
	sub rdi, 1
	add rsi, rdx
	sub rsi, 1
while:
	cmp rdx, 0
	je end
	mov bh, byte [rsi]
	mov [rdi], bh
	dec rdx
	dec rdi
	dec rsi
	jmp while
end:
	ret
