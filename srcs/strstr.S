BITS 64

SECTION .text

GLOBAL strstr

strstr:
while:
	cmp byte [rdi], 0
	je end
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
