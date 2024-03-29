BITS 64

SECTION .text

GLOBAL strstr:function

strstr:
	cmp rdi, 0
	je nul
	cmp rsi, 0
	je nul
	mov bh, byte [rsi]
	cmp [rdi], bh
	je zero_val
while:
	cmp byte [rdi], 0
	je nul
	mov rax, rdi
	mov rcx, rsi
while_:
	cmp byte [rsi], 0
	je wend
	cmp byte [rdi], 0
	je wend
	mov dl, byte [rdi]
	cmp byte [rsi], dl
	jne wend
	inc rdi
	inc rsi
	jmp while_
wend:
	cmp byte [rsi], 0
	je end
	mov rsi, rcx
	mov rdi, rax
	inc rdi
	jmp while
end:
	ret
nul:
	xor rax, rax
	ret
zero_val:
	cmp byte [rdi], 0
	jne while
	mov rax, rdi
	ret
