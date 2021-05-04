; REGISTERS 
;  8 bytes 64 bit  R0  R1  R2  R3  R4  R5  R6  R7  R8  R9  R10  R11  R12  R13  R14  R15  RAX RCX RDX RBX RSP RBP RSI RDI  
;  4 bytes 32 bit  R0D R1D R2D R3D R4D R5D R6D R7D R8D R9D R10D R11D R12D R13D R14D R15D EAX ECX EDX EBX ESP EBP ESI EDI
;  2 bytes 16 bit  R0W R1W R2W R3W R4W R5W R6W R7W R8W R9W R10W R11W R12W R13W R14W R15W  AX  CX  DX  BX  SP  BP  SI  DI
;  1 bytes 8  bit  R0B R1B R2B R3B R4B R5B R6B R7B R8B R9B R10B R11B R12B R13B R14B R15B  AL  CL  DL  BL  SPL BPL SIL DIL
;  1 bytes 8  bit                                                                         AH  CH  DH  BH  <- high  [AH and AL => AX]
; 16 bytes 128bit  XMM0 ... XMM15

; MEMORY  
section .bss
	string  resb 20   ; 				 1 byte * 20
    count   resw 256  ; 	   1 word => 2 byte * 256
    x       resd 1    ; 1 double word => 4 byte * 1
					  ; 	quad word -> 8
section .data
	b db 200	
	a dq 151
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
	jl  ; (a <  b) SF != OF 		   LESS 
	jle ; (a <= b) SF != OF && ZF == 1 LESS OR EQUAL  
	jg	; (a >  b) SF == OF && ZF 	   GREATER 
	jge	; (a => b) SF == OF 		   GREATER OR EQUAL
	
	jb  ; (a <  b) CF == 1 		  	   BELOW 
	jbe ; (a <= b) CF == 1 && ZF == 1  BELOW OR EQUAL  
	ja	; (a >  b) CF == 0 && ZF == 0  ABOVE 
	jae	; (a => b) CF == 0 &&          ABOVE OR EQUAL











