	AREA problem2, CODE, READONLY
	ENTRY
	EXPORT main
	EXPORT 
			
VAR1 EQU 0x3A				;16 bit varable
VAR2 EQU 0x5B				;16 bit varable
	
main
	LDR r0, =0xC2A
	LSR r1,r0, 2			;shift right
	LSL r2,r0, 3			;shift left
	ASR r3,r0, 5			;arithmetic shift right
	
Stop B Stop
	END
