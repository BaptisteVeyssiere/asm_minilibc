BITS 64

SECTION .text

GLOBAL strcasecmp:function

strcasecmp:
	xor r8, r8
	xor r9, r9
while:
	cmp byte [rdi], 0
	je end
	cmp byte [rsi], 0
	je end
	mov r8b, byte [rdi]
	mov r9b, byte [rsi]
	jmp lower
lower_end:
	cmp r8b, r9b
	jne end
	inc rdi
	inc rsi
	jmp while
lower:
	cmp byte [rdi], 65
	jle lower_s
	cmp byte [rdi], 90
	jg lower_s
	add r8b, 32
lower_s:
	cmp byte [rsi], 65
	jle lower_end
	cmp byte [rsi], 90
	jg lower_end
	add r9b, 32
end:
	xor rbx, rbx
	mov rbx, r8
	sub rbx, r9
	mov rax, rbx
	cbw
	cwde
	ret
