BITS 64

SECTION .text

GLOBAL rindex

rindex:
	mov rax, 0
	mov rdx, rdi
while:
	cmp byte [rdx], 0
	je end
	cmp [rdx], sil
	je ret_value
end_ret:
	inc rdx
	jmp while
ret_value:
	mov rax, rdx
	jmp end_ret
end:
	ret
