	AREA problem1, CODE, READONLY
	ENTRY
	EXPORT main
main

;16 bit operation

task1
	MOV r0,#0x8A5C
	MOV r1,#0x3F7E
	
	AND r2,r0,r1		;and op operation
	ORR r3,r0,r1		;or operation
	MVN r4,r2			;nand operation
	MVN r5,r3			;nor operation
	EOR r6,r0,r1		;exor operation
	MVN r7,r6			;exnor operation
	
;32 bit operation

task2	
	LDR r0, =0x12345678
	LDR r1, =0x87654321
	
	AND r2,r0,r1		;and op operation
	ORR r3,r0,r1		;or operation
	MVN r4,r2			;nand operation
	MVN r5,r3			;nor operation
	EOR r6,r0,r1		;exor operation
	MVN r7,r6			;exnor operation
	
Stop B Stop
	END







