		global _ft_write

		section .text

;write(int fildes, const void *buf, size_t nbyte);
		;rdi, rsi, rdx
_ft_write:

          section   .text
		  mov       rax, 0x02000004         ; system call for write
          syscall                           ; invoke operating system to do thewrite
