.text

MAIN:
	jal GET_ASCII	#jump to GET_ASCII and store the address of the current line address $ra
	move $t0, $v0
	
	jal GET_NO	#jump to GET_NO and store the address of the current line address in $ra
	move $t1, $v0
	
	move $a0, $t0
	move $a1, $t1
	
	li $v0, 10	
	syscall


# Inputs: Non applicable
# Outputs: char in $v0
# Affected: NA


GET_ASCII:
	li $v0, 12	#get a char from user
	syscall
	
	jr $ra	

GET_NO:
	li $v0, 5
	syscall
	
	jr $ra	#jump to the line address currenlty stored in $ra, i.e where the GET_NO was called from