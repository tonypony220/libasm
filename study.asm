; REGISTERS 
;  8 bytes 64 bit  R0  R1  R2  R3  R4  R5  R6  R7  R8  R9  R10  R11  R12  R13  R14  R15  RAX RCX RDX RBX RSP RBP RSI RDI  
;  4 bytes 32 bit  R0D R1D R2D R3D R4D R5D R6D R7D R8D R9D R10D R11D R12D R13D R14D R15D EAX ECX EDX EBX ESP EBP ESI EDI
;  2 bytes 16 bit  R0W R1W R2W R3W R4W R5W R6W R7W R8W R9W R10W R11W R12W R13W R14W R15W  AX  CX  DX  BX  SP  BP  SI  DI
;  1 bytes 8  bit  R0B R1B R2B R3B R4B R5B R6B R7B R8B R9B R10B R11B R12B R13B R14B R15B  AL  CL  DL  BL  SPL BPL SIL DIL
;  1 bytes 8  bit                                                                         AH  CH  DH  BH  <- high  [AH and AL => AX]
; 16 bytes 128bit  XMM0 ... XMM15

 ax ; accumulator for numeric operations  : return value
 bx ; base register ( array access)
 ex ; count register (string operations) 
 dx ; data register
 si ; source index       : used for moving data from one arr to another
 di ; destination index  : ^
 bp ; base pointer (for function frames) : store current stack pointer and users for args [bp - 4] and for function params [bp + 4] etc.
 sp ; stack pointer : points always on stack 
 ip ; (eip)extended instruction pointer : store adress in RAM of next machine command to execute; eip += len(command) :: return control
 flags ; flags 
 	; zf - zero 
	; cf - carry flag  
	; sf - sign
	; of - overflow
; MEMORY  
section .text ; stores code
section .data ; stores initialized vars
section .bss  ; stores not initialized vars and can be expanded
; example
section .bss
	string  resb 20   ; 				 1 byte * 20
    count   resw 256  ; 	   1 word => 2 byte * 256  minimal size able to push to stack
    x       resd 1    ; 1 double word => 4 byte * 1
					  ; 	quad word => 8 byte 
section .data
	b db 200	
	a dq 151
	fibon dw 1, 1, 2, 3, 5, 8, 13, 21

; MOVE
	; same result: extends to 8 bits when eax (4 bytes)
	mov rax, 100 
	mov eax, 100
	;
	mov [x], 25 ; ERROR! size not specified
	mov [x], dword 25 ; ok
	mov [x], word  25 ; ok
	mov [x], byte  25 ; ok
	mov dword [x], 25 ; ok
	
	; lea -- load effective address
	lea eax, [1000+ebx+8*ecx] ; eax <- 1000+ebx+8*ecx

; DEVISION
; rdx : rax for the dividend
; rdx:rax / [x] -> rdx(remainder)  : rax (quotient)
; The quotient is stored in rax and the remainder is stored in rdx.

	mov		rax, [x] ; x will be the dividend
	mov 	rdx, 0 	 ; 0 out rdx, so rdx:rax == rax
	div 	[y]		 ; 

;				MULT
;unsigned  mul
;signed   imul
;   1 operand 
	imul	qword [data] ; multiply rax by data -> rdx:rax
	; yasm requires the quad-word attribute for the source
; 	2 operand 
	imul	rax, 100 ;	
; 	3 operand 
	imul	rbx, [x] , 100
	; The carry flag (CF) and the overflow flag (OF) are 
	; set when the product exceeds 64 bits (unless you explicitly request a smaller multiply)


; CONDITIONAL
;Instruction 	effect
;cmovz			move if zero flag set
;cmovnz			move if zero flag not set (not zero)
;cmovl			move if result was negative
;cmovle			move if result was negative or zero
;cmovg			move if result was positive
;cmovge			result was positive or zero

; BIT OPERATIONS
	mov rax, Ox12345678
	xor eax, eax  	; set to 0
	mov rax, Ox1234
	xor rax, Oxf  	;change to Ox123b

; shift left 				 (shl) same 
; shift arithmetic left 	 (sal) same
; shift right 	 			 (shr) not save
; and shift arithmetic right (sar) saves sign bit

; SWITCH
	section .data
switch: dq main.case0
		dq main.case1
		dq main.case2
i:		dq 2
	section .text
	global main
main: 
	mov rax, [i]
	jmp	[switch+rax*8] ; switch i	
.case0:
	mov rbx, 100
	jmp .end
.case1:
	mov rbx, 101
	jmp .end
.case2:
	mov rbx, 102
.end
	xor eax, eax
	ret

	bt	[data+8*rbx], rcx ; bit <- CF flag 
  ; bts sets the bit to 1 
  ; btr sets the bit to 0.
  ; set[[eflags]] 
 	setc dl; rdx <-- 

; CONDITIONS 
	cmp a, b 

	je  jz 	; (a == b) ZF == 1 			   EQUAL
	jne jnz	; (a 1= b) ZF == 0 			   EQUAL

	jl  	; (a <  b) SF != OF 		   LESS 
	jle 	; (a <= b) SF != OF && ZF == 1 LESS OR EQUAL  
	jg 	jnle; (a >  b) SF == OF && ZF 	   GREATER 
	jge	jnl	; (a => b) SF == OF 		   GREATER OR EQUAL
	
	jb  	; (a <  b) CF == 1 		  	   BELOW 
	jbe 	; (a <= b) CF == 1 && ZF == 1  BELOW OR EQUAL  
	ja		; (a >  b) CF == 0 && ZF == 0  ABOVE 
	jae		; (a => b) CF == 0 &&          ABOVE OR EQUAL

; STACK
	push bx	; puts bx in stack and ESP + bx (pointer increase)
	pop	 bx ; get bx from stack and ESP - bx (pointer decrease)

	mov eax, [esp]  ; esp copy from top of stack and that is it

; STACK FRAME 
somefunction:

	push ebp  ;	saving pointer from call
	mov ebp, esp  ; saving top stack pointer to current ebp. ebp used to achinve params or func vars;
	sub esp, 16 ;  reserving 16 
	; this 3 command equals 
	enter 16, 0 
	; code...
	mov esp, ebp  ;
	pop ebp ; returns seved stack pointer to calling function
	ret  ;
	; this 3 commands equals 
	leave
		
;	CONVENTIONS 
; PASSING PARAMS:
; For integers and pointers 
	rdi, rsi, rdx, rcx, r8, r9.
;For floating-point (float, double), 
	xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7.

;the CALLE-SAVE REGISTERS ARE: 
	rbp, rbx, r12, r13, r14, r15



