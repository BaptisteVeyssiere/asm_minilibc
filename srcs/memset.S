BITS 64

SECTION .text

GLOBAL memset:function

memset:
	cmp rdi, 0
	je null
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
null:
	xor rax, rax
	ret
