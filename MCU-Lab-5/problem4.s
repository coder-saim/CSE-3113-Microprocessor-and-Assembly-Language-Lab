	AREA problem4, CODE, READONLY
	ENTRY
	EXPORT main
	
array DCD 0x07, 0x08, -0x05, 0x010, 0x01;			; declaring array
		
		
main
    LDR  r0, =array            ; Load the address of the array into r0
    MOV  r1, #5       		   ; Load the size of the array into r1
	MOV  r5, #15			   ;final result will be stored in r5 and init r5 by the lagest value 15
    BL   find_min              ; Call the find_min function
	MOV r7, r0				   ; check whether the find_min function return the final value to the main function or not 
	B Stop
    
    
find_min
    push {lr}                  ; Save the link register on the stack
    CMP  r1, #0                ; Check if the size of the array is 0
    BEQ  return_min            ; If so, return the element as the min
    
    LDR  r2, [r0]              ; Load the first element of the array
	CMP  r2, r5                ; Compare the current minimum with the next element
    BLT  calc_min
    ADD  r0, r0, #4            ; Increment the pointer to the next element
    SUB  r1, r1, #1            ; Decrement the size of the array
    
    BL   find_min              ; Call the find_min function recursively
    pop  {LR}                  ; Restore the link register
	BX LR					   ; Return the link register address

calc_min
	MOV r5, r2                 ; If the next element is smaller, update the minimum
	ADD  r0, r0, #4            ; Increment the pointer to the next element
    SUB  r1, r1, #1            ; Decrement the size of the array
    
    BL   find_min              ; Call the find_min function recursively
    pop  {LR}                  ; Restore the link register 
	BX LR					   ; Return the link register address
    
return_min
    MOV  r0, r5              ; Load the value of the minimum array element into r0
    pop  {LR}				 ; Restore the link register 
	BX LR					 ; Return the link register address
	
Stop B Stop
	END