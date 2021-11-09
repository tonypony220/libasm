
		global _ft_strdub

		extern _ft_strlen
		extern _malloc
		section .text

;read(int fildes, void *buf, size_t nbyte);
	   ;	  rdi,             rsi,          rdx

_ft_strdub:

		mov r10, rdi
		call _ft_strlen	
		mov rdi, rax
		inc rdi
		call _malloc	
		mov rdi, rax
		cmp rax, 0
		jg .copy
		
.copy:
		mov rsi, r10
		call _ft_strcpy	
		ret
