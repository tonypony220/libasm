;%include "stud_io.inc"
;global  _start
;section .text
;_start: mov     eax, 0
;again:  PRINT   "Hello"
;		PUTCHAR 10
;		inc     eax
;		cmp     eax, 5
;		jl      again
;		FINISH

;Program : exit
;Executes the exit system call
;No input
;Output: only the exit status ($? in the shell)


	; data or instructions following it are to be 
	; placed in the .text segment or section
    segment .text  
	; assembler directive or a pseudo opcode (pseudo-op)
	; This pseudo-op informs the assembler that the label _start 
	; is to be made known to the linker program when the program is linked.
	global _start  

; label. Since no code has been generated up to this point, 
; the label refers to location 0 of the program's text segment.
_start:  
	; symbolic opcodes
	mov eax,1  ;1 is the exit sys call number
	mov ebx,5  ;the status value to return 
	; generates a software interrupt numbered Ox80 
	; which is the way Linux handles 32 bit system calls. 
	; (This code works on both 32 bit and 64 bit Linux systems.)
	int 0x80   ;execute a system call
	 
