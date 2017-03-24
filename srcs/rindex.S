BITS 64

SECTION .text

GLOBAL rindex:function

rindex:
	cmp rdi, 0
	je null
	xor rax, rax
	cmp rdi, 0
	je end
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
	cmp byte [rdx], sil
	je zero_val
	ret
null:
	xor rax, rax
	ret
zero_val:
	mov rax, rdx
	ret
