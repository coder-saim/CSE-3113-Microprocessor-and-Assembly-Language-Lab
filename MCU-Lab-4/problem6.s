	AREA problem6, CODE, READONLY
	ENTRY
	EXPORT main
	EXPORT calc_avg
 
array  DCD 0x003, 0x004, 0x005, 0x006, 0x007
	
main
	
	MOV r0, #0						;final result will be stored in the register r0
	MOV r1, #0						;init counter with 0
	MOV r2, #5						;size of the array
	LDR r3, =array					;loading the array to the register r2
	
	BL calc_avg						;calling calc_avg function to calculate average

calc_avg
loop								;loop started
	LDR r5, [r3, r1, LSL #2]		;getting the value of the array into the register r5 and left shifting r1 by 2 while the loop is running

	ADD r0, r0, r5					;add the array element with the resultant variable and also stored
	ADD r1, r1, #1					;increment the counter by 1 
	CMP r1, r2						;comparing the counter with the array size
	BLT loop						;BLT means branch if less than that is if r1<r2 then go back to the loop
	SDIV r0, r1						;exit the loop and calculate the average

	

Stop B Stop
	END



