;Instruction 	effect
;cmovz			move if zero flag set
;cmovnz			move if zero flag not set (not zero)
;cmovl			move if result was negative
;cmovle			move if result was negative or zero
;cmovg			move if result was positive
;cmovge			result was positive or zero

; DEVISION
; rdx : rax for the dividend
; rdx:rax / [x] -> rdx(remainder)  : rax (quotient)
; The quotient is stored in rax and the remainder is stored in rdx.

	mov		rax, [x] ; x will be the dividend
	mov 	rdx, 0 	 ; 0 out rdx, so rdx:rax == rax
	div 	[y]		 ; 

; MULT
; 1 operand 
	imul	qword [data] ; multiply rax by data -> rdx:rax
	; yasm requires the quad-word attribute for the source

; 2 operand 
	imul	rax, 100 ;	
; 3 operand 
	imul	rbx, [x] , 100
	; The carry flag (CF) and the overflow flag (OF) are 
	; set when the product exceeds 64 bits (unless you explicitly request a smaller multiply)


