	AREA problem5, CODE, READONLY
	ENTRY
	EXPORT main
			
array DCD 3, 8, 5, 10, 2;			; declaring array


main
	MOV r0, #0						;final result will be stored in the register r0
	MOV r1, #0						;init counter with 0
	MOV r2, #5						;size of the array
	LDR r3, =array					;loading the array to the register r2
	

loop								;loop started
	LDR r5, [r3, r1, LSL #2]		;getting the value of the array into the register r5 and left shifting r1 by 2 while the loop is running

	CMP r5, r0						;compare the array element with the resultant variable
	BGT greater						;BGT means branch if greater than that is if r5>r0 then goto the branch grater
	ADD r1, r1, #1					;increment the counter by 1
	CMP r1, r2						;comparing the counter with the array size
	BLT loop						;BLT means branch if less than that is if r1<r2 then go back to the loop
	B Stop							;else exit the loop
	
greater
	MOV r0, r5						;move r5 to r0
	ADD r1, r1, #1					;increment the counter by 1
	CMP r1, r2						;comparing the counter with the array size
	BLT loop						;BLT means branch if less than that is if r1<r2 then go back to the loop
	B Stop							;else exit the loop


Stop  B Stop
     END