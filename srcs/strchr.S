BITS 64

SECTION .text

GLOBAL strchr:function

strchr:
	cmp rdi, 0
	je nul
while:
	cmp byte [rdi], 0
	je check
	cmp [rdi], sil
	je end
	inc rdi
	jmp while
end:
	mov rax, rdi
	ret
check:
	cmp byte [rdi], sil
	je end
nul:
	xor rax, rax
	ret
