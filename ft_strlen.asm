	global _ft_strlen

	section .text

_ft_strlen:
	xor rax, rax
.loop:
	mov dl, [rdi]
	cmp	dl, 0 
	jz	.end	
	inc rax
	inc rdi
	jmp .loop
.end: 
	ret


