	AREA problem2, CODE, READONLY
	ENTRY
	EXPORT main
		
main
	MOV r1, #10				;init r1 by 10
	MOV r2, #5				;init r2 by 5
	BL sum_call_by_val		;call the sum funtion usign call by value method
	MOV r6, r0				;move the return value into register r6
	MOV r5, r2				;check the vlue of r2 , which is changed or not .... 
							;as the values are restored by the function call ,so the value in the registers remain as it is.
	B Stop
	
	
sum_call_by_val
	PUSH {r6}				;store the value into the stack memory
	PUSH {r2}				;store the value into the stack memory
	PUSH {r1}				;store the value into the stack memory
	ADD r6, r1, r2			;calculate the sum
	MOV r0, r6				;move the result to the r0 register to return the result
	MOV r2, #7				;change the value of r2 by 7
	POP {r1}				;restore the value from the stack memory
	POP {r2}				;restore the value from the stack memory
	POP {r6}				;restore the value from the stack memory
	;MOV PC, LR				;go back to the caller function
	BX LR					;go back to the caller function
	
Stop B Stop
	END