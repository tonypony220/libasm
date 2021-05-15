		global _ft_read

		extern ___error
		section .text

;read(int fildes, void *buf, size_t nbyte);
	   ;	  rdi,             rsi,          rdx
_ft_read:

		mov       rax, 0x02000003 
        syscall                  
		mov rdx, rax
		jnc .done	 
		mov r10, [rsp]
		sub rsp, 8
		call ___error
		add rsp, 8
		mov [rax], rdx
		mov rdx, -1 
.done:
		mov rax, rdx
		ret
