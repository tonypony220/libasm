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
    segment .text global _start
_start :
	mov eax , 1  ;1 is the exit sys call number
	mov ebx , 5  ;the status value to return 
	int Ox80 	 ;execute a system call
	 
