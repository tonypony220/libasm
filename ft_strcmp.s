	global _ft_strcmp

	section .text

_ft_strcmp:

.loop:
	cmp byte [rdi], 0
	jz	.end	
	mov al, [rdi]
	cmp al, [rsi]
	jnz .end
	inc rdi
	inc rsi
	jmp .loop
.end:
	xor rax, rax
	mov al, [rdi]
	sub al, [rsi]
	ret
