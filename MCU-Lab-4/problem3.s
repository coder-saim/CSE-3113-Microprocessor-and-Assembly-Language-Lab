	    AREA problem3, CODE, READONLY
		ENTRY
		EXPORT main
		EXPORT task1
		EXPORT task2
		
		
x EQU 10
y EQU 5
	
p EQU 0xAB36
q EQU 0xCAB8

main
task1
	MOV r1, #x
	MOV r2, #y
	ADDS r3, r1, r2
	SUBS r4, r1, r2
	MUL r5, r1,r2
	SDIV r6, r1,r2

task2
	 MOV r1, #p		;#32767 
	 MOV r2, #q		;#1
	 
	 
	 ADD r3,r1,r2				;addition
	 BVS overflow				;BVS stands for "Branch if Overflow Set".
	
	 SUBS r4,r1,r2				;subtraction
	 BVS overflow

	 SDIV r5,r1,r2				;signed division
	 BVS overflow

	 MUL r6,r1,r2				;multiplication
	 BVS overflow
	 BX lr;
	 
overflow
	B Stop
	;MOV r3, #5
	


Stop  B Stop
     END