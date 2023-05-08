	AREA problem5, CODE, READONLY
	ENTRY

	EXPORT main

main
	MOV r1, #10				;init r1 by 10
	MOV r2, #5				;init r2 by 5
	BL summation			;call the sum funtion
	MOV r6, r0 				;get the return value, store into r6
	B Stop
	
summation	
	push {lr}				;store the caller function link into the stack memory
	push {r5}				;store the value into the stack memory
	BL subtraction			;call subtrction function
	MOV r5, r0				;move the return value into the register r5
	ADD r5, r1, r2			;calculate the sum
	MOV r0, r5				;move the result to the r0 register to return the result
	pop {r5}				;restore the value from the stack memory
	pop {lr}				;restore the caller function link from the stack memory
	MOV PC, LR				;go back to the caller function
	;BX lr					;go back to the caller function
	
	
subtraction
	push {lr}				;store the caller function link into the stack memory
	push {r5}				;store the value into the stack memory
	SUB r5, r1, r2			;calculate the subraction
	MOV r0, r5				;move the result to the r0 register to return the result
	pop {r5}				;restore the value from the stack memory
	pop {lr}				;restore the caller function link from the stack memory
	MOV PC, LR				;go back to the caller function
	
Stop B Stop
	END