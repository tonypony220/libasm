		global _ft_write

		extern ___error
		section .text


;write(int fildes, const void *buf, size_t nbyte);
	   ;	  rdi,             rsi,          rdx
_ft_write:

        section   .text
		mov       rax, 0x02000004         ; system call for write
        syscall                           ; invoke operating system to do thewrite
		mov rdx, rax
		jnc .done	 
		sub rsp, 8
		call ___error
		add rsp, 8
		mov [rax], rdx
		mov rdx, -1 
.done:
		mov rax, rdx
		ret

