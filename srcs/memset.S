BITS 64

SECTION .text

GLOBAL memset

memset:
	xor rcx, rcx
	mov rax, rdi
while:
	cmp rcx, rdx
	je end
	mov byte [rdi], sil
	inc rdi
	inc rcx
	jmp while
end:
	ret
