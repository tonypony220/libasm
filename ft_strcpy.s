		global _ft_strcpy

		section .text

_ft_strcpy:
; rdi dest
; rsi src
		push rsi
.loop:  
		cmp byte [rsi], 0
		jz	.end	
		mov al, [rsi]
		mov [rdi], al
		inc rdi
		inc rsi
		jmp .loop
.end:
		pop rax
		ret

