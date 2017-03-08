BITS 64

SECTION .text

GLOBAL strchr

strchr:
while:
	cmp byte [rdi], 0
	je nul
	cmp [rdi], sil
	je end
	inc rdi
	jmp while
end:
	mov rax, rdi
	ret
nul:
	xor rax, rax
	ret
