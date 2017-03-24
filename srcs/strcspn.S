BITS 64

SECTION .text

GLOBAL strcspn:function

strcspn:
	xor rcx, rcx
while:
	cmp byte [rdi], 0
	je end
	mov rbx, rsi
while_:
	cmp byte [rsi], 0
	je wend
	mov dl, byte [rdi]
	cmp byte [rsi], dl
	je end
	inc rsi
	jmp while_
wend:
	mov rsi, rbx
	inc rdi
	inc rcx
	jmp while
end:
	mov rax, rcx
	ret
