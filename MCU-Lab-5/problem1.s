	AREA problem1, CODE, READONLY
	ENTRY
	EXPORT main

		

array  DCD 15, 23, 31, 45, 71, 2, 3, 7, 5
primes DCD 1

main
	; initialize variables
	mov r1, #0           ; initialize the array index to 0
    mov r2, #0           ; initialize the prime count to 0
	ldr r3, =array       ; load the array address into r3
    ldr r4, =primes      ; load the primes array address into r4
	mov r5, #9			 ; array size
	BL prime			 ;call the prime function
	B Stop
	
	
prime
loop
	LDR r6, [r3, r1, LSL #2]		;getting the value of the array into the register r6 and left shifting r1 by 2 while the loop is running
	CMP r6,#2						;compare r6 with 2
	BEQ prime_Ok					;if r6 is equal to 2 then it is a pirme number and will be stored into the prime array
	
	CMP r6,#3						;compare r6 with 3
	BEQ prime_Ok					;if r6 is equal to 3 then it is a pirme number and will be stored into the prime array
	
	CMP r6,#5						;compare r6 with 5
	BEQ prime_Ok					;if r6 is equal to 5 then it is a pirme number and will be stored into the prime array
	
	CMP r6,#7						;compare r6 with 7
	BEQ prime_Ok					;if r6 is equal to 7 then it is a pirme number and will be stored into the prime array
	
	CMP r6, #2						;compare r6 with 2
	BGT calc_primes_2				;call the calc_primes_2 function for calculating prime number
	ADD r1, #1						;increment the index of tne array
	CMP r1, r5						;check whether the index is equal to the array size or not
	BLT loop						;if so then run the loop again
	

calc_primes_2
	MOV r10, 2						;move 2 into the register r10
	SDIV r8, r6, r10				;calculate the quitient divided by r10
	MUL r8, r10						;multiply the quotient and divisor
	CMP r8, r6						;compare that the number is divided by 2 or not
	BNE calc_primes_3				;if not then check for the divisor 3
	ADD r2, #1						;increment the index of tne prime array
	ADD r1, #1						;increment the index of tne array
	CMP r1, r5						;check whether the index is equal to the array size or not
	BLT loop						;if so then run the loop again

calc_primes_3
	MOV r10, 3						;move 3 into the register r10
	SDIV r8, r6, r10				;calculate the quitient divided by r10
	MUL r8, r10						;multiply the quotient and divisor
	CMP r8, r6						;compare that the number is divided by 3 or not
	BNE calc_primes_5				;if not then check for the divisor 5
	ADD r2, #1						;increment the index of tne prime array
	ADD r1, #1						;increment the index of tne array
	CMP r1, r5						;check whether the index is equal to the array size or not
	BLT loop						;if so then run the loop again

	
calc_primes_5
	MOV r10, 5						;move 5 into the register r10
	SDIV r8, r6, r10				;calculate the quitient divided by r10
	MUL r8, r10						;multiply the quotient and divisor
	CMP r8, r6						;compare that the number is divided by 5 or not
	BNE calc_primes_7				;if not then check for the divisor 7
	ADD r2, #1						;increment the index of tne prime array
	ADD r1, #1						;increment the index of tne array
	CMP r1, r5						;check whether the index is equal to the array size or not
	BLT loop						;if so then run the loop again

	
calc_primes_7
	MOV r10, 7						;move 7 into the register r10
	SDIV r8, r6, r10				;calculate the quitient divided by r10
	MUL r8, r10						;multiply the quotient and divisor
	CMP r8, r6						;compare that the number is divided by 7 or not
	BNE prime_Ok					;if not then it is a pirme number and will be stored into the prime array
	ADD r2, #1						;increment the index of tne prime array
	ADD r1, #1						;increment the index of tne array
	CMP r1, r5						;check whether the index is equal to the array size or not
	BLT loop						;if so then run the loop again
	
		


prime_Ok
	STR r6, [r4, r2, LSL #2]  ; store the prime number in the primes array
	MOV r11, r6
	ADD r2, #1
	ADD r1, #1
	CMP r1, r5
	BLT loop
	B Stop	
	
		
Stop B Stop
	END
		