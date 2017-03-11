BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:
while:
	cmp byte [rdi], 0
	je nul
	mov rcx, rsi
while_:
	cmp byte [rsi], 0
	je wend
	mov dl, byte [rdi]
	cmp byte [rsi], dl
	je end
	inc rsi
	jmp while_
wend:
	mov rsi, rcx
	inc rdi
	jmp while
end:
	mov rax, rdi
	ret
nul:
	xor rax, rax
	ret
